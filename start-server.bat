@echo off
setlocal enabledelayedexpansion
title ResumeForge AI Launcher

echo ========================================================
echo        Starting ResumeForge AI Web Application
echo ========================================================

cd /d "%~dp0"

:: Check if port 8080 is already in use
netstat -ano | findstr :8080 >nul 2>&1
if %errorlevel% equ 0 (
    echo [INFO] ResumeForge AI server is already running on port 8080.
) else (
    echo [INFO] Launching backend server in background...
    if exist "backend\target\AiResumeMatcher-0.0.1-SNAPSHOT.jar" (
        start "ResumeForge AI Backend" /min java -jar "backend\target\AiResumeMatcher-0.0.1-SNAPSHOT.jar"
    ) else (
        cd backend
        start "ResumeForge AI Backend" /min mvnw.cmd spring-boot:run
        cd ..
    )

    echo [INFO] Waiting for server to initialize on http://localhost:8080...
    :wait_loop
    timeout /t 2 /nobreak >nul
    curl -s http://localhost:8080/api/stats >nul 2>&1
    if errorlevel 1 (
        echo [INFO] Still starting up...
        goto wait_loop
    )
    echo [SUCCESS] Server is online!
)

:: Launch Chrome
echo [INFO] Opening ResumeForge AI in Google Chrome...
start "" "chrome.exe" "http://localhost:8080/resume-creator.html"

echo ========================================================
echo  ResumeForge AI is running permanently at:
echo  - Studio:  http://localhost:8080/resume-creator.html
echo  - Matcher: http://localhost:8080/index.html
echo ========================================================
timeout /t 3 >nul
exit
