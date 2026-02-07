# Salud rapida de Antigravity

$report = @()

# n8n
try {
    $n8nUp = Test-NetConnection -ComputerName "localhost" -Port 5678 -WarningAction SilentlyContinue
    $report += "n8n puerto 5678: " + ($(if ($n8nUp.TcpTestSucceeded) {"OK"} else {"OFF"}))
} catch { $report += "n8n puerto 5678: error $_" }

# Backups
$backupRoot = "C:\Users\Lenovo\OneDrive\Sistema_Antigravity\backups"
if (Test-Path $backupRoot) {
    $last = Get-ChildItem $backupRoot -Filter "*.zip" | Sort-Object LastWriteTime -Descending | Select-Object -First 1
    if ($last) {
        $report += "Ultimo backup: $($last.Name) @ $($last.LastWriteTime)"
    } else {
        $report += "Ultimo backup: ninguno encontrado"
    }
} else {
    $report += "Ultimo backup: carpeta no existe"
}

# Espacio en disco (unidad C)
$drive = Get-PSDrive -Name C
$freeGB = [math]::Round($drive.Free/1GB,2)
$report += "Espacio libre C: $freeGB GB"

# Scheduled Task
$task = schtasks /Query /TN "Antigravity_AutoBackup" /FO LIST /V 2>$null
if ($LASTEXITCODE -eq 0) {
    $report += "Tarea AutoBackup: registrada"
} else {
    $report += "Tarea AutoBackup: no encontrada"
}

$report | ForEach-Object { Write-Host $_ }
