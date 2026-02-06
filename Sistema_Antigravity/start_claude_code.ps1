# Script para iniciar Claude Code con Node.js configurado
# Ejecutar desde PowerShell: .\start_claude_code.ps1

# Configurar Git Bash para Claude Code (Requerido para Windows)
$env:CLAUDE_CODE_GIT_BASH_PATH = "C:\Program Files\Git\bin\bash.exe"

# Añadir Node.js al PATH (de Playwright)
$nodePath = "C:\Users\Lenovo\AppData\Local\ms-playwright-go\1.50.1"
$env:Path = "$nodePath;$env:Path"

# Verificar versiones
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host "  CLAUDE CODE LAUNCHER  " -ForegroundColor Yellow
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Node.js version: " -NoNewline
node --version
Write-Host "Claude Code version: " -NoNewline
claude --version
Write-Host ""
Write-Host "===========================================" -ForegroundColor Cyan

# Iniciar Claude Code
Write-Host "Iniciando Claude Code..." -ForegroundColor Green
claude
