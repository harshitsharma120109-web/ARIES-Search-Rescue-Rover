# SMART INDIA HACKATHON 2026 — OFFICIAL IDEA PRESENTATION DECK
## Project: ARIES (Autonomous & Remotely-operated Intelligent Emergency Search-and-rescue rover)
## Team Name: ALPHA-X
## Problem Statement ID: SIH26223 | Theme: Disaster Management | Category: Hardware

---

### 📌 SLIDE 1: Title & Team Details (Cover Slide)
* **Problem Statement ID:** `SIH26223`
* **Problem Statement Title:** AICTE Student Innovation (Disaster Management)
* **Theme:** Disaster Management
* **Category:** Hardware / Robotics / IoT
* **Project Name:** **ARIES** (*Autonomous & Remotely-Operated Intelligent Emergency Search-and-Rescue Rover*)
* **Team Name:** **ALPHA-X**
* **Team Leader & Members:** [Insert Team Leader & Member Names / College Name / State]

> **Tagline:** *"Bridging the Critical First-Response Gap in Disaster Reconnaissance with Multi-Sensor Edge Intelligence."*

---

### 📌 SLIDE 2: Proposed Solution & Idea Overview

#### 1. The Real-World Problem:
* In natural/man-made disasters (collapsed buildings, tunnel collapses, industrial gas leaks, chemical spills, mine accidents), sending human rescue workers or sniffer dogs inside first poses severe life-threatening risks from structural collapse, toxic gases, and unmapped hazards.
* Existing military-grade rescue rovers are prohibitively expensive ($20,000+), heavy, and unavailable for municipal fire services, SDRF, or localized emergency teams.

#### 2. The ARIES Solution:
* **ARIES** is a rugged, compact, low-cost search-and-rescue ground rover engineered for immediate **first-in reconnaissance** in hazardous, GPS-denied environments.
* It penetrates confined disaster zones ahead of human entry to:
  1. **Stream live visual intelligence** via an onboard camera to the incident commander.
  2. **Continuously scan for environmental hazards:** Toxic gases (MQ-135), ambient temperature/humidity extremes (DHT11), and structural instability/tilt (MPU6500).
  3. **Provide assisted survivor discovery** with edge-assisted computer vision and an operator-in-the-loop verification protocol.
  4. **Guarantee emergency alert transmission** via redundant GSM/Cellular fallback even when standard local Wi-Fi range is compromised.

---

### 📌 SLIDE 3: Technical Approach & System Architecture

#### System Architecture:
```text
  [ DISASTER ZONE / HAZARDOUS ENVIRONMENT ]
  ┌─────────────────────────────────────────────────────────────┐
  │                        ARIES ROVER                          │
  │                                                             │
  │  ┌───────────────┐   ┌───────────────────────────────────┐  │
  │  │  ESP32-CAM    │   │           Arduino UNO             │  │
  │  │  (Wi-Fi Live  │   │  • MQ-135 Gas / Air Quality       │  │
  │  │   Video Feed) │   │  • DHT11 Temp & Humidity          │  │
  │  └───────┬───────┘   │  • MPU6500 Tilt & Vibration       │  │
  │          │           │  • Dual Ultrasonic + IR Sensors   │  │
  │          │           │  • L298N High-Torque Motor Drive  │  │
  │          │           └─────────────────┬─────────────────┘  │
  │          │                             │                    │
  │          │           ┌─────────────────┴─────────────────┐  │
  │          │           │           Arduino Nano            │  │
  │          │           │  • HC-05 Bluetooth Control        │  │
  │          │           │  • SIM800L GSM Emergency SMS      │  │
  │          │           └─────────────────┬─────────────────┘  │
  └──────────┼─────────────────────────────┼────────────────────┘
             │ (Wi-Fi 2.4GHz)              │ (Serial / GSM)
             ▼                             ▼
  ┌─────────────────────────────────────────────────────────────┐
  │                 RESCUE COMMAND DASHBOARD                    │
  │  • Live Video Stream & AI Survivor Detection Overlay        │
  │  • Real-Time Telemetry Gauges (Gas, Temp, Tilt, Obstacles)  │
  │  • Rover Teleoperation Controls (WASD / Gamepad / Mobile)   │
  │  • Operator Verification & Instant Emergency SOS Dispatch   │
  └─────────────────────────────────────────────────────────────┘
```

#### Key Technical Modules:
1. **Mobility & Drive Subsystem:** Rugged multi-wheel differential chassis driven by geared DC motors and L298N driver, featuring dual-zone ultrasonic collision avoidance.
2. **Multi-Hazard Sensor Array:** Analog/Digital sensor pipeline monitoring gas levels, ambient climate, and chassis tilt to prevent rollovers.
3. **Redundant Communication Pipeline:** High-bandwidth Wi-Fi for video streaming + Bluetooth for local low-latency navigation + GSM/SMS for long-range emergency beaconing.
4. **Intelligent Edge Pipeline:** Camera video analysis identifying possible human presence with an **"Operator Confirmation Workflow"** to eliminate false-positive emergency alerts.

---

### 📌 SLIDE 4: Feasibility, Uniqueness & Innovation

#### 1. Key Innovations:
* **Hybrid Redundant Architecture:** Dual-microcontroller + ESP32 pipeline prevents single-point-of-failure (motor control and sensor telemetry stay fully operational even if camera stream disconnects).
* **Realistic & Reliable AI Verification:** Unlike unrealistic claims of automated medical diagnosis on microcontrollers, ARIES implements a robust **Human-in-the-Loop AI workflow** (*Detection → Operator Verification → Authorized SOS Alert*).
* **Multi-Modal Threat Detection:** Integrates vision, atmospheric toxicity, ambient climate, and structural vibration in a single ultra-compact form factor.
* **Instant Cellular Fallback:** Transmits critical telemetry coordinates and SOS alerts via GSM SMS when local broadband/Wi-Fi infrastructure is destroyed.

#### 2. Feasibility & Cost Advantage:
* Built using modular, field-replaceable COTS (Commercial-Off-The-Shelf) embedded hardware.
* Total prototype bill of materials cost is **under ₹6,000–₹8,000 INR** (~$80–$100 USD), compared to industrial disaster robots costing upwards of ₹15,00,000 INR.
* High maintainability and field-repairability by rescue teams without specialized tooling.

---

### 📌 SLIDE 5: Impact, Social Benefits & Target Beneficiaries

#### 1. Target Beneficiaries & Potential Users:
* **NDRF (National Disaster Response Force) & SDRF:** Rapid deployment in building collapses, landslides, and urban search operations.
* **Fire & Emergency Services:** Pre-entry hazard scans during industrial fires, chemical storage leaks, and smoke-filled basements.
* **Mining & Heavy Industries:** Pipeline and collapsed tunnel structural/air-quality reconnaissance.
* **Defense & Law Enforcement:** Remote situational awareness in confined high-risk structures.

#### 2. Societal & Life-Saving Impact:
* **Zero-Human-Risk First Look:** Eliminates unnecessary endangerment of rescue personnel during the critical "Golden Hour" of disaster response.
* **Actionable Situational Awareness:** Provides incident commanders with live data before committing heavy rescue equipment.
* **Democratized Access:** Affordable cost enables every municipal fire station and regional rescue outpost to equip a reconnaissance rover.

---

### 📌 SLIDE 6: Technology Stack, Bill of Materials (BOM) & Roadmap

#### Hardware Bill of Materials (BOM):
| Component Category | Hardware Model / Specifications | Function |
| :--- | :--- | :--- |
| **Compute & Control** | Arduino UNO R3 + Arduino Nano | Master Sensor & Communication Controller |
| **Vision & Edge Stream**| ESP32-CAM (OV2640 Module) | Live Video Feed & Wi-Fi Streaming |
| **Environmental** | MQ-135 Gas Sensor + DHT11 | Toxic Gas, Smoke, Temp & Humidity Sensing |
| **Kinematic / Safety** | MPU6500 (6-DOF IMU) + HC-SR04 (x2) | Tilt/Vibration & Collision Avoidance |
| **Communication** | SIM800L GSM Module + HC-05 Bluetooth | Long-range Cellular SOS & Local Teleoperation |
| **Locomotion & Power** | L298N Motor Driver + High-Torque DC Motors | Rugged All-Terrain Mobility (12V Battery Pack) |

#### Future Scalability & Development Roadmap:
* **Phase 1 (Current):** Working integrated rover prototype with live telemetry, camera stream, obstacle avoidance & GSM alerts.
* **Phase 2 (Post-Hackathon):** Integration of FLIR Lepton Micro-Thermal Camera for survivor heat signature detection through smoke/dust.
* **Phase 3 (Enterprise):** LoRa Mesh networking (up to 5km range in dense rubble) + Tethered Micro-Drone aerial mapping payload.
