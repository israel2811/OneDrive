$workflowsDir = Join-Path $PSScriptRoot "workflows"

if (-not (Test-Path $workflowsDir)) {
    Write-Error "No se encontro carpeta workflows en $workflowsDir"
    exit 1
}

$n8nCmd = Get-Command n8n -ErrorAction SilentlyContinue
if (-not $n8nCmd) {
    Write-Error "n8n CLI no esta en PATH. Instala n8n o agrega el binario y reintenta."
    exit 1
}

$files = Get-ChildItem $workflowsDir -Filter "*.json"
if (-not $files) {
    Write-Error "No hay archivos JSON para importar."
    exit 1
}

foreach ($file in $files) {
    Write-Host "Importando $($file.Name)..." -ForegroundColor Cyan
    n8n import:workflow --input $file.FullName --separate
}

Write-Host "Importacion terminada. Revisa http://localhost:5678 para activar cada workflow." -ForegroundColor Green
