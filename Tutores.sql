USE [master]
GO
/****** Object:  Database [Tutores]    Script Date: 12/06/2021 8:56:06 ******/
CREATE DATABASE [Tutores]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tutores', FILENAME = N'C:\Users\i5\Tutores.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tutores_log', FILENAME = N'C:\Users\i5\Tutores_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Tutores] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tutores].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tutores] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tutores] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tutores] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tutores] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tutores] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tutores] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Tutores] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tutores] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tutores] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tutores] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tutores] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tutores] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tutores] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tutores] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tutores] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Tutores] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tutores] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tutores] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tutores] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tutores] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tutores] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tutores] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tutores] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tutores] SET  MULTI_USER 
GO
ALTER DATABASE [Tutores] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tutores] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tutores] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tutores] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tutores] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tutores] SET QUERY_STORE = OFF
GO
USE [Tutores]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Tutores]
GO
/****** Object:  Table [dbo].[Carreras]    Script Date: 12/06/2021 8:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carreras](
	[IdCarrera] [int] NOT NULL,
	[NombreCarrera] [nvarchar](100) NULL,
	[Facultad] [nvarchar](100) NULL,
	[IdMaestro] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maestros]    Script Date: 12/06/2021 8:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maestros](
	[IdMaestro] [int] NOT NULL,
	[NombreMaestro] [nvarchar](100) NULL,
	[Facultad] [nvarchar](100) NULL,
	[IdTutor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMaestro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materias]    Script Date: 12/06/2021 8:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materias](
	[IdMateria] [int] NOT NULL,
	[NombreMateria] [nvarchar](100) NULL,
	[IdCarrera] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol_BD]    Script Date: 12/06/2021 8:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol_BD](
	[IdRolBD] [int] NOT NULL,
	[Descripcion] [text] NULL,
	[IdRolServidor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRolBD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol_Servidor]    Script Date: 12/06/2021 8:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol_Servidor](
	[IdRolServidor] [int] NOT NULL,
	[Descripcion] [text] NULL,
	[IdTipoUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRolServidor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Usuario]    Script Date: 12/06/2021 8:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Usuario](
	[IdTipoUsuario] [int] NOT NULL,
	[Descripcion] [text] NULL,
	[IdTutor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tutor]    Script Date: 12/06/2021 8:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutor](
	[IdTutor] [int] NOT NULL,
	[NombreTutor] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/06/2021 8:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] NOT NULL,
	[Usuario] [nvarchar](250) NULL,
	[Contraseña] [nvarchar](250) NULL,
	[Fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Rol_BD]    Script Date: 12/06/2021 8:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Rol_BD](
	[IdUsuarioRolBd] [int] NOT NULL,
	[IdUsuarioRolServidor] [int] NULL,
	[IdUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuarioRolBd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Rol_Servidor]    Script Date: 12/06/2021 8:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Rol_Servidor](
	[IdUsuarioRolServidor] [int] NOT NULL,
	[IdRolBD] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuarioRolServidor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Carreras] ([IdCarrera], [NombreCarrera], [Facultad], [IdMaestro]) VALUES (1, N'Licenciatura en Administración', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Carreras] ([IdCarrera], [NombreCarrera], [Facultad], [IdMaestro]) VALUES (2, N'Licenciatura en Contaduría Publica', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Carreras] ([IdCarrera], [NombreCarrera], [Facultad], [IdMaestro]) VALUES (3, N'Licenciatura en Comunicaciones', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Carreras] ([IdCarrera], [NombreCarrera], [Facultad], [IdMaestro]) VALUES (4, N'Licenciatura en Ciencias de la Computación', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Carreras] ([IdCarrera], [NombreCarrera], [Facultad], [IdMaestro]) VALUES (5, N'Licenciatura en Mercadeo', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Carreras] ([IdCarrera], [NombreCarrera], [Facultad], [IdMaestro]) VALUES (6, N'Técnico en Publicidad', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Carreras] ([IdCarrera], [NombreCarrera], [Facultad], [IdMaestro]) VALUES (7, N'Técnico en Mercadeo', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Carreras] ([IdCarrera], [NombreCarrera], [Facultad], [IdMaestro]) VALUES (8, N'Técnico en Sistemas de Computación', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Carreras] ([IdCarrera], [NombreCarrera], [Facultad], [IdMaestro]) VALUES (9, N'Técnico en Redes de Computación', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Carreras] ([IdCarrera], [NombreCarrera], [Facultad], [IdMaestro]) VALUES (10, N'Técnico en Desarrollo de Software', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Carreras] ([IdCarrera], [NombreCarrera], [Facultad], [IdMaestro]) VALUES (11, N'Licenciatura en Ciencias Jurídicas', N'Jurisprudencia y Ciencias Sociales', NULL)
INSERT [dbo].[Carreras] ([IdCarrera], [NombreCarrera], [Facultad], [IdMaestro]) VALUES (12, N'Doctor en Medicina', N'Medicina', NULL)
INSERT [dbo].[Carreras] ([IdCarrera], [NombreCarrera], [Facultad], [IdMaestro]) VALUES (13, N'Licenciatura en Enfermería', N'Medicina', NULL)
INSERT [dbo].[Carreras] ([IdCarrera], [NombreCarrera], [Facultad], [IdMaestro]) VALUES (14, N'Médico Veterinario Zootecnista', N'Medicina Veterinaria y Zooetecnia', NULL)
INSERT [dbo].[Carreras] ([IdCarrera], [NombreCarrera], [Facultad], [IdMaestro]) VALUES (15, N'Doctor en Cirugía Dental', N'Cirugía Dental', NULL)
INSERT [dbo].[Carreras] ([IdCarrera], [NombreCarrera], [Facultad], [IdMaestro]) VALUES (16, N'Especialidad en Endoncia', N'Cirugía Dental', NULL)
INSERT [dbo].[Carreras] ([IdCarrera], [NombreCarrera], [Facultad], [IdMaestro]) VALUES (17, N'Licenciatura en Química y Farmacia', N'Química y Farmacia', NULL)
GO
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (1, N'Lic. Victor Monterroza', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (2, N'Licda. Nury Ramirez', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (3, N'Lic. Hector Ramos', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (4, N'Lic. Isidro Andaluz', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (5, N'Lic. Fredy Lopez', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (6, N'Ing. José Girón', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (8, N'Ing. Sandra Flores', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (9, N'Ing. Carlos Monrroy', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (10, N'Ing. Alberto Oviedo', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (11, N'Dra. Ana Rojas', N'Medicina', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (12, N'Dr. Celso Echenique', N'Medicina', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (13, N'Lic. Luis Escamilla', N'Química y Farmacia', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (14, N'Dra. Marvin Ramirez', N'Medicina', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (15, N'Mvz. Jacqueline Alvarenga', N'Medicina Veterinaria y Zooetecnia', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (16, N'Dr. René Cruz', N'Cirugía Dental', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (17, N'Dra. Sara Álvarez', N'Química y Farmacia', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (18, N'Licda. Arancely de Reyes', N'Ciencias Empresariales', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (19, N'Licda. Alexia Aguilar', N'Jurisprudencia y Ciencias Sociales', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (20, N'Licda. Nubia Ramirez', N'Química y Farmacia', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (21, N'Licda. Jhoseline Moran', N'Química y Farmacia', NULL)
INSERT [dbo].[Maestros] ([IdMaestro], [NombreMaestro], [Facultad], [IdTutor]) VALUES (22, N'Licda. Cristina Vásquez', N'Química y Farmacia', NULL)
GO
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (1, N'Administración I', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (2, N'Matemáticas I', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (3, N'Técnicas de Redacción', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (4, N'Informática I', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (5, N'Administración II', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (6, N'Matemáticas II', 2)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (7, N'Métodos y Técnicas de Investigación', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (8, N'Informática II', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (9, N'Estadística I', 2)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (10, N'Matemática Financiera', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (11, N'Contabilidad Financiera I', 2)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (12, N'Ingles I', 10)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (13, N'Filosofía', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (14, N'Estadística II', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (15, N'Principios Generales de Economía', 2)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (16, N'Contabilidad Financiera II', 2)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (17, N'Ingles II', 10)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (18, N'Ética Profesional', 8)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (19, N'Micro-economía', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (20, N'Contabilidad de Costos Industriales', 2)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (21, N'Ingles III', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (22, N'Psicología Empresarial', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (23, N'Macro-economía', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (24, N'Análisis e Interpr. de Estados Financieros', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (25, N'Ingles IV', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (26, N'Administración de Recursos Humanos', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (27, N'Modelos de Desiciones', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (28, N'Administración Financiera', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (29, N'Administración de la Producción', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (30, N'Legalización Empresarial', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (31, N'Investigación de Mercados', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (32, N'Análisis de Inversiones', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (33, N'Administración de Calidad', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (34, N'Análisis Administrativos', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (35, N'Formulación y Evaluación de Proyectos', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (36, N'Presupuesto de la Empresa Privada', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (37, N'Plan de Negocios', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (38, N'Organización y Practicas Administrativas', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (39, N'Desarrollo Organizacional', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (40, N'Administración Publica', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (41, N'Mercado de Capitales', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (42, N'Administración de Estrategias', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (43, N'Seminario de Investigación', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (44, N'Contabilidad Financiera III', 2)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (45, N'Contabilidad Financiera IV', 2)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (46, N'Auditoria Financiera I', 2)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (47, N'Auditoria Financiera I', 2)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (48, N'Contabilidad Gubernamental', 2)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (49, N'Contabilidad de Seguros', 2)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (50, N'Auditoria Financiera I', 2)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (51, N'Contabilidad Bancaria', 2)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (52, N'Organización y Practicas Contables', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (53, N'Auditoria Fiscal', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (54, N'Contabilidad Agropecuaria', 2)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (55, N'Principio de la Comunicación', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (56, N'Taller de Creatividad', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (57, N'Psicología de la Comunicación', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (58, N'Redacción y Oratoria', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (59, N'Diseño Publicitario I', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (60, N'Bases Mercadológicas', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (61, N'Fotografia I', 6)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (62, N'Guiones y Medios de Comunicación', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (63, N'Fotografia II', 6)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (64, N'Relaciones Publicas I', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (65, N'Producción en Radio', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (66, N'Publicidad II', 6)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (68, N'Publicidad I', 6)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (69, N'Relaciones Publicas II', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (70, N'Producción en Video', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (71, N'Campañas Publicitarias', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (72, N'Comunicación Institucional', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (73, N'Producción en Prensa', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (74, N'Comunicación Política y Social', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (75, N'Reportaje Interpretativo', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (76, N'Análisis del Consumidor', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (77, N'Opinión Publica', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (78, N'Etiqueta y Protocolo', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (79, N'Sociología de la Comiunicación', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (80, N'Semiótica de la Comunicación', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (81, N'Fundamentos Generales del Derecho', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (82, N'Tecnologías para Medios de Comunicación', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (83, N'Organismos Regionales e Internacionales', 3)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (84, N'Lógica Comunicacional', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (85, N'Programación Orientada a Objetos', 10)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (86, N'Programación Web I', 10)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (87, N'Programación Orientada a Servicios', 10)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (88, N'Ingeniería de Software', 10)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (89, N'Programación Web II', 10)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (90, N'Desarrollo de Aplicaciones Móviles', 10)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (91, N'Fundamentos Eléctricos y Electrónicos ', 9)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (92, N'Administración de Redes I', 9)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (93, N'Instalación y Configuración de Redes', 9)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (94, N'Protocolos de Redes', 9)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (95, N'Administración de Redes II', 9)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (96, N'Hardware de Redes', 9)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (97, N'Redes Empresariales', 9)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (98, N'Sistemas Operativos', 8)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (99, N'Lenguaje Unificado de Modelado', 8)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (100, N'Gestión de Servidores Web', 8)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (101, N'Proyecto de Aplicación', 8)
GO
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (102, N'Programación I', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (103, N'Programación II', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (104, N'Base de Datos I', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (105, N'Base de Datos II', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (106, N'Programación III', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (107, N'Arquitectura de Computadoras', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (108, N'Estructura de Datos', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (109, N'Programación IV', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (110, N'Mantenimiento de Hardware', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (111, N'Auditoria de Sistemas Computacionales', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (112, N'Sistemas de Información Gerencial', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (113, N'Administración de Centros de Computo', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (114, N'Teleinformatíca', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (115, N'Inteligencia Artificial', 4)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (116, N'Marketing de Servicios', 7)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (117, N'Administración de Compras', 7)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (118, N'Distribución y Logística', 7)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (119, N'Promoción de Ventas', 7)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (120, N'Proyección y Desarrollo del Producto', 7)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (121, N'Marketing Estrategicos', 7)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (122, N'Gerencia de Marca', 5)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (123, N'Marketing Internacional', 5)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (124, N'Gerencias de Ventas', 5)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (125, N'Filosofía General', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (126, N'Introducción al Estudio del Derecho', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (127, N'Métodos de Investigación e Informática', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (128, N'Téoria General del Estado', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (129, N'Derecho de Familia', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (130, N'Derecho Agrario y Ambiental', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (131, N'Sociología Juridica', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (132, N'Derecho Constitucional I', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (133, N'Derecho Civil I', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (134, N'Derecho Penal I', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (135, N'Téoria General del Proceso', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (136, N'Derecho Constitucional II', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (137, N'Derecho Civil II', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (138, N'Derecho Civil II', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (139, N'Derecho Penal II', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (140, N'Derecho Procesal I', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (141, N'Derecho Administrativo I', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (142, N'Derecho Civil III', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (143, N'Derecho Penal III', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (144, N'Derecho Procesal II', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (145, N'Derecho Procesal Familiar', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (146, N'Derecho Administrativo II', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (147, N'Derecho Civil IV', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (148, N'Derecho Procesal Penal I', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (149, N'Derecho Procesal III', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (150, N'Derecho de Integración Económica', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (151, N'Finanzas Publicas', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (152, N'Derecho Mercantil I', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (153, N'Derecho Procesal Penal II', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (154, N'Derecho Procesal IV', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (155, N'Derechos Humanos', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (156, N'Derecho Tributario', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (157, N'Derecho Mercantil II', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (158, N'Criminología y Medicina Forense', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (159, N'Derecho Internacional Público', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (160, N'Derecho Laboral I', 10)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (161, N'Derecho Mercantil III', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (162, N'Derecho Penitenciario', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (163, N'Derecho Internacional Privado', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (164, N'Derecho Laboral II', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (165, N'Derecho Bancario Y financiero', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (166, N'Resolución Alternativas de Conflictos', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (167, N'Derecho Notarial', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (168, N'Derecho Laboral III', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (169, N'Filosofía del Derecho', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (170, N'Derecho Registral', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (171, N'Técnicas de Oralidad', 11)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (175, N'Química General', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (176, N'Habilidades Profesionales I', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (177, N'Ingles Técnico I', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (178, N'Biología Molecular de la Célula', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (179, N'Química Orgánica', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (180, N'Biofísica Medica', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (181, N'Anatamia Medica', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (182, N'Bioquimica Medica I', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (183, N'Microbiología y Parasitología Medica', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (184, N'Anatomia Medica II', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (185, N'Bioquimica Medica II', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (186, N'Investigación Científica', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (187, N'Bioestadistica', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (188, N'Neuroanatomia', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (189, N'Fisiología Medica', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (190, N'Inmunología Básica', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (191, N'Genética Humana', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (192, N'Patología de Sistemas', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (193, N'Elementos de Integración', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (194, N'Optativa I', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (195, N'Epidemiología', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (196, N'Bioética', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (197, N'Fisiopatología', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (198, N'Diagnóstico Fisico', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (199, N'Semiología la Psiquiátrica', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (200, N'Medicina Preventiva', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (201, N'Cirugía I', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (202, N'Medicina I', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (203, N'Dermatología', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (204, N'Medicina de la Comunidad', 12)
GO
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (205, N'Ginecología y Obsterica I', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (206, N'Pediatría I', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (207, N'Psquiatría I', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (208, N'Optativa II', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (209, N'Ginecología y Obsterica II', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (210, N'Pediatría II', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (211, N'Salud Publica', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (212, N'Cirugía II', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (213, N'Medicina II', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (214, N'Optativa III', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (215, N'Internado Medicina', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (216, N'Internado Cirugía', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (217, N'Internado Ginecología y Obstetrica', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (218, N'Internado Pediatria', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (219, N'Internado Salud Pública', 12)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (220, N'Sociología', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (221, N'Bioquimica Humana', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (222, N'Psicología', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (223, N'Ética y Legislación en Enfermeria', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (224, N'Anatomia y Fisiología', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (225, N'Tecnología Didactica', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (226, N'Metodología de la Investigación', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (227, N'Microbiología y Parasitología', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (228, N'Fundamentos de Enfermería I', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (229, N'Farmacología', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (230, N'Enfermería en Salud Mental', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (231, N'Nutrición y Dietoterapía', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (232, N'Fundamentos de Enfermería II', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (233, N'Curso Extraordinario de la Gramática', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (234, N'Enfermería al Adolescente y adulto I', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (236, N'Enfermería en Salud Comunitaria I', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (237, N'Atención en Emergencias y Desastres', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (238, N'Curso Extraordinario de la Informática', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (239, N'Enfermería al Adolescente y adulto II', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (240, N'Enfermería Quirúrgica', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (241, N'Docencia Aplicada a la Enfermería', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (242, N'Enfermería en Psquiatría', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (243, N'Enfermería Materno Infantil I', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (244, N'Investigación Aplicada a Enfermería I', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (245, N'Admon. y Ger. de los Servicios de Enfermería I', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (246, N'Enfermería Materno Infantil II', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (247, N'Investigación Aplicada a Enfermería II', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (248, N'Admon. y Ger. de los Servicios de Enfermería II', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (249, N'Enfermería Materno Infantil III', 13)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (250, N'Fisiología General', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (251, N'Zootecnia General', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (252, N'Sociología General', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (253, N'Animales y su Ambiente', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (254, N'Biofisica', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (255, N'Anatomía Descriptiva y Disección I', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (256, N'Bioquimica', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (257, N'Microbiología General', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (258, N'Pastos y Forrages', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (259, N'Anatomía Descriptiva y Disección II', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (260, N'Parasitología', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (261, N'Ingles Técnico II', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (262, N'Histología y Embriología Comparada', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (263, N'Anatomía Topográfica', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (264, N'Virología', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (265, N'Ingles Técnico III', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (266, N'Enfermedades Parasitarias', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (267, N'Higiene y Profilaxis Animal', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (268, N'Inmunología', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (269, N'Ingles Técnico IV', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (270, N'Fisiología Especial', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (271, N'Propedéutica Técnica', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (272, N'Zooetecnia de Pequeñas Especies', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (273, N'Imagenología', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (274, N'Producción de Pequeños Rumiantes', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (275, N'Farmacología General', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (276, N'Economía y Administración de Empresas Agropecuaría', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (277, N'Alimentos y Nutrición', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (278, N'Técnicas Quirúrgicas', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (279, N'Laboratorio Clínico', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (280, N'Farmacología Especial', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (281, N'Patología Sistematica I', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (282, N'Cirugía General', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (283, N'Medicina y Manejo de Fauna Silvestre', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (284, N'Patología Sistematica II', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (285, N'Producción Acuicola y Cunícola', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (286, N'Salud Pública Veterinaria', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (287, N'Inspección de Productos de Origen Animal', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (288, N'Cliníca y Producción de Bovinos', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (289, N'Clínica de Equinos', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (290, N'Enfermedades Infecciosas', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (291, N'Cliníca y Producción de Cerdos', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (292, N'Clínicas de Pequeñas Especies', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (293, N'Fisiopatología de la Reproducción', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (294, N'Legislación y Ética  ', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (295, N'Legislación y Ética Profesional', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (296, N'Clínica y Producción de Aves', 14)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (297, N'Biología General', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (298, N'Anatomía Dental', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (299, N'Anatomía Dental', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (300, N'Anatomía Humana', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (301, N'Histología Embriología de la Cavidad Bucal', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (302, N'Materiales Dentales', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (303, N'Anatomía de Cabeza y Cuello Neuroanatomía', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (304, N'Bioquímica Medica', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (305, N'Microbiología Médica y Oral', 15)
GO
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (306, N'Microbiología Médica y Oral', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (307, N'Oclusión', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (308, N'Oclusión', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (309, N'Medina Interna', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (310, N'Radiología', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (311, N'Ética y Relaciones Humanas', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (312, N'Patología Bucal I', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (313, N'Fisiología Humana', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (314, N'Operatoria Dental', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (316, N'Psicología General Aplicada', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (317, N'Patología Bucal II', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (318, N'Farmacología y Terapéutica', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (319, N'Operatoria Dental II', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (320, N'Odontología Preventiva', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (321, N'Bioseguridad', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (322, N'Prótesis Parcial Fija I', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (323, N'Prótesis Parcial Removible', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (324, N'Prótesis Completa', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (325, N'Periodoncia', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (326, N'Odontopediatría', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (327, N'Ortodoncia', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (328, N'Prótesis Parcial Fija II', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (329, N'Endodoncia', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (330, N'Cirugía Bucal', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (331, N'Periodoncia II', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (332, N'Cliníca de Odontopediatía y Ortodencia I', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (333, N'Clínica de Operatoria Dental I', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (334, N'Clínica Prostodoncia', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (335, N'Clínica Cirugía Bucal I', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (336, N'Clínica de Periodoncia', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (337, N'Clínica de Diagnostico Bucal', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (338, N'Clínica de Operatoria Dental II', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (339, N'Clínica Operatoria Dental II', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (340, N'Clínica de Prostodoncia II', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (341, N'Clínica de Endoncia II', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (342, N'Clínica Cirugía Bucal II', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (343, N'Clínica de Periodoncia II', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (344, N'Clínica de Diagnostico Bucal II', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (345, N'Clínica de Odontopediatria y Ortodoncia III', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (346, N'Clínica de Operatoria Dental III', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (347, N'Clínica de Prostodoncia III', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (348, N'Clínica de Endoncia III', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (349, N'Clínica Cirugía Bucal III', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (350, N'Clínica de Periodoncia III', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (351, N'Clínica de Diagnostico Bucal III', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (352, N'Práctica Integral en el Adulto I', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (353, N'Prática Integral en el Niño', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (354, N'Investigación I', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (355, N'Práctica Integral en el Adulto II', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (356, N'Práctica Comunitaria I', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (357, N'Investigación II', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (358, N'Odontología Legal y Forense', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (359, N'Odontología Integral Orientada', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (360, N'Práctica Comunitaria II', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (361, N'Investigación III', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (362, N'Administración de Consultorios', 15)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (363, N'Ciencias Básicas', 16)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (364, N'Radiología y Fotografía Clínica', 16)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (365, N'Metodología de la Investigación I', 16)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (366, N'Pre-Clínica de Endodoncia', 16)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (367, N'Discusión de casos Clínicos', 16)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (368, N'Metodología de la Investigación II', 16)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (369, N'Clínica de Endoncia I', 16)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (370, N'Cirugía Endodóntica', 16)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (371, N'Discusión de casos Clínicos II', 16)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (372, N'Metodología de la Investigación III', 16)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (373, N'Química General I', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (374, N'Matemáticas para Quimicos I', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (375, N'Seguiridad Y Salud Industrial', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (376, N'Informática Básica e Internet', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (377, N'Química General II', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (378, N'Química Orgánica I', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (379, N'Matemáticas para Quimicos II', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (380, N'Química Inorganica', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (381, N'Análisis Cualitativo', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (382, N'Química Orgánica II', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (383, N'Técnicas de Redacción e Investigación', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (384, N'Analisís Cuantitativo', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (385, N'Química Orgánica II', 1)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (386, N'Química Orgánica III', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (387, N'Fisicoquímica', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (388, N'Analisís Instrumental I', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (389, N'Botánica Farmacéutica', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (390, N'Analisís Instrumental II', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (391, N'Microbiología Industrial', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (392, N'Farmacognosia', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (393, N'Analisís Bromatológia', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (394, N'Fisiología', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (395, N'Bioestadistica para Químicos', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (396, N'Ecología y Medio Ambiente', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (397, N'Farmaco Químico', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (398, N'Farmaco Químico', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (399, N'Farmacotecnia', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (400, N'Química Industrial y Aprovechamiento de Recursos Naturales', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (401, N'Administracón Farmaceutico', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (402, N'Mercadeo Farmacéutico', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (403, N'Ética y Lesgislación Farmaceutica', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (404, N'Control de Calidad de Productos Farmacéuticos de Uso Humano y Veterinario I', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (405, N'Control de Calidad de Productos Farmacéuticos de Uso Humano y Veterinario I', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (406, N'Farmacia Industrial I', 17)
GO
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (407, N'Farmacia Hospitalaria', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (408, N'Química Legal y Analisis Toxicológico', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (409, N'Seminario de Investigación Tesis', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (410, N'Control de Calidad de Productos Farmacéuticos de Uso Humano y Veterinario II', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (411, N'Farmacia Industrial II', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (412, N'Farmacia Comunitaria', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (413, N'Biofarmacia y Bioequivalencia', 17)
INSERT [dbo].[Materias] ([IdMateria], [NombreMateria], [IdCarrera]) VALUES (414, N'Investigación de Desarollo', 17)
GO
INSERT [dbo].[Tutor] ([IdTutor], [NombreTutor]) VALUES (1, N'Yoel Almirez')
INSERT [dbo].[Tutor] ([IdTutor], [NombreTutor]) VALUES (2, N'Sandra Portillo')
INSERT [dbo].[Tutor] ([IdTutor], [NombreTutor]) VALUES (3, N'Cynthia Aguilar')
INSERT [dbo].[Tutor] ([IdTutor], [NombreTutor]) VALUES (4, N'Ricardo Campos')
INSERT [dbo].[Tutor] ([IdTutor], [NombreTutor]) VALUES (5, N'Luis Reyes')
INSERT [dbo].[Tutor] ([IdTutor], [NombreTutor]) VALUES (6, N'Teresa Ramírez')
INSERT [dbo].[Tutor] ([IdTutor], [NombreTutor]) VALUES (7, N'Katherine Gomez')
INSERT [dbo].[Tutor] ([IdTutor], [NombreTutor]) VALUES (8, N'Sandor Alfredo')
INSERT [dbo].[Tutor] ([IdTutor], [NombreTutor]) VALUES (9, N'Erick Pacheco')
INSERT [dbo].[Tutor] ([IdTutor], [NombreTutor]) VALUES (10, N'Sandy Cortez')
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Usuario], [Contraseña], [Fecha]) VALUES (1, N'Admin', N'Admin', CAST(N'2021-11-06' AS Date))
INSERT [dbo].[Usuario] ([IdUsuario], [Usuario], [Contraseña], [Fecha]) VALUES (2, N'Usam', N'Usam', CAST(N'2021-11-06' AS Date))
GO
ALTER TABLE [dbo].[Carreras]  WITH CHECK ADD  CONSTRAINT [fk_Maestros] FOREIGN KEY([IdMaestro])
REFERENCES [dbo].[Maestros] ([IdMaestro])
GO
ALTER TABLE [dbo].[Carreras] CHECK CONSTRAINT [fk_Maestros]
GO
ALTER TABLE [dbo].[Maestros]  WITH CHECK ADD  CONSTRAINT [fk_Tutor] FOREIGN KEY([IdTutor])
REFERENCES [dbo].[Tutor] ([IdTutor])
GO
ALTER TABLE [dbo].[Maestros] CHECK CONSTRAINT [fk_Tutor]
GO
ALTER TABLE [dbo].[Materias]  WITH CHECK ADD  CONSTRAINT [fk_Carreras] FOREIGN KEY([IdCarrera])
REFERENCES [dbo].[Carreras] ([IdCarrera])
GO
ALTER TABLE [dbo].[Materias] CHECK CONSTRAINT [fk_Carreras]
GO
ALTER TABLE [dbo].[Rol_BD]  WITH CHECK ADD  CONSTRAINT [fk_RolServidor] FOREIGN KEY([IdRolServidor])
REFERENCES [dbo].[Rol_Servidor] ([IdRolServidor])
GO
ALTER TABLE [dbo].[Rol_BD] CHECK CONSTRAINT [fk_RolServidor]
GO
ALTER TABLE [dbo].[Rol_Servidor]  WITH CHECK ADD  CONSTRAINT [fk_TipoUsuario] FOREIGN KEY([IdTipoUsuario])
REFERENCES [dbo].[Tipo_Usuario] ([IdTipoUsuario])
GO
ALTER TABLE [dbo].[Rol_Servidor] CHECK CONSTRAINT [fk_TipoUsuario]
GO
ALTER TABLE [dbo].[Tipo_Usuario]  WITH CHECK ADD  CONSTRAINT [fk_Tutor2] FOREIGN KEY([IdTutor])
REFERENCES [dbo].[Tutor] ([IdTutor])
GO
ALTER TABLE [dbo].[Tipo_Usuario] CHECK CONSTRAINT [fk_Tutor2]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [fk_Usuario_Rol_BD] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [fk_Usuario_Rol_BD]
GO
ALTER TABLE [dbo].[Usuario_Rol_BD]  WITH CHECK ADD  CONSTRAINT [fk_UsuarioRolBD] FOREIGN KEY([IdUsuarioRolServidor])
REFERENCES [dbo].[Usuario_Rol_Servidor] ([IdUsuarioRolServidor])
GO
ALTER TABLE [dbo].[Usuario_Rol_BD] CHECK CONSTRAINT [fk_UsuarioRolBD]
GO
ALTER TABLE [dbo].[Usuario_Rol_Servidor]  WITH CHECK ADD  CONSTRAINT [fk_RolBD] FOREIGN KEY([IdRolBD])
REFERENCES [dbo].[Rol_BD] ([IdRolBD])
GO
ALTER TABLE [dbo].[Usuario_Rol_Servidor] CHECK CONSTRAINT [fk_RolBD]
GO
USE [master]
GO
ALTER DATABASE [Tutores] SET  READ_WRITE 
GO
