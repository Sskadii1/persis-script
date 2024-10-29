# Điều kiện mở calc
$Action = {
    Write-Output "Excel được phát hiện, khởi chạy Calculator..."
    Start-Process "calc.exe"
}

# Vòng lặp để tìm excel trong hệ thống, thuật toán hơi kém với cơ bản, thông cảm :))
while ($true) {
    # Kiểm tra xem có process nào là excel.exe đang chạy không
    $excelProcess = Get-Process -Name "EXCEL" -ErrorAction SilentlyContinue

    if ($excelProcess) {
        & $Action
        # Chờ 10 giây để tránh mở lại liên tục
        Start-Sleep -Seconds 10
    }
    # Kiểm tra mỗi 5 giây
    Start-Sleep -Seconds 5
}
