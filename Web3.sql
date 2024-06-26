USE [master]
GO
/****** Object:  Database [Web1]    Script Date: 3/15/2024 9:30:21 PM ******/
CREATE DATABASE [Web1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Web1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Web1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Web1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Web1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Web1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Web1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Web1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Web1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Web1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Web1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Web1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Web1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Web1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Web1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Web1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Web1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Web1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Web1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Web1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Web1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Web1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Web1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Web1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Web1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Web1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Web1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Web1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Web1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Web1] SET RECOVERY FULL 
GO
ALTER DATABASE [Web1] SET  MULTI_USER 
GO
ALTER DATABASE [Web1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Web1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Web1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Web1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Web1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Web1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Web1', N'ON'
GO
ALTER DATABASE [Web1] SET QUERY_STORE = OFF
GO
USE [Web1]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/15/2024 9:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[pass] [nvarchar](max) NULL,
	[isAdmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[accountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/15/2024 9:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartid] [int] IDENTITY(1,1) NOT NULL,
	[accountid] [int] NULL,
	[date] [date] NULL,
	[totalmoney] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[cartid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cartline]    Script Date: 3/15/2024 9:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cartline](
	[cartid] [int] NULL,
	[productid] [int] NULL,
	[price] [money] NULL,
	[quanlity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/15/2024 9:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryid] [int] NOT NULL,
	[categoryname] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/15/2024 9:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[quanlity] [int] NULL,
	[categoryid] [int] NULL,
	[accountid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (1, N'Adam', N'123456', 1)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (2, N'dat1', N'1', 1)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (3, N'dat2', N'2', 1)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (4, N'dat3', N'3', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (5, N'dat4', N'4', 1)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (6, N'dat5', N'5', 1)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (7, N'dat6', N'6', 1)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (8, N'dat7', N'7', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (9, N'dat8', N'8', 1)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (10, N'dat9', N'9', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (11, N'dat10', N'10', 1)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (12, N'dat11', N'11', 1)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (13, N'dat12', N'12', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (14, N'dat13', N'13', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (15, N'dat14', N'14', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (16, N'dat15', N'15', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (17, N'dat16', N'16', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (18, N'dat17', N'17', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (19, N'dat18', N'18', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (20, N'dat19', N'19', 1)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (21, N'dat20', N'20', 1)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (22, N'dat21', N'21', 1)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (23, N'dat22', N'22', 1)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (24, N'dat23', N'23', 1)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (25, N'dat24', N'24', 1)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (26, N'dat25', N'25', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (27, N'admin', N'123', 1)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (28, N'dat44', N'44', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (29, N'dat45', N'45', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (30, N'dat46', N'46', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (31, N'dat47', N'47', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (32, N'dat48', N'48', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (33, N'dat49', N'49', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (34, N'dat42', N'42', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (35, N'dat26', N'26', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (36, N'dat27', N'27', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (37, N'dat29', N'29', 1)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (38, N'dat30', N'39', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (39, N'dat50', N'50', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (40, N'Hien', N'123', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (1039, N'dat51', N'51', 0)
INSERT [dbo].[Account] ([accountid], [name], [pass], [isAdmin]) VALUES (1040, N'dat54', N'54', 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (4, 5, CAST(N'2024-03-10' AS Date), 0.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (5, 5, CAST(N'2024-03-10' AS Date), 1820.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (6, 5, CAST(N'2024-03-10' AS Date), 940.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (7, 6, CAST(N'2024-03-10' AS Date), 1160.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (8, 6, CAST(N'2024-03-10' AS Date), 860.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (9, 5, CAST(N'2024-03-10' AS Date), 720.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (10, 5, CAST(N'2024-03-10' AS Date), 2160.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (11, 33, CAST(N'2024-03-10' AS Date), 360.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (12, 33, CAST(N'2024-03-10' AS Date), 720.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (13, 33, CAST(N'2024-03-10' AS Date), 2160.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (14, 33, CAST(N'2024-03-10' AS Date), 0.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (15, 33, CAST(N'2024-03-10' AS Date), 0.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (16, 33, CAST(N'2024-03-10' AS Date), 0.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (17, 33, CAST(N'2024-03-10' AS Date), 0.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (18, 33, CAST(N'2024-03-10' AS Date), 0.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (19, 33, CAST(N'2024-03-10' AS Date), 0.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (20, 33, CAST(N'2024-03-10' AS Date), 0.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (21, 33, CAST(N'2024-03-10' AS Date), 360.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (22, 33, CAST(N'2024-03-10' AS Date), 720.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (23, 33, CAST(N'2024-03-10' AS Date), 720.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (24, 33, CAST(N'2024-03-10' AS Date), 1020.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (25, 33, CAST(N'2024-03-10' AS Date), 360.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (26, 5, CAST(N'2024-03-10' AS Date), 21600.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (27, 5, CAST(N'2024-03-10' AS Date), 5800.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (28, 5, CAST(N'2024-03-10' AS Date), 28800.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (29, 33, CAST(N'2024-03-10' AS Date), 2880.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (30, 33, CAST(N'2024-03-11' AS Date), 1800.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (31, 33, CAST(N'2024-03-11' AS Date), 2088.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (32, 5, CAST(N'2024-03-11' AS Date), 4320.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (33, 5, CAST(N'2024-03-11' AS Date), 4832.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (34, 5, CAST(N'2024-03-12' AS Date), 21504.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (35, 5, CAST(N'2024-03-12' AS Date), 2880.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (36, 33, CAST(N'2024-03-12' AS Date), 105424.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (37, 33, CAST(N'2024-03-12' AS Date), 1384.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (38, 5, CAST(N'2024-03-13' AS Date), 960.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (39, 5, CAST(N'2024-03-13' AS Date), 0.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (40, 5, CAST(N'2024-03-13' AS Date), 240.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (1038, 40, CAST(N'2024-03-13' AS Date), 2160.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (2038, 5, CAST(N'2024-03-15' AS Date), 29700.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (2039, 14, CAST(N'2024-03-15' AS Date), 240.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (2040, 14, CAST(N'2024-03-15' AS Date), 360.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (2041, 14, CAST(N'2024-03-15' AS Date), 35280.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (2042, 14, CAST(N'2024-03-15' AS Date), 32660.0000)
INSERT [dbo].[Cart] ([cartid], [accountid], [date], [totalmoney]) VALUES (2043, 14, CAST(N'2024-03-15' AS Date), 29700.0000)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (5, 2, 240.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (5, 3, 260.0000, 2)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (5, 1, 360.0000, 2)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (5, 6, 340.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (6, 1, 360.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (6, 2, 240.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (6, 6, 340.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (9, 2, 240.0000, 3)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (10, 1, 360.0000, 6)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (24, 5, 320.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (24, 6, 340.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (24, 8, 360.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (25, 1, 360.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (30, 8, 360.0000, 5)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (32, 1, 360.0000, 12)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (33, 8, 360.0000, 4)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (33, 1, 360.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (33, 3, 260.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (33, 5, 320.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (33, 6, 340.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (33, 4, 224.0000, 3)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (33, 23, 360.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (33, 10, 360.0000, 3)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (34, 4, 224.0000, 96)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (35, 1, 360.0000, 8)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (36, 1, 360.0000, 289)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (38, 2, 240.0000, 4)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (40, 2, 240.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (1038, 11, 360.0000, 3)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (1038, 1, 360.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (1038, 10, 360.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (1038, 53, 360.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (2038, 4, 300.0000, 99)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (2039, 2, 240.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (2040, 1, 360.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (2041, 1, 360.0000, 98)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (2042, 2, 240.0000, 10)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (2042, 3, 260.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (2042, 4, 300.0000, 100)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (2043, 4, 300.0000, 99)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (7, 2, 240.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (7, 3, 260.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (7, 6, 340.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (7, 5, 320.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (8, 2, 240.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (8, 3, 260.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (8, 1, 360.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (11, 1, 360.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (21, 1, 360.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (26, 2, 240.0000, 90)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (27, 8, 360.0000, 9)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (27, 5, 320.0000, 8)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (28, 5, 320.0000, 90)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (31, 1, 360.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (31, 3, 260.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (31, 4, 224.0000, 2)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (31, 5, 320.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (31, 6, 340.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (31, 8, 360.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (12, 2, 240.0000, 3)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (13, 1, 360.0000, 6)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (22, 28, 360.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (22, 1, 360.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (23, 8, 360.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (23, 14, 360.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (29, 20, 360.0000, 8)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (36, 2, 240.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (36, 3, 260.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (36, 4, 224.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (36, 5, 320.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (36, 6, 340.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (37, 2, 240.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (37, 3, 260.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (37, 4, 224.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (37, 5, 320.0000, 1)
INSERT [dbo].[Cartline] ([cartid], [productid], [price], [quanlity]) VALUES (37, 6, 340.0000, 1)
GO
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (1, N'GIÀY ADIDAS')
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (2, N'GIÀY NIKE')
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (3, N'GIÀY BITI''S')
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (4, N'GIÀY CONVERSE')
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (5, N'GIÀY GUCCI')
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (6, N'GIÀY DIOR')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (1, N'Giày New Men''s Running Shoes', N'https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/bc6ecf9c065848a6aa128743c45c9ddc_9366/samba-og.jpg', 180.0000, N'Comfortable Sports Shoes Men Athletic Outdoor Cushioning Sneakers for Walking&Jogging (EUR Size 39-48)', N'New Men''s Running Shoes Comfortable Sports Shoes Men Athletic Outdoor Cushioning Sneakers for Walking&Jogging (EUR Size 39-48)', 0, 1, 1)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (2, N'Winter Men''s Snow Boots Plus Velvet', N'https://canary.contestimg.wish.com/api/webimage/5da3d0b594a0f07fdec6c5ac-large.jpg?cache_buster=a2471ea62eba44e7c0b0f4d2b4c64681', 120.0000, N'Winter Men''s Snow Boots Plus Velvet Cotton Shoes Men''s Shoes Martin Cotton Boots Warm Shoes', N'Winter Men''s Snow Boots Plus Velvet Cotton Shoes Men''s Shoes Martin Cotton Boots Warm Shoes', 82, 3, 1)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (3, N'Mens Skid Resistant Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5f3fb6d1b2a7ef003f6bd8a4-large.jpg?cache_buster=c9295f971ce194c1e68f6144f11314c6', 130.0000, N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoor Sport Shoes Fashion Sneakers', N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoor Sport Shoes Fashion Sneakers', 91, 3, 1)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (4, N'New Men''s Shose', N'https://canary.contestimg.wish.com/api/webimage/5d0235c9ae115f0be32755ef-large.jpg?cache_buster=fd2c105001ca1cbb03795818542906cc', 190.0000, N'Đồi giày có 102', N'Đồi giày có 1021', 99, 1, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (5, N'Giày Dior B23 High Top Gray CD Diamond Like Auth      ', N'https://tyhisneaker.com/wp-content/uploads/2023/01/dior-b23-high-top-gray-cd-diamond-1.jpg', 160.0000, N'Giày Dior B23 High Top Gray CD Diamond với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.', N'Giày Dior B23 High Top Gray CD Diamond là một tác phẩm thời trang độc đáo và đẳng cấp của nhà mốt danh tiếng Dior. Bài viết này sẽ giới thiệu chi tiết về thiết kế đẳng cấp, chất liệu cao cấp và sự hấp dẫn của đôi giày này. Hãy cùng khám phá sự kết hợp tinh tế giữa phong cách thể thao và sự sang trọng.', 96, 1, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (6, N'Giày Adidas Chính Hãng - DURAMO SL 2.0 - Đen | JapanSport HP2384', N'https://bizweb.dktcdn.net/thumb/small/100/347/092/products/429308254-1440992959823323-632690686577483958-n.jpg?v=1708958404000', 170.0000, N'Từ buổi tập buổi sáng tại phòng tập yoga đến một ngày làm việc vặt cho đến buổi tối với bạn bè, hãy giữ cho đôi chân của bạn thoải mái và phong cách của bạn luôn hoàn hảo với đôi giày adidas này. Hãy kết hợp chúng với chiếc quần bó yêu thích của bạn để có cảm giác thể thao-giản dị nhất. Thân giày bằng lưới giúp bạn luôn mát mẻ, đồng thời lớp đệm siêu nhẹ nâng đỡ mỗi bước đi của bạn. Được làm bằng nhiều loại vật liệu tái chế, phần trên này có hàm lượng tái chế ít nhất 50%. Sản phẩm này chỉ là một trong những giải pháp của chúng tôi nhằm giúp chấm dứt rác thải nhựa.', N'Vừa vặn thường xuyên', 92, 1, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (7, N'Giày Adidas Nam Chính Hãng - BRAVADA 2.0 LIFESTYLE SKATEBOARDING CANVAS - Trắng | JapanSport HP6021', N'https://bizweb.dktcdn.net/thumb/small/100/347/092/products/398361067-793021639341242-9179150466626231635-n.jpg?v=1708957937500', 150.0000, N'Dáng regular fit', N'Trở lại nguyên tắc cơ bản đầu tiên. Đôi giày sneaker adidas này nổi bật nhờ sự đơn giản. Thân giày bằng vải canvas siêu nhẹ có lớp lót thoải mái. Đế ngoài dạng vulcanized, cùng phần toe cap bằng cao su gợi nhớ phong cách trượt ván.', 100, 1, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (8, N'Giày Adidas Nam Nữ Chính hãng - Ultraboost Light 23 - Màu Xanh xám | JapanSport HP9477', N'https://bizweb.dktcdn.net/thumb/small/100/347/092/products/adidas-ultraboost-light-23-hp9477-01.jpg?v=1708712789247', 180.0000, N'Vừa vặn thường xuyên', N'"NĂNG LƯỢNG EPIC. NHẸ NHẤT BAO GIỜ.', 79, 1, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (9, N'Giày LV Trainer Monogram Denim Đen Trắng Siêu Cấp Like Auth    ', N'https://tyhisneaker.com/wp-content/uploads/2022/10/1-1.jpeg', 190.0000, N'Giày LV Trainer Monogram Denim Đen Trắng với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.', N'Sản phẩm Giày Gucci Ace ‘Gucci Blade Distressed White’ chuẩn Auth là một sự kết hợp hoàn hảo giữa sự thanh lịch và sự táo bạo. Gucci, một trong những thương hiệu thời trang hàng đầu thế giới, đã sáng tạo ra một đôi giày thể thao độc đáo với thiết kế đặc trưng và đầy sự cá tính. Giày này không chỉ đơn giản là một sản phẩm thời trang, mà còn là biểu tượng của gu thời trang và phong cách riêng biệt. Đây là sản phẩm nổi bật nằm trong bộ sưu tập giày gucci like auth của cửa hàng chúng tôi.', 100, 1, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (10, N'Giày Thể Thao Nam Nike Air Max Excee - Be', N'https://supersports.com.vn/cdn/shop/files/FQ8067-133-1_120x.jpg?v=1703489611', 180.0000, N'Công nghệ Max Air cushioning hỗ trợ vững chắc và thoải mái cho mỗi bước chân của bạn trở nên nhẹ nhàng và êm dịu', N'Giày Thể Thao Nam Nike Air Max Excee là đôi giày tôn vinh dòng Air Max 90 huyền thoại của Nike. Với vẻ ngoài đậm chất cổ điển pha trộn nét hiện đại, Excee không chỉ là một đôi giày, mà còn là tuyên ngôn phong cách của bạn. Hãy phối chúng với trang phục streetwear cá tính, và bước ra ngoài, khẳng định sự khác biệt, sẵn sàng tạo nên dấu ấn riêng trên từng con đường bạn đi.', 96, 2, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (11, N'Giày Thể Thao Nữ Nike Gamma Force - Trắng', N'https://supersports.com.vn/cdn/shop/files/DX9176-107-1_medium.jpg?v=1703489173', 180.0000, N'Đế giữa: Cao su', N'"Với Zoom Strobel Air và lớp bọt Signature Formula 23 ở phần đế thấp, giày này giúp bạn thực hiện những bước chạy nhanh và kiểm soát hoàn hảo trên sân cỏ.', 97, 2, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (12, N'Giày Gucci Screener GG ‘White Leather’ ‎546551-9Y920-9666', N'https://cdn.authentic-shoes.com/wp-content/uploads/2023/04/546551_9y920_9666_001_100_0000_l-removebg-preview_cf420277e0d747cda2e6b6fc01b63e14-300x140.png', 180.0000, N'Đế giữa: Cao su', N'Bước chân vào thế giới của phong cách đa chiều với Giày Thể Thao Nữ Nike Gamma Force. Khám phá sự kết hợp tinh tế giữa thoải mái và linh hoạt, sản phẩm này không chỉ đậm chất văn hóa bóng rổ truyền thống mà còn là biểu tượng của phong cách thời trang hiện đại. Với lớp chất liệu cổ điển kế thừa từ thể thao cổ điển, đôi giày này là một tuyên bố cá nhân về sự đa dạng và tinh tế.', 100, 5, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (13, N'Giày Converse Run Star Hike Valentine''s Day', N'https://bizweb.dktcdn.net/thumb/medium/100/419/301/products/171120v2.jpg?v=1613990950827', 180.0000, N'Thiết kế cao cổ với phần lưỡi gà dày dặn ôm lấy cổ chân vừa êm ái vừa ấm áp như vòng tay của những cặp đôi yêu nhau.', N'Valentine''s Day Run Star Hike High Top - tình yêu thời công nghệ', 100, 4, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (14, N'Giày Converse Chuck 70 Valentine''s Day', N'https://bizweb.dktcdn.net/thumb/medium/100/419/301/products/171117c8.jpg?v=1613990961403', 180.0000, N'Thiết kế tương đối giống với dòng All Star nhưng dòng Chuck 70 lại được cải tiến với đệm lót dày hơn, đế giày được nâng cao để giúp người dùng cao ráo và trẻ trung hơn.', N'hể hiện tình yêu nồng nhiệt với Converse Chuck 70 Valentine''s Day High Top', 99, 4, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (16, N'Giày Thể Thao Nam Biti''s Hunter Core HSM003200XNH', N'https://salt.tikicdn.com/cache/750x750/ts/product/ba/15/ba/9af5bda7fec7ed9994457754b5e6c438.png.webp', 180.0000, N'Thiết kế cao cổ với phần lưỡi gà dày dặn ôm lấy cổ chân vừa êm ái vừa ấm áp như vòng tay của những cặp đôi yêu nhau.', N'"Valentine''s Day Run Star Hike High Top - tình yêu thời công nghệ', 100, 3, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (18, N'Giày Dior B23 High Top Gray CD Diamond Like Auth', N'https://tyhisneaker.com/wp-content/uploads/2023/01/dior-b23-high-top-gray-cd-diamond-1.jpg', 180.0000, N'Giày Dior B23 High Top Gray CD Diamond với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.', N'Giày Dior B23 High Top Gray CD Diamond là một tác phẩm thời trang độc đáo và đẳng cấp của nhà mốt danh tiếng Dior. Bài viết này sẽ giới thiệu chi tiết về thiết kế đẳng cấp, chất liệu cao cấp và sự hấp dẫn của đôi giày này. Hãy cùng khám phá sự kết hợp tinh tế giữa phong cách thể thao và sự sang trọng.', 100, 6, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (19, N'Giày Gucci Ace ‘Gucci Blade Distressed White’ Like Auth', N'https://tyhisneaker.com/wp-content/uploads/2023/10/giay-gucci-ace-gucci-blade-distressed-white.jpg', 180.0000, N'Giày Gucci Ace ‘Gucci Blade Distressed White’ Like Auth là một điển hình trong các mẫu Sneaker bẩn đến từ nhà GUCCI. Cái sự “bẩn có chủ ý” của nhà Gucci đã khiến mẫu sneaker một thời nổi đình nổi đám. Thậm chí cho đến bây giờ thì nó vẫn được nhiều tín đồ thời trang săn đón.Sạch sẽ, trắng tinh tươm thì chắc chắn ai cũng thích rồi. Nhưng vẫn không ít người bị lôi cuốn bởi những món đồ sở hữu vẻ ngoài khá bẩn nhưng rất Luxury.', N'Sản phẩm Giày Gucci Ace ‘Gucci Blade Distressed White’ chuẩn Auth là một sự kết hợp hoàn hảo giữa sự thanh lịch và sự táo bạo. Gucci, một trong những thương hiệu thời trang hàng đầu thế giới, đã sáng tạo ra một đôi giày thể thao độc đáo với thiết kế đặc trưng và đầy sự cá tính. Giày này không chỉ đơn giản là một sản phẩm thời trang, mà còn là biểu tượng của gu thời trang và phong cách riêng biệt. Đây là sản phẩm nổi bật nằm trong bộ sưu tập giày gucci like auth của cửa hàng chúng tôi.', 100, 5, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (20, N'Giày Gucci Stripe Leather Sneaker ‘White Red Black’ Like Auth', N'https://tyhisneaker.com/wp-content/uploads/2023/10/gucci-stripe-leather-sneaker-white-red-black.jpg', 170.0000, N'Giày Gucci Stripe Leather Sneaker ‘White Red Black’ chuẩn Auth với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Với chất liệu da dê bền bỉ thoải mái vậy nên đây là một Sneaker không thể bỏ lở.', N'Giày Gucci Stripe Leather Sneaker ‘White Red Black’ chuẩn Auth là một tuyệt phẩm trong thế giới thời trang của Gucci. Được thiết kế độc đáo và đầy phá cách, đôi giày này là biểu tượng của sự tinh tế và phong cách trong thế giới giày thể thao. Chúng mang đậm dấu ấn của thương hiệu Gucci, với sự kết hợp tinh tế giữa màu trắng, đỏ và đen, tạo nên một bản giao hòa hoàn hảo giữa sự thanh lịch và cá tính. Đôi giày này là một trong những sản phẩm độc đáo nằm trong bộ sưu tập giày gucci like auth của cửa hàng chúng tôi.', 92, 5, 6)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (21, N'Giày Gucci Ace Embroidered ‘Snake’ Like Auth', N'https://tyhisneaker.com/wp-content/uploads/2023/10/giay-gucci-men-s-ace-embroidered-sneaker-mau-trang-size-6-5-63ae9b3f24764-30122022150311.jpg', 165.0000, N'Giày Gucci Ace Embroidered ‘Snake’ Like Auth với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Với chất liệu da dê bền bỉ thoải mái vậy nên đây là một Sneaker không thể bỏ lở.', N'Giày Gucci Ace Embroidered ‘Snake’ chuẩn Auth là một tác phẩm thời trang độc đáo từ thương hiệu Gucci. Được thiết kế với sự kết hợp tinh tế của da cao cấp và họa tiết rắn đẹp mắt, đôi giày này không chỉ thể hiện sự tinh luyện của thương hiệu Gucci mà còn mang lại một cảm giác cá nhân và phong cách cho người sử dụng. Đôi giày này là sản phẩm độc đáo nằm trong bộ sưu tập giày gucci like auth của chúng tôi.', 100, 5, 6)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (22, N'Giày Gucci Ace ‘Stars’ 454562-DOP50-9076 Like Auth', N'https://tyhisneaker.com/wp-content/uploads/2023/10/giay-nam-gucci-ace-stars-454562-dop50-9076-4-837040f75ca248e5a8ababb3feeb5c7c-master.png', 130.0000, N'Giày Gucci Ace ‘Stars’ 454562-DOP50-9076 chuẩn Auth với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Với chất liệu da dê bền bỉ thoải mái vậy nên đây là một Sneaker không thể bỏ lở.', N'Giày Gucci Ace ‘Stars’ 454562-DOP50-9076 là một tác phẩm thời trang độc đáo, đầy phong cách và đẳng cấp từ nhà mốt Gucci. Được thiết kế với sự kết hợp tinh tế của da cao cấp và họa tiết sao lấp lánh, đôi giày này không chỉ thể hiện sự tinh luyện của thương hiệu Gucci mà còn đem lại một cảm giác cá nhân và độc đáo cho người sử dụng. Đây là một sản phẩm nổi bật nằm trong bộ sưu tập giày gucci like auth của chúng tôi.', 100, 5, 6)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (23, N'Giày LV Trainer Monogram Denim Đen Trắng Siêu Cấp Like Auth', N'https://tyhisneaker.com/wp-content/uploads/2022/10/1-1.jpeg', 185.0000, N'Giày LV Trainer Monogram Denim Đen Trắng với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.', N'Giày LV Trainer Monogram Denim Đen Trắng là biểu tượng hoàn hảo cho sự thượng lưu và phong cách hiện đại từ thương hiệu xa xỉ Louis Vuitton. Với chất liệu Monogram Denim thượng hạng và thiết kế tinh tế, đôi giày này không chỉ là một sản phẩm thời trang mà còn là biểu tượng của sự sang trọng và đẳng cấp. Bài viết này sẽ giới thiệu về những đặc điểm nổi bật của Giày LV Trainer Monogram Denim Đen Trắng, từ thiết kế đến tính năng, giúp bạn hiểu rõ hơn về sức hút và giá trị của sản phẩm này. Đây là một trong những sản phẩm giày lv like auth của chúng tôi.', 99, 6, 6)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (24, N'Giày Dior B27 Low ‘Blue Cream Dior’ Like Auth', N'https://tyhisneaker.com/wp-content/uploads/2024/01/giay-dior-b27-low-blue-cream-dior-3sn272zir-h568.jpg', 176.0000, N'Giày Dior B27 Low ‘Blue Cream Dior’ chuẩn Auth 99% với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.', N'Giày Dior B27 Low ‘Blue Cream Dior’ không chỉ là một sản phẩm thời trang mà còn là biểu tượng của sự tinh tế và cá tính trong thế giới giày sneaker. Với sắc màu xanh dương nhẹ nhàng và chất liệu cao cấp, đôi giày này không chỉ nổi bật trong mọi bước đi mà còn làm tôn lên phong cách cá nhân của người mang. Đây là một trong những sản phẩm nổi bật nằm trong bộ sưu tập giày dior like auth của cửa hàng chúng tôi.', 100, 6, 6)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (25, N'Giày Thể Thao Nam Biti''s Hunter Core HSM003200TRG (Trắng)', N'https://salt.tikicdn.com/cache/100x100/ts/product/79/f8/b9/db00fff50ec671b2b0e839c9c983bfce.png.webp', 180.0000, N'Giày Thể Thao', N'"blue-checkThiết kế thời trang và trẻ trung với màu trắng tinh tế.', 100, 1, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (26, N'Giày Dior B27 Low ‘Dior Oblique Galaxy White Red’ 3SN272ZIJ-H063 Like Auth', N'https://tyhisneaker.com/wp-content/uploads/2023/10/dior-b27-low-dior-oblique-galaxy-white-red-3sn272zij-h063.jpg', 180.0000, N'Giày LV Trainer Monogram Denim Đen Trắng với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.', N'Sản phẩm Giày Gucci Ace ‘Gucci Blade Distressed White’ chuẩn Auth là một sự kết hợp hoàn hảo giữa sự thanh lịch và sự táo bạo. Gucci, một trong những thương hiệu thời trang hàng đầu thế giới, đã sáng tạo ra một đôi giày thể thao độc đáo với thiết kế đặc trưng và đầy sự cá tính. Giày này không chỉ đơn giản là một sản phẩm thời trang, mà còn là biểu tượng của gu thời trang và phong cách riêng biệt. Đây là sản phẩm nổi bật nằm trong bộ sưu tập giày gucci like auth của cửa hàng chúng tôi.', 100, 6, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (27, N'Giày chạy bộ thể thao nam nữ Anta Running Super Flexi 812235557', N'https://salt.tikicdn.com/cache/100x100/ts/product/0e/73/e8/ae5d35ca71fd7b0420f8889f8dafa53f.jpg.webp', 160.0000, N'Giày chạy bộ thể thao nam nữ Anta Running Super Flexi 812135555 được thiết kế dựa trên nền chất liệu cao cấp', N'- Công nghệ đế giày Super Flexi 360 cải tiến từ công nghệ Super Flexi 2020', 100, 3, 6)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (28, N'Giày Adidas Nữ Chính Hãng - BARRICADE TENNIS W MC - Đỏ | JapanSport HQ8427', N'https://bizweb.dktcdn.net/thumb/small/100/347/092/products/z-hq8427-standard-side-lateral-center-view-kqxdum5q7v.jpg?v=1706983510043', 180.0000, N'Vừa vặn dễ di chuyển', N'"Giày tennis được làm một phần từ vật liệu tái chế và mang lại khả năng kiểm soát tốt hơn.', 99, 1, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (29, N'Giày Bóng Rổ Nam Nike Air Jordan Xxxviii Pf - Xanh Dươn', N'https://supersports.com.vn/cdn/shop/files/DZ3355-106-1_medium.jpg?v=1697432651', 180.0000, N'Sẵn sàng đánh bại mọi đối thủ và tỏa sáng trên sân bóng? Giày thể thao Nike Air Jordan XXXVIII PF sẽ giúp bạn làm điều đó. Với thiết kế ấn tượng và hiệu suất vượt trội, đôi giày này sẽ là trợ thủ đắc lực cho mọi cú nảy và cú xoay nhanh.', N'Sản phẩm Giày Gucci Ace ‘Gucci Blade Distressed White’ chuẩn Auth là một sự kết hợp hoàn hảo giữa sự thanh lịch và sự táo bạo. Gucci, một trong những thương hiệu thời trang hàng đầu thế giới, đã sáng tạo ra một đôi giày thể thao độc đáo với thiết kế đặc trưng và đầy sự cá tính. Giày này không chỉ đơn giản là một sản phẩm thời trang, mà còn là biểu tượng của gu thời trang và phong cách riêng biệt. Đây là sản phẩm nổi bật nằm trong bộ sưu tập giày gucci like auth của cửa hàng chúng tôi.', 100, 2, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (30, N'Giày Adidas Chính Hãng - Forum Low - Trắng/Vàng| JapanSport GX4993', N'https://bizweb.dktcdn.net/thumb/small/100/347/092/products/adidas-forum-low-gx4993-1.jpg?v=1707064408780', 180.0000, N'Vừa vặn thường xuyên', N'"PHONG CÁCH HUẤN LUYỆN VIÊN HÀNG NGÀY SỬ DỤNG BẢNG MÀU ĐẬM.', 100, 1, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (31, N'Giày Chạy Bộ Adidas EQT Bost 2023 Xám Trắng LikeAuth', N'https://tyhisneaker.com/wp-content/uploads/2023/02/giay-chay-bo-adidas-eqt-bost-2023-xam-trang-likeauth.jpg', 180.0000, N'Giày Nike Air Force 1 Low Tiffany & Co. 1837 là một phiên bản đặc biệt của biểu tượng thời trang – Nike Air Force 1. Được tạo ra trong sự kết hợp giữa Nike và Tiffany & Co., đôi giày này thể hiện sự đẳng cấp và phong cách.', N'Giày Nike Air Jordan 1 Low Year of the Dragon 2024 là một phiên bản đặc biệt được thiết kế độc đáo cho kỳ nghỉ Tết Nguyên Đán, đặc biệt là trong Năm Rồng 2024. Đôi giày này kết hợp tinh tế giữa màu trắng (Sail) và đỏ sẫm, tạo nên một bảng màu lễ hội phong cách. Họa tiết Swoosh, logo lưỡi giày và logo ở gót chân được làm nổi bật bằng màu vàng, tăng thêm vẻ sang trọng cho thiết kế.', 100, 1, 5)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (32, N'Giày Bóng Rổ Nam Nike Air Jordan Xxxviii Pf - Xanh Dương', N'https://supersports.com.vn/cdn/shop/files/DZ3355-106-1_medium.jpg?v=1697432651', 190.0000, N'Sẵn sàng đánh bại mọi đối thủ và tỏa sáng trên sân bóng? Giày thể thao Nike Air Jordan XXXVIII PF sẽ giúp bạn làm điều đó. Với thiết kế ấn tượng và hiệu suất vượt trội, đôi giày này sẽ là trợ thủ đắc lực cho mọi cú nảy và cú xoay nhanh.', N'Với Zoom Strobel Air và lớp bọt Signature Formula 23 ở phần đế thấp, giày này giúp bạn thực hiện những bước chạy nhanh và kiểm soát hoàn hảo trên sân cỏ.', 100, 2, 6)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (33, N'Giày Bóng Rổ Nam Nike Zoom Lebron Nxxt Gen Ep - Đen', N'https://supersports.com.vn/cdn/shop/files/DR8788-500-1_medium.jpg?v=1703220250', 222.0000, N'Dù bạn có khả năng nhảy bật giống như trong cuộc thi dunk hoặc là một cầu thủ tầm thấp ở gần sân đấu, bạn sẽ cảm thấy nhanh hơn, gần hơn sân bóng và tự tin hơn với LeBron NXXT Gen. Chúng tôi đã thiết kế nên sản phẩm này để đáp ứng yêu cầu của trò chơi hiện đại, giúp bạn luôn dẫn đầu đối thủ với tốc độ và sức mạnh tối đa.', N'Phiên bản này được thiết kế dành cho sử dụng ngoài trời với đế cao su bền chắc hơn.', 100, 2, 6)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (34, N'Giày Converse Chuck Taylor All Star Classic - All Black', N'https://bizweb.dktcdn.net/thumb/medium/100/419/301/products/m33101.jpg?v=1614010243590', 195.0000, N'Cá tính cool ngầu trên Converse Chuck Taylor All Star Classic – M3310V', N'Nếu bạn là tín đồ của những mẫu giày sneaker thì chắc chắn Converse Chuck Taylor All Star Classic sẽ không còn là một cái tên xa lạ. Những dấu ấn mà dòng sneaker này để lại trên thị trường thời trang thể thao là cả một kho tàng đồ sộ về sự tinh tế, cá tính mạnh mẽ và phong cách chất chơi. Nó cũng là một trong những cái tên được người dùng nhắc đến trong gần suốt 100 năm qua mà vẫn chưa hề có dấu hiệu hạ nhiệt. Để hiểu rõ hơn về Chuck Taylor All Star Classic, chúng ta hãy cùng khám phá phiên bản full black trong câu chuyện ngày hôm nay nhé!', 100, 4, 6)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (35, N'Giày Converse Chuck Taylor All Star Classic - Navy', N'https://bizweb.dktcdn.net/thumb/large/100/419/301/products/1274402.png?v=1614010236930', 186.0000, N'Converse Chuck Taylor All Star Classic – 127440C bền bỉ với thời gian', N'Một trong những dòng giày huyền thoại không bao giờ lỗi mốt của Converse chính là Converse Chuck Taylor All Star Classic – 127440C. Với lối thiết kế cổ điển được ưa chuộng, chất liệu vải canvas truyền thống, phần cổ cao cá tính với những đường viền đế đặc trưng đã mang đến cho người dùng những trải nghiệm thời trang vô cùng năng động.', 100, 4, 6)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (36, N'Giày Converse Chuck Taylor All Star Classic - Black/White', N'https://bizweb.dktcdn.net/thumb/large/100/419/301/products/1211784.jpg?v=1614010240967', 150.0000, N'Với cá tính mix màu basic nhưng không kém phần ấn tượng đó, Converse Chuck Taylor All Star Classic – 121178 đã mang đến một sự kích thích không hề nhỏ cho những ai thích sự đơn giản nhưng vẫn phải có sự ấn tượng khi dùng.', N'Một trong những mẫu giày được mệnh danh là siêu basic kinh điển trong thời trang sneaker chính là giày Converse Chuck Taylor All Star Classic – 121178. Được thiết kế với màu đen phủ kín phần upper mix cùng với tone trắng đối lập ở phần đế và dây giày, phiên bản này luôn là một sự lựa chọn an toàn nhưng không kém phần cá tính dành cho các tín đồ Converse.', 100, 4, 7)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (37, N'Giày Converse Chuck Taylor All Star 1970s White - Low', N'https://bizweb.dktcdn.net/thumb/large/100/419/301/products/1620655.png?v=1614010217560', 110.0000, N'Giày Converse Chuck 70 low top - huyền thoại trở lại đầy ngoạn mục', N'Đẹp - chất - cá tính- phá cách - độc đáo đều là những tính từ được sử dụng để miêu tả dòng sản phẩm này của Converse - Chuck 70 low top. Như một sản phẩm mà bất cứ chàng trai nào cũng muốn thử một lần, sản phẩm giày thể thao cổ thấp của Converse này có thể hội tụ đủ mọi mong muốn của người dùng. Thiết kế, form dáng đẹp, gọn, đi chắc chắn, êm ái, mà vẫn cực kỳ thời trang, Chuck 70 low top xứng đáng là một trong những sản phẩm kinh điển của hãng giày đình đám Converse.', 100, 4, 7)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (38, N'Giày Converse Chuck Taylor All Star Classic - Red', N'https://bizweb.dktcdn.net/thumb/large/100/419/301/products/1274422.png?v=1614010232677', 180.0000, N'Ưu điểm thứ hai thuộc về chất liệu: Chất liệu của Converse Chuck Taylor All Star Classic – 127442C', N'Màu đỏ thu hút và nổi bật. Cổ thấp năng động và cá tính. Thiết kế cổ điển có sức sống lâu bền. Tạo hình chắc chắn và tỉ mỉ. Mẫu giày Converse Chuck Taylor All Star Classic – 127442C low top màu đỏ là một trong những item sneaker được nhiều người lựa chọn cho các outfit năng động của mình.', 100, 4, 7)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (39, N'Giày Gucci Screener GG High ‘Off-White’ 563730-9Y9P0-9661', N'https://cdn.authentic-shoes.com/wp-content/uploads/2023/04/563730_9y9p0_9661.png_26e2db5ebde8410890c3e36fb79cea29-600x356.png', 180.0000, N'Mua Giày Gucci Screener GG High ‘Off-White’ 563730-9Y9P0-9661 chính hãng 100% có sẵn tại Authentic Shoes. Giao hàng miễn phí trong 1 ngày. Cam kết đền tiền X5 nếu phát hiện Fake. Đổi trả miễn phí size. FREE vệ sinh giày trọn đời. MUA NGAY !', N'không chỉ là một sản phẩm thời trang mà còn là biểu tượng của sự tinh tế và cá tính trong thế giới giày sneaker. Với sắc màu xanh dương nhẹ nhàng và chất liệu cao cấp, đôi giày này không chỉ nổi bật trong mọi bước đi mà còn làm tôn lên phong cách cá nhân của người mang. Đây là một trong những sản phẩm nổi bật nằm trong bộ sưu tập giày dior like auth của cửa hàng chúng tôi.', 100, 5, 7)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (40, N'Giày Gucci MAC80 Trainer Black Off White', N'https://tyhisneaker.com/wp-content/uploads/2023/09/giay-gucci-mac80-trainer-black-off-white-like-auth.jpg', 180.0000, N'Giày Gucci MAC80 Trainer Black Off White chuẩn Auth với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.', N'Giày Gucci MAC80 Trainer Black Off White là một tác phẩm nghệ thuật trong thế giới giày thể thao và thời trang. Được tạo ra trong sự kết hợp táo bạo giữa thương hiệu thời trang danh tiếng Gucci và phong cách độc đáo của Off White, đôi giày này thể hiện sự đa dạng và đẳng cấp. Đây là một sản phẩm nổi bật nằm trong bộ sưu tập giày gucci like auth của cửa hàng chúng tôi.', 100, 5, 7)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (41, N'Giày Gucci MAC80 Off-White Black Like Auth', N'https://tyhisneaker.com/wp-content/uploads/2023/09/giay-gucci-mac80-off-white-black.jpg', 180.0000, N'Giày Gucci MAC80 Off-White Black chuẩn Auth với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.', N'Giày Gucci MAC80 Off-White Black không chỉ là một đôi giày, mà chính là một tác phẩm nghệ thuật đầy táo bạo và phong cách. Hợp tác đầy độc đáo giữa hai thương hiệu thời trang danh tiếng, Gucci và Off-White, đôi giày này đại diện cho sự sáng tạo và đẳng cấp trong thế giới thời trang. Đây là sản phẩm độc đáo nằm trong bộ sưu tập giày gucci like auth của cửa hàng chúng tôi.', 100, 5, 7)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (42, N'Giày Adidas Forum 84 Low ADV Shoes ‘Cloud White Blue Bird’', N'https://tyhisneaker.com/wp-content/uploads/2023/02/o1cn01umom1q2jkh5dyqe2i-209894-1-6b66f45d41044a6d96f893a76ba14f29.webp', 180.0000, N'Giày Adidas Forum 84 Low ADV Shoes ‘Cloud White Blue Bird’ với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Bảng nâng cấp 2023 Boost nén cực êm, đi như trên mây nên rất phù hợp cho các bạn thích sự thoải mái, nhẹ nhàng, chạy bộ thì không thể bỏ lỡ mẫu này được.', N'Nhắc đến thương hiệu Adidas, không thể không nhắc đến sự kết hợp tinh tế giữa phong cách cổ điển và hiện đại trong các sản phẩm của họ. Và một sản phẩm đáng chú ý không thể bỏ qua là giày Adidas Forum 84 Low ADV Shoes ‘Cloud White Blue Bird’. Được ra mắt như một phiên bản nâng cấp của mẫu giày thể thao kinh điển Forum, đôi giày này đem lại cảm giác retro hấp dẫn cùng với các tính năng tiên tiến phù hợp với nhu cầu của thời đại.', 100, 1, 7)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (43, N'Giày Chạy Bộ Adidas EQT Bost 2023 Xám Trắng LikeAuth', N'https://tyhisneaker.com/wp-content/uploads/2023/02/giay-chay-bo-adidas-eqt-bost-2023-xam-trang-likeauth.jpg', 180.0000, N'Giày Chạy Bộ Adidas EQT Bost 2023 Xám Trắng LikeAuth với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Bảng nâng cấp 2023 Boost nén cực êm, đi như trên mây nên rất phù hợp cho các bạn thích sự thoải mái, nhẹ nhàng, chạy bộ thì không thể bỏ lỡ mẫu này được.', N'Giày Adidas Originals EQUIPMENT Plus Cream White thường được làm từ chất liệu da hoặc vải cao cấp. Phần trên của giày có màu trắng (Cream White) trải dọc từ phần gót đến mũi giày, tạo nên vẻ ngoài trang nhã và thanh lịch. Chất liệu được sử dụng và các chi tiết được cắt may tỉ mỉ, tạo nên sự chất lượng và độ bền của giày.', 100, 1, 7)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (44, N'Giày Nike Air Jordan 1 Low Year of the Dragon 2024', N'https://tyhisneaker.com/wp-content/uploads/2024/01/giay-nike-air-jordan-1-low-year-of-the-dragon-2024.jpg', 180.0000, N'Giày Nike Air Jordan 1 Low Year of the Dragon 2024 với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Nằm trong bộ sưu tập giày jordan mới nhất dành cho năm 2024.', N'Giày Nike Air Jordan 1 Low Year of the Dragon 2024 là một phiên bản đặc biệt được thiết kế độc đáo cho kỳ nghỉ Tết Nguyên Đán, đặc biệt là trong Năm Rồng 2024. Đôi giày này kết hợp tinh tế giữa màu trắng (Sail) và đỏ sẫm, tạo nên một bảng màu lễ hội phong cách. Họa tiết Swoosh, logo lưỡi giày và logo ở gót chân được làm nổi bật bằng màu vàng, tăng thêm vẻ sang trọng cho thiết kế.', 100, 1, 7)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (45, N'Giày Nike Air Force 1 Low Tiffany & Co. 1837 Like Auth', N'https://tyhisneaker.com/wp-content/uploads/2023/09/giay-nike-air-force-1-low-tiffany-co-1837-dz1382-001jpg.jpg', 185.0000, N'Giày Nike Air Force 1 Low Tiffany & Co. 1837 là một phiên bản đặc biệt của biểu tượng thời trang – Nike Air Force 1. Được tạo ra trong sự kết hợp giữa Nike và Tiffany & Co., đôi giày này thể hiện sự đẳng cấp và phong cách.', N'Và nếu bạn cũng là một người đam mê dòng sneaker dễ mang, dễ phố đồ thì không nên bỏ qua mẫu giày siêu phẩm này đâu nhé! Dưới đây là một số hình ảnh của đôi Giày Nike Air Force 1 Low ‘Tiffany & Co. 1837’ Like Auth tại TyHi Sneaker (hàng chuẩn Like auth bản xịn nhất thị trường).', 100, 2, 7)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (46, N'Dior B27 Brown & Deep Gray Smooth Calfskin Oblique Galaxy Leather', N'https://tyhisneaker.com/wp-content/uploads/2023/10/dior-b27-brown-deep-gray-smooth-calfskin-oblique-galaxy-leather-1.jpg', 140.0000, N'Dior B27 Brown & Deep Gray Smooth Calfskin Oblique Galaxy Leather với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.', N'Dior luôn được biết đến với sự tinh tế và phong cách trong thiết kế thời trang. Dior B27 là một ví dụ xuất sắc về sự kết hợp giữa thể thao và thời trang, với phong cách độc đáo và cá tính. Đôi giày này thể hiện sự đẳng cấp và sáng tạo của Dior nằm trong bộ sưu tập giày dior like auth của chúng tôi.', 100, 6, 7)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (47, N'Giày Dior B27 Low ‘Dior Oblique Galaxy White Red’ 3SN272ZIJ-H063 Like Auth', N'https://tyhisneaker.com/wp-content/uploads/2023/10/dior-b27-low-dior-oblique-galaxy-white-red-3sn272zij-h063.jpg', 180.0000, N'Giày Dior B27 Low ‘Dior Oblique Galaxy White Red’ 3SN272ZIJ-H063 Like Auth với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.', N'Thế giới giày thể thao và thời trang đang trở nên đa dạng và đầy sáng tạo, với nhiều thương hiệu danh tiếng cùng thiết kế độc đáo. Trong bài viết này, chúng ta sẽ khám phá một đôi giày đặc biệt – Giày Dior B27 Low ‘Dior Oblique Galaxy White Red’ 3SN272ZIJ-H063, với sự hoàn hảo và phóng khoáng giống như phiên bản chính hãng (authentic).', 100, 6, 7)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (48, N'Giày Thể Thao Nam Biti''s Hunter X Dune DSMH10701KEM (Kem)', N'https://salt.tikicdn.com/cache/750x750/ts/product/d5/60/20/20b91a3f270c3b767c26bd93563c9d4a.jpg.webp', 170.0000, N'với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.', N'blue-checkThiết kế mũ quai độc đáo, kết hợp giữa si Nubuk và da lộn, tạo phong cách tương lai và thời thượng.', 100, 3, 7)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (49, N'Giày Thể Thao Nam Biti''s Hunter X DSMH10500TRG (Trắng)', N'https://salt.tikicdn.com/cache/750x750/ts/product/df/8b/44/be3e651b07534959c527ca9a4faaabb3.jpg.webp', 187.0000, N'PHONG CÁCH HUẤN LUYỆN VIÊN HÀNG NGÀY SỬ DỤNG BẢNG MÀU ĐẬM.', N'"Đế: IP/Cao su', 100, 3, 1)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (50, N'Giày Converse Unisex Chuck 70 Plus', N'https://tyhisneaker.com/wp-content/uploads/2023/05/converse-unisex-chuck-70-plus.jpg', 160.0000, N'Giày Converse Unisex Chuck 70 Plus với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.', N'- Đế: IP/Cao su', 100, 4, 1)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (51, N'Giày Thể Thao Nam Biti''s Hunter X DSMH10600TRG (Trắng)', N'https://salt.tikicdn.com/cache/100x100/ts/product/41/df/2a/030dc829fb450c5d554b8e574755303a.png.webp', 170.0000, N'Dù bạn có khả năng nhảy bật giống như trong cuộc thi dunk hoặc là một cầu thủ tầm thấp ở gần sân đấu, bạn sẽ cảm thấy nhanh hơn, gần hơn sân bóng và tự tin hơn với LeBron NXXT Gen. Chúng tôi đã thiết kế nên sản phẩm này để đáp ứng yêu cầu của trò chơi hiện đại, giúp bạn luôn dẫn đầu đối thủ với tốc độ và sức mạnh tối đa.', N'Đế: IP/Cao su', 100, 3, 1)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (52, N'Giày Thể Thao Nam Biti''s Hunter X - Dune OTP Real Black edition HSM001200DEN (Đen)', N'https://salt.tikicdn.com/cache/100x100/ts/product/e8/24/77/f3615dcb4d15772a16bd29f5327d608e.png.webp', 160.0000, N'Dù bạn có khả năng nhảy bật giống như trong cuộc thi dunk hoặc là một cầu thủ tầm thấp ở gần sân đấu, bạn sẽ cảm thấy nhanh hơn, gần hơn sân bóng và tự tin hơn với LeBron NXXT Gen. Chúng tôi đã thiết kế nên sản phẩm này để đáp ứng yêu cầu của trò chơi hiện đại, giúp bạn luôn dẫn đầu đối thủ với tốc độ và sức mạnh tối đa.', N'- Đế: IP/Cao su', 100, 3, 1)
INSERT [dbo].[Product] ([productid], [name], [image], [price], [title], [description], [quanlity], [categoryid], [accountid]) VALUES (53, N'Giày Converse Unisex Chuck 70 Plus', N'https://tyhisneaker.com/wp-content/uploads/2023/05/converse-unisex-chuck-70-plus.jpg', 180.0000, N'Giày Converse Unisex Chuck 70 Plus với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.', N'Giày Converse Unisex Chuck 70 Plus là sự kết hợp tinh tế giữa phong cách cổ điển không thể lỗi thời và thiết kế hiện đại đầy phá cách. Với những cải tiến đáng giá từ dòng giày Chuck 70 truyền thống, phiên bản Plus này mang đến sự hoàn hảo cho cả những người yêu thời trang đường phố và những tín đồ trung thành của thương hiệu Converse. Hãy cùng chúng tôi khám phá về mẫu giày này và những lý do tại sao nó trở thành biểu tượng trong làng giày sneaker.', 99, 4, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Cartline]  WITH CHECK ADD FOREIGN KEY([cartid])
REFERENCES [dbo].[Cart] ([cartid])
GO
ALTER TABLE [dbo].[Cartline]  WITH CHECK ADD FOREIGN KEY([productid])
REFERENCES [dbo].[Product] ([productid])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([categoryid])
REFERENCES [dbo].[Category] ([categoryid])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Account] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([accountid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Account]
GO
USE [master]
GO
ALTER DATABASE [Web1] SET  READ_WRITE 
GO
