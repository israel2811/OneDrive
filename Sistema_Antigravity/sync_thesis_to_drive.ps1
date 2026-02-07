# Sincroniza archivos clave de tesis a Google Drive usando rclone.
# Requiere un remote llamado "gdrive" ya configurado (`rclone config`).

$remote = "gdrive"
$destRoot = "Antigravity/Tesis"
$staging = Join-Path $env:TEMP "antigravity_sync"

if (-not (Get-Command rclone -ErrorAction SilentlyContinue)) {
    Write-Error "rclone no esta instalado o no esta en PATH. Instala rclone y crea el remote '$remote'."
    exit 1
}

rclone listremotes | Select-String "^$remote:" | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Error "Remote '$remote' no esta configurado. Ejecuta 'rclone config'."
    exit 1
}

New-Item -ItemType Directory -Path $staging -Force | Out-Null

$items = @(
    "C:\Users\Lenovo\OneDrive\Sistema_Antigravity\MEGA_MASTER_CONSOLIDADO.md",
    "C:\Users\Lenovo\OneDrive\TESIS_NEXUS_INDEX.md",
    "C:\Users\Lenovo\OneDrive\INDICE_TOTAL_SUMADO_PARTE1.md",
    "C:\Users\Lenovo\OneDrive\INDICE_TOTAL_SUMADO_PARTE2.md",
    "C:\Users\Lenovo\OneDrive\INDICE_TOTAL_SUMADO_PARTE3.md"
)

foreach ($item in $items) {
    if (Test-Path $item) {
        Copy-Item $item -Destination $staging -Force
        Write-Host "Preparado: $item"
    } else {
        Write-Host "Aviso: no se encontro $item"
    }
}

$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm"
$dest = "$remote:$destRoot/$timestamp"

Write-Host "Subiendo a $dest ..."
rclone copy $staging $dest --progress

Write-Host "Sync completado. Limpieza de staging..."
Remove-Item $staging -Recurse -Force
