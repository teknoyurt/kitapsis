USE [master]
GO
/****** Object:  Database [kitapsis]    Script Date: 21.01.2020 12:38:33 ******/
CREATE DATABASE [kitapsis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kitapsis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\kitapsis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kitapsis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\kitapsis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [kitapsis] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kitapsis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kitapsis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kitapsis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kitapsis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kitapsis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kitapsis] SET ARITHABORT OFF 
GO
ALTER DATABASE [kitapsis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kitapsis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kitapsis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kitapsis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kitapsis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kitapsis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kitapsis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kitapsis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kitapsis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kitapsis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [kitapsis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kitapsis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kitapsis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kitapsis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kitapsis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kitapsis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kitapsis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kitapsis] SET RECOVERY FULL 
GO
ALTER DATABASE [kitapsis] SET  MULTI_USER 
GO
ALTER DATABASE [kitapsis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kitapsis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kitapsis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kitapsis] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kitapsis] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'kitapsis', N'ON'
GO
ALTER DATABASE [kitapsis] SET QUERY_STORE = OFF
GO
USE [kitapsis]
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 21.01.2020 12:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[kategoriAdı] [nvarchar](50) NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kitapKategori]    Script Date: 21.01.2020 12:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kitapKategori](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[kitapId] [int] NULL,
	[kategoriId] [int] NULL,
 CONSTRAINT [PK_kitapKategori] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kitaplar]    Script Date: 21.01.2020 12:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kitaplar](
	[KitapId] [int] IDENTITY(1,1) NOT NULL,
	[ISBN] [nchar](13) NOT NULL,
	[KitapAdi] [nvarchar](50) NOT NULL,
	[YazarAdi] [nvarchar](50) NOT NULL,
	[Yayınevi] [nvarchar](50) NULL,
	[SayfaSayisi] [int] NULL,
 CONSTRAINT [PK_Kitaplar] PRIMARY KEY CLUSTERED 
(
	[KitapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kullanici]    Script Date: 21.01.2020 12:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kullanici](
	[KullaniciId] [int] IDENTITY(1,1) NOT NULL,
	[TC] [nvarchar](11) NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Soyad] [nvarchar](50) NOT NULL,
	[Telefon] [nvarchar](11) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Sifre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_kullanici] PRIMARY KEY CLUSTERED 
(
	[KullaniciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oduncKitap]    Script Date: 21.01.2020 12:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oduncKitap](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[kullaniciId] [int] NULL,
	[kitapId] [int] NULL,
	[aldigiTarih] [date] NULL,
	[verdigiTarih] [date] NULL,
 CONSTRAINT [PK_oduncKitap] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[kitapKategori]  WITH CHECK ADD  CONSTRAINT [FK_kitapKategori_Kategori] FOREIGN KEY([kategoriId])
REFERENCES [dbo].[Kategori] ([Id])
GO
ALTER TABLE [dbo].[kitapKategori] CHECK CONSTRAINT [FK_kitapKategori_Kategori]
GO
ALTER TABLE [dbo].[kitapKategori]  WITH CHECK ADD  CONSTRAINT [FK_kitapKategori_Kitaplar] FOREIGN KEY([kitapId])
REFERENCES [dbo].[Kitaplar] ([KitapId])
GO
ALTER TABLE [dbo].[kitapKategori] CHECK CONSTRAINT [FK_kitapKategori_Kitaplar]
GO
ALTER TABLE [dbo].[oduncKitap]  WITH CHECK ADD  CONSTRAINT [FK_oduncKitap_Kitaplar] FOREIGN KEY([kitapId])
REFERENCES [dbo].[Kitaplar] ([KitapId])
GO
ALTER TABLE [dbo].[oduncKitap] CHECK CONSTRAINT [FK_oduncKitap_Kitaplar]
GO
ALTER TABLE [dbo].[oduncKitap]  WITH CHECK ADD  CONSTRAINT [FK_oduncKitap_kullanici] FOREIGN KEY([kullaniciId])
REFERENCES [dbo].[kullanici] ([KullaniciId])
GO
ALTER TABLE [dbo].[oduncKitap] CHECK CONSTRAINT [FK_oduncKitap_kullanici]
GO
USE [master]
GO
ALTER DATABASE [kitapsis] SET  READ_WRITE 
GO
