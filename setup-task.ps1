$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-ExecutionPolicy Bypass -WindowStyle Hidden -File E:\aidesign\daily-news\auto-push.ps1'
$trigger = New-ScheduledTaskTrigger -Daily -At '09:10'
$settings = New-ScheduledTaskSettingsSet -RunOnlyIfNetworkAvailable:$true
Register-ScheduledTask -TaskName 'DailyNewsAutoPush' -Action $action -Trigger $trigger -Settings $settings -Description 'Auto push daily news updates to GitHub at 9:10 AM daily' -Force
Write-Host "Task created successfully"
