USE [master]
GO
/****** Object:  Database [BDidcheck]    Script Date: 04/03/2014 12:02:36 a.m. ******/
CREATE DATABASE [BDidcheck]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDidcheck', FILENAME = N'D:\SQL server 2012\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\BDidcheck.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BDidcheck_log', FILENAME = N'D:\SQL server 2012\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\BDidcheck_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BDidcheck] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDidcheck].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDidcheck] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDidcheck] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDidcheck] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDidcheck] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDidcheck] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDidcheck] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDidcheck] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BDidcheck] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDidcheck] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDidcheck] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDidcheck] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDidcheck] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDidcheck] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDidcheck] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDidcheck] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDidcheck] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDidcheck] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDidcheck] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDidcheck] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDidcheck] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDidcheck] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDidcheck] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDidcheck] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDidcheck] SET RECOVERY FULL 
GO
ALTER DATABASE [BDidcheck] SET  MULTI_USER 
GO
ALTER DATABASE [BDidcheck] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDidcheck] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDidcheck] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDidcheck] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BDidcheck', N'ON'
GO
USE [BDidcheck]
GO
/****** Object:  Table [dbo].[Acceso]    Script Date: 04/03/2014 12:02:37 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Acceso](
	[ID_Acceso] [int] NOT NULL,
	[ID_Personal] [char](8) NULL,
	[Fecha] [date] NULL,
	[Fecha_Ingreso] [date] NULL,
	[Fecha_Cese] [date] NULL,
	[Nota] [nvarchar](400) NULL,
	[Essalud] [bit] NULL,
	[SCTR_Pensiones] [bit] NULL,
	[SCTR_Salud] [bit] NULL,
	[PDT_Plame] [bit] NULL,
	[AFP] [bit] NULL,
	[ONP] [bit] NULL,
 CONSTRAINT [PK_Acceso] PRIMARY KEY CLUSTERED 
(
	[ID_Acceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 04/03/2014 12:02:37 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Administrador](
	[Pasword] [nvarchar](50) NOT NULL,
	[ID_Personal] [char](8) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empresa_Colaboradora]    Script Date: 04/03/2014 12:02:37 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empresa_Colaboradora](
	[ID_Empresa] [char](11) NOT NULL,
	[Nombre_Empresa] [nvarchar](100) NOT NULL,
	[Gerente] [nvarchar](100) NULL,
	[Telefono] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
 CONSTRAINT [PK_Empresa_Colaboradora] PRIMARY KEY CLUSTERED 
(
	[ID_Empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 04/03/2014 12:02:37 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[ID_Estado] [int] NOT NULL,
	[Nombre_Estado] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[ID_Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Personal]    Script Date: 04/03/2014 12:02:37 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personal](
	[ID_Personal] [char](8) NOT NULL,
	[Nombres] [nvarchar](100) NOT NULL,
	[Apellidos] [nvarchar](100) NOT NULL,
	[Fecha_Nac] [date] NOT NULL,
	[Area] [nvarchar](50) NOT NULL,
	[Cargo] [nvarchar](50) NOT NULL,
	[Foto] [image] NULL,
	[ID_Empresa] [char](11) NOT NULL,
	[ID_TipoPersonal] [int] NOT NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[ID_Personal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Registro]    Script Date: 04/03/2014 12:02:37 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Registro](
	[ID_Registro] [nvarchar](50) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[ID_Estado] [int] NOT NULL,
	[ID_Acceso] [int] NOT NULL,
	[ID_Personal] [char](8) NOT NULL,
 CONSTRAINT [PK_Registro] PRIMARY KEY CLUSTERED 
(
	[ID_Registro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tipo_Personal]    Script Date: 04/03/2014 12:02:37 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Personal](
	[ID_TipoPersonal] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoPersonal] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tipo_Personal] PRIMARY KEY CLUSTERED 
(
	[ID_TipoPersonal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD  CONSTRAINT [FK_Administrador_Personal] FOREIGN KEY([ID_Personal])
REFERENCES [dbo].[Personal] ([ID_Personal])
GO
ALTER TABLE [dbo].[Administrador] CHECK CONSTRAINT [FK_Administrador_Personal]
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Empresa_Colaboradora] FOREIGN KEY([ID_Empresa])
REFERENCES [dbo].[Empresa_Colaboradora] ([ID_Empresa])
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_Empresa_Colaboradora]
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Tipo_Personal] FOREIGN KEY([ID_TipoPersonal])
REFERENCES [dbo].[Tipo_Personal] ([ID_TipoPersonal])
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_Tipo_Personal]
GO
ALTER TABLE [dbo].[Registro]  WITH CHECK ADD  CONSTRAINT [FK_Registro_Acceso] FOREIGN KEY([ID_Acceso])
REFERENCES [dbo].[Acceso] ([ID_Acceso])
GO
ALTER TABLE [dbo].[Registro] CHECK CONSTRAINT [FK_Registro_Acceso]
GO
ALTER TABLE [dbo].[Registro]  WITH CHECK ADD  CONSTRAINT [FK_Registro_Estado] FOREIGN KEY([ID_Estado])
REFERENCES [dbo].[Estado] ([ID_Estado])
GO
ALTER TABLE [dbo].[Registro] CHECK CONSTRAINT [FK_Registro_Estado]
GO
ALTER TABLE [dbo].[Registro]  WITH CHECK ADD  CONSTRAINT [FK_Registro_Personal] FOREIGN KEY([ID_Personal])
REFERENCES [dbo].[Personal] ([ID_Personal])
GO
ALTER TABLE [dbo].[Registro] CHECK CONSTRAINT [FK_Registro_Personal]
GO
USE [master]
GO
ALTER DATABASE [BDidcheck] SET  READ_WRITE 
GO
