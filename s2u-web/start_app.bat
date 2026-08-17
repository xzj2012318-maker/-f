@echo off
chcp 65001 >nul
title i love s2u
cd /d "%~dp0"

netstat -ano | findstr ":8000 " | findstr "LISTENING" >nul
if %errorlevel%==0 (
    echo Server already running. Opening app...
    start "" msedge --app=http://127.0.0.1:8000
    exit /b 0
)

echo ==========================================
echo   i love s2u  -  starting...
echo ==========================================

start "s2u-server" /min "C:\Users\ASUS\AppData\Local\Programs\Python\Python311\python.exe" -m http.server 8000 --bind 127.0.0.1

timeout /t 2 /nobreak >nul

start "" msedge --app=http://127.0.0.1:8000

echo App opened. Close this window to stop the server.
pause
