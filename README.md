# persis-script
tôi thử lập script để tạo persistence

Đây là cách thiết lập persistence, kết hợp giữa việc chạy script PowerShell nền và tạo Scheduled Task để giữ cho script hoạt động ngay cả khi khởi động lại hoặc đăng nhập lại. Script này sẽ phát hiện khi excel.exe được mở và tự động khởi chạy calc.exe mà không cần tác động thủ công sau lần chạy đầu tiên.

đây là cách mở Calc.exe bằng Excel.

Tổng Quan Các Bước
1.Tạo Script Theo Dõi Sự Kiện Mở Excel(ở đây là cái DoExcel.ps1)
2.Tạo Scheduled Task Để Duy Trì Script Sau Khi Khởi Động Lại(Rec1.ps1) và  điều chỉnh đường dẫn đến MonitorExcel.ps1.
3. Chạy Script Tạo Scheduled Task
4. Khởi tạo trong shell()
.\CreateTask.ps1


Nếu muốn xóa Scheduled Task và vô hiệu hóa persistence, sử dụng lệnh sau trong PowerShell:

**Unregister-ScheduledTask -TaskName "ExcelMonitorTask" -Confirm:$false**
