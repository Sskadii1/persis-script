$TaskName = "ExcelMonitorTask"
$ScriptPath = "C:\Path\To\MonitorExcel.ps1"  # Thay bằng đường dẫn thật

# gán nv cho task
$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-WindowStyle Hidden -File $ScriptPath"

# Thiết lập trigger chạy task khi khởi động hệ thống, hehehehe
$Trigger = New-ScheduledTaskTrigger -AtStartup

# Cấu hình task để đảm bảo persistence sau những lần sau
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -RestartCount 3 -RestartInterval (New-TimeSpan -Minutes 1)

# Gài task kiểu đăng ký
Register-ScheduledTask -Action $Action -Trigger $Trigger -TaskName $TaskName -Settings $Settings

Write-Output "Scheduled task $TaskName đã được tạo để chạy khi hệ thống khởi động."
