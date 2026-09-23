# ========================================================
# ARIES 2.0 LIGHT THEME OFFICIAL SIH DECK GENERATOR
# Clean Light Theme | Low Text | High Visuals | SIH Logo Box
# ========================================================
$outDir   = "C:\Users\manoj\.gemini\antigravity\scratch\ARIES\docs\sih\slides_light_png"
$assetDir = "C:\Users\manoj\.gemini\antigravity\scratch\ARIES\assets\images"
$pptDeck  = "C:\Users\manoj\.gemini\antigravity\scratch\ARIES\docs\sih\SIH2026_ARIES_LIGHT_THEME.pptx"

if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir -Force | Out-Null }

$ppt = New-Object -ComObject PowerPoint.Application
$pres = $ppt.Presentations.Add([Microsoft.Office.Core.MsoTriState]::msoFalse)
$pres.PageSetup.SlideWidth  = 960
$pres.PageSetup.SlideHeight = 540

# Colors (BGR Format for PowerPoint COM)
$cBg       = 0xFCFAF8   # #F8FAFC (Soft Light Off-White)
$cWhite    = 0xFFFFFF   # #FFFFFF (Pure White Card Fill)
$cBorder   = 0xE2E8F0   # #F0E8E2 (Subtle Light Border)
$cDarkNavy = 0x2A170F   # #0F172A (Deep Slate Navy for Headings)
$cTextDark = 0x47331E   # #1E3347 (High-Contrast Body Text)
$cTextGray = 0x695547   # #475569 (Secondary Text)
$cOrange   = 0x0C58EA   # #EA580C (Vibrant Safety Orange)
$cCyan     = 0xC78402   # #0284C7 (Electric Blue / Cyan)
$cGreen    = 0x4AA316   # #16A34A (Emerald Green)
$cAmber    = 0x0677D9   # #D97706 (Warm Amber)
$cRed      = 0x1C1CE1   # #E11C1C (Crimson Alert)

function Add-LightHeader($slide, $badgeLeft, $titleText, $badgeMid) {
    # Top Bar Background
    $bar = $slide.Shapes.AddShape(1, 0, 0, 960, 48)
    $bar.Fill.Solid(); $bar.Fill.ForeColor.RGB = $cWhite
    $bar.Line.ForeColor.RGB = $cBorder; $bar.Line.Weight = 1

    # Badge Left (Orange Pill)
    $b1 = $slide.Shapes.AddShape(5, 20, 9, 140, 30)
    $b1.Fill.Solid(); $b1.Fill.ForeColor.RGB = $cOrange
    $b1.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
    $b1.TextFrame.TextRange.Text = $badgeLeft
    $b1.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue
    $b1.TextFrame.TextRange.Font.Size = 11.5
    $b1.TextFrame.TextRange.Font.Color.RGB = $cWhite

    # Center Title
    $tb = $slide.Shapes.AddTextbox(1, 168, 8, 480, 32)
    $tb.TextFrame.TextRange.Text = $titleText
    $tb.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue
    $tb.TextFrame.TextRange.Font.Size = 14
    $tb.TextFrame.TextRange.Font.Color.RGB = $cDarkNavy

    # Badge Mid (Problem Statement Pill)
    $b2 = $slide.Shapes.AddShape(5, 655, 9, 210, 30)
    $b2.Fill.Solid(); $b2.Fill.ForeColor.RGB = 0xEFF6FF # Soft light blue
    $b2.Line.ForeColor.RGB = $cCyan; $b2.Line.Weight = 1
    $b2.TextFrame.TextRange.Text = $badgeMid
    $b2.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue
    $b2.TextFrame.TextRange.Font.Size = 10
    $b2.TextFrame.TextRange.Font.Color.RGB = $cCyan

    # Dedicated SIH Logo Placeholder Box
    $logoBox = $slide.Shapes.AddShape(5, 875, 7, 65, 34)
    $logoBox.Fill.Solid(); $logoBox.Fill.ForeColor.RGB = 0xF1F5F9 # Light gray
    $logoBox.Line.ForeColor.RGB = $cOrange; $logoBox.Line.Weight = 1
    $logoBox.TextFrame.TextRange.Text = "[SIH LOGO]"
    $logoBox.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue
    $logoBox.TextFrame.TextRange.Font.Size = 7.5
    $logoBox.TextFrame.TextRange.Font.Color.RGB = $cTextGray
}

# ========================================================
# SLIDE 1: COVER SLIDE (LIGHT THEME)
# ========================================================
$s1 = $pres.Slides.Add(1, 12)
$bg1 = $s1.Shapes.AddShape(1, 0, 0, 960, 540); $bg1.Fill.Solid(); $bg1.Fill.ForeColor.RGB = $cBg; $bg1.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
Add-LightHeader $s1 "ALPHA-X | SIH_1186" "SMART INDIA HACKATHON 2026" "PS ID: SIH26223 | HARDWARE"

# Hero Left Container
$s1Card = $s1.Shapes.AddShape(5, 20, 60, 480, 415)
$s1Card.Fill.Solid(); $s1Card.Fill.ForeColor.RGB = $cWhite
$s1Card.Line.ForeColor.RGB = $cBorder; $s1Card.Line.Weight = 1.5

# Category Pill
$catPill = $s1.Shapes.AddShape(5, 36, 75, 260, 24)
$catPill.Fill.Solid(); $catPill.Fill.ForeColor.RGB = 0xEFF6FF
$catPill.Line.ForeColor.RGB = $cCyan; $catPill.Line.Weight = 1
$catPill.TextFrame.TextRange.Text = "AICTE STUDENT INNOVATION (DISASTER MGMT)"
$catPill.TextFrame.TextRange.Font.Size = 8.5; $catPill.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue
$catPill.TextFrame.TextRange.Font.Color.RGB = $cCyan

# Project Title
$t1 = $s1.Shapes.AddTextbox(1, 32, 104, 450, 55)
$t1.TextFrame.TextRange.Text = "ARIES 2.0"
$t1.TextFrame.TextRange.Font.Size = 44; $t1.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue
$t1.TextFrame.TextRange.Font.Color.RGB = $cOrange

# Subtitle
$st1 = $s1.Shapes.AddTextbox(1, 34, 155, 450, 40)
$st1.TextFrame.TextRange.Text = "Tri-Phibian All-Domain Autonomous Search-and-Rescue Robot"
$st1.TextFrame.TextRange.Font.Size = 13.5; $st1.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue
$st1.TextFrame.TextRange.Font.Color.RGB = $cDarkNavy

# 4 Advanced Feature Badges (Horizontal Grid)
$s1Features = @(
    @{Icon="🚜"; Title="Tank Treads (Rubble)"; Desc="Continuous tracks climb 45° collapsed debris"},
    @{Icon="🚁"; Title="Octocopter Drone"; Desc="8 integrated rotors hop over deep trenches"},
    @{Icon="🚤"; Title="Amphibious Hull"; Desc="IP68 pontoon floats & steers in floodwaters"},
    @{Icon="🦾"; Title="Bionic SpO2 Arm"; Desc="Scans survivor pulse & blood oxygen in voids"}
)

for ($f=0; $f -lt 4; $f++) {
    $col = $f % 2; $row = [math]::Floor($f / 2)
    $fx = 36 + ($col * 224); $fy = 205 + ($row * 82)
    $fBox = $s1.Shapes.AddShape(5, $fx, $fy, 214, 74)
    $fBox.Fill.Solid(); $fBox.Fill.ForeColor.RGB = 0xF8FAFC
    $fBox.Line.ForeColor.RGB = $cBorder; $fBox.Line.Weight = 1
    $fBox.TextFrame.TextRange.Text = "$($s1Features[$f].Icon) $($s1Features[$f].Title)`r`n$($s1Features[$f].Desc)"
    $fBox.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue
    $fBox.TextFrame.TextRange.Paragraphs(1).Font.Size = 10.5
    $fBox.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cDarkNavy
    $fBox.TextFrame.TextRange.Paragraphs(2).Font.Size = 8.5
    $fBox.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cTextGray
}

# Team Leader / College Tag Box
$teamBox = $s1.Shapes.AddShape(5, 36, 380, 448, 80)
$teamBox.Fill.Solid(); $teamBox.Fill.ForeColor.RGB = 0xFFF7ED # Warm light orange
$teamBox.Line.ForeColor.RGB = $cOrange; $teamBox.Line.Weight = 1
$teamBox.TextFrame.TextRange.Text = "Team Leader: Harshit Sharma  |  Team: ALPHA-X (ID: SIH_1186)`r`nInstitute: Poornima University, Jaipur  |  Category: Hardware & Edge AI`r`nMotto: 'We don't just build robots, we build hope.'"
$teamBox.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $teamBox.TextFrame.TextRange.Paragraphs(1).Font.Size = 10; $teamBox.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cDarkNavy
$teamBox.TextFrame.TextRange.Paragraphs(2).Font.Size = 9; $teamBox.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cTextGray
$teamBox.TextFrame.TextRange.Paragraphs(3).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $teamBox.TextFrame.TextRange.Paragraphs(3).Font.Size = 9.5; $teamBox.TextFrame.TextRange.Paragraphs(3).Font.Color.RGB = $cOrange

# Right Hero Image: Brand New Unified Flying-Tracked Rover Render
$imgHero = Join-Path $assetDir "aries_advanced_unified_rover.jpg"
if (Test-Path $imgHero) {
    $pic1 = $s1.Shapes.AddPicture($imgHero, [Microsoft.Office.Core.MsoTriState]::msoFalse, [Microsoft.Office.Core.MsoTriState]::msoTrue, 515, 60, 425, 415)
    $pic1.Line.ForeColor.RGB = $cBorder; $pic1.Line.Weight = 1.5
}

# Footer Ribbon
$bot1 = $s1.Shapes.AddShape(1, 0, 485, 960, 55); $bot1.Fill.Solid(); $bot1.Fill.ForeColor.RGB = $cWhite
$bot1.Line.ForeColor.RGB = $cBorder; $bot1.Line.Weight = 1
$botText1 = $s1.Shapes.AddTextbox(1, 20, 492, 920, 40)
$botText1.TextFrame.TextRange.Text = "Poornima University Internal Hackathon RANK 5 Finalist   |   Theme: Disaster Management   |   GitHub: github.com/harshitsharma120109-web/ARIES-Search-Rescue-Rover"
$botText1.TextFrame.TextRange.Font.Size = 10.5; $botText1.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $botText1.TextFrame.TextRange.Font.Color.RGB = $cOrange

# ========================================================
# SLIDE 2: PROPOSED SOLUTION & TRI-PHIBIAN ECOSYSTEM
# ========================================================
$s2 = $pres.Slides.Add(2, 12)
$bg2 = $s2.Shapes.AddShape(1, 0, 0, 960, 540); $bg2.Fill.Solid(); $bg2.Fill.ForeColor.RGB = $cBg; $bg2.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
Add-LightHeader $s2 "ALPHA-X | SIH_1186" "PROPOSED SOLUTION & TRI-PHIBIAN ECOSYSTEM" "SIH26223 | SOLUTION OVERVIEW"

# 4 Key Metric Cards (Top Row)
$metrics = @(
    @{Val="10x-20x"; Sub="Cost Disruption"; Note="₹50,000 vs ₹25L imported"; Color=$cOrange},
    @{Val="5 km"; Sub="Deep Rubble LoRa"; Note="Sub-GHz concrete mesh"; Color=$cCyan},
    @{Val="1000°C"; Sub="Fire Armor Shield"; Note="Silica Aerogel insulation"; Color=$cRed},
    @{Val="Zero"; Sub="Human Ingress Risk"; Note="First look in Golden Hour"; Color=$cGreen}
)
for ($m=0; $m -lt 4; $m++) {
    $mx = 20 + ($m * 232)
    $mCard = $s2.Shapes.AddShape(5, $mx, 58, 222, 70)
    $mCard.Fill.Solid(); $mCard.Fill.ForeColor.RGB = $cWhite
    $mCard.Line.ForeColor.RGB = $metrics[$m].Color; $mCard.Line.Weight = 1.5
    $mCard.TextFrame.TextRange.Text = "$($metrics[$m].Val)  $($metrics[$m].Sub)`r`n$($metrics[$m].Note)"
    $mCard.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $mCard.TextFrame.TextRange.Paragraphs(1).Font.Size = 12.5; $mCard.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $metrics[$m].Color
    $mCard.TextFrame.TextRange.Paragraphs(2).Font.Size = 8.5; $mCard.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cTextGray
}

# Left Process Workflow Box
$flowBox = $s2.Shapes.AddShape(5, 20, 138, 480, 335)
$flowBox.Fill.Solid(); $flowBox.Fill.ForeColor.RGB = $cWhite
$flowBox.Line.ForeColor.RGB = $cBorder; $flowBox.Line.Weight = 1.5

$fTitle = $s2.Shapes.AddTextbox(1, 30, 144, 460, 24)
$fTitle.TextFrame.TextRange.Text = "OPERATIONAL RECONNAISSANCE PIPELINE (HOW IT WORKS):"
$fTitle.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $fTitle.TextFrame.TextRange.Font.Size = 10; $fTitle.TextFrame.TextRange.Font.Color.RGB = $cDarkNavy

$steps = @(
    @{Num="01"; Icon="🚜"; Title="Rubble & Flood Entry"; Desc="Tank tracks traverse unstable ruins; pontoon hull floats over flooded waters."},
    @{Num="02"; Icon="🚁"; Title="Auto-Trench Air-Hop"; Desc="Integrated 8-rotor octocopter lifts chassis across deep chasms and cliffs."},
    @{Num="03"; Icon="🦾"; Title="Bionic Crevice Vitals"; Desc="Robotic arm penetrates 10cm holes to scan survivor pulse & SpO2 at tip."},
    @{Num="04"; Icon="🚨"; Title="Incident Command SOS"; Desc="Human-in-the-Loop AI verifies survivor -> Instant SOS beacon to NDRF."}
)

for ($st=0; $st -lt 4; $st++) {
    $sy = 175 + ($st * 68)
    $sItem = $s2.Shapes.AddShape(5, 32, $sy, 456, 60)
    $sItem.Fill.Solid(); $sItem.Fill.ForeColor.RGB = 0xF8FAFC
    $sItem.Line.ForeColor.RGB = $cBorder; $sItem.Line.Weight = 1
    
    # Step Number Pill
    $nPill = $s2.Shapes.AddShape(5, 42, $sy + 10, 40, 22)
    $nPill.Fill.Solid(); $nPill.Fill.ForeColor.RGB = $cOrange; $nPill.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
    $nPill.TextFrame.TextRange.Text = $steps[$st].Num
    $nPill.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $nPill.TextFrame.TextRange.Font.Size = 9; $nPill.TextFrame.TextRange.Font.Color.RGB = $cWhite
    
    # Step Text
    $sTxt = $s2.Shapes.AddTextbox(1, 90, $sy + 4, 390, 50)
    $sTxt.TextFrame.TextRange.Text = "$($steps[$st].Icon) $($steps[$st].Title)`r`n$($steps[$st].Desc)"
    $sTxt.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $sTxt.TextFrame.TextRange.Paragraphs(1).Font.Size = 10.5; $sTxt.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cDarkNavy
    $sTxt.TextFrame.TextRange.Paragraphs(2).Font.Size = 8.5; $sTxt.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cTextGray
}

# Right Visual Box (Thermal vs Optical in Smoke)
$imgThermal = Join-Path $assetDir "thermal_vision.jpg"
if (Test-Path $imgThermal) {
    $pic2 = $s2.Shapes.AddPicture($imgThermal, [Microsoft.Office.Core.MsoTriState]::msoFalse, [Microsoft.Office.Core.MsoTriState]::msoTrue, 515, 138, 425, 335)
    $pic2.Line.ForeColor.RGB = $cBorder; $pic2.Line.Weight = 1.5
}

# Footer Banner
$bot2 = $s2.Shapes.AddShape(1, 0, 485, 960, 55); $bot2.Fill.Solid(); $bot2.Fill.ForeColor.RGB = $cWhite
$bot2.Line.ForeColor.RGB = $cBorder; $bot2.Line.Weight = 1
$botText2 = $s2.Shapes.AddTextbox(1, 20, 492, 920, 40)
$botText2.TextFrame.TextRange.Text = "Core Mission Value: Eliminating rescuer fatalities during initial Golden-Hour reconnaissance across all 3 domains (Land, Water & Air)."
$botText2.TextFrame.TextRange.Font.Size = 10.5; $botText2.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $botText2.TextFrame.TextRange.Font.Color.RGB = $cDarkNavy

# ========================================================
# SLIDE 3: TECHNICAL APPROACH & SYSTEM ARCHITECTURE
# ========================================================
$s3 = $pres.Slides.Add(3, 12)
$bg3 = $s3.Shapes.AddShape(1, 0, 0, 960, 540); $bg3.Fill.Solid(); $bg3.Fill.ForeColor.RGB = $cBg; $bg3.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
Add-LightHeader $s3 "ALPHA-X | SIH_1186" "TECHNICAL APPROACH & DUAL-MCU ARCHITECTURE" "SIH26223 | HARDWARE & AI"

# 3 Modular Pillars (Clean White Cards)
$s3Cols = @(
    @{
        Icon="🚜"; Title="Tri-Phibian Mobility";
        Points="• Land: Kevlar caterpillar tank tracks with high-torque DC planetary gearmotors.`r`n• Water: IP68 sealed carbon boat hull + twin submersible waterjets.`r`n• Air: 8x heavy-lift carbon-fiber outrigger rotors (lifts full 15kg chassis).";
        Border=$cOrange
    },
    @{
        Icon="🦾"; Title="Perception & Bionic Arm";
        Points="• Bionic Arm: 4-DOF carbon manipulator (1m crevice void reach).`r`n• Biosensor Tip: MAX30102 pulse oximeter (BPM & SpO2) + BMP280 depth.`r`n• Vision Core: FLIR radiometric LWIR thermal core + 3D LiDAR SLAM.";
        Border=$cCyan
    },
    @{
        Icon="⚡"; Title="Dual-MCU & Fire Shield";
        Points="• Dual-MCU: Arduino #1 (Drive) + Arduino #2 (Sensors) - Zero EMF freeze!`r`n• Comms: 5 km Sub-GHz LoRa Mesh (868MHz) + Wi-Fi 6 + SIM800L GSM.`r`n• Fire Armor: 10mm Silica Aerogel (blocks 1000°C) + Nitrogen cold purge.";
        Border=$cGreen
    }
)

$colWidth = 296; $colGap = 16
for ($c=0; $c -lt 3; $c++) {
    $cx = 20 + ($c * ($colWidth + $colGap))
    $cCard = $s3.Shapes.AddShape(5, $cx, 58, $colWidth, 290)
    $cCard.Fill.Solid(); $cCard.Fill.ForeColor.RGB = $cWhite
    $cCard.Line.ForeColor.RGB = $s3Cols[$c].Border; $cCard.Line.Weight = 1.5
    
    $cTxt = $s3.Shapes.AddTextbox(1, $cx + 10, 68, $colWidth - 20, 270)
    $cTxt.TextFrame.TextRange.Text = "$($s3Cols[$c].Icon) $($s3Cols[$c].Title)`r`n`r`n$($s3Cols[$c].Points)"
    $cTxt.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue
    $cTxt.TextFrame.TextRange.Paragraphs(1).Font.Size = 13.5
    $cTxt.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cDarkNavy
    for ($p=2; $p -le $cTxt.TextFrame.TextRange.Paragraphs().Count; $p++) {
        $cTxt.TextFrame.TextRange.Paragraphs($p).Font.Size = 9.5
        $cTxt.TextFrame.TextRange.Paragraphs($p).Font.Color.RGB = $cTextDark
    }
}

# Bottom Architectural Block Diagram Banner
$diagBox = $s3.Shapes.AddShape(5, 20, 360, 920, 115)
$diagBox.Fill.Solid(); $diagBox.Fill.ForeColor.RGB = $cWhite
$diagBox.Line.ForeColor.RGB = $cBorder; $diagBox.Line.Weight = 1.5

$dTitle = $s3.Shapes.AddTextbox(1, 30, 364, 900, 20)
$dTitle.TextFrame.TextRange.Text = "SYSTEM ARCHITECTURE & END-TO-END DATAFLOW PIPELINE:"
$dTitle.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $dTitle.TextFrame.TextRange.Font.Size = 10; $dTitle.TextFrame.TextRange.Font.Color.RGB = $cDarkNavy

# 4 Interconnected Flow Stages in Banner
$fStages = @(
    @{Name="SENSING & ARM"; Sub="MQ-135, FLIR, SpO2, Sonar"},
    @{Name="DUAL-MCU CORE"; Sub="Arduino #1 & #2 Isolated Bus"},
    @{Name="RESILIENT COMMS"; Sub="5 km LoRa Mesh + GSM SMS"},
    @{Name="WEB MISSION HUB"; Sub="Browser Web Serial Console"}
)
for ($s=0; $s -lt 4; $s++) {
    $sx = 32 + ($s * 224)
    $sBox = $s3.Shapes.AddShape(5, $sx, 390, 190, 68)
    $sBox.Fill.Solid(); $sBox.Fill.ForeColor.RGB = 0xF8FAFC
    $sBox.Line.ForeColor.RGB = $cCyan; $sBox.Line.Weight = 1
    $sBox.TextFrame.TextRange.Text = "$($s+1). $($fStages[$s].Name)`r`n$($fStages[$s].Sub)"
    $sBox.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $sBox.TextFrame.TextRange.Paragraphs(1).Font.Size = 10.5; $sBox.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cDarkNavy
    $sBox.TextFrame.TextRange.Paragraphs(2).Font.Size = 8.5; $sBox.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cTextGray
    
    if ($s -lt 3) {
        $arrD = $s3.Shapes.AddShape(13, $sx + 196, 415, 20, 14)
        $arrD.Fill.Solid(); $arrD.Fill.ForeColor.RGB = $cOrange; $arrD.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
    }
}

# Footer Ribbon
$bot3 = $s3.Shapes.AddShape(1, 0, 485, 960, 55); $bot3.Fill.Solid(); $bot3.Fill.ForeColor.RGB = $cWhite
$bot3.Line.ForeColor.RGB = $cBorder; $bot3.Line.Weight = 1
$botText3 = $s3.Shapes.AddTextbox(1, 20, 492, 920, 40)
$botText3.TextFrame.TextRange.Text = "Zero-Lockup Guarantee: Dedicated Dual-MCU domain isolation prevents high-current motor EMF noise from disrupting mission-critical gas & vital sensors."
$botText3.TextFrame.TextRange.Font.Size = 10; $botText3.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $botText3.TextFrame.TextRange.Font.Color.RGB = $cDarkNavy

# ========================================================
# SLIDE 4: CHALLENGES, MITIGATION & FEASIBILITY
# ========================================================
$s4 = $pres.Slides.Add(4, 12)
$bg4 = $s4.Shapes.AddShape(1, 0, 0, 960, 540); $bg4.Fill.Solid(); $bg4.Fill.ForeColor.RGB = $cBg; $bg4.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
Add-LightHeader $s4 "ALPHA-X | SIH_1186" "RISK MITIGATION MATRIX & FEASIBILITY ANALYSIS" "SIH26223 | FEASIBILITY"

# 4 Risk Matrix Rows (Problem ➔ Mitigation)
$rMatrix = @(
    @{
        Risk="Deep Rubble Signal Loss"; Prob="2.4GHz Wi-Fi drops through 2m concrete.";
        Fix="5 km Sub-GHz LoRa Mesh (868MHz) + SIM800L GSM SMS fallback."; Color=$cCyan
    },
    @{
        Risk="Cliffs & Trench Trap"; Prob="Rover gets trapped in sudden drop-offs.";
        Fix="Integrated 8-Rotor Octocopter automatically lifts chassis across."; Color=$cOrange
    },
    @{
        Risk="500°C Industrial Fire"; Prob="Extreme heat fries sensitive microcontrollers.";
        Fix="Silica Aerogel Heat Shield (1000°C block) + Nitrogen cold purge."; Color=$cRed
    },
    @{
        Risk="Environmental False Alarms"; Prob="Hot steam pipes/embers falsely flag survivor.";
        Fix="MAX30102 Heartbeat/SpO2 check + Mandatory Human-in-Loop HUD."; Color=$cGreen
    }
)

for ($k=0; $k -lt 4; $k++) {
    $ky = 58 + ($k * 78)
    $rowBox = $s4.Shapes.AddShape(5, 20, $ky, 920, 70)
    $rowBox.Fill.Solid(); $rowBox.Fill.ForeColor.RGB = $cWhite
    $rowBox.Line.ForeColor.RGB = $rMatrix[$k].Color; $rowBox.Line.Weight = 1.2
    
    # Left Problem Pill
    $pBox = $s4.Shapes.AddShape(5, 30, $ky + 10, 360, 50)
    $pBox.Fill.Solid(); $pBox.Fill.ForeColor.RGB = 0xFEF2F2 # Soft red
    $pBox.Line.ForeColor.RGB = 0xFCA5A5; $pBox.Line.Weight = 1
    $pBox.TextFrame.TextRange.Text = "⚠️ CHALLENGE: $($rMatrix[$k].Risk)`r`n$($rMatrix[$k].Prob)"
    $pBox.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $pBox.TextFrame.TextRange.Paragraphs(1).Font.Size = 9.5; $pBox.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cRed
    $pBox.TextFrame.TextRange.Paragraphs(2).Font.Size = 8; $pBox.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cTextGray

    # Arrow Middle
    $arrK = $s4.Shapes.AddShape(13, 402, $ky + 25, 20, 16)
    $arrK.Fill.Solid(); $arrK.Fill.ForeColor.RGB = $cGreen; $arrK.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse

    # Right Solution Pill
    $sBox = $s4.Shapes.AddShape(5, 432, $ky + 10, 495, 50)
    $sBox.Fill.Solid(); $sBox.Fill.ForeColor.RGB = 0xF0FDF4 # Soft green
    $sBox.Line.ForeColor.RGB = 0x86EFAC; $sBox.Line.Weight = 1
    $sBox.TextFrame.TextRange.Text = "🛡️ ARIES ENGINEERING MITIGATION:`r`n$($rMatrix[$k].Fix)"
    $sBox.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $sBox.TextFrame.TextRange.Paragraphs(1).Font.Size = 9.5; $sBox.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cGreen
    $sBox.TextFrame.TextRange.Paragraphs(2).Font.Size = 8.5; $sBox.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cTextDark
}

# Bottom Feasibility Cards
$feas1 = $s4.Shapes.AddShape(5, 20, 380, 450, 95)
$feas1.Fill.Solid(); $feas1.Fill.ForeColor.RGB = $cWhite
$feas1.Line.ForeColor.RGB = $cBorder; $feas1.Line.Weight = 1.5
$feas1.TextFrame.TextRange.Text = "💰 ECONOMIC VIABILITY & 10x COST ADVANTAGE:`r`n• Commercial target under ₹50,000 INR vs ₹25-40 Lakhs imported military robots.`r`n• Built on modular COTS hardware, eliminating expensive overseas maintenance."
$feas1.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $feas1.TextFrame.TextRange.Paragraphs(1).Font.Size = 10; $feas1.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cOrange
$feas1.TextFrame.TextRange.Paragraphs(2).Font.Size = 8.5; $feas1.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cTextDark

$feas2 = $s4.Shapes.AddShape(5, 490, 380, 450, 95)
$feas2.Fill.Solid(); $feas2.Fill.ForeColor.RGB = $cWhite
$feas2.Line.ForeColor.RGB = $cBorder; $feas2.Line.Weight = 1.5
$feas2.TextFrame.TextRange.Text = "🔬 WORKING PROOF OF CONCEPT (PoC) VALIDATION:`r`n• Scaled prototype validated on dual-microcontrollers with L293D shield.`r`n• Tested with live gas telemetry, sonar auto-stop, OLED display & Web Serial Hub."
$feas2.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $feas2.TextFrame.TextRange.Paragraphs(1).Font.Size = 10; $feas2.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cCyan
$feas2.TextFrame.TextRange.Paragraphs(2).Font.Size = 8.5; $feas2.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cTextDark

# Footer Ribbon
$bot4 = $s4.Shapes.AddShape(1, 0, 485, 960, 55); $bot4.Fill.Solid(); $bot4.Fill.ForeColor.RGB = $cWhite
$bot4.Line.ForeColor.RGB = $cBorder; $bot4.Line.Weight = 1
$botText4 = $s4.Shapes.AddTextbox(1, 20, 492, 920, 40)
$botText4.TextFrame.TextRange.Text = "Zero False-Alarm Architecture: Two-tier validation combines physiological SpO2 pulse verification with Incident Commander HUD confirmation."
$botText4.TextFrame.TextRange.Font.Size = 10; $botText4.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $botText4.TextFrame.TextRange.Font.Color.RGB = $cDarkNavy

# ========================================================
# SLIDE 5: MULTI-DIMENSIONAL IMPACT & BENEFICIARIES
# ========================================================
$s5 = $pres.Slides.Add(5, 12)
$bg5 = $s5.Shapes.AddShape(1, 0, 0, 960, 540); $bg5.Fill.Solid(); $bg5.Fill.ForeColor.RGB = $cBg; $bg5.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
Add-LightHeader $s5 "ALPHA-X | SIH_1186" "MULTI-DIMENSIONAL IMPACT & TARGET BENEFICIARIES" "SIH26223 | NATIONAL IMPACT"

# 3 Impact Pillars (Left Side)
$s5Cards = @(
    @{Icon="❤️"; Title="Social & Life-Saving"; Text="• Zero First-Responder Loss: Eliminates sniffer dog & rescuer hazards.`r`n• Golden Hour Acceleration: Spots trapped survivors in minutes via thermal vision.`r`n• Pre-Staged Medical Triage: Medics receive SpO2 & pulse before physical entry."},
    @{Icon="💰"; Title="Economic Democratization"; Text="• 10x-20x Cost Reduction: Under ₹50,000 INR vs ₹25-40 Lakhs imported robots.`r`n• COTS Modular Maintenance: Standard parts, zero foreign service lock-in.`r`n• Scalable Pan-India Outreach: Affordable for every municipal fire station."},
    @{Icon="🌱"; Title="Environmental Containment"; Text="• Real-Time Hazard Containment: MQ-135 tracks gas diffusion before civilian impact.`r`n• Zero-Emission Electric Locomotion: Safe in combustible & low-oxygen shafts.`r`n• Deep Underground Recon: Safe for subterranean tunnels and coal mines."}
)

for ($i=0; $i -lt 3; $i++) {
    $iy = 58 + ($i * 102)
    $card5 = $s5.Shapes.AddShape(5, 20, $iy, 480, 94)
    $card5.Fill.Solid(); $card5.Fill.ForeColor.RGB = $cWhite
    $card5.Line.ForeColor.RGB = $cBorder; $card5.Line.Weight = 1.2
    
    $txt5 = $s5.Shapes.AddTextbox(1, 28, $iy + 4, 464, 86)
    $txt5.TextFrame.TextRange.Text = "$($s5Cards[$i].Icon) $($s5Cards[$i].Title)`r`n$($s5Cards[$i].Text)"
    $txt5.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $txt5.TextFrame.TextRange.Paragraphs(1).Font.Size = 11.5; $txt5.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cDarkNavy
    for ($p=2; $p -le $txt5.TextFrame.TextRange.Paragraphs().Count; $p++) {
        $txt5.TextFrame.TextRange.Paragraphs($p).Font.Size = 8.5; $txt5.TextFrame.TextRange.Paragraphs($p).Font.Color.RGB = $cTextDark
    }
}

# Right Side Image (NDRF Responders deploying rover)
$imgNdrf = Join-Path $assetDir "ndrf_impact.jpg"
if (Test-Path $imgNdrf) {
    $pic5 = $s5.Shapes.AddPicture($imgNdrf, [Microsoft.Office.Core.MsoTriState]::msoFalse, [Microsoft.Office.Core.MsoTriState]::msoTrue, 515, 58, 425, 300)
    $pic5.Line.ForeColor.RGB = $cBorder; $pic5.Line.Weight = 1.5
}

# 4 Target Beneficiary Badges at Bottom
$bens = @(
    @{Icon="🏛️"; Title="NDRF & State SDRF"; Desc="Earthquake & building collapses"},
    @{Icon="🚒"; Title="Fire & Emergency"; Desc="Basement fires & chemical leaks"},
    @{Icon="⛏️"; Title="Mining Authorities"; Desc="Deep coal mine & tunnel collapse"},
    @{Icon="🏭"; Title="Industrial Plants"; Desc="Hazardous industrial plant scouts"}
)
for ($b=0; $b -lt 4; $b++) {
    $bx = 20 + ($b * 232)
    $bBox = $s5.Shapes.AddShape(5, $bx, 370, 222, 105)
    $bBox.Fill.Solid(); $bBox.Fill.ForeColor.RGB = $cWhite
    $bBox.Line.ForeColor.RGB = $cCyan; $bBox.Line.Weight = 1
    $bBox.TextFrame.TextRange.Text = "$($bens[$b].Icon) $($bens[$b].Title)`r`n$($bens[$b].Desc)"
    $bBox.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $bBox.TextFrame.TextRange.Paragraphs(1).Font.Size = 10.5; $bBox.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cDarkNavy
    $bBox.TextFrame.TextRange.Paragraphs(2).Font.Size = 8.5; $bBox.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cTextGray
}

# Footer Ribbon
$bot5 = $s5.Shapes.AddShape(1, 0, 485, 960, 55); $bot5.Fill.Solid(); $bot5.Fill.ForeColor.RGB = $cWhite
$bot5.Line.ForeColor.RGB = $cBorder; $bot5.Line.Weight = 1
$botText5 = $s5.Shapes.AddTextbox(1, 20, 492, 920, 40)
$botText5.TextFrame.TextRange.Text = "Humanitarian Impact: Aligned with National Disaster Management Plan (NDMP) benchmarks to save lives during critical Golden Hour extractions."
$botText5.TextFrame.TextRange.Font.Size = 10; $botText5.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $botText5.TextFrame.TextRange.Font.Color.RGB = $cDarkNavy

# ========================================================
# SLIDE 6: BOM, STANDARDS, CITATIONS & LIVE REPO
# ========================================================
$s6 = $pres.Slides.Add(6, 12)
$bg6 = $s6.Shapes.AddShape(1, 0, 0, 960, 540); $bg6.Fill.Solid(); $bg6.Fill.ForeColor.RGB = $cBg; $bg6.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
Add-LightHeader $s6 "ALPHA-X | SIH_1186" "BILL OF MATERIALS, NATIONAL STANDARDS & REPO" "SIH26223 | STANDARDS & REPO"

# 4 Framework Quadrants (Clean White Cards)
$quads6 = @(
    @{
        Icon="💰"; Title="Bill of Materials & Cost Disruption";
        Points="• Basic Working Prototype (Table Model): Under ₹8,000 INR.`r`n• ARIES 2.0 Enterprise Tri-Phibian Model: Under ₹50,000 INR.`r`n• Imported Military Competitors: ₹25,00,000 to ₹40,00,000 INR.`r`n• Result: 10x to 40x Unprecedented Cost Democratization!";
        Border=$cOrange
    },
    @{
        Icon="🏛️"; Title="National Guidelines (Govt. of India)";
        Points="• NDMA Guidelines on Urban Search & Rescue (USAR) Equipment Standards.`r`n• NDRF Standard Operating Procedures (SOP) for Confined Space Hazards.`r`n• Aligned with National Disaster Management Plan (NDMP 2019).`r`n• Hazardous gas threshold compliance (MQ/PID Standards).";
        Border=$cAmber
    },
    @{
        Icon="📚"; Title="Academic USAR Robotics Literature";
        Points="• Murphy, R. R. (2014) Disaster Robotics, MIT Press / IEEE Transactions.`r`n• Kumar & Sharma (2022) IoT USAR Ground Vehicles, IEEE Xplore / ICRA.`r`n• IEEE IoT Journal: Sub-GHz Wireless Mesh for Deep-Rubble Disaster Telemetry.`r`n• Journal of Field Robotics: Multi-Spectral Thermal Fusion in Fire Zones.";
        Border=$cCyan
    },
    @{
        Icon="💻"; Title="Open-Source Repositories & Live Hubs";
        Points="• GitHub Repo: github.com/harshitsharma120109-web/ARIES-Search-Rescue-Rover`r`n• Live Web Mission Hub: melodic-halva-b0fa56.netlify.app`r`n• Full Dual-MCU Firmware, Schematics & Web Serial telemetry open-sourced.`r`n• Validated on functional scaled embedded prototype.";
        Border=$cGreen
    }
)

for ($q=0; $q -lt 4; $q++) {
    $col = $q % 2; $row = [math]::Floor($q / 2)
    $qx = 20 + ($col * 470); $qy = 58 + ($row * 175)
    $qCard = $s6.Shapes.AddShape(5, $qx, $qy, 450, 165)
    $qCard.Fill.Solid(); $qCard.Fill.ForeColor.RGB = $cWhite
    $qCard.Line.ForeColor.RGB = $quads6[$q].Border; $qCard.Line.Weight = 1.5
    
    $qTxt = $s6.Shapes.AddTextbox(1, $qx + 10, $qy + 6, 430, 150)
    $qTxt.TextFrame.TextRange.Text = "$($quads6[$q].Icon) $($quads6[$q].Title)`r`n$($quads6[$q].Points)"
    $qTxt.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue
    $qTxt.TextFrame.TextRange.Paragraphs(1).Font.Size = 11.5
    $qTxt.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cDarkNavy
    for ($p=2; $p -le $qTxt.TextFrame.TextRange.Paragraphs().Count; $p++) {
        $qTxt.TextFrame.TextRange.Paragraphs($p).Font.Size = 8.5
        $qTxt.TextFrame.TextRange.Paragraphs($p).Font.Color.RGB = $cTextDark
    }
}

# Bottom Motto & Repository Banner
$bot6 = $s6.Shapes.AddShape(1, 0, 420, 960, 120); $bot6.Fill.Solid(); $bot6.Fill.ForeColor.RGB = 0xFFF7ED # Warm light orange
$bot6.Line.ForeColor.RGB = $cOrange; $bot6.Line.Weight = 1.5
$botText6 = $s6.Shapes.AddTextbox(1, 20, 428, 920, 105)
$botText6.TextFrame.TextRange.Text = "OFFICIAL PROJECT REPOSITORY & LIVE WEB MISSION HUB:`r`n• GitHub: https://github.com/harshitsharma120109-web/ARIES-Search-Rescue-Rover`r`n• Live Console: https://melodic-halva-b0fa56.netlify.app/  |  https://joyful-cactus-9b247c.netlify.app/`r`n'WE DON'T JUST BUILD ROBOTS, WE BUILD HOPE.' — Team ALPHA-X (SIH_1186)"
$botText6.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $botText6.TextFrame.TextRange.Paragraphs(1).Font.Size = 10.5; $botText6.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cOrange
$botText6.TextFrame.TextRange.Paragraphs(2).Font.Size = 9.5; $botText6.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cDarkNavy
$botText6.TextFrame.TextRange.Paragraphs(3).Font.Size = 9.5; $botText6.TextFrame.TextRange.Paragraphs(3).Font.Color.RGB = $cCyan
$botText6.TextFrame.TextRange.Paragraphs(4).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $botText6.TextFrame.TextRange.Paragraphs(4).Font.Size = 12; $botText6.TextFrame.TextRange.Paragraphs(4).Font.Color.RGB = $cOrange

# Save Presentation Deck
$pres.SaveAs($pptDeck)
Write-Host "Light Theme Deck saved to: $pptDeck"

# Export all 6 slides to PNG (1920x1080)
for ($s=1; $s -le 6; $s++) {
    $pngOut = Join-Path $outDir "slide_$s.png"
    $pres.Slides.Item($s).Export($pngOut, "PNG", 1920, 1080)
    Write-Host "Exported Slide $s -> $pngOut"
    Copy-Item $pngOut (Join-Path $assetDir "light_slide_$s.png") -Force
}

$pres.Close()
$ppt.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($ppt) | Out-Null
Write-Host "All 6 Light-Theme Slides successfully generated and exported!"
