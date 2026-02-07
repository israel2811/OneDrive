$env:Path = "$env:Path;C:\Windows\System32"
Write-Host "PATH temporalmente arreglado para esta sesión." -ForegroundColor Green

# Verificar si estamos en el directorio correcto
if (Test-Path ".\Sistema_Antigravity") {
    Write-Host "Cambiando al directorio del proyecto Sistema_Antigravity..." -ForegroundColor Cyan
    Set-Location ".\Sistema_Antigravity"
}

# Comprobar versión de Claude
Write-Host "Verificando instalación de Claude..." -ForegroundColor Cyan
try {
    claude --version
}
catch {
    Write-Host "No se pudo ejecutar claude. Asegúrate de que está instalado." -ForegroundColor Red
    exit
}

# Instrucciones para el usuario
Write-Host "`nPara completar la configuración:" -ForegroundColor Yellow
Write-Host "1. Ejecuta 'claude install' para actualizar a la versión nativa (recomendado)."
Write-Host "2. Ejecuta 'claude login' para autenticarte (ahora debería abrir el navegador)."
Write-Host "3. Si falla, copia la URL que aparece y ábrela manualmente."
Write-Host "4. Una vez logueado, ya puedes usar 'claude' en este directorio."

# Opcional: Ejecutar login si el usuario quiere
$response = Read-Host "`n¿Quieres intentar iniciar sesión ahora? (S/N)"
if ($response -match "S|s") {
    claude login
}
