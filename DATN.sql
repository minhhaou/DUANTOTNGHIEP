USE [master]
GO
/****** Object:  Database [course_online_2]    Script Date: 7/27/2023 8:31:07 AM ******/
CREATE DATABASE [course_online_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'course_online_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\course_online_2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'course_online_2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\course_online_2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [course_online_2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [course_online_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [course_online_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [course_online_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [course_online_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [course_online_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [course_online_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [course_online_2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [course_online_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [course_online_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [course_online_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [course_online_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [course_online_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [course_online_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [course_online_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [course_online_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [course_online_2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [course_online_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [course_online_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [course_online_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [course_online_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [course_online_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [course_online_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [course_online_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [course_online_2] SET RECOVERY FULL 
GO
ALTER DATABASE [course_online_2] SET  MULTI_USER 
GO
ALTER DATABASE [course_online_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [course_online_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [course_online_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [course_online_2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [course_online_2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [course_online_2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'course_online_2', N'ON'
GO
ALTER DATABASE [course_online_2] SET QUERY_STORE = OFF
GO
USE [course_online_2]
GO
/****** Object:  Table [dbo].[cau_hoi]    Script Date: 7/27/2023 8:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cau_hoi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_khoa_hoc] [int] NULL,
	[ngay_tao] [date] NULL,
	[cau_hoi] [nvarchar](max) NULL,
	[cau_tra_loi] [nvarchar](max) NULL,
	[dap_an] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chung_chi]    Script Date: 7/27/2023 8:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chung_chi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_nguoi_dung] [int] NULL,
	[id_khoa_hoc] [int] NULL,
	[bang_loai] [nvarchar](100) NULL,
	[ngay_cap] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dang_ky_khoa_hoc]    Script Date: 7/27/2023 8:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dang_ky_khoa_hoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_nguoi_dung] [int] NULL,
	[id_khoa_hoc] [int] NULL,
	[ngay_dang_ky] [date] NULL,
	[tien_do] [int] NULL,
	[trang_thai] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[danh_gia]    Script Date: 7/27/2023 8:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danh_gia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_khoa_hoc] [int] NULL,
	[id_nguoi_dung] [int] NULL,
	[noi_dung] [nvarchar](max) NULL,
	[so_diem_danh_gia] [int] NULL,
	[ngay_tao] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dien_dan]    Script Date: 7/27/2023 8:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dien_dan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_khoa_hoc] [int] NULL,
	[tieu_de] [nvarchar](100) NULL,
	[noi_dung] [nvarchar](max) NULL,
	[nguoi_dang] [nvarchar](100) NULL,
	[ngay_dang] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[duyet_khoa_hoc]    Script Date: 7/27/2023 8:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[duyet_khoa_hoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_khoa_hoc] [int] NULL,
	[id_nguoi_duyet] [int] NULL,
	[trang_thai] [nvarchar](50) NOT NULL,
	[ngay_duyet] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khoa_hoc]    Script Date: 7/27/2023 8:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khoa_hoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_khoa_hoc] [nvarchar](100) NOT NULL,
	[mo_ta] [nvarchar](max) NULL,
	[ngay_tao] [date] NULL,
	[nguoi_tao] [int] NULL,
	[chi_phi] [decimal](10, 2) NULL,
	[duyet] [bit] NULL,
	[trang_thai] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loai_khoa_hoc]    Script Date: 7/27/2023 8:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai_khoa_hoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IDKhoaHoc] [int] NULL,
	[ten_loai_khoa_hoc] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nguoi_dung]    Script Date: 7/27/2023 8:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoi_dung](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tai_khoan] [nvarchar](50) NOT NULL,
	[mat_khau] [nvarchar](100) NOT NULL,
	[ho_ten] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[so_dien_thoai] [nvarchar](15) NOT NULL,
	[chuc_vu] [nvarchar](50) NULL,
	[trang_thai] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tai_lieu_khoa_hoc]    Script Date: 7/27/2023 8:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tai_lieu_khoa_hoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_khoa_hoc] [int] NULL,
	[ten_slide] [nvarchar](100) NULL,
	[thu_tu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[video_khoa_hoc]    Script Date: 7/27/2023 8:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[video_khoa_hoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_khoa_hoc] [int] NULL,
	[link_video] [nvarchar](max) NULL,
	[thu_tu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[cau_hoi]  WITH CHECK ADD  CONSTRAINT [FK_cau_hoi_khoa_hoc] FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
GO
ALTER TABLE [dbo].[cau_hoi] CHECK CONSTRAINT [FK_cau_hoi_khoa_hoc]
GO
ALTER TABLE [dbo].[chung_chi]  WITH CHECK ADD FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[chung_chi]  WITH CHECK ADD FOREIGN KEY([id_nguoi_dung])
REFERENCES [dbo].[nguoi_dung] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dang_ky_khoa_hoc]  WITH CHECK ADD FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dang_ky_khoa_hoc]  WITH CHECK ADD FOREIGN KEY([id_nguoi_dung])
REFERENCES [dbo].[nguoi_dung] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[danh_gia]  WITH CHECK ADD FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[danh_gia]  WITH CHECK ADD FOREIGN KEY([id_nguoi_dung])
REFERENCES [dbo].[nguoi_dung] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dien_dan]  WITH CHECK ADD FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[duyet_khoa_hoc]  WITH CHECK ADD FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[duyet_khoa_hoc]  WITH CHECK ADD FOREIGN KEY([id_nguoi_duyet])
REFERENCES [dbo].[nguoi_dung] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[khoa_hoc]  WITH CHECK ADD FOREIGN KEY([nguoi_tao])
REFERENCES [dbo].[nguoi_dung] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[loai_khoa_hoc]  WITH CHECK ADD FOREIGN KEY([IDKhoaHoc])
REFERENCES [dbo].[khoa_hoc] ([id])
GO
ALTER TABLE [dbo].[tai_lieu_khoa_hoc]  WITH CHECK ADD FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[video_khoa_hoc]  WITH CHECK ADD FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [course_online_2] SET  READ_WRITE 
GO
