$port = 8080
$root = $PSScriptRoot
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()

Write-Host "=========================================================" -ForegroundColor Green
Write-Host "   ARIES Search & Rescue Mission Hub — Local Server Active" -ForegroundColor Cyan
Write-Host "   URL: http://localhost:$port/index.html" -ForegroundColor Yellow
Write-Host "=========================================================" -ForegroundColor Green
Write-Host "Web Serial is FULLY UNLOCKED in Chrome/Edge on localhost!" -ForegroundColor White
Write-Host "Keep this window open while using the command console.`n" -ForegroundColor Gray

# Open browser
Start-Process "http://localhost:$port/index.html"

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $path = $request.Url.LocalPath.TrimStart('/')
        if ([string]::IsNullOrEmpty($path) -or $path -eq "/") { $path = "index.html" }
        $filePath = Join-Path $root $path.Replace('/', '\')

        if (Test-Path $filePath -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $mime = switch ($ext) {
                ".html" { "text/html; charset=utf-8" }
                ".css"  { "text/css" }
                ".js"   { "application/javascript" }
                ".png"  { "image/png" }
                ".jpg"  { "image/jpeg" }
                ".jpeg" { "image/jpeg" }
                ".json" { "application/json" }
                ".ico"  { "image/x-icon" }
                ".pdf"  { "application/pdf" }
                ".pptx" { "application/vnd.openxmlformats-officedocument.presentationml.presentation" }
                default { "application/octet-stream" }
            }
            $response.ContentType = $mime
            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $response.StatusCode = 404
            $msg = [System.Text.Encoding]::UTF8.GetBytes("File Not Found: $path")
            $response.OutputStream.Write($msg, 0, $msg.Length)
        }
        $response.Close()
    }
} finally {
    $listener.Stop()
}
