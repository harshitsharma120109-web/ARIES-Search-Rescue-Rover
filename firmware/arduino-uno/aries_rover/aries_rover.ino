#include <Wire.h>
#include <DHT.h>
#include <OneWire.h>
#include <DallasTemperature.h>
#include <Adafruit_BMP280.h>
#include <MAX30105.h>
#include <heartRate.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

// ─────────── Pin Map ────────────────────────────────────
#define DHTPIN       2    // DHT11 data pin
#define DHTTYPE DHT11
#define DS18B20_PIN  3    // DS18B20 OneWire data
#define TRIG1        10   // HC-SR04 trigger
#define ECHO1        11   // HC-SR04 echo
#define IR_LEFT      A1   // IR sensor left
#define IR_RIGHT     A2   // IR sensor right
#define MQ135_PIN    A0   // MQ-135 gas sensor

// L293D Motor Shield Pins (standard shield mapping)
// M1: D11(pwm), D12, D13 | M2: D3(pwm), D4 | M3/M4: via D5,D6,D7,D8

// ─────────── OLED 0.96" ─────────────────────────────────
#define SCREEN_W 128
#define SCREEN_H 64
Adafruit_SSD1306 oled(SCREEN_W, SCREEN_H, &Wire, -1);

// ─────────── Sensor Objects ─────────────────────────────
DHT dht(DHTPIN, DHTTYPE);
OneWire oneWire(DS18B20_PIN);
DallasTemperature ds18b20(&oneWire);
Adafruit_BMP280 bmp;
MAX30105 particleSensor;

// ─────────── Heart Rate State ───────────────────────────
byte   rateBuffer[4];
byte   rateSpot    = 0;
long   lastBeat    = 0;
float  beatsPerMin = 0;
int    beatAvg     = 0;

// ─────────── Timing & State ─────────────────────────────
int           oledPage        = 0;
unsigned long lastOledSwitch  = 0;
unsigned long lastTelemetry   = 0;
bool          emergencyStop   = false;

// ════════════════════════════════════════════════════════
void setup() {
  Serial.begin(9600);
  Wire.begin();

  // ── OLED ──────────────────────────────────────────────
  if (!oled.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
    Serial.println(F("{\"err\":\"OLED_FAIL\"}"));
  }
  showBoot();

  // ── Sensors ───────────────────────────────────────────
  dht.begin();
  ds18b20.begin();

  if (!bmp.begin(0x76)) {
    Serial.println(F("{\"err\":\"BMP280_FAIL\"}"));
  }
  bmp.setSampling(Adafruit_BMP280::MODE_NORMAL,
                  Adafruit_BMP280::SAMPLING_X2,
                  Adafruit_BMP280::SAMPLING_X16,
                  Adafruit_BMP280::FILTER_X16,
                  Adafruit_BMP280::STANDBY_MS_500);

  if (!particleSensor.begin(Wire, I2C_SPEED_FAST)) {
    Serial.println(F("{\"err\":\"MAX30102_FAIL\"}"));
  } else {
    particleSensor.setup();
    particleSensor.setPulseAmplitudeRed(0x0A);
    particleSensor.setPulseAmplitudeGreen(0);
  }

  // ── I/O ───────────────────────────────────────────────
  pinMode(TRIG1,  OUTPUT);
  pinMode(ECHO1,  INPUT);
  pinMode(IR_LEFT, INPUT);
  pinMode(IR_RIGHT,INPUT);

  Serial.println(F("{\"status\":\"ARIES_ONLINE\",\"version\":\"2.0\"}"));
}

// ════════════════════════════════════════════════════════
void loop() {
  pollHeartRate();   // Always poll MAX30102

  if (Serial.available()) {
    char cmd = Serial.read();
    emergencyStop = false;
    handleCommand(cmd);
  }

  // Auto-stream every 500ms
  if (millis() - lastTelemetry > 500) {
    streamTelemetry();
    lastTelemetry = millis();
  }
}

// ─────────── Boot Screen ────────────────────────────────
void showBoot() {
  oled.clearDisplay();
  oled.setTextColor(SSD1306_WHITE);
  oled.setTextSize(1);
  oled.setCursor(10, 18);
  oled.println(F("  ARIES ROVER v2.0"));
  oled.setCursor(15, 34);
  oled.println(F("Team: ALPHA-X"));
  oled.setCursor(10, 48);
  oled.println(F("SIH 2026 | PS:SIH26223"));
  oled.display();
  delay(2000);
}

// ─────────── Motor Control (L293D Shield) ───────────────
void motorForward()  { /* Set M1 M2 forward */ }
void motorBackward() { /* Set M1 M2 backward */ }
void motorLeft()     { /* M1 fwd, M2 back */ }
void motorRight()    { /* M1 back, M2 fwd */ }
void motorStop()     {
  // Stop all L293D outputs
  for (int p = 4; p <= 8; p++) { pinMode(p,OUTPUT); digitalWrite(p,LOW); }
  analogWrite(3,0); analogWrite(11,0);
  emergencyStop = true;
}

void handleCommand(char c) {
  if      (c=='F') motorForward();
  else if (c=='B') motorBackward();
  else if (c=='L') motorLeft();
  else if (c=='R') motorRight();
  else if (c=='S') motorStop();
  else if (c=='D') streamTelemetry();
}

// ─────────── Sonar Distance ─────────────────────────────
long getDist() {
  digitalWrite(TRIG1, LOW); delayMicroseconds(2);
  digitalWrite(TRIG1, HIGH); delayMicroseconds(10);
  digitalWrite(TRIG1, LOW);
  long dur = pulseIn(ECHO1, HIGH, 23529);
  return (dur == 0) ? 999 : dur * 0.034 / 2;
}

// ─────────── MAX30102 Heart Rate Polling ────────────────
void pollHeartRate() {
  long irVal = particleSensor.getIR();
  if (checkForBeat(irVal)) {
    long delta = millis() - lastBeat;
    lastBeat   = millis();
    beatsPerMin = 60.0 / (delta / 1000.0);
    if (beatsPerMin > 20 && beatsPerMin < 255) {
      rateBuffer[rateSpot++] = (byte)beatsPerMin;
      rateSpot %= 4;
      beatAvg = 0;
      for (byte x = 0; x < 4; x++) beatAvg += rateBuffer[x];
      beatAvg /= 4;
    }
  }
}

// ─────────── OLED Display (3 rotating pages) ────────────
void updateOLED(float t1, float t2, int gas, long dist, float pres) {
  if (millis() - lastOledSwitch > 3000) {
    oledPage = (oledPage + 1) % 3;
    lastOledSwitch = millis();
  }
  oled.clearDisplay();
  oled.setTextColor(SSD1306_WHITE);
  oled.setTextSize(1);
  oled.setCursor(0,0);

  if (oledPage == 0) {
    // Page 1: Sensors
    oled.println(F("== ARIES v2.0 =="));
    oled.print(F("Gas: "));  oled.print(gas);   oled.println(F(" PPM"));
    oled.print(F("T1:")); oled.print(t1,1); oled.print(F("C T2:")); oled.print(t2,1); oled.println(F("C"));
    oled.print(F("Dist:")); oled.print(dist); oled.println(F("cm"));
    if (gas > 600) { oled.println(F("!! GAS DANGER !!")); }
    if (dist < 25) { oled.println(F("!! OBSTACLE !!")); }

  } else if (oledPage == 1) {
    // Page 2: Survivor Vitals
    oled.println(F("=== VITALS ==="));
    oled.setTextSize(2);
    oled.print(F("HR:")); oled.println(beatAvg);
    oled.setTextSize(1);
    oled.println(F("BPM — MAX30102"));
    oled.print(F("Pres:")); oled.print(pres,0); oled.println(F("hPa"));

  } else {
    // Page 3: Status
    oled.println(F("=== STATUS ==="));
    oled.println(emergencyStop ? F("!! AUTO-STOP !!") : F("DRIVING OK"));
    oled.print(F("Pres:")); oled.print(pres,0); oled.println(F("hPa"));
    oled.println(F("LoRa: SEARCHING"));
  }
  oled.display();
}

// ─────────── JSON Telemetry Stream ──────────────────────
void streamTelemetry() {
  float t1 = dht.readTemperature();
  float h   = dht.readHumidity();
  ds18b20.requestTemperatures();
  float t2  = ds18b20.getTempCByIndex(0);
  int   gas = analogRead(MQ135_PIN);
  long  dist= getDist();
  float pres= bmp.readPressure() / 100.0F;
  float alt = bmp.readAltitude(1013.25);

  // Safety check: Auto-stop on obstacle or toxic gas
  if (dist < 25 || gas > 600) motorStop();

  updateOLED(t1, t2, gas, dist, pres);

  // JSON output for web dashboard
  Serial.print(F("{\"t1\":")); Serial.print(t1, 1);
  Serial.print(F(",\"t2\":")); Serial.print(t2, 1);
  Serial.print(F(",\"h\":")); Serial.print(h, 1);
  Serial.print(F(",\"gas\":")); Serial.print(gas);
  Serial.print(F(",\"dist\":")); Serial.print(dist);
  Serial.print(F(",\"pres\":")); Serial.print(pres, 1);
  Serial.print(F(",\"alt\":")); Serial.print(alt, 1);
  Serial.print(F(",\"hr\":")); Serial.print(beatAvg);
  Serial.println(F("}"));
}
