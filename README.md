# 🚨 ARIES — Autonomous & Remotely-Operated Intelligent Emergency Search-and-Rescue Rover

[![SIH 2026](https://img.shields.io/badge/SIH-2026-orange.svg)](https://www.sih.gov.in/)
[![Theme](https://img.shields.io/badge/Theme-Disaster%20Management-red.svg)]()
[![Team](https://img.shields.io/badge/Team-ALPHA--X-blue.svg)]()
[![Hardware](https://img.shields.io/badge/Platform-Dual--MCU%20Isolated%20Architecture-brightgreen.svg)]()

> **Problem Statement ID:** SIH26223 | **Theme:** Disaster Management | **Category:** Hardware & Edge AI  
> **Team:** ALPHA-X | **Institution:** AICTE Student Innovation

---

## 📌 Executive Summary
**ARIES** is an autonomous and teleoperated search-and-rescue rover engineered to eliminate secondary casualties during the critical **"Golden Hour"** of disaster response. Designed for zero-visibility, subterranean, and GPS-denied environments (earthquakes, collapsed concrete structures, basement fires, and mining cave-ins), ARIES acts as a **"Zero-Human-Risk First Look"** reconnaissance asset.

---

## 🌟 Key Technical Innovations

| Innovation | Technical Implementation | Benefit |
| :--- | :--- | :--- |
| **Decoupled Dual-MCU** | Arduino UNO #1 (Drive) + Arduino UNO #2 (Sensors) | Completely isolates motor inductive back-EMF spikes for 100% sensor uptime. |
| **Tri-Channel Comms** | Wi-Fi (Video) + Sub-GHz LoRa (5 km Rubble) + GSM SMS | Unbreakable telemetry link through meters of collapsed reinforced concrete. |
| **Multi-Sensor Fusion** | MQ-135 Gas, DHT11 Climate, HC-SR04 Sonar, Dual IR | 360° environmental safety, obstacle auto-brake (<25cm), and cliff drop protection. |
| **Live Telemetry HUD** | 0.96" Onboard OLED + Tactical Web Mission Console | Real-time sensor readings and live video with zero-lag Web Serial WASD driving. |
| **Emergency SOS SMS** | SIM800L Cellular Quad-Band Module | Automatic SMS alert dispatch to NDRF / Emergency contacts on critical gas leak. |
| **10x Cost Advantage** | Modular COTS (Commercial Off-The-Shelf) Parts | Target commercial cost **₹50,000 INR** vs **₹25 Lakhs** for imported military robots. |

---

## 🏗️ Hardware Architecture & Pin Map

### 🚗 Controller #1: Drive Subsystem (Arduino UNO #1 + L293D Shield)
* **Motors:** 4× High-Torque DC Gear Motors (M1, M2, M3, M4 terminals)
* **Power:** 9V/12V DC External Battery into `EXT_PWR` screw terminals
* **Controls:** Responds to Serial commands: `F` (Forward), `B` (Reverse), `L` (Spin Left), `R` (Spin Right), `S` (Stop)

### 📡 Controller #2: Sensor Hub (Arduino UNO #2)
* **MQ-135 Gas / Smoke:** Analog Pin `A0`
* **DHT11 Temperature & Humidity:** Digital Pin `D2`
* **HC-SR04 Sonar (Obstacle Radar):** Trig `D3`, Echo `D4` (<25 cm Auto-Brake)
* **IR Sensors (Cliff / Edge Drop):** Left `A1`, Right `A2`
* **0.96" OLED Display (I2C):** SDA `A4`, SCL `A5`
* **SIM800L GSM Module:** RX `D7`, TX `D8` (SoftwareSerial)
* **HC-05 Bluetooth:** RX `D9`, TX `D10` (SoftwareSerial)

### 👁️ Controller #3: Live Video Reconnaissance (ESP32-CAM)
* **Streaming Protocol:** 30 FPS MJPEG Stream over Wi-Fi SoftAP (`ARIES_RESCUE_ROVER`)
* **Endpoint:** `http://192.168.4.1/stream`

---

## 💻 Web Mission Hub & Command Console

The project includes an embedded, high-performance dark-theme mission control portal:
* **Tactical HUD:** Video feed with simulated Edge AI survivor target bounding boxes.
* **Live Telemetry Gauges:** Real-time visual meters for Gas PPM, Pressure, Altitude, Battery, Temperature, and Sonar Distance.
* **Bi-Directional Web Serial:** Connects directly to Arduino via USB in Google Chrome/Edge.
* **One-Click Launcher:** Double-click `START_MISSION_HUB.bat` to launch local server and open console.

---

## 📁 Repository Structure
```text
├── assets/images/              # 8K 3D renders and slide graphics
├── dashboard/                  # Production-ready web mission console
├── docs/sih/                   # Official 6-slide PPTX & presentation viewer
│   ├── SIH2026_ARIES_ALPHA-X.pptx
│   ├── presentation_viewer.html
│   └── slides_png/             # High-res 1920x1080 slide exports
├── firmware/
│   ├── arduino-uno/
│   │   ├── drive_controller/   # Arduino #1 Motor drive code
│   │   └── sensor_hub/         # Arduino #2 Multi-sensor & GSM code
│   └── esp32-cam/              # ESP32-CAM video streamer code
├── index.html                  # Master Web Mission Hub
├── server.ps1                  # Local HTTP server backend
└── START_MISSION_HUB.bat       # Single-click launcher
```

---

## 🏆 Team ALPHA-X — SIH 2026
*"We don't just build robots, we save lives and protect those who protect our nation."*
