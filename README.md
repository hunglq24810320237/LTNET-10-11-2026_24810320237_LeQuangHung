# LTNET-10-11-2026_24810320237_LeQuangHung

## Thông tin sinh viên

- Họ và tên: Lê Quang Hưng
- Mã sinh viên: 24810320237
- Lớp: D19QTANM1
- Môn học: Lập trình .NET

Repository gồm ba ứng dụng Windows Forms cho bài 6.3, 6.4 và 6.5. Mỗi bài dùng CSDL SQL Server riêng và được chia thành DTO, DAL, BUS, GUI.

## Công nghệ

- C# Windows Forms, .NET 10
- SQL Server Express (`localhost\SQLEXPRESS`)
- ADO.NET (`Microsoft.Data.SqlClient`)
- Visual Studio 2026

## Cấu trúc thư mục

```text
LTNET-10-11-2026_24810320237_LeQuangHung/
├── .gitignore
├── README.md
├── Database/
│   ├── ProjectTaskDB.sql
│   ├── GarageDB.sql
│   └── KaraokeDB.sql
├── images/
│   ├── Bai6.3/
│   ├── Bai6.4/
│   └── Bai6.5/
└── src/
    ├── LTNET-10-11-2026_24810320237_LeQuangHung.sln
    ├── ProjectTasks/
    ├── GarageManager/
    └── KaraokeManager/
```

## Cài đặt và chạy

1. Trong SQL Server Management Studio, kết nối `localhost\SQLEXPRESS` bằng Windows Authentication.
2. Chạy lần lượt `Database/ProjectTaskDB.sql`, `Database/GarageDB.sql` và `Database/KaraokeDB.sql`. Các script tạo CSDL và dữ liệu mẫu tiếng Việt; chạy lại không xóa bảng hay dữ liệu hiện có.
3. Mở `src/LTNET-10-11-2026_24810320237_LeQuangHung.sln` bằng Visual Studio 2026.
4. Chọn `ProjectTasks`, `GarageManager` hoặc `KaraokeManager` làm Startup Project rồi nhấn F5.
5. Nếu SQL Server dùng instance khác, sửa `ConnectionString` trong thư mục DAL tương ứng.

## Bài 6.3 — Quản lý dự án và tiến độ

- CRUD dự án và task, giao task cho nhiều thành viên.
- Lọc task theo dự án/trạng thái và cập nhật trạng thái bằng truy vấn có tham số.
- Cảnh báo task trễ hạn bằng `SqlDataReader`; tính tỷ lệ hoàn thành theo thành viên bằng `GROUP BY`.
- CSDL: `ProjectTaskDB`.

### Ảnh kết quả

1. Tổng quan: ![Tổng quan bài 6.3](images/Bai6.3/01_main_screen.jpg)
2. CRUD dự án: ![CRUD dự án bài 6.3](images/Bai6.3/02_crud_screen.jpg)
3. Danh sách task và phân công: ![Nghiệp vụ bài 6.3](images/Bai6.3/03_transaction_screen.jpg)
4. Báo cáo tiến độ và task trễ hạn: ![Báo cáo bài 6.3](images/Bai6.3/04_report_screen.jpg)
5. Kiểm tra cập nhật trạng thái an toàn: ![Xử lý lỗi bài 6.3](images/Bai6.3/05_error_handling.jpg)

## Bài 6.4 — Quản lý Garage và bảo dưỡng ô tô

- Tra cứu xe theo biển số bằng `SqlParameter`; quản lý chủ xe, xe và phụ tùng.
- Lập phiếu sửa chữa bằng `SqlTransaction`, ghi chi tiết và trừ tồn kho; thiếu phụ tùng thì rollback.
- Chuyển phiếu sửa chữa sang trạng thái đã thanh toán.
- CSDL: `GarageDB`.

### Ảnh kết quả

1. Tổng quan: ![Tổng quan bài 6.4](images/Bai6.4/01_main_screen.jpg)
2. Chủ xe, xe và phụ tùng: ![CRUD bài 6.4](images/Bai6.4/02_crud_screen.jpg)
3. Lập phiếu sửa chữa: ![Nghiệp vụ bài 6.4](images/Bai6.4/03_transaction_screen.jpg)
4. Báo cáo phiếu và thanh toán: ![Báo cáo bài 6.4](images/Bai6.4/04_report_screen.jpg)
5. Rollback khi kho không đủ: ![Rollback bài 6.4](images/Bai6.4/05_error_handling.jpg)

## Bài 6.5 — Quản lý phòng Karaoke

- Sơ đồ phòng trực quan: màu xanh là phòng trống, màu đỏ là phòng đang hát.
- Mở phòng, thêm dịch vụ qua `DataTable`/`SqlDataAdapter`, và thanh toán bằng `SqlTransaction`.
- Tính tiền phòng theo thời gian, trừ tồn dịch vụ và trả phòng sau khi thanh toán.
- CSDL: `KaraokeDB`.

### Ảnh kết quả

1. Sơ đồ phòng: ![Tổng quan bài 6.5](images/Bai6.5/01_main_screen.jpg)
2. CRUD dịch vụ: ![CRUD bài 6.5](images/Bai6.5/02_crud_screen.jpg)
3. Gọi dịch vụ và thanh toán: ![Nghiệp vụ bài 6.5](images/Bai6.5/03_transaction_screen.jpg)
4. Báo cáo hóa đơn: ![Báo cáo bài 6.5](images/Bai6.5/04_report_screen.jpg)
5. Rollback khi dịch vụ thiếu hàng: ![Rollback bài 6.5](images/Bai6.5/05_error_handling.jpg)