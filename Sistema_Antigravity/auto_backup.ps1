# Auto-Backup Script (ASCII-safe)
# Ejecutar manualmente o desde el Programador de tareas.

$backupRoot = "C:\Users\Lenovo\OneDrive\Sistema_Antigravity\backups"
New-Item -ItemType Directory -Path $backupRoot -Force | Out-Null
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm"
$backupDir = Join-Path $backupRoot $timestamp
$logFile = Join-Path $backupRoot "backup_log.txt"

function Write-Log {
    param([string]$Message, [string]$Color = "Gray")
    $line = "$(Get-Date -Format s) $Message"
    $line | Out-File -FilePath $logFile -Append -Encoding utf8
    Write-Host $line -ForegroundColor $Color
}

Write-Log "Iniciando backup $timestamp" "Cyan"
New-Item -ItemType Directory -Path $backupDir -Force | Out-Null

# Archivos a respaldar (agrega mas si se necesitan)
$filesToBackup = @(
    "C:\Users\Lenovo\OneDrive\CLAUDE.md",
    "C:\Users\Lenovo\OneDrive\Sistema_Antigravity\MEGA_MASTER_CONSOLIDADO.md",
    "C:\Users\Lenovo\OneDrive\Sistema_Antigravity\recovery-system\STATUS_TRACKER.md"
)

# Carpetas a respaldar
$foldersToBackup = @(
    "C:\Users\Lenovo\.gemini\antigravity\playground\magnetic-quasar"
)

foreach ($file in $filesToBackup) {
    if (Test-Path $file) {
        Copy-Item $file -Destination $backupDir -Force
        Write-Log "Archivo copiado: $file" "Green"
    }
    else {
        Write-Log "Aviso: no se encontro $file" "Yellow"
    }
}

foreach ($folder in $foldersToBackup) {
    if (Test-Path $folder) {
        $destFolder = Join-Path $backupDir (Split-Path $folder -Leaf)
        Copy-Item $folder -Destination $destFolder -Recurse -Force
        Write-Log "Carpeta copiada: $folder" "Green"
    }
    else {
        Write-Log "Aviso: no se encontro carpeta $folder" "Yellow"
    }
}

$zipPath = "$backupDir.zip"
Compress-Archive -Path $backupDir -DestinationPath $zipPath -Force
Remove-Item $backupDir -Recurse -Force

if (Test-Path $zipPath) {
    $hash = Get-FileHash -Algorithm SHA256 $zipPath
    Write-Log "Backup completado: $zipPath (SHA256: $($hash.Hash))" "Green"
}
else {
    Write-Log "Error: el archivo zip no se creo" "Red"
    exit 1
}

# Limpiar backups antiguos (mantener ultimos 7)
$oldBackups = Get-ChildItem $backupRoot -Filter "*.zip" | Sort-Object CreationTime -Descending | Select-Object -Skip 7
foreach ($old in $oldBackups) {
    Remove-Item $old.FullName -Force
    Write-Log "Backup antiguo eliminado: $($old.Name)" "Yellow"
}
