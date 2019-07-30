USE [master]
GO
/****** Object:  Database [FnProject3]    Script Date: 25-Aug-18 6:53:02 PM ******/
CREATE DATABASE [FnProject3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FnProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FnProject3.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FnProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FnProject3_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FnProject3] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FnProject3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FnProject3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FnProject3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FnProject3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FnProject3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FnProject3] SET ARITHABORT OFF 
GO
ALTER DATABASE [FnProject3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FnProject3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FnProject3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FnProject3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FnProject3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FnProject3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FnProject3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FnProject3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FnProject3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FnProject3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FnProject3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FnProject3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FnProject3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FnProject3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FnProject3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FnProject3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FnProject3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FnProject3] SET RECOVERY FULL 
GO
ALTER DATABASE [FnProject3] SET  MULTI_USER 
GO
ALTER DATABASE [FnProject3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FnProject3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FnProject3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FnProject3] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FnProject3] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FnProject3]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 25-Aug-18 6:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[accountID] [int] IDENTITY(1,1) NOT NULL,
	[account] [nvarchar](50) NOT NULL,
	[password] [varchar](20) NULL,
	[role] [varchar](50) NULL,
	[staffName] [nvarchar](50) NULL,
	[phone] [char](20) NULL,
	[status] [varchar](20) NOT NULL CONSTRAINT [DF_Account_status]  DEFAULT ('active'),
 CONSTRAINT [PK_UserName] PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 25-Aug-18 6:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[commentID] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](1000) NULL,
	[date] [datetime] NULL,
	[studentID] [nvarchar](50) NOT NULL,
	[accountID] [int] NULL,
	[fileName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rank]    Script Date: 25-Aug-18 6:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rank](
	[rankName] [nvarchar](30) NULL,
	[studentID] [nvarchar](50) NOT NULL,
	[semesterID] [nvarchar](50) NULL,
	[status] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rate]    Script Date: 25-Aug-18 6:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate](
	[id] [int] NOT NULL CONSTRAINT [DF_Rate_id]  DEFAULT ((1)),
	[markRate] [int] NOT NULL,
	[behRate] [int] NOT NULL,
	[failCout] [int] NOT NULL,
	[attentRate] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 25-Aug-18 6:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[studentID] [nvarchar](50) NOT NULL,
	[accountID] [int] NULL,
	[takecareStatus] [bit] NULL CONSTRAINT [DF_Student_takecareStatus]  DEFAULT ((0)),
	[studentName] [nvarchar](50) NULL,
	[caution] [bit] NULL CONSTRAINT [DF_Student_caution]  DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[studentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongKeComment]    Script Date: 25-Aug-18 6:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongKeComment](
	[commentID] [int] NOT NULL,
	[content] [nvarchar](1000) NULL,
	[date] [datetime] NULL,
	[studentID] [nvarchar](50) NULL,
	[commentypeID] [int] NULL,
	[accountID] [int] NULL,
	[action] [nvarchar](50) NULL,
	[fileName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountID], [account], [password], [role], [staffName], [phone], [status]) VALUES (1, N'tulase04241@fpt.edu.vn', NULL, N'Admin', N'Anh Tú', NULL, N'active')
INSERT [dbo].[Account] ([accountID], [account], [password], [role], [staffName], [phone], [status]) VALUES (2, N'leanhtu257tn@gmail.com', NULL, N'CareStaff', N'Anh Tú', NULL, N'active')
INSERT [dbo].[Account] ([accountID], [account], [password], [role], [staffName], [phone], [status]) VALUES (3, N'piglets1995tn1@gmail.com', NULL, N'CareStaff', N'Hoàng', NULL, N'active')
INSERT [dbo].[Account] ([accountID], [account], [password], [role], [staffName], [phone], [status]) VALUES (4, N'piglets1995tn@gmail.com', NULL, N'HeadStaff', NULL, NULL, N'active')
INSERT [dbo].[Account] ([accountID], [account], [password], [role], [staffName], [phone], [status]) VALUES (5, N'Admin', N'456', N'Admin', NULL, NULL, N'active')
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[Rate] ([id], [markRate], [behRate], [failCout], [attentRate]) VALUES (1, 80, 10, 5, 5)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE02372', NULL, 0, N'Vũ Khánh Tùng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03287', NULL, 0, N'Nguyễn Đoàn Khuê', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03307', NULL, 0, N'Nguyễn Tùng Lâm', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03372', NULL, 0, N'Trần Đăng Khoa', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03468', NULL, 0, N'Trần Trung Hiếu', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03485', NULL, 0, N'Nguyễn Công Anh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03536', NULL, 0, N'Nguyễn Hải Yến', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03537', NULL, 0, N'Trần Văn Hùng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03546', NULL, 0, N'Đinh Văn Lực', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03554', NULL, 0, N'Trần Anh Tuấn', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03555', NULL, 0, N'Phan Lâm', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03561', NULL, 0, N'Nguyễn Hữu Hiệp', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03568', NULL, 0, N'Trần Xuân Thưởng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03583', NULL, 0, N'Nguyễn Phan Anh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03586', NULL, 0, N'Nguyễn Thế Linh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03588', NULL, 0, N'Nguyễn Đức Tùng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03602', NULL, 0, N'Trần Công Thắng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03608', NULL, 0, N'Nguyễn Hoàng Trung', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03647', NULL, 0, N'Nguyễn Đức Hùng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03653', NULL, 0, N'Nguyễn Đức Nhật', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03655', NULL, 0, N'Phạm Tuấn Dũng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03656', NULL, 0, N'Trần Việt Hoàng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03660', NULL, 0, N'Nguyễn Văn Tín', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03661', NULL, 0, N'Hoàng Trung Kiên', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03663', NULL, 0, N'Thân Văn Cường', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03667', NULL, 0, N'Trần Đăng Quân', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03674', NULL, 0, N'Văn Ngọc Ánh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03679', NULL, 0, N'Ngô Tuấn Anh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03695', NULL, 0, N'Nguyễn Trường Giang', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03698', NULL, 0, N'Phạm Viết Hải', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03716', NULL, 0, N'Hoàng Trần Nhật Dương', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03730', NULL, 0, N'Hoàng Đăng Tuân', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03731', NULL, 0, N'Đặng Hoàng Hiệp', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03733', NULL, 0, N'Trần Hồng Quân', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03734', NULL, 0, N'Nguyễn Thành Đạt', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03750', NULL, 0, N'Nguyễn Ngọc Thanh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03751', NULL, 0, N'Vũ Huy Trung', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03758', NULL, 0, N'Vũ Minh Ánh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03759', NULL, 0, N'Nguyễn Việt Anh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03772', NULL, 0, N'Nguyễn Ngọc Hải', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03792', NULL, 0, N'Nguyễn Huy Quang', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03815', NULL, 0, N'Trần Văn Trường', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03823', NULL, 0, N'Nguyễn Ngọc Tuấn Anh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03828', NULL, 0, N'Phạm Trọng Thành', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03835', NULL, 0, N'Hồ Hồng Sơn', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03851', NULL, 0, N'Nguyễn Thị Thùy Dung', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03858', NULL, 0, N'Nguyễn Văn Bảo', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03865', NULL, 0, N'Tống Đức An', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03907', NULL, 0, N'Phan Bảo Sơn', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03914', NULL, 0, N'Đoàn Văn Mừng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03924', NULL, 0, N'Nguyễn Thanh Tùng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03926', NULL, 0, N'Hoàng Tuấn Thái', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03927', NULL, 0, N'Nguyễn Văn Vinh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03929', NULL, 0, N'Lê Duy Công', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03934', NULL, 0, N'Nguyễn Thị Hạnh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03942', NULL, 0, N'Đỗ Tuấn Anh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03947', NULL, 0, N'Phạm Minh Tiến', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03978', NULL, 0, N'Đặng Văn Cương', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03980', NULL, 0, N'Trần Mạnh Tiến', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03982', NULL, 0, N'Lê Văn Huy', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03983', NULL, 0, N'Nguyễn Công Long', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03985', NULL, 0, N'Nguyễn Gia Huy', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03989', NULL, 0, N'Nguyễn Thị Kim Dung', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03990', NULL, 0, N'Dương Tuấn Nhật', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03992', NULL, 0, N'Phạm Minh Thúy', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03994', NULL, 0, N'Phan Anh Tú', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03995', NULL, 0, N'Nguyễn Xuân Hoàng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03996', NULL, 0, N'Nguyễn Hồng Sơn', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03997', NULL, 0, N'Nguyễn Hoàng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE03999', NULL, 0, N'Lã Xuân Khánh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04002', NULL, 0, N'Đào Mạnh Tuấn', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04005', NULL, 0, N'Nguyễn Chí Thành', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04009', NULL, 0, N'Nguyễn Văn Tú', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04010', NULL, 0, N'Hoàng Đức Hùng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04012', NULL, 0, N'Mai Gia Tú', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04013', NULL, 0, N'Nguyễn Hải Vũ', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04017', NULL, 0, N'Nguyễn Văn Dũng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04018', NULL, 0, N'Nguyễn Hoài Nam', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04019', NULL, 0, N'Đồng Sơn Tùng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04020', NULL, 0, N'Dương Văn Tú', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04023', NULL, 0, N'Nguyễn Văn Hưng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04027', NULL, 0, N'Nguyễn Hồng Ngọc', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04028', NULL, 0, N'Nguyễn Đăng Khôi', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04029', NULL, 0, N'Bùi Quang Hưng Ngọc', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04030', NULL, 0, N'Nguyễn Hữu Quỳnh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04036', NULL, 0, N'Nguyễn Quốc Đạt', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04038', NULL, 0, N'Nguyễn Văn Sơn', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04039', NULL, 0, N'Nguyễn Đình Long', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04047', NULL, 0, N'Nguyễn Văn Cường', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04052', NULL, 0, N'Bùi Thị Minh Ngọc', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04053', NULL, 0, N'Nguyễn Việt Hùng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04056', NULL, 0, N'Lâm Ngọc Khánh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04060', NULL, 0, N'Nguyễn Văn Vượng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04063', NULL, 0, N'Trần Hữu Tú', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04064', NULL, 0, N'Đặng Hòa Hảo', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04066', NULL, 0, N'Nguyễn Anh Dũng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04069', NULL, 0, N'Nguyễn Thị Mai Lan', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04070', NULL, 0, N'Nguyễn Văn Đạt', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04073', NULL, 0, N'Phạm Bảo Anh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04081', NULL, 0, N'Hoàng Văn Minh', 1)
GO
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04084', NULL, 0, N'Nguyễn Tuấn Tùng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04086', NULL, 0, N'Lê Tuấn Đạt', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04088', NULL, 0, N'Vương Viết Hoàng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04094', NULL, 0, N'Vũ Ngọc Thạch', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04101', NULL, 0, N'Tiêu Quang Thắng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04102', NULL, 0, N'Phạm Nguyễn Hoàng Dũng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04106', NULL, 0, N'Phạm Trọng Vinh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04107', NULL, 0, N'Hoàng Sơn', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04108', NULL, 0, N'Nguyễn Quốc Đạt', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04110', NULL, 0, N'Giáp Thị Hồng Nhung', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04113', NULL, 0, N'Vũ Sỹ Tùng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04114', NULL, 0, N'Bùi Đức Trung', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04115', NULL, 0, N'Bùi Tiến Đạt', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04118', NULL, 0, N'Trần Anh Tuấn', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04120', NULL, 0, N'Nguyễn Thanh Tùng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04121', NULL, 0, N'Vũ Hải Đăng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04122', NULL, 0, N'Nguyễn Thị Lan Anh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04126', NULL, 0, N'Phạm Hữu Hậu', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04131', NULL, 0, N'Phùng Khắc Thành', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04132', NULL, 0, N'Lại Thành Hưng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04133', NULL, 0, N'Đỗ Thị Thu Quỳnh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04137', NULL, 0, N'Hoàng Phi Hùng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04138', NULL, 0, N'Tô Tiến Lực', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04142', NULL, 0, N'Tạ Đình Chiến', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04143', NULL, 0, N'Nguyễn Hoàng Long', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04146', NULL, 0, N'Nguyễn Vũ Hiệp', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04148', NULL, 0, N'Trần Hoàng Giang', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04150', NULL, 0, N'Nguyễn Khắc Kiên', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04154', NULL, 0, N'Dương Việt Anh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04158', NULL, 0, N'Len Văn Hậu', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04167', NULL, 0, N'Nguyễn Hữu Tiến', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04171', NULL, 0, N'Hoàng Anh Lâm', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04173', NULL, 0, N'Trần Mạnh Thắng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04178', NULL, 0, N'Đỗ Ngọc Thịnh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04180', NULL, 0, N'Trần Nguyên Khoa', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04181', NULL, 0, N'Huỳnh Phương Hà', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04182', NULL, 0, N'Nguyễn Lê Quang Huy', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04184', NULL, 0, N'Lê Quang Tây', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04185', NULL, 0, N'Ngô Ngọc Lâm', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04186', NULL, 0, N'Ngô Hoàng Lan', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04187', NULL, 0, N'Dương Nguyên Thảo Châu', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04192', NULL, 0, N'Nguyễn Đức Duy', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04193', NULL, 0, N'Nguyễn Đức Kiên', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04196', NULL, 0, N'Nguyễn Minh Phương', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04200', NULL, 0, N'Phùng Tuấn Thanh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04208', NULL, 0, N'Phan Xuân Phát', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04210', NULL, 0, N'Bùi Hoàng Kỳ', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04212', NULL, 0, N'Phạm Tiến Dũng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04213', NULL, 0, N'Phí Thị Trinh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04220', NULL, 0, N'Cấn Xuân Quang', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04221', NULL, 0, N'Nguyễn Viết Bách', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04222', NULL, 0, N'Phùng Thanh Bình', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04223', NULL, 0, N'Trần Nguyên Sơn', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04225', NULL, 0, N'Tăng Minh Hiếu', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04230', NULL, 0, N'Lê Hoàng Dũng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04237', NULL, 0, N'Dương Đức Dân', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04238', NULL, 0, N'Nguyễn Trung Hiếu', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04240', NULL, 0, N'Lê Thị Quỳnh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04241', NULL, 0, N'Lê Anh Tú', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04244', NULL, 0, N'Đinh Duy Mạnh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04255', NULL, 0, N'Lê Minh Hạnh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04256', NULL, 0, N'Trần Thọ Sâm', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04261', NULL, 0, N'Nguyễn Đình Công', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04265', NULL, 0, N'Đỗ Văn Quyết', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04266', NULL, 0, N'Bùi Hoàng Nam', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04270', NULL, 0, N'Nguyễn Chí Nghĩa', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04273', NULL, 0, N'Nguyễn Mạnh Cường', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04276', NULL, 0, N'Vũ Hoàng Sơn', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04277', NULL, 0, N'Lê Thế Anh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04279', NULL, 0, N'Nguyễn Hữu Hoàng Trung', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04280', NULL, 0, N'Nguyễn Xuân Khánh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04281', NULL, 0, N'Hoàng Phan Trung', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04291', NULL, 0, N'Nguyễn Hữu Trung', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04295', NULL, 0, N'Âu Văn Thịnh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04298', NULL, 0, N'Ấu Khương Duy', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04300', NULL, 0, N'Nguyễn Khắc Hoàng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04303', NULL, 0, N'Nguyễn Lê Hoàng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04307', NULL, 0, N'Lương Trường Giang', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04311', NULL, 0, N'Nguyễn Thị Thảo', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04312', NULL, 0, N'Nguyễn Văn Du', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04316', NULL, 0, N'Nguyễn Anh Quân', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04318', NULL, 0, N'Nguyễn Xuân Phú', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04319', NULL, 0, N'Nguyễn Minh Hiếu', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04322', NULL, 0, N'Nguyễn Minh Thắng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04335', NULL, 0, N'Ngô Ngọc Tuyên', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04336', NULL, 0, N'Lê Quang Minh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04338', NULL, 0, N'Đinh Công Hiếu', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04341', NULL, 0, N'Đào Thị Phương Thảo', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04347', NULL, 0, N'Tạ Minh Quân', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04355', NULL, 0, N'Nguyễn Quốc Dũng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04360', NULL, 0, N'Đàm Văn Nam', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04362', NULL, 0, N'Nguyễn Xuân Trường', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04366', NULL, 0, N'Nguyễn Thị Hải Yến', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04380', NULL, 0, N'Bùi Việt Anh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04385', NULL, 0, N'Ngụy Văn Thắng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04386', NULL, 0, N'Triệu Nam Hải', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04387', NULL, 0, N'Nguyễn Nam Anh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04388', NULL, 0, N'Nguyễn Văn Hiến', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04389', NULL, 0, N'Đỗ Bình Thuận', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04392', NULL, 0, N'Vũ Thị Phương', 1)
GO
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04394', NULL, 0, N'Hoàng Đức Mạnh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04400', NULL, 0, N'Trịnh Minh Hùng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04402', NULL, 0, N'Trần Minh Quang', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04405', NULL, 0, N'Lê Nguyên Linh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04406', NULL, 0, N'Vũ Quang Dũng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04407', NULL, 0, N'Nguyễn Ngọc Trung', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04409', NULL, 0, N'Phạm Đình Mai', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04411', NULL, 0, N'Nguyễn Thị Hải Yến', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04414', NULL, 0, N'Phan Nguyên Bảo', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04416', NULL, 0, N'Đặng Nguyễn Phương Trang', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04420', NULL, 0, N'Đỗ Văn Đức', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04421', NULL, 0, N'Uông Đông Hưng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04433', NULL, 0, N'Đỗ Duy Tân', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04441', NULL, 0, N'Nguyễn Đại Thắng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04444', NULL, 0, N'Đặng Phúc Nghĩa', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04447', NULL, 0, N'Vũ Việt Anh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04454', NULL, 0, N'Trương Nhật Lệ', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04467', NULL, 0, N'Hoàng Trọng Hà', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04469', NULL, 0, N'Nguyễn Đình Dũng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04476', NULL, 0, N'Trần Thái Long', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04479', NULL, 0, N'Phan Thị Tú Uyên', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE04486', NULL, 0, N'Nguyễn Thị Dinh', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE05164', NULL, 0, N'Nguyễn Thị Mỹ Duyên', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE61502', NULL, 0, N'Mai Phi Thắng', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE61565', NULL, 0, N'Lê Hoàng Nam', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE61635', NULL, 0, N'Trần Nhật Tân', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE61924', NULL, 0, N'Hồ Trọng Đức', 1)
INSERT [dbo].[Student] ([studentID], [accountID], [takecareStatus], [studentName], [caution]) VALUES (N'SE62120', NULL, 0, N'Ngô Thúc Đạt', 1)
ALTER TABLE [dbo].[Rank] ADD  CONSTRAINT [DF_Rank_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([studentID])
REFERENCES [dbo].[Student] ([studentID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_UserName] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_UserName]
GO
ALTER TABLE [dbo].[Rank]  WITH CHECK ADD FOREIGN KEY([studentID])
REFERENCES [dbo].[Student] ([studentID])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_UserName] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_UserName]
GO
USE [master]
GO
ALTER DATABASE [FnProject3] SET  READ_WRITE 
GO
