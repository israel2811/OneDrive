# 🧹 Disk Cleanup Script

# Ejecutar cuando el disco esté lleno
# ADVERTENCIA: Elimina archivos temporales y caches

Write-Host "🧹 LIMPIEZA DE DISCO AUTOMÁTICA" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan

$initialFree = [math]::Round((Get-PSDrive C).Free/1GB, 2)
Write-Host "`nEspacio inicial libre: $initialFree GB" -ForegroundColor Yellow

# Limpiar temp de usuario
Write-Host "`n1. Limpiando archivos temporales de usuario..." -ForegroundColor White
Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue

# Limpiar npm cache
Write-Host "2. Limpiando cache de npm..." -ForegroundColor White
Remove-Item "$env:LOCALAPPDATA\npm-cache\_logs\*" -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\npm-cache\_npx\*" -Recurse -Force -ErrorAction SilentlyContinue

# Limpiar cache de navegadores
Write-Host "3. Limpiando cache de navegadores..." -ForegroundColor White
Remove-Item "$env:LOCALAPPDATA\Microsoft\Windows\INetCache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue 2>$null

# Limpiar Windows Temp
Write-Host "4. Limpiando Windows Temp..." -ForegroundColor White
Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue 2>$null

# Limpiar crash dumps
Write-Host "5. Limpiando crash dumps..." -ForegroundColor White
Remove-Item "$env:LOCALAPPDATA\CrashDumps\*" -Force -ErrorAction SilentlyContinue

# Vaciar papelera
Write-Host "6. Vaciando papelera..." -ForegroundColor White
Clear-RecycleBin -Force -ErrorAction SilentlyContinue

$finalFree = [math]::Round((Get-PSDrive C).Free/1GB, 2)
$freed = $finalFree - $initialFree

Write-Host "`n================================" -ForegroundColor Cyan
Write-Host "✅ Limpieza completada!" -ForegroundColor Green
Write-Host "Espacio liberado: $freed GB" -ForegroundColor Green
Write-Host "Espacio libre actual: $finalFree GB" -ForegroundColor Green
