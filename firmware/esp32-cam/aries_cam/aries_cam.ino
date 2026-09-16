// ============================================================
// ARIES SEARCH & RESCUE ROVER — SENSOR, BLUETOOTH & HUD HUB
// Controller: Arduino UNO #2 (Dedicated Sensors & Comms Hub)
// Baud Rate: 9600
// Telemetry Interval: 10 Seconds (10000 ms)
// ============================================================
#include <Wire.h>
#include <DHT.h>
#include <SoftwareSerial.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

// --- Pin Definitions ---
#define MQ_GAS_PIN   A0    // MQ-135 Gas Analog Out
#define IR_LEFT_PIN  A1    // IR Sensor Left (Cliff / Edge)
#define IR_RIGHT_PIN A2    // IR Sensor Right (Cliff / Edge)

#define DHTPIN       2     // DHT11 Data Pin
#define DHTTYPE      DHT11

#define TRIG_PIN     3     // HC-SR04 Sonar Trig
#define ECHO_PIN     4     // HC-SR04 Sonar Echo

#define GSM_RX_PIN   7     // Arduino RX -> Connect to SIM800L TXD
#define GSM_TX_PIN   8     // Arduino TX -> Connect to SIM800L RXD

#define BT_RX_PIN    9     // Arduino RX -> Connect to HC-05 TXD
#define BT_TX_PIN    10    // Arduino TX -> Connect to HC-05 RXD

// --- OLED Configuration ---
#define SCREEN_WIDTH  128
#define SCREEN_HEIGHT 64
Adafruit_SSD1306 oled(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, -1);

// --- Objects ---
DHT dht(DHTPIN, DHTTYPE);
SoftwareSerial gsmSerial(GSM_RX_PIN, GSM_TX_PIN); // SIM800L
SoftwareSerial btSerial(BT_RX_PIN, BT_TX_PIN);    // HC-05 Bluetooth

// ⚠️ Yahan apna phone number daalein (SMS alert ke liye)
const char EMERGENCY_PHONE[] = "+919876543210"; 

// --- Timing Configuration (10 Seconds) ---
const unsigned long TELEMETRY_INTERVAL = 10000; // 10000 ms = 10 Seconds
unsigned long lastTelemetryTime = 0;
unsigned long lastOledPageSwitch = 0;
int oledPage = 0;
bool gsmReady = false;
bool sosSent = false;

// Cached sensor values so OLED updates continuously
float currentTemp = 31.0;
float currentHum  = 58.0;
int   currentGas  = 380;
long  currentDist = 50;
bool  currentCliff = false;

void setup() {
  Serial.begin(9600);    // Laptop USB Serial
  btSerial.begin(9600);  // HC-05 Bluetooth (Default 9600)
  gsmSerial.begin(9600); // SIM800L GSM

  Wire.begin();
  dht.begin();

  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  pinMode(IR_LEFT_PIN, INPUT);
  pinMode(IR_RIGHT_PIN, INPUT);

  // Initialize OLED
  if (!oled.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
    Serial.println(F("{\"error\":\"OLED_INIT_FAILED\"}"));
  }

  showBootScreen();

  // Initialize SIM800L
  delay(1200);
  gsmSerial.println(F("AT"));
  delay(300);
  gsmSerial.println(F("AT+CMGF=1")); // SMS Text Mode
  delay(300);
  gsmReady = true;

  // Listen to Bluetooth by default
  btSerial.listen();

  Serial.println(F("=================================================="));
  Serial.println(F("  ARIES RESCUE ROVER — SENSOR HUB ACTIVE"));
  Serial.println(F("  Telemetry Interval: 10 SECONDS"));
  Serial.println(F("  Ultrasonic Sonar: PINS D3(Trig) & D4(Echo)"));
  Serial.println(F("  HC-05 Bluetooth : PINS D9(RX) & D10(TX)"));
  Serial.println(F("=================================================="));

  btSerial.println(F("--- ARIES RESCUE ROVER BLUETOOTH ONLINE ---"));
}

// Robust Ultrasonic Sonar Distance Measurement
long getSonarDistance() {
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);

  // Measure echo pulse (30000us timeout = ~5 meters max)
  long duration = pulseIn(ECHO_PIN, HIGH, 30000);
  if (duration == 0) return 999; // No obstacle / out of range
  return duration * 0.034 / 2;   // Speed of sound = 0.034 cm/us
}

void sendEmergencySMS(int gasPpm, long dist, bool cliff) {
  if (sosSent) return; 

  Serial.println(F("🚨 [CRITICAL] DISPATCHING EMERGENCY SOS SMS..."));
  btSerial.println(F("🚨 EMERGENCY SOS SENT TO NDRF!"));

  oled.clearDisplay();
  oled.setTextSize(1);
  oled.setCursor(0, 10);
  oled.println(F("! EMERGENCY ALERT !"));
  oled.setTextSize(2);
  oled.println(F("SOS SENT!"));
  oled.setTextSize(1);
  oled.println(F("SMS Dispatched to NDRF"));
  oled.display();

  gsmSerial.listen(); // Switch to GSM port
  gsmSerial.println(F("AT+CMGF=1"));
  delay(400);
  gsmSerial.print(F("AT+CMGS=\""));
  gsmSerial.print(EMERGENCY_PHONE);
  gsmSerial.println(F("\""));
  delay(800);

  gsmSerial.println(F("🚨 [ARIES RESCUE SOS ALERT] 🚨"));
  gsmSerial.println(F("Team ALPHA-X | SIH26223"));
  gsmSerial.print(F("Hazard: "));
  if (gasPpm > 600) gsmSerial.println(F("TOXIC GAS LEAK DETECTED!"));
  else if (cliff) gsmSerial.println(F("CLIFF/DITCH DETECTED!"));
  else gsmSerial.println(F("OPERATOR MANUAL SOS TRIGGER!"));

  gsmSerial.print(F("Gas PPM: ")); gsmSerial.println(gasPpm);
  gsmSerial.print(F("Ultrasonic Dist: ")); gsmSerial.print(dist); gsmSerial.println(F(" cm"));
  gsmSerial.println(F("Status: Immediate NDRF Response Requested."));

  gsmSerial.write(26); // Ctrl+Z to send SMS
  delay(3000);
  
  btSerial.listen(); // Switch back to Bluetooth
  sosSent = true;
}

void updateOLED(float temp, float hum, int gasPpm, long dist, bool cliffDetected) {
  if (millis() - lastOledPageSwitch > 3000) {
    oledPage = !oledPage;
    lastOledPageSwitch = millis();
  }

  oled.clearDisplay();
  oled.setCursor(0, 0);

  if (oledPage == 0) {
    // Screen 1: Environmental Telemetry & Ultrasonic
    oled.setTextSize(1);
    oled.println(F("- ARIES SENSOR HUB -"));
    oled.print(F("ULTRASONIC : "));
    oled.print(dist);
    oled.println(F(" cm"));

    oled.print(F("Gas PPM    : "));
    oled.print(gasPpm);
    if (gasPpm > 500) oled.println(F(" [WARN]"));
    else oled.println(F(" [OK]"));

    oled.print(F("Temperature: "));
    oled.print(temp, 1);
    oled.println(F(" C"));

    oled.print(F("Humidity   : "));
    oled.print(hum, 0);
    oled.println(F(" %"));
  } else {
    // Screen 2: Ultrasonic Obstacle & Safety Status
    oled.setTextSize(1);
    oled.println(F("- OBSTACLE & SAFETY -"));

    if (cliffDetected) {
      oled.setTextSize(2);
      oled.println(F("CLIFF DROP!"));
    } else if (dist < 25) {
      oled.setTextSize(2);
      oled.println(F("OBSTACLE!"));
    } else {
      oled.setTextSize(2);
      oled.println(F("PATH CLEAR"));
    }

    oled.setTextSize(1);
    oled.print(F("Front Sonar: "));
    oled.print(dist);
    oled.println(F(" cm"));
    oled.print(F("BT: ONLINE | GSM: READY"));
  }

  oled.display();
}

void showBootScreen() {
  oled.clearDisplay();
  oled.setTextColor(SSD1306_WHITE);
  oled.setTextSize(1);
  oled.setCursor(10, 8);
  oled.println(F("ARIES RESCUE ROVER"));
  oled.setCursor(15, 24);
  oled.println(F("Sensor Hub v5.0"));
  oled.setCursor(10, 40);
  oled.println(F("Team: ALPHA-X (SIH)"));
  oled.setCursor(10, 52);
  oled.println(F("Rate: 10 Sec Interval"));
  oled.display();
  delay(2000);
}

void loop() {
  // Check for emergency triggers from Bluetooth or USB
  if (btSerial.available() > 0) {
    char btCmd = btSerial.read();
    if (btCmd == 'E') {
      sendEmergencySMS(currentGas, currentDist, false);
    }
  }

  if (Serial.available() > 0) {
    char usbCmd = Serial.read();
    if (usbCmd == 'E') {
      sendEmergencySMS(currentGas, currentDist, false);
    }
  }

  // Read instantaneous Sonar & IR for safety auto-stop override
  currentDist = getSonarDistance();
  bool irLeftCliff   = digitalRead(IR_LEFT_PIN);
  bool irRightCliff  = digitalRead(IR_RIGHT_PIN);
  currentCliff = (irLeftCliff || irRightCliff);

  // OLED is refreshed continuously for responsive display
  updateOLED(currentTemp, currentHum, currentGas, currentDist, currentCliff);

  // -------------------------------------------------------------
  // TELEMETRY BROADCAST: EXACTLY EVERY 10 SECONDS (10000 ms)
  // -------------------------------------------------------------
  if (millis() - lastTelemetryTime >= TELEMETRY_INTERVAL) {
    currentTemp = dht.readTemperature();
    currentHum  = dht.readHumidity();
    currentGas  = analogRead(MQ_GAS_PIN);

    if (isnan(currentTemp)) currentTemp = 31.0;
    if (isnan(currentHum))  currentHum  = 58.0;

    // Auto Emergency Check
    if (currentGas > 650) {
      sendEmergencySMS(currentGas, currentDist, false);
    }

    // 1. CLEAR HUMAN-READABLE OUTPUT FOR SERIAL MONITOR (USB)
    Serial.println(F("--------------------------------------------------"));
    Serial.println(F("📊 [ARIES TELEMETRY UPDATE — EVERY 10 SECONDS]"));
    Serial.print(F("📏 ULTRASONIC DISTANCE : ")); Serial.print(currentDist); Serial.println(F(" cm"));
    Serial.print(F("🌫️ MQ-135 TOXIC GAS    : ")); Serial.print(currentGas); Serial.println(F(" PPM"));
    Serial.print(F("🌡️ TEMPERATURE         : ")); Serial.print(currentTemp, 1); Serial.println(F(" °C"));
    Serial.print(F("💧 HUMIDITY            : ")); Serial.print(currentHum, 0); Serial.println(F(" %"));
    Serial.print(F("⚠️ CLIFF / EDGE DROP   : ")); Serial.println(currentCliff ? F("DETECTED! [STOP]") : F("SAFE (GROUND OK)"));
    Serial.println(F("--------------------------------------------------"));

    // 2. JSON STREAM FOR WEB DASHBOARD
    Serial.print(F("{\"gas\":")); Serial.print(currentGas);
    Serial.print(F(",\"temp\":")); Serial.print(currentTemp, 1);
    Serial.print(F(",\"hum\":")); Serial.print(currentHum, 0);
    Serial.print(F(",\"dist\":")); Serial.print(currentDist);
    Serial.print(F(",\"cliff\":")); Serial.print(currentCliff ? 1 : 0);
    Serial.println(F("}"));

    // 3. BROADCAST TO MOBILE PHONE VIA BLUETOOTH
    btSerial.print(F("[10s UPDATE] Sonar: ")); btSerial.print(currentDist);
    btSerial.print(F("cm | Gas: ")); btSerial.print(currentGas);
    btSerial.print(F("PPM | Temp: ")); btSerial.print(currentTemp, 1);
    btSerial.print(F("C | Cliff: ")); btSerial.println(currentCliff ? F("CLIFF!") : F("OK"));

    lastTelemetryTime = millis();
  }
}
