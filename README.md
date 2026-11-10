# BÁO CÁO BÀI TẬP C# WINFORMS KẾT NỐI SQL SERVER

## I. THÔNG TIN SINH VIÊN
- **Họ và tên:** Lê Quang Hưng
- **MSSV:** 24810320237
- **Lớp:** D19QTANM1
- **Môn học:** Lập trình .NET / Windows Forms
- **Chủ đề:** Bài 6.3, 6.4, 6.5

## II. CÔNG NGHỆ SỬ DỤNG
- C# Windows Forms, .NET 10, ADO.NET (`Microsoft.Data.SqlClient`)
- SQL Server Express: `localhost\\SQLEXPRESS`
- Phân lớp DTO – DAL – BUS – GUI

## III. CÁC BÀI TẬP
### Bài 6.3 — Quản lý công việc và tiến độ dự án
Quản lý dự án, thành viên, công việc, trạng thái và hạn hoàn thành; có báo cáo task quá hạn và tiến độ theo thành viên. Dữ liệu được lưu trong `ProjectTaskDB`.

### Bài 6.4 — Quản lý Garage và sửa chữa ô tô
Quản lý chủ xe, phương tiện, phụ tùng, phiếu sửa chữa và thanh toán. Lập phiếu và trừ kho trong SQL transaction; lỗi thiếu phụ tùng sẽ rollback. Dữ liệu được lưu trong `GarageDB`.

### Bài 6.5 — Quản lý Karaoke
Quản lý phòng, dịch vụ, gọi món và thanh toán hóa đơn; cập nhật trạng thái phòng và tồn kho bằng SQL transaction. Dữ liệu được lưu trong `KaraokeDB`.

## IV. ẢNH CHỤP MÀN HÌNH ỨNG DỤNG
> Ảnh được chụp trực tiếp từ giao diện WinForms chạy thật, không sử dụng ảnh tạo bằng AI. Mỗi bài gồm đúng 3 loại ảnh theo yêu cầu.

### Bài 6.3 — Quản lý công việc
1. **Màn hình chính**  
   ![Bài 6.3 - Màn hình chính](images/Bai6.3/01_main_screen.jpg)
2. **Quản lý dữ liệu (CRUD)**  
   ![Bài 6.3 - CRUD](images/Bai6.3/02_crud_screen.jpg)
3. **Nghiệp vụ công việc**  
   ![Bài 6.3 - Nghiệp vụ](images/Bai6.3/03_transaction_screen.jpg)

### Bài 6.4 — Quản lý Garage
1. **Màn hình chính**  
   ![Bài 6.4 - Màn hình chính](images/Bai6.4/01_main_screen.jpg)
2. **Quản lý dữ liệu (CRUD)**  
   ![Bài 6.4 - CRUD](images/Bai6.4/02_crud_screen.jpg)
3. **Nghiệp vụ sửa chữa và thanh toán**  
   ![Bài 6.4 - Nghiệp vụ](images/Bai6.4/03_transaction_screen.jpg)

### Bài 6.5 — Quản lý Karaoke
1. **Màn hình chính**  
   ![Bài 6.5 - Màn hình chính](images/Bai6.5/01_main_screen.jpg)
2. **Quản lý dữ liệu (CRUD)**  
   ![Bài 6.5 - CRUD](images/Bai6.5/02_crud_screen.jpg)
3. **Nghiệp vụ gọi dịch vụ và thanh toán**  
   ![Bài 6.5 - Nghiệp vụ](images/Bai6.5/03_transaction_screen.jpg)

## V. CẤU TRÚC REPOSITORY
```text
LTNET-10-11-2026_24810320237_LeQuangHung/
├── .gitignore
├── README.md
├── Database/                  # Script tạo CSDL và dữ liệu mẫu
├── images/                    # 03 ảnh chụp màn hình cho mỗi bài
└── src/
    ├── LTNET-10-11-2026_24810320237_LeQuangHung.sln
    ├── ProjectTasks/
    ├── GarageManager/
    └── KaraokeManager/
```
`.gitignore` loại trừ `.vs/`, `bin/`, `obj/` và các file người dùng Visual Studio.

## VI. CÁCH CHẠY
1. Mở SQL Server Management Studio, kết nối `localhost\\SQLEXPRESS` bằng Windows Authentication.
2. Chạy `Database/ProjectTaskDB.sql`, `Database/GarageDB.sql` và `Database/KaraokeDB.sql`.
3. Mở solution trong `src/` bằng Visual Studio.
4. Chọn project tương ứng làm Startup Project và nhấn **F5**.
