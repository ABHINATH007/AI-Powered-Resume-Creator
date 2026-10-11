@echo off
title Stop ResumeForge AI Server

echo ========================================================
echo        Stopping ResumeForge AI Server (Port 8080)
echo ========================================================

for /f "tokens=5" %%a in ('netstat -aon ^| findstr :8080 ^| findstr LISTENING') do (
    echo [INFO] Terminating process with PID: %%a
    taskkill /F /PID %%a >nul 2>&1
)

echo [SUCCESS] ResumeForge AI server has been stopped.
timeout /t 2 >nul
exit
