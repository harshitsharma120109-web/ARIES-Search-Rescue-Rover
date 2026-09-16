#include <SoftwareSerial.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

// ─────────── Serial Ports ───────────────────────────────
SoftwareSerial GSM(8, 9);    // SIM800L  RX=D8, TX=D9
SoftwareSerial BT(10, 11);   // HC-05    RX=D10,TX=D11

// ─────────── 0.91" OLED (128x32) ───────────────────────
#define SCREEN_W 128
#define SCREEN_H 32
Adafruit_SSD1306 oled(SCREEN_W, SCREEN_H, &Wire, -1);

// ─────────── Config ─────────────────────────────────────
const char RESCUE_CONTACT[] = "+919876543210"; // Change to NDRF number

bool  gsmReady  = false;
bool  btConn    = false;
unsigned long lastOledUpdate = 0;

// ════════════════════════════════════════════════════════
void setup() {
  Serial.begin(9600);   // Link to UNO
  GSM.begin(9600);
  BT.begin(9600);

  // OLED Init
  if (!oled.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
    Serial.println(F("{\"err\":\"NANO_OLED_FAIL\"}"));
  }
  showBootOLED();

  // GSM Init
  delay(2000);
  GSM.println(F("AT"));       delay(500);
  GSM.println(F("AT+CMGF=1")); delay(500); // SMS Text mode
  gsmReady = true;

  updateStatusOLED();
  Serial.println(F("{\"nano\":\"ONLINE\",\"gsm\":\"READY\",\"bt\":\"READY\"}"));
}

// ════════════════════════════════════════════════════════
void loop() {
  // Bridge BT → UNO (rover drive commands)
  if (BT.available()) {
    char c = BT.read();
    Serial.write(c);
    btConn = true;
  }

  // Bridge UNO → BT (telemetry to phone)
  if (Serial.available()) {
    char c = Serial.read();
    BT.write(c);
    // Check for SOS trigger from UNO
    if (c == 'E') sendSOS("SURVIVOR_DETECTED_BY_OPERATOR");
  }

  // Update OLED every 2 seconds
  if (millis() - lastOledUpdate > 2000) {
    updateStatusOLED();
    lastOledUpdate = millis();
  }
}

// ─────────── Boot Screen ────────────────────────────────
void showBootOLED() {
  oled.clearDisplay();
  oled.setTextColor(SSD1306_WHITE);
  oled.setTextSize(1);
  oled.setCursor(0, 0);
  oled.println(F("ARIES BASE STATION"));
  oled.println(F("Initializing..."));
  oled.display();
  delay(1500);
}

// ─────────── Operator Status Screen ─────────────────────
void updateStatusOLED() {
  oled.clearDisplay();
  oled.setTextColor(SSD1306_WHITE);
  oled.setTextSize(1);
  oled.setCursor(0, 0);
  oled.println(F("== ALPHA-X BASE =="));
  oled.print(F("BT:"));  oled.println(btConn   ? F("CONN") : F("WAIT"));
  oled.print(F("GSM:")); oled.println(gsmReady  ? F("READY")  : F("INIT"));
  oled.display();
}

// ─────────── Emergency SOS via SIM800L GSM ───────────────
void sendSOS(const char* event) {
  // Show SOS on OLED
  oled.clearDisplay();
  oled.setTextSize(1);
  oled.setCursor(0,0);
  oled.println(F("!! SOS SENT !!"));
  oled.println(F("NDRF ALERTED"));
  oled.display();

  GSM.println(F("AT+CMGF=1")); delay(500);
  GSM.print(F("AT+CMGS=\"")); GSM.print(RESCUE_CONTACT); GSM.println(F("\""));
  delay(1000);
  GSM.println(F("🚨 [ARIES SOS ALERT] 🚨"));
  GSM.println(F("Team ALPHA-X | SIH26223"));
  GSM.print(F("Event: ")); GSM.println(event);
  GSM.println(F("Survivor confirmed by operator."));
  GSM.println(F("Dispatch NDRF immediately."));
  GSM.write(26); // Ctrl+Z to send
  delay(3000);
  updateStatusOLED();
}
