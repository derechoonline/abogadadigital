@echo off
title Servidor Local + AutoPush Netlify
echo ==========================
echo Iniciando entorno...
echo ==========================

cd /d C:\Users\Usuario\web-profesional

REM ---------- CERRAR LIVE SERVER ANTERIOR ----------
for /f "tokens=5" %%a in ('netstat -ano ^| findstr :5500') do (
    taskkill /PID %%a /F >nul 2>nul
)

REM ---------- VERIFICAR live-server ----------
where live-server >nul 2>nul
if %errorlevel% neq 0 (
    echo Instalando live-server...
    npm install -g live-server
)

REM ---------- INICIAR LIVE SERVER ----------
start "" cmd /k "cd /d C:\Users\Usuario\web-profesional && live-server --port=5500"

REM ---------- INICIAR NODEMON PARA AUTOPUSH ----------
start "" cmd /k "cd /d C:\Users\Usuario\web-profesional && nodemon --watch . --ext html,css,js --delay 3 --ignore .git/ --ignore node_modules/ --exec cmd /c "git add -A ^&^& git diff --cached --quiet || (git commit -m auto-update ^&^& git push)""

echo ==========================
echo Listo. Abriendo Live Server en http://127.0.0.1:5500
echo Netlify publicará cambios automáticamente en https://abogadadigital.website
echo ==========================
pause


