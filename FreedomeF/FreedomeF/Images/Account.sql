USE [FnProject3]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountID], [account], [password], [role], [staffName], [phone], [status]) VALUES (1, N'tulase04241@fpt.edu.vn', NULL, N'Admin', N'Anh Tú', NULL, N'active')
INSERT [dbo].[Account] ([accountID], [account], [password], [role], [staffName], [phone], [status]) VALUES (2, N'leanhtu257tn@gmail.com', NULL, N'CareStaff', N'Anh Tú', NULL, N'active')
INSERT [dbo].[Account] ([accountID], [account], [password], [role], [staffName], [phone], [status]) VALUES (3, N'piglets1995tn1@gmail.com', NULL, N'CareStaff', N'Hoàng', NULL, N'active')
INSERT [dbo].[Account] ([accountID], [account], [password], [role], [staffName], [phone], [status]) VALUES (4, N'piglets1995tn@gmail.com', NULL, N'HeadStaff', NULL, NULL, N'active')
INSERT [dbo].[Account] ([accountID], [account], [password], [role], [staffName], [phone], [status]) VALUES (5, N'Admin', N'123', N'Admin', NULL, NULL, N'active')
SET IDENTITY_INSERT [dbo].[Account] OFF
