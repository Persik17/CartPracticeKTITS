USE [master]
GO
/****** Object:  Database [SaloonDB]    Script Date: 12.03.2022 13:24:40 ******/
CREATE DATABASE [SaloonDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SaloonDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SaloonDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SaloonDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SaloonDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SaloonDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SaloonDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SaloonDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SaloonDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SaloonDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SaloonDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SaloonDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SaloonDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SaloonDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SaloonDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SaloonDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SaloonDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SaloonDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SaloonDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SaloonDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SaloonDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SaloonDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SaloonDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SaloonDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SaloonDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SaloonDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SaloonDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SaloonDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SaloonDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SaloonDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SaloonDB] SET  MULTI_USER 
GO
ALTER DATABASE [SaloonDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SaloonDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SaloonDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SaloonDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SaloonDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SaloonDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SaloonDB] SET QUERY_STORE = OFF
GO
USE [SaloonDB]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 12.03.2022 13:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Basket]    Script Date: 12.03.2022 13:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basket](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[DateBasket] [datetime] NULL,
 CONSTRAINT [PK_Basket] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 12.03.2022 13:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
	[UserID] [int] NULL,
	[Address] [varchar](max) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 12.03.2022 13:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 12.03.2022 13:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 12.03.2022 13:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 12.03.2022 13:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12.03.2022 13:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductBasket]    Script Date: 12.03.2022 13:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductBasket](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[BasketID] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_ProductBasket] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 12.03.2022 13:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 12.03.2022 13:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12.03.2022 13:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](60) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 12.03.2022 13:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 12.03.2022 13:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 12.03.2022 13:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 12.03.2022 13:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12.03.2022 13:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[Login] [varchar](60) NULL,
	[Password] [varchar](60) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AttachedProduct] ON 

INSERT [dbo].[AttachedProduct] ([ID], [MainProductID], [AttachedProductID]) VALUES (1, 2, 8)
INSERT [dbo].[AttachedProduct] ([ID], [MainProductID], [AttachedProductID]) VALUES (2, 2, 23)
INSERT [dbo].[AttachedProduct] ([ID], [MainProductID], [AttachedProductID]) VALUES (5, 3, 15)
INSERT [dbo].[AttachedProduct] ([ID], [MainProductID], [AttachedProductID]) VALUES (6, 4, 7)
INSERT [dbo].[AttachedProduct] ([ID], [MainProductID], [AttachedProductID]) VALUES (13, 4, 69)
INSERT [dbo].[AttachedProduct] ([ID], [MainProductID], [AttachedProductID]) VALUES (14, 4, 68)
INSERT [dbo].[AttachedProduct] ([ID], [MainProductID], [AttachedProductID]) VALUES (15, 4, 67)
INSERT [dbo].[AttachedProduct] ([ID], [MainProductID], [AttachedProductID]) VALUES (16, 4, 70)
INSERT [dbo].[AttachedProduct] ([ID], [MainProductID], [AttachedProductID]) VALUES (17, 23, 35)
INSERT [dbo].[AttachedProduct] ([ID], [MainProductID], [AttachedProductID]) VALUES (18, 23, 34)
INSERT [dbo].[AttachedProduct] ([ID], [MainProductID], [AttachedProductID]) VALUES (19, 23, 32)
INSERT [dbo].[AttachedProduct] ([ID], [MainProductID], [AttachedProductID]) VALUES (20, 3, 10)
INSERT [dbo].[AttachedProduct] ([ID], [MainProductID], [AttachedProductID]) VALUES (21, 10, 6)
INSERT [dbo].[AttachedProduct] ([ID], [MainProductID], [AttachedProductID]) VALUES (22, 10, 4)
INSERT [dbo].[AttachedProduct] ([ID], [MainProductID], [AttachedProductID]) VALUES (23, 10, 3)
SET IDENTITY_INSERT [dbo].[AttachedProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Basket] ON 

INSERT [dbo].[Basket] ([ID], [UserID], [DateBasket]) VALUES (1, 2, CAST(N'2022-03-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Basket] ([ID], [UserID], [DateBasket]) VALUES (2, 2, CAST(N'2022-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Basket] ([ID], [UserID], [DateBasket]) VALUES (3, 5, CAST(N'2022-03-09T20:49:13.997' AS DateTime))
SET IDENTITY_INSERT [dbo].[Basket] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath], [UserID], [Address]) VALUES (5, N'Александр', N'Крайчик', N'Евгеньевич', NULL, CAST(N'2022-02-09T00:00:00.000' AS DateTime), NULL, N'89655889055', N'М', NULL, 2, N'липатова 23 15')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath], [UserID], [Address]) VALUES (6, N'Рамиль', N'Фатыхов', N'Маратович', NULL, CAST(N'2022-03-09T20:48:57.247' AS DateTime), NULL, N'89655889055', N'М', NULL, 5, N'Мира 44')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'Ж', N'Женщина')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'М', N'Мужчина')
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (1, N'Natura Siberica', CAST(N'2018-01-20' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (2, N'Биопин ФАРМА', CAST(N'2016-08-13' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (3, N'Milotto', CAST(N'2016-06-19' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (4, N'Лаборатория натуральной косметики MIXIT', CAST(N'2018-06-12' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (5, N'Малавит', CAST(N'2017-09-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (6, N'ANDALOU', CAST(N'2015-11-11' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (7, N'Agent Netty PRO', CAST(N'2016-03-17' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (8, N'ЕвроТек', CAST(N'2017-10-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (9, N'Blue Beautifly', CAST(N'2017-01-15' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (10, N'MATSESTA', CAST(N'2018-04-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (11, N'АЙРОН БАРБЕР', CAST(N'2018-04-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (12, N'РУСХИМТЕХ', CAST(N'2017-07-03' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (13, N'НИКОЛЬ', CAST(N'2017-02-27' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (14, N'Аравия', CAST(N'2015-06-23' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (15, N'Алтэя', CAST(N'2018-05-14' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (16, N'SHELK Cosmetics', CAST(N'2017-01-19' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (17, N'Русская косметика', CAST(N'2015-07-19' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (18, N'MAGIC HERBS', CAST(N'2016-02-23' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (19, N'Natura Botanica', CAST(N'2016-05-02' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (20, N'Bel Savon', CAST(N'2015-04-20' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (21, N'ИРИДА-НЕВА', CAST(N'2017-05-27' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (22, N'Славяна', CAST(N'2015-03-09' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (23, N'АЛВА', CAST(N'2016-08-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (24, N'Альпика', CAST(N'2018-05-31' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (25, N'Жерминаль', CAST(N'2017-04-04' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (26, N'Арт-Визаж', CAST(N'2018-04-15' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (27, N'Валери-Д', CAST(N'2018-06-28' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (28, N'Мастерская Fitoland Organic', CAST(N'2017-07-10' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (29, N'ДОМ ПРИРОДЫ', CAST(N'2015-11-25' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (30, N'Флора', CAST(N'2016-01-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (31, N'ЭКО ТАВРИДА', CAST(N'2016-06-27' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (32, N'АлтайЯ', CAST(N'2015-07-04' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (33, N'Weleda', CAST(N'2015-04-14' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (34, N'ANTI AGE', CAST(N'2015-11-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (35, N'Колорит', CAST(N'2017-12-22' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (36, N'SATIVA', CAST(N'2017-01-13' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (37, N'Фитокосметик', CAST(N'2016-03-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (38, N'Клеона', CAST(N'2017-10-29' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (39, N'Живая косметика Сибири', CAST(N'2015-03-05' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (40, N'SLAVIC HAIR Company', CAST(N'2015-12-20' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (41, N'Green era', CAST(N'2017-07-28' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (42, N'SIBERINA', CAST(N'2015-10-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (43, N'Green Mama', CAST(N'2016-11-11' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (44, N'Altanya', CAST(N'2015-03-23' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (45, N'Черный бриллиант', CAST(N'2016-01-07' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (46, N'BIOSelect', CAST(N'2016-12-29' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (47, N'АромаВятка', CAST(N'2016-10-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (48, N'VIQQO — производитель инновационной уходовой косметики', CAST(N'2017-10-12' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (49, N'DIONY', CAST(N'2017-12-03' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (50, N'AMSARVEDA', CAST(N'2015-12-11' AS Date))
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (2, N'Ирисовый освежающий увлажняющий крем', 123.0000, N'Описание', N'\Images\Product\1953276-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (3, N'Сыворотка для кожи вокруг глаз с гиалуроновой кислотой', 690.0000, N'', N'file:///C:/Users/kraic/OneDrive/Рабочий стол/Pract_22/Pract_22/Images/Product/7528034-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (4, N'Тоник для лица дневной, Витаминный', 800.0000, N'', N'\Images\Product\7293278-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (6, N'Маска-пленка отшелушивающая с лифтинг-эффектом', 860.0000, NULL, N'\Images\Product\6556452-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (7, N'Специальный крем для клеточного восстановления', 920.0000, NULL, N'\Images\Product\6556466-1.jpg', 0, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (8, N'Увлажняющий крем', 730.0000, N'', N'\Images\Product\1781678-1.jpg', 0, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (9, N'Восстанавливающая маска для лица', 630.0000, NULL, N'\Images\Product\3432465-1.jpg', 0, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (10, N'Крем SILK для чувствительной кожи лица натуральный', 740.0000, N'', N'\Images\Product\9939701-1.jpg', 1, 10)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (11, N'Подарочный набор Сияние', 630.0000, NULL, N'\Images\Product\6964198-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (12, N'Пена для бритья Натуральная, Лимон и Корица', 470.0000, NULL, N'\Images\Product\7528034-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (13, N'Крем питательный тонизирующий ночной', 950.0000, NULL, N'\Images\Product\3388879-1.jpg', 1, 46)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (14, N'Подарочный набор Супер Увлажнение', 830.0000, NULL, N'\Images\Product\6964197-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (15, N'Подарочный набор Глубокое Очищение', 860.0000, N'', N'file:///C:/Users/kraic/OneDrive/Рабочий стол/Pract_22/Pract_22/Images/Product/2351755-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (16, N'Тоник ACTIVE для возрастной кожи лица натуральный', 720.0000, NULL, N'\Images\Product\9939709-1.jpg', 1, 10)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (17, N'Эфирное масло мелиссы', 380.0000, NULL, N'\Images\Product\7064333-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (18, N'Увлажняющая эмульсия для лица', 910.0000, NULL, N'\Images\Product\6556463-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (19, N'Масло персиковое', 280.0000, NULL, N'\Images\Product\6691688-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (20, N'Очищающая коллекция Ночной восстанавливающий крем для лица', 570.0000, NULL, N'\Images\Product\3432453-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (21, N'Подарочный набор For HIM, Сильный мужчина', 900.0000, NULL, N'\Images\Product\7299377-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (22, N'Антивозрастная коллекция Освежающий тоник Цветочный', 940.0000, NULL, N'\Images\Product\3432442-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (23, N'Розовый разглаживающий увлажняющий крем', 890.0000, NULL, N'\Images\Product\1781679-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (24, N'Деликатный питательный крем', 890.0000, NULL, N'\Images\Product\1781676-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (25, N'Масло сладкого миндаля', 250.0000, NULL, N'\Images\Product\6691687-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (26, N'Эфирное масло жасмин', 610.0000, NULL, N'\Images\Product\7064330-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (27, N'Натуральная пенка для умывания, с ароматом розового дерева', 750.0000, NULL, N'\Images\Product\6953177-1.jpg', 0, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (28, N'Тоник для лица, для сухой и нормальной кожи', 490.0000, NULL, N'\Images\Product\9631443-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (29, N'Эфирное масло лемонграсс', 380.0000, NULL, N'\Images\Product\7064323-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (30, N'Ирисовый освежающий ночной крем', 840.0000, NULL, N'\Images\Product\1781674-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (31, N'Деликатное очищающее молочко', 680.0000, NULL, N'\Images\Product\1781675-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (32, N'Эфирное масло корицы', 370.0000, NULL, N'\Images\Product\7064335-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (33, N'Очищающий гель для умывания', 720.0000, NULL, N'\Images\Product\7847906-1.jpg', 0, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (34, N'Солнцезащитный лосьон для лица и тела', 830.0000, NULL, N'\Images\Product\6556469-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (35, N'Коллекция Кокосовая, Очищающая пенка для лица с экстрактами кактуса', 540.0000, NULL, N'\Images\Product\3472602-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (36, N'S.O.S. средство против локальных несовершенств кожи', 870.0000, NULL, N'\Images\Product\7847905-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (37, N'Коллекция Сияние, Очищающая крем-пенка Лимон Мейера', 750.0000, NULL, N'\Images\Product\3472591-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (38, N'Подарочный набор Сияние и Красота', 570.0000, NULL, N'\Images\Product\6964199-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (39, N'Маска-пленка для глубокого очищения пор', 920.0000, NULL, N'\Images\Product\6556453-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (40, N'Ирисовый освежающий дневной крем', 740.0000, NULL, N'\Images\Product\1781693-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (41, N'Деликатный увлажняющий крем', 940.0000, NULL, N'\Images\Product\1781680-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (42, N'Ухаживающее масло, против сухости кожи', 410.0000, NULL, N'\Images\Product\6953160-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (43, N'Розовое растительное мыло', 470.0000, NULL, N'\Images\Product\1781711-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (44, N'Гранатовый дневной крем-лифтинг', 800.0000, NULL, N'\Images\Product\1781695-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (45, N'Тонизирующее очищающее средство 2 в 1', 640.0000, NULL, N'\Images\Product\2008488-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (46, N'Сыворотка для лица с гиалуроновой кислотой, для сухой и чувствительной кожи', 590.0000, NULL, N'\Images\Product\9631448-1.jpg', 0, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (47, N'Эфирное масло лимона', 330.0000, NULL, N'\Images\Product\7064322-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (48, N'Эфирное масло розовое дерево', 510.0000, NULL, N'\Images\Product\7064326-1.jpg', 0, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (49, N'Мягкая пенка для умывания', 680.0000, NULL, N'\Images\Product\5625224-1.jpg', 0, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (50, N'Сыворотка для лица с гиалуроновой кислотой, для нормальной кожи', 560.0000, NULL, N'\Images\Product\9631445-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (51, N'Тоник для лица, для жирной и проблемной кожи', 600.0000, NULL, N'\Images\Product\9631442-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (52, N'Пенка для умывания, для сухой и чувствительной кожи', 440.0000, NULL, N'\Images\Product\9631439-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (53, N'Антивозрастной крем для лица с органическими ягодами годжи', 990.0000, NULL, N'\Images\Product\6433981-1.jpg', 0, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (54, N'Эфирное масло эвкалипт', 410.0000, NULL, N'\Images\Product\7064320-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (55, N'Сыворотка PERFECT SERUM депигментирующая натуральная', 710.0000, NULL, N'\Images\Product\9939719-1.jpg', 1, 10)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (56, N'Крем для лица с антиоксидантами органической клюквы', 980.0000, NULL, N'\Images\Product\6433979-1.jpg', 0, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (57, N'Пенка для лица для чувствительной кожи', 630.0000, NULL, N'\Images\Product\3472601-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (58, N'Коллекция Кокосовая, Укрепляющая сыворотка с экстрактами кактуса', 680.0000, NULL, N'\Images\Product\3472604-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (59, N'Крем-маска WOW EFFECT омолаживающая для лица натуральная', 950.0000, NULL, N'\Images\Product\9939704-1.jpg', 1, 10)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (60, N'Подарочный набор For MEN', 840.0000, NULL, N'\Images\Product\7299378-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (61, N'Очищающий гель для нормальной и сухой кожи лица', 720.0000, NULL, N'\Images\Product\6556458-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (62, N'Лифтинг-сыворотка для лица', 930.0000, NULL, N'\Images\Product\6556462-1.jpg', 0, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (63, N'Тоник для ухода за сухой и нормальной кожей', 990.0000, NULL, N'\Images\Product\6556459-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (64, N'Питательный крем для лица', 800.0000, NULL, N'\Images\Product\6556464-1.jpg', 0, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (65, N'Крем против морщин для глаз', 570.0000, NULL, N'\Images\Product\5427580-1.jpg', 0, 46)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (66, N'Лифтинг-сыворотка для лица с гиалуроновой кислотой', 610.0000, NULL, N'\Images\Product\9631446-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (67, N'Деликатное питательное масло для лица', 930.0000, NULL, N'\Images\Product\2262226-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (68, N'Тонизирующая сыворотка для лица', 780.0000, NULL, N'\Images\Product\6556461-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (69, N'Масло праймер для лица (основа под макияж), Выравнивание', 530.0000, NULL, N'\Images\Product\6953159-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (70, N'Сыворотка COUPEROSE укрепляющая сосуды натуральная', 590.0000, NULL, N'\Images\Product\9939714-1.jpg', 1, 10)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (71, N'Органический тонер с экстрактом Розы', 960.0000, NULL, N'\Images\Product\7889950-1.jpg', 1, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (72, N'Пенка для умывания, для жирной и комбинированной кожи', 780.0000, NULL, N'\Images\Product\9631437-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (73, N'Маска для лица увлажняющая и тонизирующая', 860.0000, NULL, N'\Images\Product\6556451-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (74, N'Эфирное масло чайного дерева', 410.0000, NULL, N'\Images\Product\7064334-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (75, N'Очищающий гель для комбинированной и жирной кожи лица', 980.0000, NULL, N'\Images\Product\6556457-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (76, N'Масло после бритья Натуральное, Лимон и Корица', 300.0000, NULL, N'\Images\Product\7528031-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (77, N'Ухаживающее масло для лица, восстанавливает кожу', 420.0000, NULL, N'\Images\Product\6953176-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (78, N'Подарочный набор Мягкое Очищение', 850.0000, N'Здесь есть описание', N'\Images\Product\6964195-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (79, N'Гранатовый ночной крем-лифтинг', 560.0000, NULL, N'\Images\Product\1781696-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (80, N'Живительный тоник для лица', 770.0000, NULL, N'\Images\Product\2008486-1.jpg', 0, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (81, N'Универсальный питательный крем SKIN FOOD', 640.0000, NULL, N'\Images\Product\2351755-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (82, N'Органическое 100% аргановое масло', 760.0000, NULL, N'\Images\Product\6433982-1.jpg', 1, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (83, N'Пенка для умывания, для нормальной кожи', 400.0000, NULL, N'\Images\Product\9631438-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (84, N'Крем PERFECT выравнивающий тон лица натуральный', 780.0000, NULL, N'\Images\Product\9939700-1.jpg', 1, 10)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (85, N'Чистящая пена-гель для лица', 550.0000, NULL, N'\Images\Product\2697586-1.jpg', 1, 46)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (86, N'Пенка для умывания Натуральная, Лимон и корица', 280.0000, NULL, N'\Images\Product\7528032-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (87, N'Масло для лица массажное, с эффектом Лифтинга', 500.0000, NULL, N'\Images\Product\6953169-1.jpg', 0, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (88, N'Увлажняющий 24-часовой крем против морщин', 910.0000, NULL, N'\Images\Product\2697576-1.jpg', 1, 46)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (89, N'Подарочный набор Travel, в Командировку, мужской', 880.0000, NULL, N'\Images\Product\7299376-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (90, N'Тоник для ухода за жирной и комбинированной кожей', 800.0000, NULL, N'\Images\Product\6556460-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (91, N'Тонизирующий крем для лица', 800.0000, NULL, N'\Images\Product\6556465-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (92, N'Восстанавливающий крем для лица с органическим шиповником', 960.0000, NULL, N'\Images\Product\6433984-1.jpg', 1, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (93, N'Эфирное масло перечной мяты', 390.0000, NULL, N'\Images\Product\7064324-1.jpg', 0, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (94, N'Тоник для лица, Успокаивающий, для всех типов кожи', 410.0000, NULL, N'\Images\Product\6953158-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (95, N'Эфирное масло бергамота', 380.0000, NULL, N'\Images\Product\7064315-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (96, N'Гималайская грязевая маска восстанавливающая', 640.0000, NULL, N'\Images\Product\6556455-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (97, N'Эфирное масло лаванды', 570.0000, NULL, N'\Images\Product\7064314-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (98, N'Гималайская грязевая маска антиоксидантная', 660.0000, NULL, N'\Images\Product\6556454-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (99, N'Гранатовая интенсивная сыворотка-лифтинг', 720.0000, NULL, N'\Images\Product\1781670-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (100, N'Коллекция Кокосовая, Увлажняющий ночной крем с экстрактами кактуса', 700.0000, NULL, N'\Images\Product\3472608-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (101, N'Тоник-пилинг для лица EXFOLIANT на основе фруктовых кислот натуральный', 660.0000, NULL, N'\Images\Product\9939710-1.jpg', 1, 10)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductBasket] ON 

INSERT [dbo].[ProductBasket] ([ID], [ProductID], [BasketID], [Quantity]) VALUES (6, 6, 1, 5)
INSERT [dbo].[ProductBasket] ([ID], [ProductID], [BasketID], [Quantity]) VALUES (8, 21, 1, 5)
SET IDENTITY_INSERT [dbo].[ProductBasket] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductPhoto] ON 

INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (3, 2, N'\Images\Product\2351755-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (4, 2, N'\Images\Product\6953169-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (5, 4, N'file:///C:/Users/kraic/OneDrive/Рабочий стол/Pract_22/Pract_22/Images/Product/7299376-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (6, 4, N'file:///C:/Users/kraic/OneDrive/Рабочий стол/Pract_22/Pract_22/Images/Product/7889950-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (7, 3, N'file:///C:/Users/kraic/OneDrive/Рабочий стол/Pract_22/Pract_22/Images/Product/1781670-1.jpg')
SET IDENTITY_INSERT [dbo].[ProductPhoto] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSale] ON 

INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (3, CAST(N'2022-03-06T00:00:00.000' AS DateTime), 2, 12, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (5, CAST(N'2022-03-07T00:00:00.000' AS DateTime), 2, 11, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (6, CAST(N'2022-04-04T00:00:00.000' AS DateTime), 3, 13, NULL)
SET IDENTITY_INSERT [dbo].[ProductSale] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [RoleID], [Login], [Password]) VALUES (1, 1, N'123', N'123')
INSERT [dbo].[User] ([ID], [RoleID], [Login], [Password]) VALUES (2, 2, N'1234', N'1234')
INSERT [dbo].[User] ([ID], [RoleID], [Login], [Password]) VALUES (5, 2, N'alex1488', N'!Pass322')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Basket]  WITH CHECK ADD  CONSTRAINT [FK_Basket_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Basket] CHECK CONSTRAINT [FK_Basket_User]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_User]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductBasket]  WITH CHECK ADD  CONSTRAINT [FK_ProductBasket_Basket] FOREIGN KEY([BasketID])
REFERENCES [dbo].[Basket] ([ID])
GO
ALTER TABLE [dbo].[ProductBasket] CHECK CONSTRAINT [FK_ProductBasket_Basket]
GO
ALTER TABLE [dbo].[ProductBasket]  WITH CHECK ADD  CONSTRAINT [FK_ProductBasket_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductBasket] CHECK CONSTRAINT [FK_ProductBasket_Product]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [SaloonDB] SET  READ_WRITE 
GO
