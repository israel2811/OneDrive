# Registra un Scheduled Task que ejecuta auto_backup.ps1 cada hora.
# Ejecutar una sola vez con privilegios suficientes.

$taskName = "Antigravity_AutoBackup"
$scriptPath = Join-Path (Split-Path $MyInvocation.MyCommand.Path -Parent) "auto_backup.ps1"

if (-not (Test-Path $scriptPath)) {
    Write-Error "No se encontro auto_backup.ps1 en $scriptPath"
    exit 1
}

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`""
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1) -RepetitionInterval (New-TimeSpan -Hours 1) -RepetitionDuration (New-TimeSpan -Days 3650)
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable

try {
    Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings -Force | Out-Null
    Write-Host "Tarea programada creada/actualizada: $taskName"
}
catch {
    Write-Error "No se pudo crear la tarea: $_"
    exit 1
}
