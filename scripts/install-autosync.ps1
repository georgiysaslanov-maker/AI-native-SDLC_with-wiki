<#
.SYNOPSIS
  Включает (или выключает) автоматическую синхронизацию через Планировщик заданий Windows.

.EXAMPLE
  powershell -ExecutionPolicy Bypass -File scripts\install-autosync.ps1
  powershell -ExecutionPolicy Bypass -File scripts\install-autosync.ps1 -Minutes 30
  powershell -ExecutionPolicy Bypass -File scripts\install-autosync.ps1 -Uninstall
#>
param(
    [int]$Minutes = 10,
    [switch]$Uninstall
)

$TaskName = 'SecondBrain-GitSync'

if ($Uninstall) {
    Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false -ErrorAction SilentlyContinue
    Write-Host "Автосинхронизация выключена (задание $TaskName удалено)." -ForegroundColor Yellow
    return
}

$script = Join-Path $PSScriptRoot 'sync.ps1'
$user   = "$env:USERDOMAIN\$env:USERNAME"

$action = New-ScheduledTaskAction -Execute 'powershell.exe' `
    -Argument "-NoProfile -NonInteractive -WindowStyle Hidden -ExecutionPolicy Bypass -File `"$script`" -Quiet"
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1) `
    -RepetitionInterval (New-TimeSpan -Minutes $Minutes)
$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable -MultipleInstances IgnoreNew `
    -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries `
    -ExecutionTimeLimit (New-TimeSpan -Minutes 5)
# Interactive: задание работает от вашего имени и видит сохранённый вход в GitHub.
$principal = New-ScheduledTaskPrincipal -UserId $user -LogonType Interactive -RunLevel Limited

Register-ScheduledTask -TaskName $TaskName -Action $action -Trigger $trigger `
    -Settings $settings -Principal $principal -Force `
    -Description 'Двусторонняя синхронизация базы знаний с GitHub (scripts\sync.ps1).' | Out-Null

Write-Host "Автосинхронизация включена: каждые $Minutes мин. Журнал — sync.log в корне репозитория." -ForegroundColor Green
Write-Host 'Выключить: powershell -ExecutionPolicy Bypass -File scripts\install-autosync.ps1 -Uninstall'
