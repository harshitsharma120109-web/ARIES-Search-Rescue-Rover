// ============================================================
// ARIES SEARCH & RESCUE ROVER — WIRELESS TELEMETRY GATEWAY
// Board: ESP32 NodeMCU (Wi-Fi Bridge)
// Baud Rate: 9600
// ============================================================
#include <WiFi.h>
#include <WebServer.h>

const char* ssid     = "ARIES_RESCUE_ROVER"; // ESP32-CAM Wi-Fi
const char* password = "aries1234";

WebServer server(8080);
String lastTelemetry = "{\"status\":\"STANDBY\"}";

void handleRoot() {
  server.send(200, "application/json", lastTelemetry);
}

void handleCommand() {
  if (server.hasArg("cmd")) {
    String cmd = server.arg("cmd");
    Serial.print(cmd); // Forward command to Arduino UNO #1
    server.send(200, "text/plain", "OK");
  } else {
    server.send(400, "text/plain", "MISSING_CMD");
  }
}

void setup() {
  Serial.begin(9600); // Hardware Serial to Arduino
  WiFi.begin(ssid, password);

  int attempts = 0;
  while (WiFi.status() != WL_CONNECTED && attempts < 20) {
    delay(500);
    attempts++;
  }

  server.on("/telemetry", handleRoot);
  server.on("/cmd", handleCommand);
  server.begin();
}

void loop() {
  server.handleClient();

  // Read Telemetry from Arduino #2 and buffer it
  if (Serial.available() > 0) {
    String incoming = Serial.readStringUntil('\n');
    if (incoming.length() > 0) {
      lastTelemetry = incoming;
    }
  }
}
