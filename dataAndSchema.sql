USE [master]
GO
/****** Object:  Database [FortuneTellerMVC]    Script Date: 9/15/2016 8:15:35 PM ******/
CREATE DATABASE [FortuneTellerMVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FortuneTellerMVC', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FortuneTellerMVC.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FortuneTellerMVC_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FortuneTellerMVC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FortuneTellerMVC] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FortuneTellerMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FortuneTellerMVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FortuneTellerMVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FortuneTellerMVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FortuneTellerMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FortuneTellerMVC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FortuneTellerMVC] SET  MULTI_USER 
GO
ALTER DATABASE [FortuneTellerMVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FortuneTellerMVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FortuneTellerMVC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FortuneTellerMVC] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FortuneTellerMVC]
GO
/****** Object:  Table [dbo].[BMonth]    Script Date: 9/15/2016 8:15:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BMonth](
	[BMonthID] [int] IDENTITY(1,1) NOT NULL,
	[BMonth] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BMonth] PRIMARY KEY CLUSTERED 
(
	[BMonthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 9/15/2016 8:15:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[BMonthID] [int] NOT NULL,
	[FavColorID] [int] NOT NULL,
	[NumOfSibsID] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FavColor]    Script Date: 9/15/2016 8:15:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavColor](
	[FavColorID] [int] IDENTITY(1,1) NOT NULL,
	[FavColor] [nvarchar](50) NOT NULL,
	[ModeOfTransport] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FavColor] PRIMARY KEY CLUSTERED 
(
	[FavColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NumOfSibs]    Script Date: 9/15/2016 8:15:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumOfSibs](
	[NumOfSibsID] [int] IDENTITY(1,1) NOT NULL,
	[NumOfSibs1] [nvarchar](50) NOT NULL,
	[RetireLocal] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NumOfSibs] PRIMARY KEY CLUSTERED 
(
	[NumOfSibsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BMonth] ON 

INSERT [dbo].[BMonth] ([BMonthID], [BMonth]) VALUES (1, N'January                                           ')
INSERT [dbo].[BMonth] ([BMonthID], [BMonth]) VALUES (2, N'February                                          ')
INSERT [dbo].[BMonth] ([BMonthID], [BMonth]) VALUES (3, N'March                                             ')
INSERT [dbo].[BMonth] ([BMonthID], [BMonth]) VALUES (4, N'April                                             ')
INSERT [dbo].[BMonth] ([BMonthID], [BMonth]) VALUES (5, N'May                                               ')
INSERT [dbo].[BMonth] ([BMonthID], [BMonth]) VALUES (6, N'June                                              ')
INSERT [dbo].[BMonth] ([BMonthID], [BMonth]) VALUES (7, N'July                                              ')
INSERT [dbo].[BMonth] ([BMonthID], [BMonth]) VALUES (8, N'August                                            ')
INSERT [dbo].[BMonth] ([BMonthID], [BMonth]) VALUES (9, N'September                                         ')
INSERT [dbo].[BMonth] ([BMonthID], [BMonth]) VALUES (10, N'October                                           ')
INSERT [dbo].[BMonth] ([BMonthID], [BMonth]) VALUES (11, N'November                                          ')
INSERT [dbo].[BMonth] ([BMonthID], [BMonth]) VALUES (12, N'December                                          ')
SET IDENTITY_INSERT [dbo].[BMonth] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Age], [BMonthID], [FavColorID], [NumOfSibsID]) VALUES (1, N'Rick', N'Bruyere', 31, 3, 1, 3)
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Age], [BMonthID], [FavColorID], [NumOfSibsID]) VALUES (2, N'Stephanie', N'Bruyere', 30, 1, 7, 4)
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Age], [BMonthID], [FavColorID], [NumOfSibsID]) VALUES (3, N'Nina', N'Bruyere', 4, 12, 7, 1)
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Age], [BMonthID], [FavColorID], [NumOfSibsID]) VALUES (5, N'Rick', N'Bruyere', 31, 3, 3, 3)
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Age], [BMonthID], [FavColorID], [NumOfSibsID]) VALUES (6, N'Nina', N'Bruyere', 4, 12, 4, 1)
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Age], [BMonthID], [FavColorID], [NumOfSibsID]) VALUES (7, N'Joe', N'Shmoe', 32, 4, 4, 4)
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Age], [BMonthID], [FavColorID], [NumOfSibsID]) VALUES (8, N'ar', N'gh', 32, 4, 3, 1)
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Age], [BMonthID], [FavColorID], [NumOfSibsID]) VALUES (9, N'Rick', N'Bruyere', 31, 3, 1, 3)
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[FavColor] ON 

INSERT [dbo].[FavColor] ([FavColorID], [FavColor], [ModeOfTransport]) VALUES (1, N'Red                                               ', N'a dragon')
INSERT [dbo].[FavColor] ([FavColorID], [FavColor], [ModeOfTransport]) VALUES (2, N'Orange                                            ', N'a broom stick')
INSERT [dbo].[FavColor] ([FavColorID], [FavColor], [ModeOfTransport]) VALUES (3, N'Yellow                                            ', N'a Starship')
INSERT [dbo].[FavColor] ([FavColorID], [FavColor], [ModeOfTransport]) VALUES (4, N'Green                                             ', N'a Firefly')
INSERT [dbo].[FavColor] ([FavColorID], [FavColor], [ModeOfTransport]) VALUES (5, N'Blue                                              ', N'a Lion of Voltron')
INSERT [dbo].[FavColor] ([FavColorID], [FavColor], [ModeOfTransport]) VALUES (6, N'Indigo                                            ', N'an X-Wing')
INSERT [dbo].[FavColor] ([FavColorID], [FavColor], [ModeOfTransport]) VALUES (7, N'Violet                                            ', N'an Airship')
SET IDENTITY_INSERT [dbo].[FavColor] OFF
SET IDENTITY_INSERT [dbo].[NumOfSibs] ON 

INSERT [dbo].[NumOfSibs] ([NumOfSibsID], [NumOfSibs1], [RetireLocal]) VALUES (1, N'0', N'The North')
INSERT [dbo].[NumOfSibs] ([NumOfSibsID], [NumOfSibs1], [RetireLocal]) VALUES (2, N'1', N'Avenger''s Tower')
INSERT [dbo].[NumOfSibs] ([NumOfSibsID], [NumOfSibs1], [RetireLocal]) VALUES (3, N'2', N'Ilvermorny')
INSERT [dbo].[NumOfSibs] ([NumOfSibsID], [NumOfSibs1], [RetireLocal]) VALUES (4, N'3', N'Casterly Rock')
INSERT [dbo].[NumOfSibs] ([NumOfSibsID], [NumOfSibs1], [RetireLocal]) VALUES (5, N'4+', N'Hogwarts')
SET IDENTITY_INSERT [dbo].[NumOfSibs] OFF
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_BMonth] FOREIGN KEY([BMonthID])
REFERENCES [dbo].[BMonth] ([BMonthID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_BMonth]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_FavColor] FOREIGN KEY([FavColorID])
REFERENCES [dbo].[FavColor] ([FavColorID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_FavColor]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_NumOfSibs] FOREIGN KEY([NumOfSibsID])
REFERENCES [dbo].[NumOfSibs] ([NumOfSibsID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_NumOfSibs]
GO
USE [master]
GO
ALTER DATABASE [FortuneTellerMVC] SET  READ_WRITE 
GO
