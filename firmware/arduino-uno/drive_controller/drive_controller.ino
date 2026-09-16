// ============================================================
// ARIES SEARCH & RESCUE ROVER — DRIVE SUBSYSTEM
// Controller: Arduino UNO #1 + L293D Motor Shield
// Baud Rate: 9600
// ============================================================
#include <AFMotor.h>

// 4 DC Motors connected to L293D Shield terminals M1, M2, M3, M4
AF_DCMotor motorFL(1); // Front-Left
AF_DCMotor motorRL(2); // Rear-Left
AF_DCMotor motorRR(3); // Rear-Right
AF_DCMotor motorFR(4); // Front-Right

const int DRIVE_SPEED = 210; // Speed 0 to 255
const int TURN_SPEED  = 180;

void setup() {
  Serial.begin(9600);
  stopMotors();
  Serial.println(F("{\"subsystem\":\"DRIVE_CORE\",\"status\":\"ONLINE\"}"));
}

void loop() {
  if (Serial.available() > 0) {
    char cmd = Serial.read();
    executeCommand(cmd);
  }
}

void executeCommand(char cmd) {
  switch (cmd) {
    case 'F': // Forward
      setSpeed(DRIVE_SPEED);
      motorFL.run(FORWARD); motorRL.run(FORWARD);
      motorFR.run(FORWARD); motorRR.run(FORWARD);
      break;

    case 'B': // Backward
      setSpeed(DRIVE_SPEED);
      motorFL.run(BACKWARD); motorRL.run(BACKWARD);
      motorFR.run(BACKWARD); motorRR.run(BACKWARD);
      break;

    case 'L': // Turn Left (Spin)
      setSpeed(TURN_SPEED);
      motorFL.run(BACKWARD); motorRL.run(BACKWARD);
      motorFR.run(FORWARD);  motorRR.run(FORWARD);
      break;

    case 'R': // Turn Right (Spin)
      setSpeed(TURN_SPEED);
      motorFL.run(FORWARD);  motorRL.run(FORWARD);
      motorFR.run(BACKWARD); motorRR.run(BACKWARD);
      break;

    case 'S': // Emergency Stop
    default:
      stopMotors();
      break;
  }
}

void setSpeed(int s) {
  motorFL.setSpeed(s); motorRL.setSpeed(s);
  motorFR.setSpeed(s); motorRR.setSpeed(s);
}

void stopMotors() {
  motorFL.run(RELEASE); motorRL.run(RELEASE);
  motorFR.run(RELEASE); motorRR.run(RELEASE);
}
