IF DB_ID(N'ProjectTaskDB') IS NULL CREATE DATABASE ProjectTaskDB;
GO
USE ProjectTaskDB;
GO
IF OBJECT_ID(N'dbo.DuAn',N'U') IS NULL CREATE TABLE dbo.DuAn(MaDuAn INT IDENTITY(1,1) PRIMARY KEY,TenDuAn NVARCHAR(150) NOT NULL,NgayBatDau DATETIME NULL,NgayKetThuc DATETIME NULL,TrangThai NVARCHAR(50) NOT NULL CONSTRAINT DF_DuAn_TrangThai DEFAULT N'Đang chạy');
IF OBJECT_ID(N'dbo.ThanhVien',N'U') IS NULL CREATE TABLE dbo.ThanhVien(MaThanhVien INT IDENTITY(1,1) PRIMARY KEY,HoTen NVARCHAR(100) NOT NULL,Email VARCHAR(100) NOT NULL UNIQUE,ChuyenMon NVARCHAR(100) NULL);
IF OBJECT_ID(N'dbo.CongViec',N'U') IS NULL CREATE TABLE dbo.CongViec(MaTask INT IDENTITY(1,1) PRIMARY KEY,MaDuAn INT NOT NULL REFERENCES dbo.DuAn(MaDuAn),TenTask NVARCHAR(200) NOT NULL,MoTa NVARCHAR(MAX) NULL,HanNop DATETIME NULL,DoUuTien NVARCHAR(20) NOT NULL CONSTRAINT DF_Task_Priority DEFAULT N'Trung bình',TrangThai NVARCHAR(50) NOT NULL CONSTRAINT DF_Task_Status DEFAULT N'To Do');
IF OBJECT_ID(N'dbo.PhanCong',N'U') IS NULL CREATE TABLE dbo.PhanCong(MaTask INT NOT NULL REFERENCES dbo.CongViec(MaTask) ON DELETE CASCADE,MaThanhVien INT NOT NULL REFERENCES dbo.ThanhVien(MaThanhVien),NgayGiao DATETIME NOT NULL CONSTRAINT DF_PhanCong_Ngay DEFAULT GETDATE(),CONSTRAINT PK_PhanCong PRIMARY KEY(MaTask,MaThanhVien));
IF NOT EXISTS(SELECT 1 FROM dbo.DuAn) INSERT dbo.DuAn(TenDuAn,NgayBatDau,NgayKetThuc,TrangThai) VALUES(N'Ứng dụng quản lý thư viện',DATEADD(day,-14,GETDATE()),DATEADD(day,30,GETDATE()),N'Đang chạy'),(N'Cổng thông tin sinh viên',DATEADD(day,-7,GETDATE()),DATEADD(day,45,GETDATE()),N'Đang chạy');
IF NOT EXISTS(SELECT 1 FROM dbo.ThanhVien) INSERT dbo.ThanhVien(HoTen,Email,ChuyenMon) VALUES(N'Lê Quang Hưng','hunglq@example.com',N'Phân tích hệ thống'),(N'Nguyễn Minh Anh','minhanh@example.com',N'Phát triển giao diện'),(N'Trần Quốc Bảo','quocbao@example.com',N'Cơ sở dữ liệu');
IF NOT EXISTS(SELECT 1 FROM dbo.CongViec) BEGIN
 DECLARE @p INT=(SELECT TOP 1 MaDuAn FROM dbo.DuAn ORDER BY MaDuAn);
 INSERT dbo.CongViec(MaDuAn,TenTask,MoTa,HanNop,DoUuTien,TrangThai) VALUES(@p,N'Phân tích yêu cầu',N'Tổng hợp yêu cầu người dùng',DATEADD(day,-2,GETDATE()),N'Cao',N'Done'),(@p,N'Thiết kế giao diện',N'Tạo wireframe các màn hình',DATEADD(day,4,GETDATE()),N'Trung bình',N'In Progress'),(@p,N'Xây dựng cơ sở dữ liệu',N'Tạo bảng và dữ liệu mẫu',DATEADD(day,7,GETDATE()),N'Cao',N'To Do');
 INSERT dbo.PhanCong(MaTask,MaThanhVien) SELECT t.MaTask,m.MaThanhVien FROM dbo.CongViec t CROSS JOIN dbo.ThanhVien m WHERE t.TenTask IN(N'Phân tích yêu cầu',N'Thiết kế giao diện') AND m.Email IN('hunglq@example.com','minhanh@example.com') AND NOT EXISTS(SELECT 1 FROM dbo.PhanCong p WHERE p.MaTask=t.MaTask AND p.MaThanhVien=m.MaThanhVien);
END;
GO