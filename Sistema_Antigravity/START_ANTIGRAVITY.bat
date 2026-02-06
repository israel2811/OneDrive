@echo off
setlocal

:: Configurar rutas
set "NODE_PATH=C:\nodejs\node-v20.18.0-win-x64"
set "PATH=%NODE_PATH%;%PATH%"

echo ==========================================
echo   🚀 ANTIGRAVITY LAUNCHER (Auto-Config)
echo ==========================================
echo.

:: Verificar Node
node --version
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Node.js no encontrado en %NODE_PATH%
    pause
    exit /b 1
)

:: Ir al directorio de trabajo
cd /d "C:\Users\Lenovo\OneDrive\Sistema_Antigravity\n8n-integration"

:: Importar Workflows (Opcional, si no existen)
echo.
echo 📦 Importando Workflows...
call npx n8n import:workflow --input="workflows\01_auto_backup.json"
call npx n8n import:workflow --input="workflows\02_conversation_sync.json"
call npx n8n import:workflow --input="workflows\03_daily_summary.json"
call npx n8n import:workflow --input="workflows\04_thesis_tracker.json"
call npx n8n import:workflow --input="workflows\05_multi_ai.json"
call npx n8n import:workflow --input="workflows\06_git_auto_commit.json"
call npx n8n import:workflow --input="workflows\07_error_recovery.json"
call npx n8n import:workflow --input="workflows\08_health_check.json"
call npx n8n import:workflow --input="workflows\09_conversation_logger.json"
call npx n8n import:workflow --input="workflows\10_file_watcher.json"

:: Instalar Nodos Comunitarios (Extensiones)
echo.
echo 🧩 Instalando Extensiones (Community Nodes)...
:: browserless no se instala así, se hace desde UI, pero preparamos el entorno
:: call npm install n8n-nodes-text-manipulation

:: Iniciar n8n
echo.
echo 🟢 Iniciando n8n Server...
echo Accede en: http://localhost:5678
call npx n8n

endlocal
