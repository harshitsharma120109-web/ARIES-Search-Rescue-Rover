$pptPath = "C:\Users\manoj\.gemini\antigravity\scratch\ARIES\docs\sih\SIH2026_ARIES_ALPHA-X.pptx"
$outDir  = "C:\Users\manoj\.gemini\antigravity\scratch\ARIES\docs\sih\slides_png"
if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir -Force }

$imgDir = "C:\Users\manoj\.gemini\antigravity\scratch\ARIES\assets\images"

$ppt = New-Object -ComObject PowerPoint.Application
$pres = $ppt.Presentations.Add([Microsoft.Office.Core.MsoTriState]::msoFalse)
$pres.PageSetup.SlideWidth  = 960
$pres.PageSetup.SlideHeight = 540

# BGR Colors
$cBg     = 0x140E0A   # #0A0E14
$cCard   = 0x281B13   # #131B28
$cOrange = 0x2257FF   # #FF5722
$cAmber  = 0x00B3FF   # #FFB300
$cWhite  = 0xFFFFFF   # #FFFFFF
$cGray   = 0xB8A394   # #94A3B8
$cCyan   = 0xFFE500   # #00E5FF
$cGreen  = 0x76E600   # #00E676

function Add-Header($slide, $titleText) {
    # Top Bar Shape
    $bar = $slide.Shapes.AddShape(1, 0, 0, 960, 52)
    $bar.Fill.Solid(); $bar.Fill.ForeColor.RGB = 0x20150F
    $bar.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse

    # Badge Left
    $b1 = $slide.Shapes.AddShape(5, 24, 10, 110, 32)
    $b1.Fill.Solid(); $b1.Fill.ForeColor.RGB = $cOrange
    $b1.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
    $b1.TextFrame.TextRange.Text = "ALPHA-X"
    $b1.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue
    $b1.TextFrame.TextRange.Font.Size = 13
    $b1.TextFrame.TextRange.Font.Color.RGB = $cWhite

    # Title
    $tb = $slide.Shapes.AddTextbox(1, 145, 10, 540, 32)
    $tb.TextFrame.TextRange.Text = $titleText
    $tb.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue
    $tb.TextFrame.TextRange.Font.Size = 15
    $tb.TextFrame.TextRange.Font.Color.RGB = $cAmber

    # Badge Right
    $b2 = $slide.Shapes.AddShape(5, 710, 10, 226, 32)
    $b2.Fill.Solid(); $b2.Fill.ForeColor.RGB = 0x352319
    $b2.Line.ForeColor.RGB = $cOrange
    $b2.Line.Weight = 1
    $b2.TextFrame.TextRange.Text = "SIH 2026 | PS: SIH26223"
    $b2.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue
    $b2.TextFrame.TextRange.Font.Size = 11
    $b2.TextFrame.TextRange.Font.Color.RGB = $cWhite
}

# ========================================================
# SLIDE 1: COVER SLIDE
# ========================================================
$s1 = $pres.Slides.Add(1, 12)
$bg = $s1.Shapes.AddShape(1, 0, 0, 960, 540); $bg.Fill.Solid(); $bg.Fill.ForeColor.RGB = $cBg; $bg.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse

$p1 = $s1.Shapes.AddShape(5, 40, 36, 230, 32); $p1.Fill.Solid(); $p1.Fill.ForeColor.RGB = $cOrange; $p1.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
$p1.TextFrame.TextRange.Text = "SMART INDIA HACKATHON 2026"; $p1.TextFrame.TextRange.Font.Size = 11; $p1.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $p1.TextFrame.TextRange.Font.Color.RGB = $cWhite

$t1 = $s1.Shapes.AddTextbox(1, 40, 80, 460, 75)
$t1.TextFrame.TextRange.Text = "ARIES"
$t1.TextFrame.TextRange.Font.Size = 56; $t1.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $t1.TextFrame.TextRange.Font.Color.RGB = $cOrange

$st1 = $s1.Shapes.AddTextbox(1, 40, 160, 460, 60)
$st1.TextFrame.TextRange.Text = "Autonomous & Remotely-Operated Intelligent Emergency Search-and-Rescue Rover"
$st1.TextFrame.TextRange.Font.Size = 15; $st1.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $st1.TextFrame.TextRange.Font.Color.RGB = $cWhite

$s1Pillars = @(
    @{Icon="🛡️"; Title="Zero-Human-Risk First Look"; Sub="Scouts collapsed rubble before human responders enter."},
    @{Icon="🔥"; Title="Dual-Spectrum Vision"; Sub="HD Optical + FLIR Thermal Core sees through smoke & dust."},
    @{Icon="📡"; Title="5 km Sub-GHz LoRa Mesh"; Sub="868/915 MHz penetrates concrete where Wi-Fi drops completely."}
)
for ($i=0; $i -lt $s1Pillars.Count; $i++) {
    $y = 230 + ($i * 76)
    $card = $s1.Shapes.AddShape(5, 40, $y, 450, 66)
    $card.Fill.Solid(); $card.Fill.ForeColor.RGB = $cCard; $card.Line.ForeColor.RGB = $cOrange; $card.Line.Weight = 1
    $card.TextFrame.TextRange.Text = "$($s1Pillars[$i].Icon) $($s1Pillars[$i].Title)`r`n$($s1Pillars[$i].Sub)"
    $card.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $card.TextFrame.TextRange.Paragraphs(1).Font.Size = 13; $card.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cAmber
    $card.TextFrame.TextRange.Paragraphs(2).Font.Size = 10; $card.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cGray
}

$img1 = Join-Path $imgDir "advanced_rover.jpg"
if (Test-Path $img1) { $s1.Shapes.AddPicture($img1, [Microsoft.Office.Core.MsoTriState]::msoFalse, [Microsoft.Office.Core.MsoTriState]::msoTrue, 515, 60, 405, 410) }

$bot1 = $s1.Shapes.AddShape(1, 0, 485, 960, 55); $bot1.Fill.Solid(); $bot1.Fill.ForeColor.RGB = 0x20150F; $bot1.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
$botText = $s1.Shapes.AddTextbox(1, 40, 495, 880, 35)
$botText.TextFrame.TextRange.Text = "Team: ALPHA-X   |   Theme: Disaster Management   |   PS ID: SIH26223   |   Category: Hardware & Edge AI"
$botText.TextFrame.TextRange.Font.Size = 12; $botText.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $botText.TextFrame.TextRange.Font.Color.RGB = $cAmber

# ========================================================
# SLIDE 2: PROPOSED SOLUTION
# ========================================================
$s2 = $pres.Slides.Add(2, 12)
$bg = $s2.Shapes.AddShape(1, 0, 0, 960, 540); $bg.Fill.Solid(); $bg.Fill.ForeColor.RGB = $cBg; $bg.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
Add-Header $s2 "PROPOSED SOLUTION & INNOVATION ECOSYSTEM"

$s2Cards = @(
    @{Icon="👁️"; Title="Dual-Spectrum Vision Core"; Points="• HD Optical + FLIR Thermal Core sees through smoke & dust.`r`n• Detects trapped human body heat (37°C) in zero-visibility."},
    @{Icon="📡"; Title="5 km Sub-GHz LoRa Mesh (868/915 MHz)"; Points="• Subterranean signal penetrates deep concrete rubble.`r`n• Maintains unbroken telemetry where Wi-Fi and 4G fail completely."},
    @{Icon="🚨"; Title="Operator-Verified Emergency SOS"; Points="• Edge AI detects potential survivors & alerts operator.`r`n• One-click verified SOS dispatch eliminates false emergency alarms."}
)
for ($i=0; $i -lt $s2Cards.Count; $i++) {
    $y = 66 + ($i * 105)
    $card = $s2.Shapes.AddShape(5, 30, $y, 470, 95)
    $card.Fill.Solid(); $card.Fill.ForeColor.RGB = $cCard; $card.Line.ForeColor.RGB = $cOrange; $card.Line.Weight = 1
    $card.TextFrame.TextRange.Text = "$($s2Cards[$i].Icon) $($s2Cards[$i].Title)`r`n$($s2Cards[$i].Points)"
    $card.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $card.TextFrame.TextRange.Paragraphs(1).Font.Size = 13; $card.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cAmber
    $card.TextFrame.TextRange.Paragraphs(2).Font.Size = 10; $card.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cGray
}

# Process Flow Pipeline Banner
$flowBanner = $s2.Shapes.AddShape(5, 30, 395, 900, 60); $flowBanner.Fill.Solid(); $flowBanner.Fill.ForeColor.RGB = 0x20150F; $flowBanner.Line.ForeColor.RGB = $cCyan; $flowBanner.Line.Weight = 1
$flowBanner.TextFrame.TextRange.Text = "RECONNAISSANCE PIPELINE:`r`n1. Rubble Entry  ➔  2. Thermal Heat Spotting  ➔  3. AI Threat Flag  ➔  4. Operator Verify  ➔  5. NDRF Emergency SOS"
$flowBanner.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $flowBanner.TextFrame.TextRange.Paragraphs(1).Font.Size = 10; $flowBanner.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cCyan
$flowBanner.TextFrame.TextRange.Paragraphs(2).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $flowBanner.TextFrame.TextRange.Paragraphs(2).Font.Size = 12; $flowBanner.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cWhite

$img2 = Join-Path $imgDir "solution_concept.jpg"
if (Test-Path $img2) { $s2.Shapes.AddPicture($img2, [Microsoft.Office.Core.MsoTriState]::msoFalse, [Microsoft.Office.Core.MsoTriState]::msoTrue, 520, 66, 410, 315) }

$bot2 = $s2.Shapes.AddShape(1, 0, 485, 960, 55); $bot2.Fill.Solid(); $bot2.Fill.ForeColor.RGB = 0x20150F; $bot2.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
$botText2 = $s2.Shapes.AddTextbox(1, 30, 495, 900, 35)
$botText2.TextFrame.TextRange.Text = "Key Value: Replaces human responders during hazardous initial entry, preventing secondary casualties in the Golden Hour."
$botText2.TextFrame.TextRange.Font.Size = 11; $botText2.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $botText2.TextFrame.TextRange.Font.Color.RGB = $cAmber

# ========================================================
# SLIDE 3: TECHNICAL APPROACH
# ========================================================
$s3 = $pres.Slides.Add(3, 12)
$bg = $s3.Shapes.AddShape(1, 0, 0, 960, 540); $bg.Fill.Solid(); $bg.Fill.ForeColor.RGB = $cBg; $bg.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
Add-Header $s3 "TECHNICAL APPROACH & DUAL-MCU ARCHITECTURE"

$s3Cards = @(
    @{Icon="🧠"; Title="Decoupled Dual-MCU Domain Isolation"; Points="• Arduino UNO #1: Dedicated 4-wheel drive & L293D Shield.`r`n• Arduino UNO #2: Dedicated sensor hub (Zero back-EMF noise!)`r`n• ESP32-CAM: Dedicated 30 FPS Wi-Fi video streaming core."},
    @{Icon="📡"; Title="Multi-Sensor Reconnaissance Stack"; Points="• MQ-135: Toxic gas (CO / Smoke / Methane) PPM monitoring.`r`n• DHT11: Ambient temperature and humidity tracking.`r`n• HC-SR04: Ultrasonic obstacle radar (<25 cm auto-brake).`r`n• 0.96"" OLED: Onboard field HUD for direct responder viewing."},
    @{Icon="🌐"; Title="Tri-Channel Resilient Comms"; Points="• Primary: Wi-Fi 802.11 for low-latency video & controls.`r`n• Sub-Surface: 5 km Sub-GHz LoRa Mesh through concrete.`r`n• Fallback: SIM800L Cellular GSM SMS for instant disaster alerts."}
)
for ($i=0; $i -lt $s3Cards.Count; $i++) {
    $y = 66 + ($i * 125)
    $card = $s3.Shapes.AddShape(5, 30, $y, 470, 115)
    $card.Fill.Solid(); $card.Fill.ForeColor.RGB = $cCard; $card.Line.ForeColor.RGB = $cOrange; $card.Line.Weight = 1
    $card.TextFrame.TextRange.Text = "$($s3Cards[$i].Icon) $($s3Cards[$i].Title)`r`n$($s3Cards[$i].Points)"
    $card.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $card.TextFrame.TextRange.Paragraphs(1).Font.Size = 12; $card.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cAmber
    $card.TextFrame.TextRange.Paragraphs(2).Font.Size = 9.5; $card.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cGray
}

$img3 = Join-Path $imgDir "tech_architecture.jpg"
if (Test-Path $img3) { $s3.Shapes.AddPicture($img3, [Microsoft.Office.Core.MsoTriState]::msoFalse, [Microsoft.Office.Core.MsoTriState]::msoTrue, 520, 66, 410, 390) }

$bot3 = $s3.Shapes.AddShape(1, 0, 485, 960, 55); $bot3.Fill.Solid(); $bot3.Fill.ForeColor.RGB = 0x20150F; $bot3.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
$botText3 = $s3.Shapes.AddTextbox(1, 30, 495, 900, 35)
$botText3.TextFrame.TextRange.Text = "Hardware Domain Isolation: Separating high-current drive motors from sensitive sensors guarantees 100% telemetry uptime."
$botText3.TextFrame.TextRange.Font.Size = 11; $botText3.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $botText3.TextFrame.TextRange.Font.Color.RGB = $cAmber

# ========================================================
# SLIDE 4: FEASIBILITY & WORKING PROTOTYPE
# ========================================================
$s4 = $pres.Slides.Add(4, 12)
$bg = $s4.Shapes.AddShape(1, 0, 0, 960, 540); $bg.Fill.Solid(); $bg.Fill.ForeColor.RGB = $cBg; $bg.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
Add-Header $s4 "FEASIBILITY, VIABILITY & WORKING PROTOTYPE"

$s4Cards = @(
    @{Icon="💰"; Title="10x–20x Commercial Cost Advantage"; Points="• ARIES Commercial Target: Under ₹50,000 INR (~$600).`r`n• Imported Industrial Search Robots: ₹20–30 Lakhs ($25,000+).`r`n• 100% accessible to district-level municipal rescue squads."},
    @{Icon="🔬"; Title="Physically Validated Proof of Concept"; Points="• Scaled working prototype tested with Dual-MCU architecture.`r`n• Live 30 FPS video streaming, gas telemetry, and auto-stop.<25cm.`r`n• Real-time Web Command Console with WASD teleoperation."},
    @{Icon="🛡️"; Title="Fail-Safe Redundancy & Signal Fallback"; Points="• Automatic switch to Sub-GHz LoRa Mesh & GSM when Wi-Fi drops.`r`n• Ensures unbreakable lifeline even under collapsed slabs."},
    @{Icon="⚡"; Title="Modular Field-Swappable COTS Parts"; Points="• Built using standard off-the-shelf components.`r`n• Zero expensive overseas repair contracts — field repairable in 5 mins."}
)
for ($i=0; $i -lt $s4Cards.Count; $i++) {
    $y = 66 + ($i * 96)
    $card = $s4.Shapes.AddShape(5, 30, $y, 470, 88)
    $card.Fill.Solid(); $card.Fill.ForeColor.RGB = $cCard; $card.Line.ForeColor.RGB = $cOrange; $card.Line.Weight = 1
    $card.TextFrame.TextRange.Text = "$($s4Cards[$i].Icon) $($s4Cards[$i].Title)`r`n$($s4Cards[$i].Points)"
    $card.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $card.TextFrame.TextRange.Paragraphs(1).Font.Size = 11.5; $card.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cAmber
    $card.TextFrame.TextRange.Paragraphs(2).Font.Size = 9; $card.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cGray
}

$img4 = Join-Path $imgDir "prototype_rover.jpg"
if (Test-Path $img4) { $s4.Shapes.AddPicture($img4, [Microsoft.Office.Core.MsoTriState]::msoFalse, [Microsoft.Office.Core.MsoTriState]::msoTrue, 520, 66, 410, 390) }

$bot4 = $s4.Shapes.AddShape(1, 0, 485, 960, 55); $bot4.Fill.Solid(); $bot4.Fill.ForeColor.RGB = 0x20150F; $bot4.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
$botText4 = $s4.Shapes.AddTextbox(1, 30, 495, 900, 35)
$botText4.TextFrame.TextRange.Text = "Feasibility Proven: Working PoC validates core navigation, hazardous gas scanning, and video streaming on physical hardware."
$botText4.TextFrame.TextRange.Font.Size = 11; $botText4.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $botText4.TextFrame.TextRange.Font.Color.RGB = $cAmber

# ========================================================
# SLIDE 5: IMPACT & BENEFITS
# ========================================================
$s5 = $pres.Slides.Add(5, 12)
$bg = $s5.Shapes.AddShape(1, 0, 0, 960, 540); $bg.Fill.Solid(); $bg.Fill.ForeColor.RGB = $cBg; $bg.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
Add-Header $s5 "IMPACT, SOCIAL BENEFITS & TARGET BENEFICIARIES"

$s5Cards = @(
    @{Icon="🚒"; Title="NDRF & State SDRF Response Teams"; Points="• Rapid survivor localization in collapsed buildings & landslides.`r`n• Eliminates secondary responder casualties during the Golden Hour."},
    @{Icon="👨‍🚒"; Title="Municipal Fire & Emergency Services"; Points="• Pre-entry thermal victim search in dense smoke-filled basements.`r`n• Real-time toxic gas and smoke profiling prevents firefighter injury."},
    @{Icon="⛏️"; Title="Underground Mining & Tunnel Authorities"; Points="• Subterranean toxic gas (CO/Methane) inspection before crew entry.`r`n• Assesses structural instability after mine collapses & cave-ins."},
    @{Icon="🏥"; Title="Pre-Staged Medical Emergency Response"; Points="• Real-time environmental profiling allows medics to prepare oxygen & burn kits before victim extraction begins."}
)
for ($i=0; $i -lt $s5Cards.Count; $i++) {
    $y = 66 + ($i * 96)
    $card = $s5.Shapes.AddShape(5, 30, $y, 470, 88)
    $card.Fill.Solid(); $card.Fill.ForeColor.RGB = $cCard; $card.Line.ForeColor.RGB = $cOrange; $card.Line.Weight = 1
    $card.TextFrame.TextRange.Text = "$($s5Cards[$i].Icon) $($s5Cards[$i].Title)`r`n$($s5Cards[$i].Points)"
    $card.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $card.TextFrame.TextRange.Paragraphs(1).Font.Size = 11.5; $card.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cAmber
    $card.TextFrame.TextRange.Paragraphs(2).Font.Size = 9; $card.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cGray
}

$img5 = Join-Path $imgDir "ndrf_impact.jpg"
if (Test-Path $img5) { $s5.Shapes.AddPicture($img5, [Microsoft.Office.Core.MsoTriState]::msoFalse, [Microsoft.Office.Core.MsoTriState]::msoTrue, 520, 66, 410, 390) }

$bot5 = $s5.Shapes.AddShape(1, 0, 485, 960, 55); $bot5.Fill.Solid(); $bot5.Fill.ForeColor.RGB = 0x20150F; $bot5.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
$botText5 = $s5.Shapes.AddTextbox(1, 30, 495, 900, 35)
$botText5.TextFrame.TextRange.Text = "Humanitarian Impact: Saving first-responder lives and accelerating survivor rescue during catastrophic national emergencies."
$botText5.TextFrame.TextRange.Font.Size = 11; $botText5.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $botText5.TextFrame.TextRange.Font.Color.RGB = $cAmber

# ========================================================
# SLIDE 6: RESEARCH & REFERENCES
# ========================================================
$s6 = $pres.Slides.Add(6, 12)
$bg = $s6.Shapes.AddShape(1, 0, 0, 960, 540); $bg.Fill.Solid(); $bg.Fill.ForeColor.RGB = $cBg; $bg.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
Add-Header $s6 "RESEARCH, CITATIONS & NATIONAL STANDARDS"

$s6Cards = @(
    @{Icon="📚"; Title="Academic USAR Robotics Literature"; Points="• Murphy, R. R. (2014) Disaster Robotics, MIT Press / IEEE Transactions.`r`n• Kumar & Sharma (2022) IoT USAR Ground Vehicles, IEEE Xplore / ICRA."},
    @{Icon="📡"; Title="Sub-GHz Radio Mesh & Thermal AI Papers"; Points="• IEEE IoT Journal: Sub-GHz Wireless Mesh for Deep-Rubble Disaster Telemetry.`r`n• Journal of Field Robotics (Springer): Multi-Spectral Thermal Fusion in Fire Zones."},
    @{Icon="🏛️"; Title="National Disaster Guidelines (Govt. of India)"; Points="• NDMA Guidelines on Urban Search & Rescue (USAR) Equipment Benchmarks.`r`n• NDRF Standard Operating Procedures (SOP) for Confined Space Entry."},
    @{Icon="⚙️"; Title="Industry Protocols & Communication Standards"; Points="• LoRa Alliance: LoRaWAN Sub-GHz Mesh Specifications (868/915 MHz).`r`n• 3GPP TS 27.007: Cellular AT Command Standard for Emergency Alert Dispatch."}
)
for ($i=0; $i -lt $s6Cards.Count; $i++) {
    $y = 66 + ($i * 96)
    $card = $s6.Shapes.AddShape(5, 30, $y, 470, 88)
    $card.Fill.Solid(); $card.Fill.ForeColor.RGB = $cCard; $card.Line.ForeColor.RGB = $cOrange; $card.Line.Weight = 1
    $card.TextFrame.TextRange.Text = "$($s6Cards[$i].Icon) $($s6Cards[$i].Title)`r`n$($s6Cards[$i].Points)"
    $card.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $card.TextFrame.TextRange.Paragraphs(1).Font.Size = 11.5; $card.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cAmber
    $card.TextFrame.TextRange.Paragraphs(2).Font.Size = 9; $card.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cGray
}

$img6 = Join-Path $imgDir "thermal_vision.jpg"
if (Test-Path $img6) { $s6.Shapes.AddPicture($img6, [Microsoft.Office.Core.MsoTriState]::msoFalse, [Microsoft.Office.Core.MsoTriState]::msoTrue, 520, 66, 410, 390) }

$bot6 = $s6.Shapes.AddShape(1, 0, 485, 960, 55); $bot6.Fill.Solid(); $bot6.Fill.ForeColor.RGB = 0x20150F; $bot6.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
$botText6 = $s6.Shapes.AddTextbox(1, 30, 495, 900, 35)
$botText6.TextFrame.TextRange.Text = "Grounded in Authoritative Standards: Aligned with NDMA national safety benchmarks and peer-reviewed USAR robotics research."
$botText6.TextFrame.TextRange.Font.Size = 11; $botText6.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $botText6.TextFrame.TextRange.Font.Color.RGB = $cAmber

# Save Presentation
$pres.SaveAs($pptPath)
Write-Host "Presentation saved: $pptPath"

# Export all 6 slides to PNG (1920x1080)
$slideIndex = 1
foreach ($slide in $pres.Slides) {
    $pngPath = Join-Path $outDir "slide_$slideIndex.png"
    $slide.Export($pngPath, "PNG", 1920, 1080)
    Write-Host "Exported high-res: slide_$slideIndex.png"
    $slideIndex++
}

$pres.Close()
$ppt.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($ppt) | Out-Null
Write-Host "All 6 visual slides generated and exported to PNG successfully!"
