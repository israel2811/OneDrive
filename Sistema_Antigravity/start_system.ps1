# 🚀 Quick Start Script - Sistema Antigravity

# Ejecutar este script para iniciar todo el sistema
# Guardar como: start_system.ps1
# Ejecutar con: .\start_system.ps1

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  🚀 SISTEMA ANTIGRAVITY - QUICK START" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# 1. Verificar espacio en disco
$disk = Get-PSDrive C
$freeGB = [math]::Round($disk.Free/1GB, 2)
Write-Host "`n📊 Espacio libre en disco: $freeGB GB" -ForegroundColor Yellow

if ($freeGB -lt 1) {
    Write-Host "⚠️ Advertencia: Poco espacio en disco!" -ForegroundColor Red
}

# 2. Verificar si n8n está corriendo
$n8nProcess = Get-Process -Name "node" -ErrorAction SilentlyContinue | Where-Object {$_.CommandLine -like "*n8n*"}
if ($n8nProcess) {
    Write-Host "✅ n8n ya está corriendo (PID: $($n8nProcess.Id))" -ForegroundColor Green
} else {
    Write-Host "🔄 Iniciando n8n..." -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npx -y n8n" -WindowStyle Normal
    Write-Host "✅ n8n iniciado en nueva ventana" -ForegroundColor Green
}

# 3. Mostrar estado del sistema
Write-Host "`n📋 ESTADO DEL SISTEMA:" -ForegroundColor Cyan
Write-Host "  - CLAUDE.md: C:\Users\Lenovo\OneDrive\CLAUDE.md"
Write-Host "  - n8n UI: http://localhost:5678"
Write-Host "  - Workflows: 10 listos para importar"

# 4. Mostrar tareas pendientes
Write-Host "`n📝 TAREAS PENDIENTES:" -ForegroundColor Cyan
$claudeMd = Get-Content "C:\Users\Lenovo\OneDrive\CLAUDE.md" -ErrorAction SilentlyContinue
$pendingTasks = $claudeMd | Where-Object { $_ -match '^\s*-\s*\[\s*\]' }
$pendingTasks | Select-Object -First 5 | ForEach-Object {
    Write-Host "  $_" -ForegroundColor White
}

# 5. Abrir n8n en navegador
Write-Host "`n🌐 Abriendo n8n en navegador..." -ForegroundColor Yellow
Start-Sleep -Seconds 5
Start-Process "http://localhost:5678"

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  ✅ Sistema listo!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
