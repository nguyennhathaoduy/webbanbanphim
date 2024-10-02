USE [master]
GO
CREATE DATABASE [KeyboardShop]
GO
USE [KeyboardShop]
GO
ALTER DATABASE [KeyboardShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KeyboardShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KeyboardShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KeyboardShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KeyboardShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KeyboardShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KeyboardShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [KeyboardShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KeyboardShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KeyboardShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KeyboardShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KeyboardShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KeyboardShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KeyboardShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KeyboardShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KeyboardShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KeyboardShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KeyboardShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KeyboardShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KeyboardShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KeyboardShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KeyboardShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KeyboardShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KeyboardShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KeyboardShop] SET RECOVERY FULL 
GO
ALTER DATABASE [KeyboardShop] SET  MULTI_USER 
GO
ALTER DATABASE [KeyboardShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KeyboardShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KeyboardShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KeyboardShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KeyboardShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'KeyboardShop', N'ON'
GO
ALTER DATABASE [KeyboardShop] SET QUERY_STORE = OFF
GO
USE [KeyboardShop]
GO
/************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[app_role](
	[role_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](100) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[password] [varchar](4000) NOT NULL,
	[phone] [varchar](20) NULL,
	[register_date] [date] NULL,
	[image] [varchar](200) NULL,
	[address] [nvarchar](1000) NOT NULL,
	[status] [bit] NOT NULL,
	[gender] [bit] NULL,
	[admin] [bit] NULL,
 CONSTRAINT [PK__customer__CD65CB851ADF9E73] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetails](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[unit_price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[amount] [float] NOT NULL,
	[customer_id] [int] NOT NULL,
	[order_date] [date] NULL,
	[status] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[desciption] [nvarchar](4000) NOT NULL,
	[discount] [float] NOT NULL,
	[entered_date] [date] NULL,
	[image] [varchar](200) NULL,
	[name] [nvarchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [smallint] NOT NULL,
	[unit_price] [float] NOT NULL,
 CONSTRAINT [PK__products__47027DF55DF14F77] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_role](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[role_id] [bigint] NULL,
	[customer_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[app_role] ON 

INSERT [dbo].[app_role] ([role_id], [name]) VALUES (1, N'ROLE_ADMIN')
INSERT [dbo].[app_role] ([role_id], [name]) VALUES (2, N'ROLE_USER')
SET IDENTITY_INSERT [dbo].[app_role] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([category_id], [category_name], [status]) VALUES (1, N'E-DRA', 0)
INSERT [dbo].[categories] ([category_id], [category_name], [status]) VALUES (3, N'Filco', 0)
INSERT [dbo].[categories] ([category_id], [category_name], [status]) VALUES (4, N'Akko', 0)
INSERT [dbo].[categories] ([category_id], [category_name], [status]) VALUES (6, N'Keychron', 0)
INSERT [dbo].[categories] ([category_id], [category_name], [status]) VALUES (69, N'Leopold', 0)
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [register_date], [image], [address], [status], [gender], [admin]) VALUES (1, N'keyboardshop2023@gmail.com', N'Admin', N'$2a$10$cNC/DcvMNbE5Ko02b6kBq.fvC50VB4d6ZvYeDT7wdOiH0JqKHDwe2', N'0987654321', CAST(N'2022-08-13' AS Date), N'img_01.jpg', N'TP HCM', 1, 0, 1)
INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [register_date], [image], [address], [status], [gender], [admin]) VALUES (2, N'duong52000550@gmail.com', N'Phạm Thị Thùy Dương', N'$2a$10$wBpuzTkT4JXx0RE.YlU5NO/LJf1ffpKDkdfznRwUv2No73MHYi.Em', N'0987654321', CAST(N'2022-12-14' AS Date), N'img_02.jpg', N'Đà Nẵng', 1, 0, 0)
INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [register_date], [image], [address], [status], [gender], [admin]) VALUES (3, N'duy52000325@gmail.com', N'Nguyễn Nhã Thảo Duy', N'$2a$10$1b5OzJPFCQr9o7Y25UB5bu.l2mZMpwpzm.jVLFf9wPfhmDpARCjEe', N'0987654321', CAST(N'2022-12-11' AS Date), N'img_03.jpg', N'Tiền Giang', 1, 0, 0)
INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [register_date], [image], [address], [status], [gender], [admin]) VALUES (4, N'nhu52000379@gmail.com', N'Lê Trần Quỳnh Như', N'$2a$10$rzzTetd/zKnjZgPN9RScguSsBI/qVHQTThdf8QFEw82GqJDv5TGK.', N'0987654322', CAST(N'2022-12-14' AS Date), N'img_04.jpg', N'Bạc Liêu', 1, 0, 0)
INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [register_date], [image], [address], [status], [gender], [admin]) VALUES (6, N'suong52000129@gmail.com', N'Nguyễn Thị Diễm Sương', N'$2a$10$5lhlVoV0kUT9f2.Reu6hZe5gvTKnRjkM1qXehZ02DTftO4szHZHAi', N'0987654320', CAST(N'2022-12-14' AS Date), N'img_06.jpg', N'Tiền Giang', 1, 0, 0)
INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [register_date], [image], [address], [status], [gender], [admin]) VALUES (18, N'loi52000776@gmail.com', N'Trương Thành Lợi', N'$2a$10$5e8NtWuVymZ/WX0fs1OYrO0edltiK78uC62tmblP059pvz0adTjEC', N'0987632321', CAST(N'2022-12-11' AS Date), N'img_05.jpg', N'TP HCM', 1, 1, 0)
INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [register_date], [image], [address], [status], [gender], [admin]) VALUES (23, N'th4oduy@gmail.com', N'Lê Thị Thảo', N'$2a$10$MasbF5lQ7cQntW7KT/7vBOXlWJn8LcNjOEV9m349DqR9ZxnyG97pm', N'0983214321', CAST(N'2022-12-13' AS Date), N'img_07.jpg', N'Đồng Nai', 1, 0, 0)
INSERT [dbo].[customers] ([customer_id], [email], [name], [password], [phone], [register_date], [image], [address], [status], [gender], [admin]) VALUES (25, N'duy138p5@gmail.com', N'Nguyễn Thanh Lam', N'$2a$10$nO63n5hx2JfRcT9kCHVSTuMM5qgmn0sRfVFtXwKaRBX./PFm4gE.e', N'0932454321', CAST(N'2022-12-14' AS Date), N'img_08.jpg', N'TP HCM', 1, 1, 0)
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[orderdetails] ON 

INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (9, 8, 21, 4, 1800000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (10, 8, 10, 1, 1080000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (11, 9, 4, 1, 719100)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (12, 9, 21, 1, 1800000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (13, 9, 22, 2, 1500000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (14, 9, 60, 1, 4000000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (15, 10, 35, 1, 550000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (16, 10, 22, 1, 1500000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (17, 10, 9, 1, 675000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (18, 10, 10, 1, 1080000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (19, 11, 20, 1, 2100000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (20, 11, 4, 1, 719100)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (21, 11, 22, 1, 1500000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (22, 11, 9, 1, 675000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (23, 11, 10, 1, 1080000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (24, 12, 4, 1, 719100)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (25, 12, 21, 1, 1800000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (26, 12, 22, 1, 1500000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (27, 13, 10, 4, 1080000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (28, 14, 21, 1, 1800000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (29, 14, 22, 1, 1500000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (30, 15, 9, 1, 675000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (31, 16, 10, 1, 1080000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (32, 17, 21, 1, 1800000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (33, 17, 24, 1, 1250000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (34, 18, 22, 1, 1500000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (35, 18, 10, 2, 1080000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (36, 19, 9, 1, 675000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (37, 19, 10, 1, 1080000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (38, 20, 4, 1, 719100)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (39, 20, 21, 2, 1800000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (40, 28, 4, 1, 719100)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (41, 28, 21, 2, 1800000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (42, 28, 10, 1, 1080000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (43, 29, 4, 1, 719100)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (44, 29, 9, 1, 675000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (45, 29, 10, 1, 1080000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (46, 30, 52, 1, 7600000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (47, 30, 21, 1, 1800000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (48, 30, 9, 1, 675000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (49, 32, 9, 1, 675000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (50, 34, 4, 1, 719100)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (51, 34, 21, 3, 1800000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (52, 34, 22, 1, 1500000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (53, 35, 20, 1, 2100000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (54, 35, 21, 2, 1800000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (55, 35, 53, 3, 1450000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (56, 35, 22, 1, 1500000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (57, 36, 4, 2, 719100)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (58, 37, 20, 1, 2100000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (59, 37, 22, 3, 1500000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (60, 37, 9, 2, 675000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (61, 37, 60, 1, 4000000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (62, 38, 22, 2, 1500000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (63, 38, 9, 4, 675000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (64, 38, 59, 1, 2400000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (65, 39, 49, 1, 3200000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (66, 39, 22, 2, 1500000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (67, 39, 9, 1, 675000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (68, 39, 10, 1, 1080000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (69, 40, 4, 1, 719100)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (70, 40, 22, 3, 1500000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (71, 40, 9, 1, 675000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (72, 41, 20, 1, 2100000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (73, 41, 9, 2, 675000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (74, 41, 10, 1, 1080000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (75, 42, 20, 1, 2100000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (76, 42, 22, 3, 1500000)
INSERT [dbo].[orderdetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (77, 42, 9, 1, 675000)
SET IDENTITY_INSERT [dbo].[orderdetails] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (8, 8280000, 2, CAST(N'2022-06-14' AS Date), 2)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (9, 9519100, 6, CAST(N'2022-06-14' AS Date), 2)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (10, 3805000, 4, CAST(N'2022-06-14' AS Date), 3)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (11, 6074100, 4, CAST(N'2022-06-14' AS Date), 2)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (12, 4019100, 6, CAST(N'2022-06-14' AS Date), 2)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (13, 4320000, 6, CAST(N'2022-06-14' AS Date), 2)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (14, 3300000, 6, CAST(N'2022-06-14' AS Date), 2)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (15, 675000, 6, CAST(N'2022-06-14' AS Date), 3)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (16, 1080000, 6, CAST(N'2022-06-14' AS Date), 2)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (17, 3050000, 6, CAST(N'2022-06-14' AS Date), 3)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (18, 3660000, 6, CAST(N'2022-06-14' AS Date), 3)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (19, 1755000, 2, CAST(N'2022-06-14' AS Date), 3)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (20, 4319100, 2, CAST(N'2022-06-14' AS Date), 2)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (28, 5399100, 2, CAST(N'2022-06-14' AS Date), 1)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (29, 2474100, 6, CAST(N'2022-06-14' AS Date), 0)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (30, 10075000, 2, CAST(N'2022-06-15' AS Date), 2)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (32, 675000, 2, CAST(N'2022-06-15' AS Date), 0)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (34, 7619100, 2, CAST(N'2022-06-15' AS Date), 2)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (35, 11550000, 2, CAST(N'2022-06-15' AS Date), 3)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (36, 10738200, 2, CAST(N'2022-06-15' AS Date), 2)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (37, 11950000, 2, CAST(N'2022-06-15' AS Date), 3)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (38, 8100000, 2, CAST(N'2022-06-15' AS Date), 3)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (39, 7955000, 2, CAST(N'2022-06-15' AS Date), 3)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (40, 5894100, 2, CAST(N'2022-06-15' AS Date), 3)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (41, 4530000, 2, CAST(N'2022-06-15' AS Date), 2)
INSERT [dbo].[orders] ([order_id], [amount], [customer_id], [order_date], [status]) VALUES (42, 7275000, 2, CAST(N'2022-06-15' AS Date), 2)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (4, 1, N'Nhằm dung hòa giữa chất lượng phím bấm cao cấp và vẻ đẹp của LED, E-Dra đã cho ra mắt phiên bản mới nhất của dòng EK387 mang tên E-Dra EK387 Gateron với sự "nâng cấp" lớn so với phiên bản EK387 Huano khi sử dụng switch GATERON cao cấp. Không giống bất cứ một mẫu bàn phím cơ giá rẻ nào trước đây, E-Dra EK387 Gateron là chiếc bàn phím cơ duy nhất có mức giá dưới 1 triệu đồng được trang bị switch Gateron. Đây là điểm mạnh vượt trội so với tất cả các sản phẩm giác cùng phân khúc', 10, CAST(N'2022-06-11' AS Date), N'ek387g.png', N'E-DRA EK387 GATERON', 99, 1, 799000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (9, 1, N'Nhằm dung hòa giữa chất lượng phím bấm cao cấp và vẻ đẹp của LED, E-Dra đã cho ra mắt phiên bản mới nhất của dòng EK387 mang tên E-Dra EK387 Gateron với sự "nâng cấp" lớn so với phiên bản EK387 Huano khi sử dụng switch GATERON cao cấp. Không giống bất cứ một mẫu bàn phím cơ giá rẻ nào trước đây, E-Dra EK387 Gateron là chiếc bàn phím cơ duy nhất có mức giá dưới 1 triệu đồng được trang bị switch Gateron. Đây là điểm mạnh vượt trội so với tất cả các sản phẩm giác cùng phân khúc.', 10, CAST(N'2022-06-05' AS Date), N'ek387pink.jpg', N'E-DRA EK387 PINK', 97, 0, 750000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (10, 4, N'Ấn tương đầu tiên mà chiếc bàn phím cơ AKKO 3087 Silent mang tới cho ta có lẽ chính là cách phối màu rất dịu mắt, đó là sự kết hợp giữa keycap màu trắng và xám nhạt chủ đạo, được tô điểm bằng những chiếc keycap lẻ màu Xanh sáng và Tím. Thêm với vỏ phím màu xám rất hợp tone, giúp cho chiếc phím cơ có vẻ ngoài chúng tôi đánh giá là cho cảm giác rất dễ chịu, đẹp một cách đơn giản nhưng không hề nhạt nhòa mà rất có điểm nhấn.', 10, CAST(N'2022-06-10' AS Date), N'akko3087.jpg', N'AKKO 3087 SILENT', 99, 0, 1200000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (20, 6, N'Bàn phím cơ không dây TKL gọn gàng
Công tắc cơ khí Gateron thay nóng (Hotswap)
Kết nối Bluetooth 5.1 đến 3 thiết bị hoặc dây USB-C
Tương thích cả MAC và Windows thân thuộc
Đèn LED RGB lên đến hơn 15 hiệu ứng đặc sắc
Bàn phím thông minh kết nối với Siri hoặc Cortana
PIN đến 4000mAh sử dụng liên tục 240 giờ không đèn', 0, CAST(N'2022-06-05' AS Date), N'keychronk8.jpg', N'Keychron K8', 98, 0, 2100000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (21, 6, N'Bàn phím cơ Keychron K4 Optical Red switch G1
Kết nối dây Type-C hoặc Bluetooth cực kỳ tiện lợi
Switch quang cơ cho độ bền cao, tốc độ phản hồi phím nhanh
Led đơn màu
Tương thích tốt với Window, MacOS', 0, CAST(N'2022-06-10' AS Date), N'keychronk4.jpg', N'Keychron K4', 88, 0, 1800000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (22, 1, N'Bàn phím cơ E-DRA EK368W Bluetooth Kailhbox Red switch
Bàn phím cơ không dây
Switch Kailhbox chất lượng cao
Kết nối Bluetooth thông dụng
Layout 68 phím vừa nhỏ gọn vừa tiện lợi
Keycap PBT DyeSub profile XDA siêu đẹp
Pin sạc dung lượng cao', 0, CAST(N'2022-06-05' AS Date), N'ek368w.png', N'E-DRA EK368W', 96, 0, 1500000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (23, 3, N'Là thương hiệu bàn phím cơ đến từ Nhật Bản, Filco được ra đời từ năm 1992. Đến nay, Filco nổi tiếng với các bàn phím cơ sử dụng switch Cherry và thời gian bảo hành lên đến 5 năm. Filco còn có các sản phẩm bổ trợ người sử dụng như KOBO Studio, kê tay, keycap,... tạo nên hệ sinh thái và trải nghiệm sản phẩm hoàn thiện cho người tiêu dùng.', 0, CAST(N'2022-06-05' AS Date), N'filcoair.jpg', N'Filco Air', 99, 0, 3500000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (24, 1, N'Bàn phím cơ E-DRA EK387W RGB Wireless Gateron Red switch
Phím cơ không dây, sử dụng kết nối 2,4GHz (đầu nhận USB) hoặc Bluetooth
Switch GATERON cao cấp
LED RGB 16.8 triệu màu
Pin sạc dung lượng cao
Dây sạc đầu gắn với phím USB TYPE-C', 0, CAST(N'2022-06-05' AS Date), N'ek387w.jpg', N'E-DRA EK387W', 99, 0, 1250000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (25, 1, N'Bàn phím cơ E-DRA EK3104 Huano Blue switch Version 2022
NÂNG CẤP VỚI DÂY RỜI, ĐẦU NỐI VỚI PHÍM USB TYPE C
NÂNG CẤP SWITCH HUANO SIÊU BỀN
Thiết kế 104 phím chuẩn ANSI
LED Rainbow siêu đẹp
Keycaps ABS Double shot', 0, CAST(N'2022-06-05' AS Date), N'ek3104.jpg', N'E-DRA EK3104', 99, 0, 700000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (26, 1, N'Bàn phím cơ E-DRA EK361W Bluetooth White Red switch
Bàn phím cơ không dây
Switch Outemu độ bền 50 triệu lần bấm
Kết nối Bluetooth thông dụng
Layout 61 phím
LED RGB 16.8 triệu màu
Pin dung lượng 4000mhA, sạc qua cổng USB', 0, CAST(N'2022-06-05' AS Date), N'ek361w.jpg', N'E-DRA EK361W', 99, 0, 800000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (27, 1, N'Bàn phím cơ E-DRA EK384 RGB Huano Red switch
Switch Huano chất lượng cao
Layout 84 phím vừa nhỏ gọn vừa tiện lợi
LED RGB 16.8 triệu màu
Keycap ABS Doubleshot xuyên led
Dây có thể tháo rời với đầu dây nối với phím USB TypeC', 0, CAST(N'2022-06-05' AS Date), N'ek384.png', N'E-DRA EK384', 99, 0, 780000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (30, 1, N'Bàn phím cơ E-DRA EK387 Pro Gateron Blue switch
PHIÊN BẢN MỚI NÂNG CẤP SWITCH GATERON SIÊU XỊN
NÂNG CẤP DÂY THÁO RỜI VỚI ĐẦU NƠI VỚI PHÍM USB TYPE C
NÂNG CẤP KEYCAP PBT CHERRY PROFILE DOUBLE SHOT
Thiết kế 87 phím nhỏ gọn
Dây USB tháo rời với jack nối trên phím Type C', 0, CAST(N'2022-06-05' AS Date), N'ek387p.jpg', N'E-DRA EK387 PRO GATERON', 99, 0, 1090000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (31, 4, N'Bàn phím cơ AKKO 3087 World Tour Tokyo Blue Switch
Model: 3087 (Tenkeyless, 87 keys)
Kết nối: USB Type C, có thể tháo rời
Hỗ trợ NKRO
Keycap: PBT Dye-Subbed
Loại switch: Akko switch
Keycap custom lấy chủ đạo là màu hoa anh đào, núi Phú sĩ, cá chép và mèo may mắn (biểu tượng của Nhật Bản)', 0, CAST(N'2022-06-12' AS Date), N'akko3087pink.jpg', N'AKKO 3087 WORLD TOUR TOKYO', 99, 0, 1300000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (32, 1, N'Bàn phím cơ E-DRA EK3104 Pro Gateron Blue switch
PHIÊN BẢN MỚI NÂNG CẤP SWITCH GATERON SIÊU XỊN
NÂNG CẤP DÂY THÁO RỜI VỚI ĐẦU NƠI VỚI PHÍM USB TYPE C
NÂNG CẤP KEYCAP PBT CHERRY PROFILE DOUBLE SHOT
Thiết kế 104 phím chuẩn ANSI', 0, CAST(N'2022-06-05' AS Date), N'ek3104pro.jpg', N'E-DRA EK3104 PRO', 99, 0, 1100000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (33, 69, N'Bàn phím cơ Leopold FC750R PD White Grey Red switch
Bàn phím cơ sử dụng switch Cherry MX Red
Keycap làm bằng PBT siêu dày, độ bền cực cao, chống mài mòn cực tốt
Keycap Profile "Cherry" tiêu chuẩn
Ký tự Double shot siêu bền
Bàn phím có chiều cao rất hợp lý, giúp việc typing tốt nhất mà không cần dùng tới kê tay.', 0, CAST(N'2022-06-05' AS Date), N'leopold750.jpg', N'Leopold FC750R PD', 99, 0, 3100000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (34, 69, N'Bàn phím cơ Leopold FC980M PD Blue Grey Brown switch
Bàn phím cơ cao cấp của Hàn Quốc sử dụng công tắc cơ khí Cherry MX Brown
Độ bền công tắc lên tới 50 triệu lần bấm
Thiết kế nút bấm, mạch và lớp vỏ thông minh giúp cho cảm giác gõ phím tốt nhất
Keycap làm bằng nhựa PBT siêu dày và siêu bền
Mẫu bàn phím mới với layout đặc biệt, đầy đủ phím nhưng nhỏ gọn', 0, CAST(N'2022-06-05' AS Date), N'leopold980.jpg', N'Leopold FC980M PD', 99, 0, 3500000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (35, 1, N'Bàn phím cơ E-DRA EK3087 Blue LED Blue switch
Switch Outemu siêu bền
Keycap ABS Double Shot
LED siêu sáng
Dây cáp bọc dù', 0, CAST(N'2022-06-06' AS Date), N'ek3087.jpg', N'E-DRA EK3087', 99, 0, 550000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (49, 3, N'Bàn phím cơ Filco Majestouch 2 Tenkeyless Blue Switch
Bàn phím cơ cao cấp của Nhật Bản
Ban phím sử dụng công tắc cơ khí Cherry MX Blue với chất lượng tốt nhất
Độ bên công tắc lên tới 50 triệu lần bấm
Chất lượng phím bấm tuyệt vời', 0, CAST(N'2022-06-12' AS Date), N'majestouch2_tkl.jpg', N'Filco Majestouch 2', 99, 0, 3200000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (50, 69, N'Bàn phím cơ Leopold FC900R PD Bluefont Blue switch
Bàn phím cơ cao cấp của Hàn Quốc sử dụng công tắc cơ khí Cherry MX
Độ bền công tắc lên tới 50 triệu lần bấm
Thiết kế nút bấm, mạch và lớp vỏ thông minh giúp cho cảm giác gõ phím tốt nhất
Keycap làm bằng nhựa PBT double shot siêu dày và siêu bền', 0, CAST(N'2022-06-12' AS Date), N'leopold_fc900r_.jpg', N'Leopold FC900R PD', 99, 0, 3500000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (51, 69, N'Bàn phím cơ Leopold FC750R SP White SkyBlue Blue switch
Phiên bản phím có Stickpoint (dùng thay cho chuột)
Bàn phím cơ cao cấp của Hàn Quốc sử dụng công tắc cơ khí Cherry MX
Độ bền công tắc lên tới 50 triệu lần bấm
Thiết kế nút bấm, mạch và lớp vỏ thông minh giúp cho cảm giác gõ phím tốt nhất
Keycap làm bằng nhựa PBT DYE-SUB siêu dày và siêu bền', 0, CAST(N'2022-06-12' AS Date), N'eopold_fc750r_sp_white_skyblue.jpg', N'Leopold FC750R SP White SkyBlue', 99, 0, 3700000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (52, 69, N'Bàn phím cơ Leopold FC980C White Grey (Topre switch)
Bàn phím cơ siêu cao cấp
Sử dụng switch Topre công nghệ cao, lực bấm 45g
Độ bền 50 triệu lần bấm
Keycap PBT siêu bền vớ kiểu in Dye-Sub rất đẹp
Độ hoàn thiện rất cao, rất đẹp và đẳng cấp.', 0, CAST(N'2022-06-12' AS Date), N'leopold_fc980c_white_grey.png', N'Leopold FC980C', 98, 0, 7600000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (53, 4, N'Bàn phím cơ AKKO 3098 DS MidNight R2 Akko Pink switch
Model: 3098 (98 keys)
Kết nối: USB Type C, có thể tháo rời
Kích thước: 382x134x40 mm | Trọng lượng 0.97 kg
Hỗ trợ NKRO / Multimedia / Macro / Khóa phím Windows
Keycap: PBT Dye-Subbed, OEM profile
Loại switch: AKKO switch v2
Phụ kiện: 1 sách hướng dẫn sử dụng + 1 keypuller + 1 cover che bụi + 40 keycap tặng kèm + 1 dây cáp USB Type-C to USB
Tương thích: Windows / MacOS / Linux
Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)', 0, CAST(N'2022-06-12' AS Date), N'akko_3096_ds_midnight_r2.jpg', N'AKKO 3098 DS MidNight R2', 99, 0, 1450000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (54, 4, N'Bàn phím cơ AKKO 3068 v2 2022 Year of the Ox hotswap Akko CS Matcha Green switch
Kết nối: Bluetooth 5.0 / USB Type C, có thể tháo rời
Kết nối 4 thiết bị (4 profiles)
Model: 3068 (68 keys) – LED nền RGB, 18 chế độ LED
Có tính năng hotswap (thay nóng switch, hỗ trợ cho switch 3 pin)
Dung lượng pin: 1800 mah ~ 200 giờ hoạt động
Kích thước: 312x102x40 mm | Trọng lượng ~ 0.59kg
Keycap: PBT Dye-Subbed – JDA Profile
Loại switch: Akko cs (Ocean Blue/ Matcha Green/ Rose Red) switch
Hỗ trợ NKRO/Multimedia/Macro/Khóa phím Windows
Phụ kiện: 1 sách hướng dẫn sử dụng + 1 keypuller + 1 cover che bụi + 1 dây cáp USB Type-C 2 USB
Tương thích: Windows / MacOS / Linux / IOS / ANDROID
Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)', 0, CAST(N'2022-06-12' AS Date), N'akko_3068_v2_2021_year_of_the_ox.jpg', N'AKKO 3068 v2 2022 Year of the Ox', 99, 0, 1950000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (55, 4, N'Bàn phím cơ AKKO 3108 Honkai Impact 3rd - Yae Sakura Akko Pink switch
Phím sử dụng Switch AKKO
108 phím chuẩn ANSI
Keycap PBT Double Shot siêu bền
Ký tự in kiểu Dye-Sub
Lấy cảm hứng từ nhân vật Yae Sakura trong trò chơi Honkai Impact III
Phụ kiện đi kèm: 1 sách hướng dẫn sử dụng + 1 keypuller + 1 cover che bụi
Dây cáp có thể tháo rời
1 sách hướng dẫn sử dụng + 1 keypuller + 1 cover che bụi + keycap tặng kèm + 1 dây cáp USB', 0, CAST(N'2022-06-12' AS Date), N'akko_3108_honkai_impact_3rd_yae_sakura.jpg', N'AKKO 3108 Honkai Impact 3rd', 99, 0, 2100000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (56, 6, N'Bàn phím cơ Keychron K2 RGB Gateron Brown switch C3
Thiết kế layout 75% đầy đủ chức năng, gọn nhẹ
Vỏ nhôm Aluminum chắc chắn
Kết nối cả Bluetooth lẫn dây type-C
Led RGB 16.8 triệu màu
Switch Gateron cho chất lượng gõ tốt
Tương thích tốt với Window, MacOS', 0, CAST(N'2022-06-12' AS Date), N'keychron_k2_rgb_gateron_brown_switch_c3.jpg', N'Keychron K2', 99, 0, 2100000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (57, 6, N'Bàn phím cơ Keychron K6
Thiết kế mini 65% gọn nhẹ
Khung kim loại nhôm chắc chắn
Kết nối : Bluetooth / Cáp Type-C tiện lợi. Kết nối cùng lúc với 3 thiết bị
Tương thích tốt với Window / MAC
Led RGB nhiều hiệu ứng
Dung lượng pin : 4000mAh', 0, CAST(N'2022-06-12' AS Date), N'keychron_k6_w2_gateron_blue_switch_nhom_rgb_hotswap.jpg', N'Keychron k6', 99, 0, 2200000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (58, 6, N'Dạng LED: RGB
Dạng bàn phím: Phím cơ
Loại Switch: Gateron Blue Switch
Kích thước phím: 75%
Bàn Phím Cơ Bluetooth Keychron K3 là dòng phím bluetooth mới nhất đến từ Keychron, với thiết kế low profile cho kích thước phím siêu mỏng nhẹ đem đến sự thuận tiện trong quá trình làm việc', 0, CAST(N'2022-06-12' AS Date), N'keychron-k3.jpg', N'Keychron k3', 99, 0, 1900000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (59, 6, N'Bàn phím cơ Keychron K1 N1
Thiết kế Fullsize 104 phím truyền thống
Siêu mỏng, sử dụng switch Gateron low profile
Khung nhôm chắc chắn
Kết nối : Bluetooth 5.1 / Cáp type C.
Tương thích với nhiều thiết bị, đặc biệt là MacOS, IOS
Led RGB 16.8 triệu màu nhiều hiệu ứng', 0, CAST(N'2022-06-12' AS Date), N'ban_phim_co_keychron_k1.jpg', N'Keychron k1', 990, 0, 2400000)
INSERT [dbo].[products] ([product_id], [category_id], [desciption], [discount], [entered_date], [image], [name], [quantity], [status], [unit_price]) VALUES (60, 3, N'Bàn phím cơ Không dây Filco Majestouch Minila Air-R
Phiên bản mới nâng cấp từ Minila Air
Kết nối Bluetooth 5.1
Hỗ trợ 4 Profile Bluetooth và một kết nối dây USB
Layout 2 trong 1 hỗ trợ cả Windows và MAC
Keycap PBT Double độc đáo, bề mặt chữ có thể tháo rời
Switch Cherry MX nổi tiếng đến từ Đức
Thời lượng pin cao lên đến 8-12 tháng
Bảo hành 5 năm', 0, CAST(N'2022-06-12' AS Date), N'filco_majestouch_minila_air_r_convertible_asagi.jpg', N'Filco Majestouch Minila Air-R', 99, 0, 4000000)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[user_role] ON 

INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (1, 1, 1)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (2, 2, 2)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (3, 2, 3)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (4, 2, 4)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (5, 2, 6)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (6, 2, 18)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (8, 2, 23)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (9, 2, 1)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (10, 2, 1)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (11, 2, 2)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (12, 2, 2)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (13, 2, 2)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (14, 2, 2)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (15, 2, 2)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (16, 2, 2)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (17, 2, 2)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (18, 2, 25)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (19, 2, 2)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (20, 2, 2)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (21, 2, 4)
INSERT [dbo].[user_role] ([id], [role_id], [customer_id]) VALUES (22, 2, 6)
SET IDENTITY_INSERT [dbo].[user_role] OFF
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FK92im1bt9gndrexccag7x5oq92] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FK92im1bt9gndrexccag7x5oq92]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FKhnsosbuy7bhpqpnt3bjr7sh8x] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FKhnsosbuy7bhpqpnt3bjr7sh8x]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKpxtb8awmi0dk6smoh2vp1litg] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKpxtb8awmi0dk6smoh2vp1litg]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([category_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9]
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD  CONSTRAINT [FK6khb6aehv520qkn1lyykakjx9] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[user_role] CHECK CONSTRAINT [FK6khb6aehv520qkn1lyykakjx9]
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD  CONSTRAINT [FKp6m37g6n6c288s096400uw8fw] FOREIGN KEY([role_id])
REFERENCES [dbo].[app_role] ([role_id])
GO
ALTER TABLE [dbo].[user_role] CHECK CONSTRAINT [FKp6m37g6n6c288s096400uw8fw]
GO
USE [master]
GO
ALTER DATABASE [KeyboardShop] SET  READ_WRITE 
GO