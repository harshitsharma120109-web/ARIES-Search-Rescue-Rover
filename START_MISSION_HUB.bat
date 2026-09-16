@echo off
title ARIES Mission Hub & Rover Controller
echo Starting ARIES Local Web Server...
powershell -ExecutionPolicy Bypass -File "%~dp0server.ps1"
pause
