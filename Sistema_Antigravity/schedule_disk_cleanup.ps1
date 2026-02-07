# Programa disk_cleanup.ps1 para correr semanalmente.
$taskName = "Antigravity_DiskCleanup"
$scriptPath = Join-Path (Split-Path $MyInvocation.MyCommand.Path -Parent) "disk_cleanup.ps1"

if (-not (Test-Path $scriptPath)) {
    Write-Error "No se encontro disk_cleanup.ps1 en $scriptPath"
    exit 1
}

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`""
$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At 03:00
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable

try {
    Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings -Force | Out-Null
    Write-Host "Tarea programada creada/actualizada: $taskName"
}
catch {
    Write-Error "No se pudo crear la tarea: $_"
    exit 1
}
