﻿USE [master]
GO
/****** Object:  Database [OnlineBookSales]    Script Date: 03/12/2018 22:49:35 ******/
CREATE DATABASE [OnlineBookSales]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineBookSales', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\OnlineBookSales.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineBookSales_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\OnlineBookSales_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineBookSales] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineBookSales].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineBookSales] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineBookSales] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineBookSales] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineBookSales] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineBookSales] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineBookSales] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineBookSales] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineBookSales] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineBookSales] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineBookSales] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineBookSales] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineBookSales] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineBookSales] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineBookSales] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineBookSales] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineBookSales] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineBookSales] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineBookSales] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineBookSales] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineBookSales] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineBookSales] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineBookSales] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [OnlineBookSales] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineBookSales] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineBookSales] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineBookSales] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineBookSales] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineBookSales] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineBookSales] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineBookSales', N'ON'
GO
USE [OnlineBookSales]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 03/12/2018 22:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Books]    Script Date: 03/12/2018 22:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PurchasePrice] [decimal](18, 2) NOT NULL,
	[Text] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subscriptions]    Script Date: 03/12/2018 22:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/12/2018 22:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181201040353_v1', N'2.0.3-rtm-10026')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181201070206_v12', N'2.0.3-rtm-10026')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181202181413_v13', N'2.0.3-rtm-10026')
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (1, N'Book1', CAST(120.00 AS Decimal(18, 2)), N'Nice book')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (2, N'Fundamentals of Wavelets', CAST(228.00 AS Decimal(18, 2)), N'Goswami Jaideva')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (3, N'Data Smart', CAST(235.00 AS Decimal(18, 2)), N'Foreman John')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (4, N'God Created the Integers', CAST(197.00 AS Decimal(18, 2)), N'Hawking Stephen')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (5, N'Superfreakonomics', CAST(179.00 AS Decimal(18, 2)), N'Dubner Stephen')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (6, N'Orientalism', CAST(197.00 AS Decimal(18, 2)), N'Said Edward')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (7, N'Drunkards Walk', CAST(197.00 AS Decimal(18, 2)), N'Mlodinow Leonard')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (8, N'Data Scientists at Work', CAST(230.00 AS Decimal(18, 2)), N'Sebastian Gutierrez')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (9, N'Slaughterhouse Five', CAST(198.00 AS Decimal(18, 2)), N'Vonnegut Kurt')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (10, N'Birth of a Theorem', CAST(234.00 AS Decimal(18, 2)), N'Villani Cedric')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (11, N'Age of Wrath', CAST(238.00 AS Decimal(18, 2)), N'Eraly Abraham')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (12, N'Trial', CAST(198.00 AS Decimal(18, 2)), N'Kafka Frank')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (13, N'Statistical Decision Theory', CAST(236.00 AS Decimal(18, 2)), N'Pratt John')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (14, N'Data Mining Handbook', CAST(242.00 AS Decimal(18, 2)), N'Nisbet Robert')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (15, N'New Machiavelli', CAST(180.00 AS Decimal(18, 2)), N'Wells H. G.')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (16, N'Computer Programs', CAST(240.00 AS Decimal(18, 2)), N'Sussman Gerald')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (17, N'Image Processing', CAST(241.00 AS Decimal(18, 2)), N'Shih Frank')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (18, N'How to Think Like Sherlock Holmes', CAST(240.00 AS Decimal(18, 2)), N'Konnikova	Maria')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (19, N'Nature of Statistical Theory', CAST(230.00 AS Decimal(18, 2)), N'Vapnik Vladimir')
INSERT [dbo].[Books] ([Id], [Name], [PurchasePrice], [Text]) VALUES (20, N'Integration of the Indian States', CAST(217.00 AS Decimal(18, 2)), N'Menon	 V P')

SET IDENTITY_INSERT [dbo].[Books] OFF
SET IDENTITY_INSERT [dbo].[Subscriptions] ON 

INSERT [dbo].[Subscriptions] ([Id], [BookId], [UserId]) VALUES (1, 1, 1)
INSERT [dbo].[Subscriptions] ([Id], [BookId], [UserId]) VALUES (2, 2, 1)
INSERT [dbo].[Subscriptions] ([Id], [BookId], [UserId]) VALUES (3, 3, 1)
INSERT [dbo].[Subscriptions] ([Id], [BookId], [UserId]) VALUES (4, 3, 2)
INSERT [dbo].[Subscriptions] ([Id], [BookId], [UserId]) VALUES (5, 2, 2)
SET IDENTITY_INSERT [dbo].[Subscriptions] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [Password]) VALUES (2, N'testuser@gmail.COM', N'Test', N'Lastname', N'testuser')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Subscriptions_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_Books]
GO
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Subscriptions_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_Users]
GO
USE [master]
GO
ALTER DATABASE [OnlineBookSales] SET  READ_WRITE 
GO
