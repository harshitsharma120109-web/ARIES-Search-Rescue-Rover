# 🎙️ SMART INDIA HACKATHON 2026 — OFFICIAL TEAM PITCH SCRIPT
## Team ALPHA-X | Problem Statement: SIH26223 | Project: ARIES
**Presentation Date:** 22 September 2026 | **Time Slot:** 1:00 PM – 3:00 PM | **Room:** 440
**Target Total Pitch Time:** 5:30 to 6:00 Minutes (~60 Seconds per Speaker)

---

## 📋 STAGE STRATEGY & ROSTER OVERVIEW

| Speaker | Name / Role | Assigned Slide | Core Focus | Target Time |
| :--- | :--- | :--- | :--- | :---: |
| **Speaker 1** | **Harshit Sharma** (Team Leader) | Slide 1 ➔ Slide 2 | **The Hook, Problem Statement (SIH26223), ARIES Introduction** | **0:00 - 1:00 (60s)** |
| **Speaker 2** | Hardware & Locomotion Lead | Slide 2 ➔ Slide 3 | **4WD Chassis, Dual-MCU Inductive Noise Isolation, Auto-Brake** | **1:00 - 2:00 (60s)** |
| **Speaker 3** | Sensors & Biometrics Lead | Slide 3 | **Multi-Hazard Scanning (MQ-135/DHT11), MAX30102 Vitals (BPM/SpO2)** | **2:00 - 3:00 (60s)** |
| **Speaker 4** | Comms & Edge AI Lead | Slide 3 ➔ Slide 4 | **5 km Sub-GHz LoRa Mesh, GSM Fallback, Human-in-the-Loop AI** | **3:00 - 4:00 (60s)** |
| **Speaker 5** | Software & Live Demo Operator | Slide 4 | **Web Mission Hub Live Console, Web Serial Telemetry & Rover Demo** | **4:00 - 5:00 (60s)** |
| **Speaker 6** | Business Viability & Closer | Slide 5 ➔ Slide 6 | **₹50K vs ₹25L Cost Disruption, NDRF Impact, GitHub Repo & Closing** | **5:00 - 6:00 (60s)** |

---

```
[ TIMELINE FLOWCHART ]
0:00        1:00        2:00        3:00        4:00        5:00        6:00 MIN
 ├───────────┼───────────┼───────────┼───────────┼───────────┼───────────┤
  Speaker 1   Speaker 2   Speaker 3   Speaker 4   Speaker 5   Speaker 6
  (Hook/PS)   (Hardware)  (Sensors)   (Comms/AI)  (Live Demo) (Cost/Closer)
```

---

## 🎯 SPEAKER 1: TEAM LEADER (HARSHIT SHARMA)
**Slide on Screen:** Slide 1 (Cover) ➔ Transition to Slide 2 (Proposed Solution)  
**Timing:** `0:00` to `1:00` (60 Seconds)  
**Tone:** Powerful, Authoritative, Eye contact with judges.

### 🎬 Action Cues:
- Stand in the center. Both hands open. Smile and greet judges with strong voice.
- At 0:40, gesture towards Slide 2 on the projector screen.

### 🗣️ Exact Dialogue (English):
> "A very good afternoon, Respected Judges and Evaluators.
> 
> In any catastrophic disaster—whether it is an earthquake collapse, an industrial gas explosion, or an underground mine hazard—the first 60 minutes are critically known as the **'Golden Hour'**.
> 
> Currently, emergency services face an impossible dilemma: sending human first-responders or sniffer dogs blindly into structurally unstable rubble risks secondary casualties, toxic asphyxiation, and tragic loss of rescuer lives. On the other hand, imported military rescue robots cost upwards of **₹25 Lakhs**, making them completely inaccessible to local municipal fire brigades and regional response teams.
> 
> Addressing Problem Statement **SIH26223**, we are **Team ALPHA-X**, and we present **ARIES**: *Autonomous & Remotely-Operated Intelligent Emergency Search-and-Rescue Rover*.
> 
> ARIES is a rugged, low-cost first-in reconnaissance scout engineered to penetrate collapsed rubble and GPS-denied hazards *before* human boots touch the ground.
> 
> To explain our core hardware architecture and domain isolation, I invite **Speaker 2**."

*(Pass mic / nod to Speaker 2)*

---

## ⚙️ SPEAKER 2: HARDWARE & LOCOMOTION LEAD
**Slide on Screen:** Slide 2 ➔ Slide 3 (Technical Architecture & Dual-MCU)  
**Timing:** `1:00` to `2:00` (60 Seconds)  
**Tone:** Technical, confident, engineering-focused.

### 🎬 Action Cues:
- Step forward. Point directly at the physical Rover on the table.
- Emphasize the "Dual-MCU" words with vocal punch.

### 🗣️ Exact Dialogue (English):
> "Thank you, Harshit.
> 
> In disaster robotics, physical mobility in hostile terrain is paramount. ARIES is built on a high-clearance, 4-wheel differential drive chassis powered by geared high-torque DC motors, capable of traversing uneven debris and steep inclines.
> 
> But our greatest engineering innovation lies in our **Decoupled Dual-MCU Domain Isolation**.
> 
> In conventional hobbyist rovers, driving high-current DC motors generates heavy inductive back-EMF noise and voltage brownout spikes. When sensors and motors share a single microcontroller, this electrical noise freezes the I2C bus and crashes the telemetry.
> 
> In ARIES, we strictly isolated the domains:
> - **Arduino UNO #1** functions exclusively as the High-Current Drive Controller via an L293D motor driver with independent buck-regulated power.
> - **Arduino UNO #2** acts as a completely isolated, noise-free **Master Sensor Hub**.
> 
> Furthermore, front-mounted ultrasonic sonar provides autonomous hardware auto-braking whenever an obstacle is detected within 25 cm, preventing collisions in zero-visibility dust.
> 
> To detail our multi-sensor perception and world-first biometric life-detection, here is **Speaker 3**."

*(Pass mic / nod to Speaker 3)*

---

## 🔍 SPEAKER 3: SENSORS & BIOMETRICS SPECIALIST
**Slide on Screen:** Slide 3 (Perception Stack & MAX30102 Vitals)  
**Timing:** `2:00` to `3:00` (60 Seconds)  
**Tone:** Clear, scientifically precise, enthusiastic.

### 🎬 Action Cues:
- Point at the sensor array on the Rover (MQ-135, DHT11, OLED, MAX30102).
- Highlight the "MAX30102 Biometrics" as the killer differentiator.

### 🗣️ Exact Dialogue (English):
> "Thank you.
> 
> A rescue rover is only as valuable as the life-saving intelligence it gathers. ARIES carries a comprehensive multi-modal environmental and vital sensor payload:
> 
> 1. **Atmospheric Toxicity:** An onboard **MQ-135 gas sensor** continuously maps concentrations of Carbon Monoxide, Methane, and toxic combustion smoke in real-time PPM.
> 2. **Subterranean Micro-Climate:** A **DHT11 sensor** tracks ambient temperature and humidity, while a **BMP280 barometric sensor** estimates relative depth in collapsed basement voids.
> 3. **Chassis Safety:** An **MPU6500 6-DOF IMU** continuously monitors pitch and roll, auto-throttling motors if the chassis exceeds a 30-degree tilt to eliminate rollover risk.
> 
> But our primary global breakthrough is **Proximity Survivor Vitals Detection**. Using an integrated **MAX30102 biometric pulse oximetry sensor**, ARIES confirms trapped survivor presence by detecting heartbeat (BPM) and blood oxygen (SpO2) upon proximity.
> 
> This enables **Thermal-Gas-Vital Fusion**: triage medics receive vital signs and ambient toxicity *before* heavy excavation even starts! An onboard 0.96-inch OLED displays these readings directly to field responders.
> 
> Now, **Speaker 4** will explain our resilient deep-rubble communications and edge vision."

*(Pass mic / nod to Speaker 4)*

---

## 📡 SPEAKER 4: COMMS & EDGE AI SPECIALIST
**Slide on Screen:** Slide 3 (Tri-Channel Comms) ➔ Slide 4 (Challenges & Mitigation)  
**Timing:** `3:00` to `4:00` (60 Seconds)  
**Tone:** Firm, solving real-world constraints, sharp.

### 🎬 Action Cues:
- Hold up or gesture toward the antennas / ESP32-CAM on the rover.
- Highlight the phrase "Human-in-the-Loop" to impress judges on AI safety.

### 🗣️ Exact Dialogue (English):
> "Thank you.
> 
> In disaster zones, traditional communication infrastructure is the first casualty. Standard 2.4 GHz Wi-Fi and 4G cellular signals attenuate drastically through three meters of reinforced concrete and debris.
> 
> To solve this, ARIES implements a **Tri-Channel Resilient Communication Pipeline**:
> 1. **High-Bandwidth Local Vision:** An onboard **ESP32-CAM** streams 30 FPS low-latency video and dual-spectrum thermal overlays over a local SoftAP Wi-Fi network.
> 2. **Deep-Rubble Lifeline:** In sub-surface concrete shafts where Wi-Fi drops, ARIES seamlessly switches to a **5 km Sub-GHz LoRa Mesh (868/915 MHz)**, penetrating dense concrete to maintain an unbroken telemetry bridge.
> 3. **Cellular Fallback:** A dedicated **SIM800L GSM engine** dispatches automated SMS emergency beacons containing survivor coordinates directly to Incident Commanders' phones.
> 
> Crucially, for survivor detection, we implement a **Human-in-the-Loop AI Protocol**. Edge vision flags potential survivor heat signatures, but the incident commander must visually verify the target on HUD before dispatching emergency teams. This eliminates 100% of false alarms from fire embers or heated pipes.
> 
> Now, **Speaker 5** will demonstrate our live Mission Hub Command Console."

*(Pass mic / nod to Speaker 5)*

---

## 💻 SPEAKER 5: SOFTWARE & LIVE DEMO LEAD
**Slide on Screen:** Slide 4 (PoC Validation) + Web Mission Hub on Laptop/Screen  
**Timing:** `4:00` to `5:00` (60 Seconds)  
**Tone:** Dynamic, hands-on, showing real-time working hardware.

### 🎬 Action Cues:
- **Turn ON Rover power switch** (show OLED lighting up).
- On the laptop screen, show the Web Mission Hub console (`joyful-cactus-9b247c.netlify.app` / `localhost:8080`).
- Point to live dials (Gas PPM, Distance, Temp, Status) updating.

### 🗣️ Exact Dialogue (English):
> "Thank you.
> 
> Respected Judges, what you see before you is not a theoretical CAD model—it is a **fully functional, scaled working prototype**.
> 
> As you can see on screen, this is our **ARIES Web Mission Hub**, accessible from any browser without installing proprietary software.
> 
> Connecting directly via browser Web Serial API to our Master Hub, the dashboard streams live telemetry:
> - Here is our **real-time MQ-135 Gas toxicity gauge**, alerting in amber and red if hazard thresholds are breached.
> - Here is the **ambient temperature and humidity telemetry**.
> - And here is our **ultrasonic distance radar**, transmitting distance readings at steady 10-second telemetry intervals.
> 
> On the video feed side, the operator receives live first-person visual intelligence with teleoperation controls and instant emergency SOS dispatch triggers.
> 
> Every packet, sensor readout, and command pipeline has been validated end-to-end on embedded silicon.
> 
> To present our economic feasibility, national impact, and conclusion, I invite **Speaker 6**."

*(Pass mic / nod to Speaker 6)*

---

## 🏆 SPEAKER 6: BUSINESS FEASIBILITY & CLOSING PITCH
**Slide on Screen:** Slide 5 (Impact & Beneficiaries) ➔ Slide 6 (Standards, Citations & Repo)  
**Timing:** `5:00` to `6:00` (60 Seconds)  
**Tone:** Inspiring, high energy, confident, climactic closing.

### 🎬 Action Cues:
- Transition slide to Slide 6 (References, Standards & GitHub Repo).
- Point to the GitHub link and live Netlify link on the screen.
- Deliver the final sentence with pride and pause for applause!

### 🗣️ Exact Dialogue (English):
> "Thank you.
> 
> Let us look at the economic reality. Military-grade search-and-rescue rovers currently cost between **₹25 to ₹30 Lakhs** ($25,000+), locking out municipal rescue stations.
> 
> By utilizing modular Commercial-Off-The-Shelf architecture, our basic working prototype was fabricated under **₹8,000 INR**, and our ruggedized, IP67 industrial production model has a target unit cost of under **₹50,000 INR**—representing an unprecedented **10x to 20x cost advantage**!
> 
> This democratizes search-and-rescue technology for:
> 1. **NDRF and State SDRF battalions** for rapid building collapse reconnaissance.
> 2. **Municipal Fire Services** for pre-entry smoke and toxic gas scans.
> 3. **Mining and Tunnel Authorities** for hazardous deep-shaft inspections.
> 
> Our system adheres to **NDMA Urban Search & Rescue guidelines** and NDRF Standard Operating Procedures for hazardous entry. Furthermore, our complete Dual-MCU firmware, schematics, and Mission Hub software are completely open-source on our **official GitHub repository** shown on Slide 6.
> 
> Respected Judges, at Team ALPHA-X, our motto is:  
> **'We don't just build robots, we build hope.'**
> 
> Thank you, and we are now open for your questions!"

*(All 6 team members stand straight, smile, and look at judges ready for Q&A)*

---

## 🛡️ TOP 5 JUDGES' CROSS-QUESTIONS (Q&A CHEAT SHEET)

### ❓ Question 1: "Why Dual-MCU? Why couldn't an ESP32 or single Arduino do everything?"
- **Answered by:** Speaker 2 or Speaker 1
> *"Sir, rescue environments demand 99.9% fault tolerance. When 4 high-torque DC motors stall in heavy rubble, they create massive back-EMF inductive spikes and draw up to 2-3 Amperes. In a single-MCU design, these electrical noise spikes disrupt the I2C bus and reset the microcontroller, blinding the operator. Our Dual-MCU architecture provides absolute physical domain isolation: motors run on Arduino #1, while mission-critical gas sensors and telemetry remain completely uninterrupted on Arduino #2."*

### ❓ Question 2: "Wi-Fi doesn't penetrate concrete rubble. How will your rover communicate?"
- **Answered by:** Speaker 4
> *"Exactly, Sir! 2.4 GHz Wi-Fi attenuates after just 1-2 meters of concrete. That is why Wi-Fi is used only for line-of-sight video. For sub-surface penetration, ARIES automatically routes telemetry through our **5 km Sub-GHz LoRa Mesh operating at 868/915 MHz**. Sub-GHz radio waves have significantly longer wavelengths that diffract through concrete voids where Wi-Fi drops completely. Additionally, our SIM800L module provides an independent GSM SMS fallback."*

### ❓ Question 3: "How does your rover avoid false alarms from hot debris or fire embers?"
- **Answered by:** Speaker 3 or Speaker 4
> *"Sir, that is solved through our **Two-Tier Verification Protocol**:*
> *First, thermal camera heat detection is cross-referenced with our **MAX30102 biometric sensor**, which looks for actual physiological human heartbeat (BPM) and blood oxygen (SpO2). Fire embers and hot pipes do not produce a pulse!*
> *Second, we enforce **Human-in-the-Loop AI**: the AI flags the candidate on the HUD, but emergency SOS dispatch requires the Incident Commander's manual confirmation. Zero false alerts are broadcast."*

### ❓ Question 4: "What happens if the rover flips upside down in steep debris?"
- **Answered by:** Speaker 2 or Speaker 5
> *"Sir, we have two layers of protection:*
> *Active Protection: Our onboard MPU6500 6-DOF IMU tracks real-time pitch and roll angles. If the chassis tilts beyond 30 degrees, the drive controller automatically engages hardware auto-braking to prevent a rollover.*
> *In our enterprise design, ARIES utilizes a symmetrical invertible chassis geometry with large diameter wheels, allowing the rover to operate and drive continuously even if inverted."*

### ❓ Question 5: "How did you achieve a ₹50,000 cost when commercial rovers cost ₹25 Lakhs?"
- **Answered by:** Speaker 6
> *"Sir, foreign defense rovers carry massive proprietary markups, classified military radios, and expensive overseas service contracts. ARIES is designed on **Modular COTS (Commercial-Off-The-Shelf) architecture**. By leveraging open-source embedded silicon (ATmega + ESP32), standardized Sub-GHz LoRa transceivers, and localized 3D printed rugged nylon frames, our prototype BOM is under ₹8,000, and our industrial batch production model scales under ₹50,000 INR."*

---

## ⚡ FINAL REHEARSAL CHECKLIST (FOR TODAY - 21 SEPT)

- [ ] **Stopwatch Drill:** Run all 6 speeches back-to-back 3 times with a phone timer. Total pitch must finish between **5:15 and 5:45 minutes**.
- [ ] **Handover Cues:** Practice the exact handover sentences ("I invite Speaker 2...", "Here is Speaker 3...", etc.).
- [ ] **Physical Hardware Test:** Turn on Rover switch at 4:00 when Speaker 5 speaks. OLED screen should show live readings.
- [ ] **Open Browser Tabs Before Entering Room 440:**
  1. Slide deck (`SIH2026_ARIES_ALPHA-X.pptx` or full-screen PNG viewer)
  2. Web Mission Hub (`joyful-cactus-9b247c.netlify.app` or `http://localhost:8080`)
  3. GitHub Repo (`github.com/harshitsharma120109-web/ARIES-Search-Rescue-Rover`)
- [ ] **Charge Everything to 100%:** Laptop, rover 18650 batteries, mobile hotspot phone.
