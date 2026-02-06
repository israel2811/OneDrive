# 🔄 Auto-Backup Script

# Ejecutar cada hora o manualmente
# Configura en Task Scheduler para backup automático

$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm"
$backupDir = "C:\Users\Lenovo\OneDrive\Sistema_Antigravity\backups\$timestamp"

Write-Host "🔄 Iniciando backup: $timestamp" -ForegroundColor Cyan

# Crear directorio de backup
New-Item -ItemType Directory -Path $backupDir -Force | Out-Null

# Archivos a respaldar
$filesToBackup = @(
    "C:\Users\Lenovo\OneDrive\CLAUDE.md",
    "C:\Users\Lenovo\OneDrive\Sistema_Antigravity\MEGA_MASTER_CONSOLIDADO.md",
    "C:\Users\Lenovo\OneDrive\Sistema_Antigravity\recovery-system\STATUS_TRACKER.md"
)

# Carpetas a respaldar
$foldersToBackup = @(
    "C:\Users\Lenovo\.gemini\antigravity\playground\magnetic-quasar"
)

# Copiar archivos
foreach ($file in $filesToBackup) {
    if (Test-Path $file) {
        Copy-Item $file -Destination $backupDir -Force
        Write-Host "  ✅ $file" -ForegroundColor Green
    }
}

# Copiar carpetas (tesis)
foreach ($folder in $foldersToBackup) {
    if (Test-Path $folder) {
        $destFolder = Join-Path $backupDir (Split-Path $folder -Leaf)
        Copy-Item $folder -Destination $destFolder -Recurse -Force
        Write-Host "  ✅ $folder" -ForegroundColor Green
    }
}

# Comprimir backup
$zipPath = "$backupDir.zip"
Compress-Archive -Path $backupDir -DestinationPath $zipPath -Force
Remove-Item $backupDir -Recurse -Force

Write-Host "`n✅ Backup completado: $zipPath" -ForegroundColor Green

# Limpiar backups antiguos (mantener últimos 7)
$backupFolder = "C:\Users\Lenovo\OneDrive\Sistema_Antigravity\backups"
$oldBackups = Get-ChildItem $backupFolder -Filter "*.zip" | Sort-Object CreationTime -Descending | Select-Object -Skip 7
foreach ($old in $oldBackups) {
    Remove-Item $old.FullName -Force
    Write-Host "🗑️ Eliminado backup antiguo: $($old.Name)" -ForegroundColor Yellow
}
