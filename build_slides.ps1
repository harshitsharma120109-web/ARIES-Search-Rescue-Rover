$pptPath = "C:\Users\manoj\.gemini\antigravity\scratch\ARIES\docs\sih\SIH2026_ARIES_ALPHA-X.pptx"
$outDir  = "C:\Users\manoj\.gemini\antigravity\scratch\ARIES\docs\sih\slides_png"
if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir -Force }

$imgDir = "C:\Users\manoj\.gemini\antigravity\scratch\ARIES\assets\images"

$ppt = New-Object -ComObject PowerPoint.Application
$pres = $ppt.Presentations.Add([Microsoft.Office.Core.MsoTriState]::msoFalse)
$pres.PageSetup.SlideWidth  = 960
$pres.PageSetup.SlideHeight = 540

# Colors (Office COM uses BGR: 0xBBGGRR)
$cBg     = 0x1A0E0A   # #0A0E1A (Dark Navy)
$cCard   = 0x281B13   # #131B28 (Dark Blue-Gray Card)
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
    $b1 = $slide.Shapes.AddShape(5, 24, 10, 110, 32) # 5 = msoShapeRoundedRectangle
    $b1.Fill.Solid(); $b1.Fill.ForeColor.RGB = $cOrange
    $b1.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
    $b1.TextFrame.TextRange.Text = "ALPHA-X"
    $b1.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue
    $b1.TextFrame.TextRange.Font.Size = 13
    $b1.TextFrame.TextRange.Font.Color.RGB = $cWhite

    # Title
    $tb = $slide.Shapes.AddTextbox(1, 145, 10, 500, 32)
    $tb.TextFrame.TextRange.Text = $titleText
    $tb.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue
    $tb.TextFrame.TextRange.Font.Size = 16
    $tb.TextFrame.TextRange.Font.Color.RGB = $cAmber

    # Badge Right
    $b2 = $slide.Shapes.AddShape(5, 710, 10, 226, 32)
    $b2.Fill.Solid(); $b2.Fill.ForeColor.RGB = 0x352319
    $b2.Line.Color.RGB = $cOrange
    $b2.Line.Weight = 1
    $b2.TextFrame.TextRange.Text = "SIH 2026 | PS: SIH26223"
    $b2.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue
    $b2.TextFrame.TextRange.Font.Size = 11
    $b2.TextFrame.TextRange.Font.Color.RGB = $cWhite
}

# ==========================================
# SLIDE 1: COVER
# ==========================================
$s1 = $pres.Slides.Add(1, 12)
$bg = $s1.Shapes.AddShape(1, 0, 0, 960, 540); $bg.Fill.Solid(); $bg.Fill.ForeColor.RGB = $cBg; $bg.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse

# Top Header Pill
$p1 = $s1.Shapes.AddShape(5, 40, 40, 220, 34); $p1.Fill.Solid(); $p1.Fill.ForeColor.RGB = $cOrange; $p1.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
$p1.TextFrame.TextRange.Text = "SMART INDIA HACKATHON 2026"; $p1.TextFrame.TextRange.Font.Size = 11; $p1.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $p1.TextFrame.TextRange.Font.Color.RGB = $cWhite

# Big Title
$t1 = $s1.Shapes.AddTextbox(1, 40, 85, 460, 70)
$t1.TextFrame.TextRange.Text = "ARIES"
$t1.TextFrame.TextRange.Font.Size = 54; $t1.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $t1.TextFrame.TextRange.Font.Color.RGB = $cOrange

$st1 = $s1.Shapes.AddTextbox(1, 40, 160, 460, 60)
$st1.TextFrame.TextRange.Text = "Autonomous & Remotely-Operated Intelligent Emergency Search-and-Rescue Rover"
$st1.TextFrame.TextRange.Font.Size = 16; $st1.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $st1.TextFrame.TextRange.Font.Color.RGB = $cWhite

# 3 Pillar Cards
$pillars = @(
    @{Icon="🛡️"; Title="Zero-Human-Risk First Look"; Sub="Scouts unstable rubble before human responders enter."},
    @{Icon="🔥"; Title="Dual-Spectrum Vision"; Sub="HD Optical + FLIR Thermal Core sees through smoke & dust."},
    @{Icon="📡"; Title="5 km Sub-GHz LoRa Mesh"; Sub="868/915 MHz penetrates concrete where Wi-Fi drops completely."}
)
for ($i=0; $i -lt $pillars.Count; $i++) {
    $y = 235 + ($i * 75)
    $card = $s1.Shapes.AddShape(5, 40, $y, 450, 64)
    $card.Fill.Solid(); $card.Fill.ForeColor.RGB = $cCard; $card.Line.Color.RGB = $cOrange; $card.Line.Weight = 1
    $card.TextFrame.TextRange.Text = "$($pillars[$i].Icon) $($pillars[$i].Title)`r`n$($pillars[$i].Sub)"
    $card.TextFrame.TextRange.Paragraphs(1).Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue
    $card.TextFrame.TextRange.Paragraphs(1).Font.Size = 13
    $card.TextFrame.TextRange.Paragraphs(1).Font.Color.RGB = $cAmber
    $card.TextFrame.TextRange.Paragraphs(2).Font.Size = 10
    $card.TextFrame.TextRange.Paragraphs(2).Font.Color.RGB = $cGray
}

# Image
$img1 = Join-Path $imgDir "advanced_rover.jpg"
if (Test-Path $img1) {
    $s1.Shapes.AddPicture($img1, [Microsoft.Office.Core.MsoTriState]::msoFalse, [Microsoft.Office.Core.MsoTriState]::msoTrue, 515, 60, 405, 380)
}

# Bottom Bar
$bot1 = $s1.Shapes.AddShape(1, 0, 485, 960, 55); $bot1.Fill.Solid(); $bot1.Fill.ForeColor.RGB = 0x20150F; $bot1.Line.Visible = [Microsoft.Office.Core.MsoTriState]::msoFalse
$botText = $s1.Shapes.AddTextbox(1, 40, 495, 880, 35)
$botText.TextFrame.TextRange.Text = "Team: ALPHA-X   |   Theme: Disaster Management   |   PS ID: SIH26223   |   Category: Hardware & Edge AI"
$botText.TextFrame.TextRange.Font.Size = 13; $botText.TextFrame.TextRange.Font.Bold = [Microsoft.Office.Core.MsoTriState]::msoTrue; $botText.TextFrame.TextRange.Font.Color.RGB = $cAmber

Write-Host "Slide 1 built."
$pres.SaveAs($pptPath)
$pres.Close()
$ppt.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($ppt) | Out-Null
