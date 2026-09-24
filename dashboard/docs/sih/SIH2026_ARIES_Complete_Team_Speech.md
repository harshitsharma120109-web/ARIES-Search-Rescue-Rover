# 🎙️ SMART INDIA HACKATHON 2026 — OFFICIAL TEAM PITCH SCRIPT
## Team ALPHA-X | Problem Statement: SIH26223 | Project: ARIES
**Presentation Date:** 22 September 2026 | **Time Slot:** 1:00 PM – 3:00 PM | **Room:** 440
**Target Total Pitch Time:** 5:30 to 6:00 Minutes (~50-60 Seconds per Speaker)

---

## 📋 6-STEP TEAM STRUCTURE & ROLE ROSTER

| Speaker | Role | Stage Action | Core Focus | Time |
| :---: | :--- | :--- | :--- | :---: |
| **Speaker 1** | **Opening & Problem Statement** | Stands Center, addresses judges | Disaster Golden Hour, Rescuer Hazards, ₹25L cost barrier | **0:00 - 0:55** |
| **Speaker 2** | **Proposed Solution & Innovation** | Points to Slide 2 (Solution) | Introducing ARIES, First-In Scout concept, FLIR Thermal, 5km LoRa | **0:55 - 1:50** |
| **Speaker 3** | **Hardware & Electronics** | Points to Rover Hardware & Slide 3 | Dual-MCU Isolation, Motors vs Sensors, MQ-135, MAX30102 Vitals | **1:50 - 2:45** |
| **Speaker 4** | **Software, AI & Connectivity** | Points to Slide 4 & Architecture | Web Mission Hub, ESP32 30 FPS, Edge AI, Tri-Channel LoRa/GSM | **2:45 - 3:40** |
| **Speaker 5** | **Live Model & Prototype Demo** | **Powers ON Rover & Shows Dashboard** | Live Telemetry, Sonar auto-brake test, OLED display, Web Serial | **3:40 - 4:40** |
| **Speaker 6** | **Cost, National Impact & Closing** | Points to Slide 5/6 & Repo link | ₹50k vs ₹25L Disruption, NDRF rollout, Closing punchline | **4:40 - 5:35** |

---

```
[ THE 6-STEP PITCH PIPELINE ]
  1. PROBLEM ──▶ 2. SOLUTION ──▶ 3. HARDWARE ──▶ 4. SOFTWARE ──▶ 5. LIVE DEMO ──▶ 6. COST & IMPACT
   (Speaker 1)    (Speaker 2)     (Speaker 3)     (Speaker 4)     (Speaker 5)     (Speaker 6)
```

---

## 🎯 SPEAKER 1: OPENING & PROBLEM STATEMENT
- **Slide:** Slide 1 (Title / Cover Slide)
- **Time:** `0:00` to `0:55` (55 Seconds)
- **Stage Action:** Center stage. Strong eye contact with judges. Confident and impactful voice.

### 🗣️ Exact Dialogue (English):
> "A very good afternoon, Respected Judges and Evaluators.
> 
> In any catastrophic disaster—whether it is an earthquake collapse, an industrial gas explosion, or a subterranean mine accident—the first 60 minutes are critically known as the **'Golden Hour'**. 
> 
> In these critical moments, emergency services face an agonizing dilemma. Sending human rescue workers or sniffer dogs blindly into structurally unstable debris risks secondary cave-ins, toxic gas asphyxiation, and tragic loss of rescuer lives. 
> 
> On the other hand, imported military-grade disaster robots cost upwards of **₹25 Lakhs**, making them completely unaffordable for local municipal fire stations and regional disaster response forces.
> 
> Addressing Problem Statement **SIH26223**, we are **Team ALPHA-X**, and we are here to bridge this critical first-response reconnaissance gap.
> 
> To present our proposed solution and core concept, I invite **Speaker 2**."

*(Pass mic / nod to Speaker 2)*

---

## 💡 SPEAKER 2: PROPOSED SOLUTION & INNOVATION
- **Slide:** Slide 2 (Proposed Solution & Innovation Ecosystem)
- **Time:** `0:55` to `1:50` (55 Seconds)
- **Stage Action:** Point to Slide 2 projector screen, energetic and solution-oriented tone.

### 🗣️ Exact Dialogue (English):
> "Thank you, Harshit.
> 
> Our solution is **ARIES**: *Autonomous and Remotely-Operated Intelligent Emergency Search-and-Rescue Rover*.
> 
> ARIES is a rugged, low-cost, all-terrain first-in reconnaissance scout engineered to enter confined, GPS-denied disaster hazards *before* human boots touch the ground.
> 
> ARIES operates on three foundational innovations:
> 1. **Zero-Human-Risk First Look:** It penetrates toxic and collapsed rubble to deliver live situational awareness directly to incident commanders during the Golden Hour.
> 2. **Dual-Spectrum Vision Core:** Combining high-definition optical streaming with an integrated **FLIR Micro-Thermal Core**, ARIES spots trapped survivor body heat (37°C) even through dense smoke, dust, and total darkness.
> 3. **Deep-Rubble Sub-Surface Comms:** Utilizing a **5 km Sub-GHz LoRa Mesh (868/915 MHz)**, ARIES maintains an unbroken telemetry lifeline through dense concrete where standard Wi-Fi and 4G fail completely.
> 
> To break down the internal embedded hardware and sensor electronics, over to **Speaker 3**."

*(Pass mic / nod to Speaker 3)*

---

## ⚙️ SPEAKER 3: HARDWARE & ELECTRONICS ARCHITECTURE
- **Slide:** Slide 3 (Technical Approach & Hardware Architecture)
- **Time:** `1:50` to `2:45` (55 Seconds)
- **Stage Action:** Step up near the physical Rover on the table. Point to the chassis, boards, and sensors.

### 🗣️ Exact Dialogue (English):
> "Thank you.
> 
> When engineering a rescue rover, hardware reliability in harsh physical terrain is non-negotiable. ARIES is built on a 4-wheel differential high-torque drive chassis.
> 
> Our most critical engineering breakthrough is **Decoupled Dual-MCU Domain Isolation**:
> In conventional rovers, running high-current DC motors generates heavy inductive back-EMF noise. This noise travels across the power rails, crashing I2C sensor lines and freezing the microcontroller. 
> 
> We completely isolated the domains:
> - **Arduino UNO #1** functions solely as the High-Current Drive Controller via an L293D shield with dedicated buck-regulated power.
> - **Arduino UNO #2** operates as a clean, noise-free **Master Sensor Hub**.
> 
> Our sensor payload includes an **MQ-135 gas sensor** for real-time toxic PPM mapping, a **DHT11** for ambient climate, a **BMP280** for barometric depth estimation, and an **MPU6500 IMU** for active anti-rollover tilt protection.
> 
> Furthermore, we integrated a **MAX30102 biometric pulse oximeter**, allowing the rover to detect a trapped survivor's heartbeat (BPM) and blood oxygen (SpO2) upon proximity.
> 
> Now, **Speaker 4** will detail our software stack, AI, and connectivity pipeline."

*(Pass mic / nod to Speaker 4)*

---

## 💻 SPEAKER 4: SOFTWARE, AI & CONNECTIVITY
- **Slide:** Slide 4 (Technical Feasibility, Comms & AI Workflow)
- **Time:** `2:45` to `3:40` (55 Seconds)
- **Stage Action:** Point to the software architecture and highlight "Human-in-the-Loop AI".

### 🗣️ Exact Dialogue (English):
> "Thank you.
> 
> The intelligence of ARIES is powered by a multi-tier software and resilient communication pipeline.
> 
> 1. **Tri-Channel Resilient Comms:**
>    - For line-of-sight operations, our onboard **ESP32 Core** hosts a local SoftAP Wi-Fi network, streaming 30 FPS low-latency video.
>    - In sub-surface concrete rubble, telemetry automatically routes through our **5 km Sub-GHz LoRa Mesh**.
>    - For long-range emergency beaconing, a dedicated **SIM800L GSM module** sends automated SOS SMS alerts with survivor coordinates directly to emergency personnel.
> 
> 2. **Human-in-the-Loop AI Protocol:**
>    Rather than relying on black-box automated triggers that risk false emergency dispatches from hot pipes or fire embers, our edge computer vision flags survivor candidates, but requires **manual verification by the Incident Commander** on the HUD before dispatching the rescue team—ensuring 100% false-alarm elimination.
> 
> 3. **Web Mission Hub:**
>    Built using HTML5, CSS3, and browser Web Serial API, our command console runs on any laptop or tablet without installing proprietary drivers.
> 
> Now, let us demonstrate this system live. Over to **Speaker 5**."

*(Pass mic / nod to Speaker 5)*

---

## 🤖 SPEAKER 5: LIVE WORKING MODEL & TELEMETRY DEMO
- **Focus:** Live Physical Rover & Laptop Screen Displaying Web Mission Hub
- **Time:** `3:40` to `4:40` (60 Seconds)
- **Stage Action:** **Power switch ON karo** (OLED screen glow karegi). Laptop screen par Web Mission Hub me live dials dikhao. Hand move karke sonar auto-stop dikhao.

### 🗣️ Exact Dialogue (English):
> "Thank you!
> 
> Respected Judges, what you see here is not just a presentation—it is a **fully functional, scaled working prototype**.
> 
> *(Actions while speaking):*
> As I power ON the rover:
> - You can see our **0.96-inch onboard OLED field display** instantly initialize, providing direct visual feedback to first-responders right at the debris edge.
> - Connecting to our **Web Mission Hub** on screen, our Master Hub streams telemetry packets via Web Serial every 10 seconds:
>   - Here is our **live MQ-135 Gas toxicity dial**, actively monitoring environmental PPM.
>   - Here is our **ambient temperature and humidity telemetry**.
>   - And here is our **ultrasonic distance radar**. When an obstacle approaches within 25 cm—*(place hand in front of sonar)*—the rover triggers an autonomous safety lock, preventing collisions in dust.
> 
> The operator has complete teleoperation control and instant SOS alert dispatch triggers right from this lightweight browser interface.
> 
> To discuss our cost disruption, national impact, and closing vision, here is **Speaker 6**."

*(Pass mic / nod to Speaker 6)*

---

## 🏆 SPEAKER 6: COST DISRUPTION, NATIONAL IMPACT & CLOSING
- **Slide:** Slide 5 (Impact) ➔ Slide 6 (Research, Standards & GitHub Repo)
- **Time:** `4:40` to `5:35` (55 Seconds)
- **Stage Action:** Transition to Slide 6. Point to GitHub link and live Netlify link on screen. High energy and proud closing.

### 🗣️ Exact Dialogue (English):
> "Thank you.
> 
> Let us address the most crucial question: **Economic Viability**.
> 
> Existing commercial search-and-rescue rovers cost upwards of **₹25 to ₹30 Lakhs**, placing them out of reach for municipal budgets.
> 
> By utilizing modular Commercial-Off-The-Shelf architecture, our basic working prototype was fabricated under **₹8,000 INR**, and our ruggedized IP67 enterprise production model has a target unit cost of under **₹50,000 INR**—representing an unprecedented **10x to 20x cost disruption**!
> 
> This enables wide-scale national adoption across:
> - **NDRF and State SDRF battalions** for rapid structural collapse search.
> - **Municipal Fire Departments** for toxic gas and basement fire reconnaissance.
> - **Mining and Tunnel Authorities** for deep subterranean shaft inspections.
> 
> Our system complies with **NDMA Urban Search & Rescue guidelines** and NDRF Standard Operating Procedures. Furthermore, our complete Dual-MCU firmware, schematics, and Mission Hub code are fully open-source on our **official GitHub repository** shown on Slide 6.
> 
> Respected Judges, at Team ALPHA-X, we firmly believe:  
> **'We don't just build robots, we build hope.'**
> 
> Thank you, and we are now ready for your questions!"

*(All 6 members stand tall, smile, and look at the judges ready for Q&A)*

---

## 🛡️ TOP 5 JUDGES' CROSS-QUESTIONS (READY-MADE DEFENSE)

### ❓ Q1: "Why Dual-MCU? Why not run everything on a single ESP32 or Arduino?"
- **Answered by:** Speaker 3 (Hardware Lead)
> *"Sir, rescue missions require 99.9% reliability. High-torque DC motors generate severe inductive back-EMF voltage spikes and high current draws. In a single-MCU architecture, this electrical noise corrupts the I2C sensor bus and triggers brownout resets, blinding the operator. Our Dual-MCU architecture isolates motor drive on Arduino #1 and sensor telemetry on Arduino #2, ensuring zero lockups."*

### ❓ Q2: "Wi-Fi cannot penetrate deep concrete rubble. How will communication work underground?"
- **Answered by:** Speaker 4 (Comms Lead)
> *"Exactly, Sir! 2.4 GHz Wi-Fi drops within 1 to 2 meters of concrete. That is why ARIES uses Wi-Fi strictly for surface line-of-sight video. For sub-surface penetration, ARIES automatically switches to our **5 km Sub-GHz LoRa Mesh (868/915 MHz)**. Sub-GHz radio waves have significantly longer wavelengths that diffract through concrete voids where high-frequency signals fail. Additionally, SIM800L cellular GSM provides SMS fallback."*

### ❓ Q3: "How do you prevent false alarms caused by hot steam pipes or fire embers?"
- **Answered by:** Speaker 3 or Speaker 4
> *"Sir, we implement a **Two-Tier Verification Protocol**:*
> *First, our **MAX30102 biometric sensor** verifies physiological human heartbeat (BPM) and blood oxygen (SpO2)—fire embers and hot pipes do not have a pulse!*
> *Second, our **Human-in-the-Loop AI** requires the Incident Commander to manually confirm the visual/thermal target before any emergency rescue alert is dispatched. This guarantees 100% false-alarm elimination."*

### ❓ Q4: "What happens if the rover flips upside down in steep debris?"
- **Answered by:** Speaker 2 or Speaker 5
> *"Sir, our onboard MPU6500 IMU tracks real-time pitch and roll angles, automatically braking the rover if tilt exceeds 30 degrees to prevent rollovers. In our enterprise design, ARIES utilizes a symmetrical invertible chassis with oversized wheels, allowing the rover to continue driving even if inverted."*

### ❓ Q5: "How did you bring the cost down to ₹50,000 when imported rovers cost ₹25 Lakhs?"
- **Answered by:** Speaker 6 (Business Lead)
> *"Sir, imported defense rovers carry high military markups, proprietary communication protocols, and expensive overseas service contracts. ARIES leverages standard Commercial-Off-The-Shelf embedded components (ATmega, ESP32, standardized LoRa) and localized modular fabrication, reducing the prototype BOM under ₹8,000 and the industrial enterprise version under ₹50,000 INR."*

---

## ⚡ TODAY'S ACTION PLAN (21 SEPT DRILL)
1. **Stopwatch Rehearsal:** Ek phone par stopwatch lagao aur puri team 3 baar back-to-back rehearsal kare. **Target: 5:20 to 5:40 minutes!**
2. **Speaker 5 Timing:** 3 minute 40 second par Speaker 5 rover ka switch ON karega aur Web Mission Hub screen par dikhayega.
3. **Keep Tabs Ready:** Laptop me `SIH2026_ARIES_ALPHA-X.pptx` + Web Mission Hub dashboard tab pehle se open rakhna.
4. **Batteries 100% Charge:** Raat ko rover ki batteries aur laptop full charge kar lena!
