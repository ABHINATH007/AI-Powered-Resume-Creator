@echo off
title Enable Permanent Autostart for ResumeForge AI

echo ========================================================
echo   Configuring Permanent Startup for ResumeForge AI
echo ========================================================

set "TARGET_DIR=%~dp0"
set "STARTUP_DIR=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "VBS_SCRIPT=%TARGET_DIR%run-background.vbs"

:: Create a VBScript to run start-server.bat completely hidden in background
(
echo Set WshShell = CreateObject^("WScript.Shell"^)
echo WshShell.Run chr^(34^) ^& "%TARGET_DIR%start-server.bat" ^& chr^(34^), 0
echo Set WshShell = Nothing
) > "%VBS_SCRIPT%"

:: Create shortcut in Windows Startup folder
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%STARTUP_DIR%\ResumeForgeAI.lnk'); $s.TargetPath = 'wscript.exe'; $s.Arguments = '\"%VBS_SCRIPT%\"'; $s.WorkingDirectory = '%TARGET_DIR%'; $s.Save()"

echo [SUCCESS] ResumeForge AI is now configured to start permanently!
echo Location: %STARTUP_DIR%\ResumeForgeAI.lnk
echo.
echo Whenever your computer starts, ResumeForge AI will run automatically in the background
echo and be accessible anytime in Google Chrome at:
echo http://localhost:8080/resume-creator.html
echo.
pause
