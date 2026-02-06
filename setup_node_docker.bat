@echo off
echo Verificando instalacion de Docker...
"C:\Program Files\Docker\Docker\resources\bin\docker.exe" --version
if %errorlevel% neq 0 (
    echo Docker no parece estar funcionando. Asegurate de que Docker Desktop este instalado y EJECUTANDOSE.
    echo Es posible que necesites reiniciar tu computadora si acabas de instalarlo.
    pause
    exit /b
)

echo.
echo Descargando la imagen mas reciente de Node.js...
"C:\Program Files\Docker\Docker\resources\bin\docker.exe" pull node:latest

echo.
echo Verificando Node.js en Docker...
"C:\Program Files\Docker\Docker\resources\bin\docker.exe" run --rm node:latest node --version

echo.
echo Configuracion completada exitosamente!
pause
