USE [master]
GO
/****** Object:  Database [FnProject3]    Script Date: 04-Sep-18 1:08:49 PM ******/
CREATE DATABASE [FnProject3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FnProject3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FnProject3.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FnProject3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FnProject3_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [FnProject3] SET AUTO_CLOSE ON 
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
ALTER DATABASE [FnProject3] SET RECOVERY SIMPLE 
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
/****** Object:  Table [dbo].[Account]    Script Date: 04-Sep-18 1:08:49 PM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 04-Sep-18 1:08:50 PM ******/
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
/****** Object:  Table [dbo].[Rank]    Script Date: 04-Sep-18 1:08:50 PM ******/
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
/****** Object:  Table [dbo].[Rate]    Script Date: 04-Sep-18 1:08:50 PM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 04-Sep-18 1:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[studentID] [nvarchar](50) NOT NULL,
	[accountID] [int] NULL,
	[takecareStatus] [bit] NULL,
	[studentName] [nvarchar](50) NULL,
	[caution] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[studentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongKeComment]    Script Date: 04-Sep-18 1:08:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongKeComment](
	[commentID] [int] NULL,
	[content] [nvarchar](1000) NULL,
	[studentID] [nvarchar](50) NULL,
	[date] [datetime] NULL,
	[fileName] [nvarchar](50) NULL,
	[accountID] [int] NULL,
	[action] [nvarchar](50) NULL,
	[rankName] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountID], [account], [password], [role], [staffName], [phone], [status]) VALUES (1, N'tulase04241@fpt.edu.vn', NULL, N'Admin', N'Anh Tú', NULL, N'active')
INSERT [dbo].[Account] ([accountID], [account], [password], [role], [staffName], [phone], [status]) VALUES (5, N'Admin', N'456', N'Admin', NULL, NULL, N'active')
INSERT [dbo].[Account] ([accountID], [account], [password], [role], [staffName], [phone], [status]) VALUES (8, N'datbtse04115@fpt.edu.vn', NULL, N'CareStaff', N'Tiến Đạt', N'0947740258          ', N'active')
INSERT [dbo].[Account] ([accountID], [account], [password], [role], [staffName], [phone], [status]) VALUES (9, N'hainmse03832@fpt.edu.vn', NULL, N'CareStaff', N'Minh Hải', N'01662811807         ', N'active')
INSERT [dbo].[Account] ([accountID], [account], [password], [role], [staffName], [phone], [status]) VALUES (10, N'hieuntse04238@fpt.edu.vn', NULL, N'HeadStaff', N'Trung Hiếu', N'01692724906         ', N'active')
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[Rate] ([id], [markRate], [behRate], [failCout], [attentRate]) VALUES (1, 80, 10, 5, 5)
ALTER TABLE [dbo].[Rank] ADD  CONSTRAINT [DF_Rank_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_takecareStatus]  DEFAULT ((0)) FOR [takecareStatus]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_caution]  DEFAULT ((1)) FOR [caution]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([studentID])
REFERENCES [dbo].[Student] ([studentID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([studentID])
REFERENCES [dbo].[Student] ([studentID])
GO
ALTER TABLE [dbo].[Rank]  WITH CHECK ADD FOREIGN KEY([studentID])
REFERENCES [dbo].[Student] ([studentID])
GO
ALTER TABLE [dbo].[Rank]  WITH CHECK ADD FOREIGN KEY([studentID])
REFERENCES [dbo].[Student] ([studentID])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Account]
GO
USE [master]
GO
ALTER DATABASE [FnProject3] SET  READ_WRITE 
GO
