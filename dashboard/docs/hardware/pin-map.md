# PROJECT ARIES — Complete Circuit Wiring & Pin Mapping Guide
## SIH 2026 | Team ALPHA-X | Problem Statement: SIH26223

---

### 1. Arduino UNO Master Controller (Sensors & Motors)

| Subsystem | Pin Name on UNO | Connected Component & Pin | Description |
| :--- | :--- | :--- | :--- |
| **Climate** | `D2` | DHT11 Signal (`DATA`) | Temperature & Humidity Sensor |
| **Motor Drive** | `D3` (PWM) | L298N `ENA` | Left Motor Speed Enable |
| **Motor Drive** | `D4` | L298N `IN1` | Left Motor Direction A |
| **Motor Drive** | `D5` | L298N `IN2` | Left Motor Direction B |
| **Motor Drive** | `D6` (PWM) | L298N `ENB` | Right Motor Speed Enable |
| **Motor Drive** | `D7` | L298N `IN3` | Right Motor Direction A |
| **Motor Drive** | `D8` | L298N `IN4` | Right Motor Direction B |
| **Ultrasonic 1**| `D10` | HC-SR04 Front Center `TRIG` | Trigger Pulse |
| **Ultrasonic 1**| `D11` | HC-SR04 Front Center `ECHO` | Echo Receive Pulse |
| **Ultrasonic 2**| `D12` | HC-SR04 Ground Clear `TRIG` | Trigger Pulse |
| **Ultrasonic 2**| `D13` | HC-SR04 Ground Clear `ECHO` | Echo Receive Pulse |
| **IR Proximity**| `A0` | TCRT5000 / IR Left Sensor | Near Obstacle / Cliff Edge |
| **IR Proximity**| `A1` | TCRT5000 / IR Right Sensor | Near Obstacle / Cliff Edge |
| **Toxic Gas** | `A2` | MQ-135 Gas Sensor `AOUT` | Air Quality & Toxic Gas ppm |
| **IMU / Tilt** | `A4` (`SDA`) | MPU6500 6-DOF IMU `SDA` | I2C Data Line (Roll/Pitch) |
| **IMU / Tilt** | `A5` (`SCL`) | MPU6500 6-DOF IMU `SCL` | I2C Clock Line |

---

### 2. Arduino Nano Dedicated Comms Controller

| Subsystem | Pin Name on Nano | Connected Module & Pin | Description |
| :--- | :--- | :--- | :--- |
| **Inter-MCU** | `D0` (`RX`) | Arduino UNO `TX` (`D1`) | Master Telemetry Stream In |
| **Inter-MCU** | `D1` (`TX`) | Arduino UNO `RX` (`D0`) | Drive Commands Out |
| **Cellular SOS**| `D8` (Soft RX) | SIM800L GSM `TXD` | GSM Serial In |
| **Cellular SOS**| `D9` (Soft TX) | SIM800L GSM `RXD` (via voltage divider) | GSM Serial Out |
| **Bluetooth** | `D10` (Soft RX) | HC-05 Bluetooth `TXD` | Smartphone Teleoperation In |
| **Bluetooth** | `D11` (Soft TX) | HC-05 Bluetooth `RXD` | Telemetry Return to Phone |

---

### 3. ESP32-CAM (AI-Thinker Model) Configuration

* **Wi-Fi Mode:** Soft-AP (SSID: `ARIES_RESCUE_ROVER`, Password: `aries1234`)
* **Live Video URL:** `http://192.168.4.1/stream` (MJPEG 30 FPS SVGA/VGA)
* **Power:** 5V / 2A dedicated supply (VCC to 5V pin, GND to Common GND)

---

### 4. Power Distribution & Grounding Guidelines

> ⚠️ **CRITICAL FOR GSM & MOTOR RELIABILITY:**
> 1. **Common Ground:** All microcontrollers (UNO, Nano, ESP32-CAM), sensors, motor driver, and SIM800L **MUST share a common GND rail**.
> 2. **SIM800L Power:** The SIM800L module requires **3.7V - 4.2V with peak bursts up to 2A**. Use an LM2596 buck converter or 1S Li-Ion dedicated supply. Do **not** power SIM800L from Arduino's 5V/3.3V pin.
> 3. **Motor Power:** 12V Li-Ion / Lead-Acid battery connected directly to L298N `12V` input, with 5V step-down regulator powering the microcontrollers.
