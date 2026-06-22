@echo off
title Binh Loi Healing - Server
color 0A
echo.
echo  ==========================================
echo   BINH LOI HEALING - Dang khoi dong...
echo  ==========================================
echo.

:: Kiem tra Node.js
node -v >nul 2>&1
if %errorlevel% neq 0 (
    echo  [LOI] Chua cai Node.js! Tai tai: https://nodejs.org
    pause
    exit
)

:: Kiem tra file .env
if not exist "%~dp0.env" (
    echo  [LOI] Khong tim thay file .env
    echo  Hay tao file .env theo huong dan truoc.
    pause
    exit
)

:: Kiem tra node_modules
if not exist "%~dp0node_modules" (
    echo  [INFO] Chua co node_modules, dang cai packages...
    cd /d "%~dp0"
    npm install
    echo.
)

cd /d "%~dp0"

echo  [OK] Dang khoi dong server...
echo  [OK] Mo trinh duyet: http://localhost:3000
echo.
echo  Nhan Ctrl+C de dung server.
echo  ==========================================
echo.

:: Mo trinh duyet sau 2 giay
start "" timeout /t 2 >nul
start "" "http://localhost:3000"

:: Chay server
node src/server.js

echo.
echo  Server da dung.
pause
