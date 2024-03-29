USE [master]
GO
/****** Object:  Database [J3.L.P0002]    Script Date: 12/8/2019 10:18:46 AM ******/
CREATE DATABASE [J3.L.P0002]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'J3.L.P0002', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\J3.L.P0002.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'J3.L.P0002_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\J3.L.P0002_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [J3.L.P0002] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [J3.L.P0002].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [J3.L.P0002] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [J3.L.P0002] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [J3.L.P0002] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [J3.L.P0002] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [J3.L.P0002] SET ARITHABORT OFF 
GO
ALTER DATABASE [J3.L.P0002] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [J3.L.P0002] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [J3.L.P0002] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [J3.L.P0002] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [J3.L.P0002] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [J3.L.P0002] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [J3.L.P0002] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [J3.L.P0002] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [J3.L.P0002] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [J3.L.P0002] SET  DISABLE_BROKER 
GO
ALTER DATABASE [J3.L.P0002] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [J3.L.P0002] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [J3.L.P0002] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [J3.L.P0002] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [J3.L.P0002] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [J3.L.P0002] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [J3.L.P0002] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [J3.L.P0002] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [J3.L.P0002] SET  MULTI_USER 
GO
ALTER DATABASE [J3.L.P0002] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [J3.L.P0002] SET DB_CHAINING OFF 
GO
ALTER DATABASE [J3.L.P0002] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [J3.L.P0002] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [J3.L.P0002] SET DELAYED_DURABILITY = DISABLED 
GO
USE [J3.L.P0002]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 12/8/2019 10:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAccount](
	[UserId] [varchar](50) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblAccount] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblBook]    Script Date: 12/8/2019 10:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBook](
	[BookId] [varchar](50) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[Author] [varchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
	[CategoryId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Photo] [varchar](255) NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[ImportDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblBook] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 12/8/2019 10:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCoupon]    Script Date: 12/8/2019 10:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCoupon](
	[Code] [varchar](25) NOT NULL,
	[Value] [float] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[UserId] [varchar](50) NULL,
	[Status] [varchar](15) NOT NULL,
 CONSTRAINT [PK_tblCoupon] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 12/8/2019 10:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrder](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](50) NOT NULL,
	[CouponCode] [varchar](25) NULL,
	[Total] [float] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 12/8/2019 10:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[BookId] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[SubTotal] [float] NOT NULL,
	[Title] [varchar](255) NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 12/8/2019 10:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRole](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUserInfo]    Script Date: 12/8/2019 10:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUserInfo](
	[UserId] [varchar](50) NOT NULL,
	[Fullname] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Address] [varchar](255) NOT NULL,
 CONSTRAINT [PK_tbl_UserInfo] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblAccount] ([UserId], [Password], [RoleId], [CreatedDate]) VALUES (N'admin', N'admin', 1, CAST(N'2019-10-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblAccount] ([UserId], [Password], [RoleId], [CreatedDate]) VALUES (N'admin2', N'admin', 1, CAST(N'2019-11-25 10:10:49.203' AS DateTime))
INSERT [dbo].[tblAccount] ([UserId], [Password], [RoleId], [CreatedDate]) VALUES (N'user', N'user', 2, CAST(N'2019-10-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblAccount] ([UserId], [Password], [RoleId], [CreatedDate]) VALUES (N'user2', N'user', 2, CAST(N'2019-11-25 10:38:29.690' AS DateTime))
INSERT [dbo].[tblBook] ([BookId], [Title], [Author], [Description], [CategoryId], [Price], [Quantity], [Photo], [Status], [ImportDate]) VALUES (N'B0001', N'Harry Potter 1', N'J.K. Rowling', N'Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive.', 1, 12.5, 0, N'assets/harry_potter_1.jpeg', N'Active', CAST(N'2019-11-25 11:22:36.463' AS DateTime))
INSERT [dbo].[tblBook] ([BookId], [Title], [Author], [Description], [CategoryId], [Price], [Quantity], [Photo], [Status], [ImportDate]) VALUES (N'B0002', N'Harry Potter 2', N'Rowling', N'Hay VCL', 1, 25, 0, N'assets/harry_potter_2.jpeg', N'Active', CAST(N'2019-11-25 11:01:24.163' AS DateTime))
INSERT [dbo].[tblBook] ([BookId], [Title], [Author], [Description], [CategoryId], [Price], [Quantity], [Photo], [Status], [ImportDate]) VALUES (N'B0003', N'Harry Potter 3', N'Rowling', N'Hay vcl', 3, 14.5, 93, N'assets/harry_potter_3.jpeg', N'Active', CAST(N'2019-11-25 07:16:41.753' AS DateTime))
INSERT [dbo].[tblBook] ([BookId], [Title], [Author], [Description], [CategoryId], [Price], [Quantity], [Photo], [Status], [ImportDate]) VALUES (N'B0005', N'Harry Potter 5', N'Rowling', N'Good', 2, 31.5, 15, N'assets/harry_potter_5.jpeg', N'Active', CAST(N'2019-11-25 11:23:42.000' AS DateTime))
INSERT [dbo].[tblBook] ([BookId], [Title], [Author], [Description], [CategoryId], [Price], [Quantity], [Photo], [Status], [ImportDate]) VALUES (N'B0342', N'Harry Potter 4', N'Thanh', N'Hay OK', 4, 25.5, 9, N'assets/harry_potter_4.jpeg', N'Active', CAST(N'2019-11-25 10:35:21.293' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([CategoryId], [Name]) VALUES (1, N'Fiction')
INSERT [dbo].[tblCategory] ([CategoryId], [Name]) VALUES (2, N'Action')
INSERT [dbo].[tblCategory] ([CategoryId], [Name]) VALUES (3, N'Fantasy')
INSERT [dbo].[tblCategory] ([CategoryId], [Name]) VALUES (4, N'Thriller')
INSERT [dbo].[tblCategory] ([CategoryId], [Name]) VALUES (5, N'Mystery')
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
INSERT [dbo].[tblCoupon] ([Code], [Value], [StartDate], [EndDate], [UserId], [Status]) VALUES (N'523AB33', 200, CAST(N'2019-12-01 00:00:00.000' AS DateTime), CAST(N'2019-12-05 00:00:00.000' AS DateTime), N'user', N'Used')
INSERT [dbo].[tblCoupon] ([Code], [Value], [StartDate], [EndDate], [UserId], [Status]) VALUES (N'AAA111', 4.5, CAST(N'2019-10-22 00:00:00.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), N'Empty', N'NotUsed')
INSERT [dbo].[tblCoupon] ([Code], [Value], [StartDate], [EndDate], [UserId], [Status]) VALUES (N'AAA222', 8.5, CAST(N'2019-10-24 00:00:00.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), N'user', N'Used')
INSERT [dbo].[tblCoupon] ([Code], [Value], [StartDate], [EndDate], [UserId], [Status]) VALUES (N'AAA333', 20, CAST(N'2019-11-25 00:00:00.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), N'user', N'Used')
INSERT [dbo].[tblCoupon] ([Code], [Value], [StartDate], [EndDate], [UserId], [Status]) VALUES (N'AAA444', 5, CAST(N'2019-10-01 00:00:00.000' AS DateTime), CAST(N'2019-12-30 00:00:00.000' AS DateTime), N'user', N'Used')
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([OrderId], [UserId], [CouponCode], [Total], [CreatedDate]) VALUES (9, N'user', N'AAA111', 2468, CAST(N'2019-11-25 07:53:19.880' AS DateTime))
INSERT [dbo].[tblOrder] ([OrderId], [UserId], [CouponCode], [Total], [CreatedDate]) VALUES (11, N'user', N'null', 1324.6, CAST(N'2019-11-25 08:16:14.760' AS DateTime))
INSERT [dbo].[tblOrder] ([OrderId], [UserId], [CouponCode], [Total], [CreatedDate]) VALUES (13, N'user', N'AAA222', 3794, CAST(N'2019-11-25 10:47:50.920' AS DateTime))
INSERT [dbo].[tblOrder] ([OrderId], [UserId], [CouponCode], [Total], [CreatedDate]) VALUES (14, N'user', N'null', 52.5, CAST(N'2019-11-25 10:50:35.367' AS DateTime))
INSERT [dbo].[tblOrder] ([OrderId], [UserId], [CouponCode], [Total], [CreatedDate]) VALUES (15, N'user', N'null', 2462, CAST(N'2019-11-28 14:33:41.713' AS DateTime))
INSERT [dbo].[tblOrder] ([OrderId], [UserId], [CouponCode], [Total], [CreatedDate]) VALUES (16, N'user', N'null', 4961.5, CAST(N'2019-11-28 14:45:04.290' AS DateTime))
INSERT [dbo].[tblOrder] ([OrderId], [UserId], [CouponCode], [Total], [CreatedDate]) VALUES (17, N'user', N'null', 37.5, CAST(N'2019-11-28 15:03:53.290' AS DateTime))
INSERT [dbo].[tblOrder] ([OrderId], [UserId], [CouponCode], [Total], [CreatedDate]) VALUES (18, N'user', N'null', 37.5, CAST(N'2019-11-28 15:05:02.050' AS DateTime))
INSERT [dbo].[tblOrder] ([OrderId], [UserId], [CouponCode], [Total], [CreatedDate]) VALUES (19, N'user', N'null', 62.5, CAST(N'2019-11-28 15:09:23.877' AS DateTime))
INSERT [dbo].[tblOrder] ([OrderId], [UserId], [CouponCode], [Total], [CreatedDate]) VALUES (20, N'user', N'null', 50, CAST(N'2019-11-28 15:58:26.900' AS DateTime))
INSERT [dbo].[tblOrder] ([OrderId], [UserId], [CouponCode], [Total], [CreatedDate]) VALUES (21, N'user', N'null', 39.5, CAST(N'2019-11-28 16:16:49.563' AS DateTime))
INSERT [dbo].[tblOrder] ([OrderId], [UserId], [CouponCode], [Total], [CreatedDate]) VALUES (22, N'user', N'AAA333', 0, CAST(N'2019-11-28 16:23:45.677' AS DateTime))
INSERT [dbo].[tblOrder] ([OrderId], [UserId], [CouponCode], [Total], [CreatedDate]) VALUES (23, N'user', N'AAA444', 9.5, CAST(N'2019-11-28 16:26:19.627' AS DateTime))
INSERT [dbo].[tblOrder] ([OrderId], [UserId], [CouponCode], [Total], [CreatedDate]) VALUES (24, N'user', N'523AB33', 30, CAST(N'2019-12-02 07:16:26.940' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (11, 9, N'B0001', 1, 10.5, N'Harry Potter 1')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (12, 9, N'B0002', 2, 2462, N'Harry Potter 2')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (13, 11, N'B0002', 1, 1231, N'Harry Potter 2')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (14, 11, N'B0003', 6, 93.600006, N'Harry Potter 3')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (15, 13, N'B0001', 3, 31.5, N'Harry Potter 1')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (16, 13, N'B0002', 3, 3693, N'Harry Potter 2')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (17, 13, N'B0003', 5, 78, N'Harry Potter 3')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (18, 14, N'B0001', 5, 52.5, N'Harry Potter 1')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (19, 15, N'B0002', 2, 2462, N'Harry Potter 2')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (20, 16, N'B0001', 3, 37.5, N'Harry Potter 1')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (21, 16, N'B0002', 4, 4924, N'Harry Potter 2')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (22, 17, N'B0001', 1, 12.5, N'Harry Potter 1')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (23, 17, N'B0002', 1, 25, N'Harry Potter 2')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (24, 18, N'B0001', 1, 12.5, N'Harry Potter 1')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (25, 18, N'B0002', 1, 25, N'Harry Potter 2')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (26, 19, N'B0001', 1, 12.5, N'Harry Potter 1')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (27, 19, N'B0002', 2, 50, N'Harry Potter 2')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (28, 20, N'B0001', 2, 25, N'Harry Potter 1')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (29, 20, N'B0002', 1, 25, N'Harry Potter 2')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (30, 21, N'B0002', 1, 25, N'Harry Potter 2')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (31, 21, N'B0003', 1, 14.5, N'Harry Potter 3')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (32, 22, N'B0001', 1, 12.5, N'Harry Potter 1')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (33, 23, N'B0003', 1, 14.5, N'Harry Potter 3')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (34, 24, N'B0003', 5, 72.5, N'Harry Potter 3')
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [BookId], [Quantity], [SubTotal], [Title]) VALUES (35, 24, N'B0005', 5, 157.5, N'Harry Potter 5')
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([RoleId], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[tblRole] ([RoleId], [Name]) VALUES (2, N'Customer')
SET IDENTITY_INSERT [dbo].[tblRole] OFF
INSERT [dbo].[tblUserInfo] ([UserId], [Fullname], [Email], [Phone], [Address]) VALUES (N'admin', N'Admin', N'admin@admin.com', N'0988111222', N'HCMC')
INSERT [dbo].[tblUserInfo] ([UserId], [Fullname], [Email], [Phone], [Address]) VALUES (N'admin2', N'Admin 2', N'admin2@admin.com', N'0988111222', N'admin')
INSERT [dbo].[tblUserInfo] ([UserId], [Fullname], [Email], [Phone], [Address]) VALUES (N'user', N'User', N'user@user@gmail.com', N'0988111333', N'HN')
INSERT [dbo].[tblUserInfo] ([UserId], [Fullname], [Email], [Phone], [Address]) VALUES (N'user2', N'User 2', N'user2@user.com', N'0988111555', N'user')
SET ANSI_PADDING ON

GO
/****** Object:  Index [Unique_Name_tblRole]    Script Date: 12/8/2019 10:18:46 AM ******/
ALTER TABLE [dbo].[tblRole] ADD  CONSTRAINT [Unique_Name_tblRole] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD  CONSTRAINT [FK_tblAccount_tblRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([RoleId])
GO
ALTER TABLE [dbo].[tblAccount] CHECK CONSTRAINT [FK_tblAccount_tblRole]
GO
ALTER TABLE [dbo].[tblBook]  WITH CHECK ADD  CONSTRAINT [FK_tblBook_tblCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[tblCategory] ([CategoryId])
GO
ALTER TABLE [dbo].[tblBook] CHECK CONSTRAINT [FK_tblBook_tblCategory]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblBook] FOREIGN KEY([BookId])
REFERENCES [dbo].[tblBook] ([BookId])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblBook]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([OrderId])
REFERENCES [dbo].[tblOrder] ([OrderId])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblUserInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblUserInfo_tblAccount] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblAccount] ([UserId])
GO
ALTER TABLE [dbo].[tblUserInfo] CHECK CONSTRAINT [FK_tblUserInfo_tblAccount]
GO
USE [master]
GO
ALTER DATABASE [J3.L.P0002] SET  READ_WRITE 
GO
