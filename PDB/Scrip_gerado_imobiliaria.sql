/****** Object:  Table [dbo].[Zona]    Script Date: 04/12/2015 08:02:02 ******/
DROP TABLE [dbo].[Zona]
GO
/****** Object:  Table [dbo].[Venda]    Script Date: 04/12/2015 08:02:02 ******/
DROP TABLE [dbo].[Venda]
GO
/****** Object:  Table [dbo].[Imovel]    Script Date: 04/12/2015 08:02:02 ******/
DROP TABLE [dbo].[Imovel]
GO
/****** Object:  Table [dbo].[Corretor]    Script Date: 04/12/2015 08:02:02 ******/
DROP TABLE [dbo].[Corretor]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 04/12/2015 08:02:02 ******/
DROP TABLE [dbo].[Cliente]
GO
/****** Object:  Table [dbo].[Bairro]    Script Date: 04/12/2015 08:02:02 ******/
DROP TABLE [dbo].[Bairro]
GO
/****** Object:  Database [Imobiliaria]    Script Date: 04/12/2015 08:02:02 ******/
DROP DATABASE [Imobiliaria]
GO
/****** Object:  Database [Imobiliaria]    Script Date: 04/12/2015 08:02:02 ******/
CREATE DATABASE [Imobiliaria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Imobiliaria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Imobiliaria.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Imobiliaria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Imobiliaria_log.ldf' , SIZE = 5696KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Imobiliaria] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Imobiliaria].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [Imobiliaria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Imobiliaria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Imobiliaria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Imobiliaria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Imobiliaria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Imobiliaria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Imobiliaria] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Imobiliaria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Imobiliaria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Imobiliaria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Imobiliaria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Imobiliaria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Imobiliaria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Imobiliaria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Imobiliaria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Imobiliaria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Imobiliaria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Imobiliaria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Imobiliaria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Imobiliaria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Imobiliaria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Imobiliaria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Imobiliaria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Imobiliaria] SET RECOVERY FULL 
GO
ALTER DATABASE [Imobiliaria] SET  MULTI_USER 
GO
ALTER DATABASE [Imobiliaria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Imobiliaria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Imobiliaria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Imobiliaria] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Imobiliaria', N'ON'
GO
/****** Object:  Table [dbo].[Bairro]    Script Date: 04/12/2015 08:02:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bairro](
	[CodBairro] [int] NOT NULL,
	[Bairro] [nvarchar](50) NULL,
	[CodZona] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 04/12/2015 08:02:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Codigo] [int] NOT NULL,
	[Cliente] [nvarchar](50) NULL,
	[Nascimento] [datetime] NULL,
	[email] [nvarchar](50) NULL,
	[login] [nvarchar](50) NULL,
	[senha] [nvarchar](50) NULL,
	[autorizado] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Corretor]    Script Date: 04/12/2015 08:02:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Corretor](
	[CodCorretor] [int] NOT NULL,
	[Corretor] [nvarchar](50) NULL,
	[Comissao] [float] NULL,
	[Login] [nvarchar](50) NULL,
	[Senha] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Imovel]    Script Date: 04/12/2015 08:02:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imovel](
	[CodImovel] [int] NOT NULL,
	[Imovel] [nvarchar](200) NULL,
	[CodImovelTipo] [int] NULL,
	[Endereco] [nvarchar](200) NULL,
	[Complemento] [nvarchar](50) NULL,
	[CodBairro] [int] NULL,
	[Cidade] [nvarchar](50) NULL,
	[Estado] [nvarchar](2) NULL,
	[QtdQuarto] [int] NULL,
	[QtdSuite] [int] NULL,
	[QtdSala] [int] NULL,
	[QtdBanheiro] [int] NULL,
	[QtdVagaGaragem] [int] NULL,
	[AreaConstruida] [int] NULL,
	[AreaTerreno] [int] NULL,
	[PrecoVenda] [decimal](18, 2) NULL,
	[Disponivel] [nvarchar](50) NULL,
	[Codvendedor] [int] NULL,
	[TipoVendedor] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Venda]    Script Date: 04/12/2015 08:02:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venda](
	[CodVenda] [int] NOT NULL,
	[CodCliente] [int] NOT NULL,
	[CodCorretor] [int] NULL,
	[CodImovel] [int] NULL,
	[Data] [datetime] NULL,
	[Valor] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Zona]    Script Date: 04/12/2015 08:02:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zona](
	[CodZona] [int] NOT NULL,
	[Zona] [nvarchar](50) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[Bairro] ([CodBairro], [Bairro], [CodZona]) VALUES (1, N'PONTA NEGRA', 2)
GO
INSERT [dbo].[Bairro] ([CodBairro], [Bairro], [CodZona]) VALUES (2, N'CAPIM MACIO', 2)
GO
INSERT [dbo].[Bairro] ([CodBairro], [Bairro], [CodZona]) VALUES (3, N'CENTRO', 5)
GO
INSERT [dbo].[Bairro] ([CodBairro], [Bairro], [CodZona]) VALUES (4, N'RIBEIRA', 3)
GO
INSERT [dbo].[Bairro] ([CodBairro], [Bairro], [CodZona]) VALUES (5, N'MORRO BRANCO', 2)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (1, N'ROBERTO NELSON', CAST(N'1959-01-05 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (2, N'BRUCE YOUNG', CAST(N'1959-01-05 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (3, N'KIM LAMBERT', CAST(N'1959-02-14 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (4, N'LESLIE JOHNSON', CAST(N'1959-04-13 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (5, N'PHIL FOREST', CAST(N'1959-04-25 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (6, N'K. J. WESTON', CAST(N'1960-01-25 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (7, N'TERRI LEE', CAST(N'1960-05-08 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (8, N'STEWART HALL', CAST(N'1960-06-11 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (9, N'KATHERINE YOUNG', CAST(N'1960-06-21 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (10, N'CHRIS PAPADOPOULOS', CAST(N'1960-01-09 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (11, N'PETE FISHER', CAST(N'1960-09-19 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (12, N'ANN BENNET', CAST(N'1961-02-08 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (13, N'ROGER DE SOUZA', CAST(N'1961-02-25 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (14, N'JANET BALDWIN', CAST(N'1961-03-28 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (15, N'ROGER REEVES', CAST(N'1961-05-02 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (16, N'WILLIE STANSBURY', CAST(N'1961-05-02 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (17, N'LESLIE PHONG', CAST(N'1961-06-10 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (18, N'ASHOK RAMANATHAN', CAST(N'1961-08-08 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (19, N'WALTER STEADMAN', CAST(N'1961-08-16 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (20, N'CAROL NORDSTROM', CAST(N'1961-10-09 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (21, N'LUKE LEUNG', CAST(N'1962-02-25 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (22, N'SUE ANNE O''BRIEN', CAST(N'1962-03-31 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (23, N'JENNIFER M. BURBANK', CAST(N'1962-04-23 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (24, N'CLAUDIA SUTHERLAND', CAST(N'1962-04-28 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (25, N'DANA BISHOP', CAST(N'1962-06-09 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (26, N'MARY S. MACDONALD', CAST(N'1962-06-09 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (27, N'RANDY WILLIAMS', CAST(N'1962-08-16 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (28, N'OLIVER H. BENDER', CAST(N'1962-10-16 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (29, N'KEVIN COOK', CAST(N'1963-02-09 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (30, N'KELLY BROWN', CAST(N'1963-02-12 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (31, N'YUKI ICHIDA', CAST(N'1963-02-12 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (32, N'MARY PAGE', CAST(N'1963-04-20 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (33, N'BILL PARKER', CAST(N'1963-06-09 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (34, N'TAKASHI YAMAMOTO', CAST(N'1963-07-09 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (35, N'ROBERTO FERRARI', CAST(N'1963-07-20 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (36, N'MICHAEL YANOWSKI', CAST(N'1963-08-17 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (37, N'JACQUES GLON', CAST(N'1963-08-31 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (38, N'SCOTT JOHNSON', CAST(N'1963-09-21 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (39, N'T.J. GREEN', CAST(N'1963-11-09 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (40, N'PIERRE OSBORNE', CAST(N'1964-01-11 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (41, N'JOHN MONTGOMERY', CAST(N'1964-04-06 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Cliente] ([Codigo], [Cliente], [Nascimento], [email], [login], [senha], [autorizado]) VALUES (42, N'MARK GUCKENHEIMER', CAST(N'1964-05-09 00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Corretor] ([CodCorretor], [Corretor], [Comissao], [Login], [Senha]) VALUES (1, N'GEORGE', 1.7, NULL, NULL)
GO
INSERT [dbo].[Corretor] ([CodCorretor], [Corretor], [Comissao], [Login], [Senha]) VALUES (2, N'ALICSSON', 1.5, NULL, NULL)
GO
INSERT [dbo].[Corretor] ([CodCorretor], [Corretor], [Comissao], [Login], [Senha]) VALUES (3, N'FELIPPE', 1.2, NULL, NULL)
GO
INSERT [dbo].[Imovel] ([CodImovel], [Imovel], [CodImovelTipo], [Endereco], [Complemento], [CodBairro], [Cidade], [Estado], [QtdQuarto], [QtdSuite], [QtdSala], [QtdBanheiro], [QtdVagaGaragem], [AreaConstruida], [AreaTerreno], [PrecoVenda], [Disponivel], [Codvendedor], [TipoVendedor]) VALUES (4922, N'Casa de Praia', 1, N'Rua Teste, 1234', N'Casa', 1, N'Natal', N'RN', 3, 1, 2, 2, 2, 200, 500, CAST(200000.00 AS Decimal(18, 2)), N'S', 1, N'1')
GO
INSERT [dbo].[Imovel] ([CodImovel], [Imovel], [CodImovelTipo], [Endereco], [Complemento], [CodBairro], [Cidade], [Estado], [QtdQuarto], [QtdSuite], [QtdSala], [QtdBanheiro], [QtdVagaGaragem], [AreaConstruida], [AreaTerreno], [PrecoVenda], [Disponivel], [Codvendedor], [TipoVendedor]) VALUES (4923, N'Casa de Campo', 2, N'Rua Teste2, 5678', N'Casa', 2, N'Campina Grande', N'PB', 2, 1, 2, 2, 2, 180, 400, CAST(180000.00 AS Decimal(18, 2)), N'S', 1, N'1')
GO
INSERT [dbo].[Imovel] ([CodImovel], [Imovel], [CodImovelTipo], [Endereco], [Complemento], [CodBairro], [Cidade], [Estado], [QtdQuarto], [QtdSuite], [QtdSala], [QtdBanheiro], [QtdVagaGaragem], [AreaConstruida], [AreaTerreno], [PrecoVenda], [Disponivel], [Codvendedor], [TipoVendedor]) VALUES (4924, N'Apto 3Q', 3, N'Rua Teste3, 910', N'Apto 101', 3, N'Natal', N'RN', 3, 1, 2, 2, 2, 110, 300, CAST(120000.00 AS Decimal(18, 2)), N'S', 2, N'2')
GO
INSERT [dbo].[Venda] ([CodVenda], [CodCliente], [CodCorretor], [CodImovel], [Data], [Valor]) VALUES (249, 1, 1, 1, CAST(N'2006-08-01 00:00:00.000' AS DateTime), 185000)
GO
INSERT [dbo].[Venda] ([CodVenda], [CodCliente], [CodCorretor], [CodImovel], [Data], [Valor]) VALUES (250, 2, 2, 2, CAST(N'2006-08-10 00:00:00.000' AS DateTime), 175000)
GO
INSERT [dbo].[Zona] ([CodZona], [Zona]) VALUES (1, N'NORTE')
GO
INSERT [dbo].[Zona] ([CodZona], [Zona]) VALUES (2, N'SUL')
GO
INSERT [dbo].[Zona] ([CodZona], [Zona]) VALUES (3, N'LESTE')
GO
INSERT [dbo].[Zona] ([CodZona], [Zona]) VALUES (4, N'OESTE')
GO
INSERT [dbo].[Zona] ([CodZona], [Zona]) VALUES (5, N'CENTRO')
GO
ALTER DATABASE [Imobiliaria] SET  READ_WRITE 
GO
