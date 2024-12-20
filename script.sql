USE [master]
GO
/****** Object:  Database [Prison_Khi]    Script Date: 12/7/2020 5:00:17 AM ******/
CREATE DATABASE [Prison_Khi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prison_Khi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Prison_Khi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Prison_Khi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Prison_Khi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Prison_Khi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prison_Khi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Prison_Khi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Prison_Khi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Prison_Khi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Prison_Khi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Prison_Khi] SET ARITHABORT OFF 
GO
ALTER DATABASE [Prison_Khi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Prison_Khi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Prison_Khi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Prison_Khi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Prison_Khi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Prison_Khi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Prison_Khi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Prison_Khi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Prison_Khi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Prison_Khi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Prison_Khi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Prison_Khi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Prison_Khi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Prison_Khi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Prison_Khi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Prison_Khi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Prison_Khi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Prison_Khi] SET RECOVERY FULL 
GO
ALTER DATABASE [Prison_Khi] SET  MULTI_USER 
GO
ALTER DATABASE [Prison_Khi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Prison_Khi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Prison_Khi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Prison_Khi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Prison_Khi] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Prison_Khi', N'ON'
GO
ALTER DATABASE [Prison_Khi] SET QUERY_STORE = OFF
GO
USE [Prison_Khi]
GO
/****** Object:  Table [dbo].[Lawyer]    Script Date: 12/7/2020 5:00:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lawyer](
	[LawyerID] [varchar](8) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Contact] [varchar](100) NULL,
	[LawFirm] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[LawyerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Crime]    Script Date: 12/7/2020 5:00:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crime](
	[CrimeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[MinSentence] [varchar](100) NULL,
	[MaxSentence] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CrimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prisoner_Lawyers]    Script Date: 12/7/2020 5:00:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prisoner_Lawyers](
	[LawyerID] [varchar](8) NOT NULL,
	[Prisoner_BATCH_NO] [varchar](8) NOT NULL,
	[DateOfAppointment] [date] NOT NULL,
	[StateAppointed] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[LawyerID] ASC,
	[Prisoner_BATCH_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrisonerCrimeHistory]    Script Date: 12/7/2020 5:00:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrisonerCrimeHistory](
	[DateOfCrime] [date] NOT NULL,
	[CrimeID] [int] NOT NULL,
	[Prisoner_BATCH_NO] [varchar](8) NOT NULL,
	[StatusID] [int] NOT NULL,
	[StartSentence] [date] NULL,
	[EndSentence] [date] NULL,
	[Final_TrialNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateOfCrime] ASC,
	[CrimeID] ASC,
	[Prisoner_BATCH_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Lawyers_who_handled_Murder_cases]    Script Date: 12/7/2020 5:00:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Lawyers_who_handled_Murder_cases]
as
(select FirstName+' '+LastName as 'Murder_Lawyers' from Lawyer
where LawyerID in (select LawyerID from Prisoner_Lawyers where Prisoner_BATCH_NO in (select Prisoner_BATCH_NO from PrisonerCrimeHistory where CrimeID = (select CrimeID From Crime where [Description] = 'Murder'))) )
GO
/****** Object:  Table [dbo].[Judge]    Script Date: 12/7/2020 5:00:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Judge](
	[JudgeID] [int] NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Contact] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[JudgeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusPrisoner_CurrentCrime]    Script Date: 12/7/2020 5:00:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusPrisoner_CurrentCrime](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trial]    Script Date: 12/7/2020 5:00:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trial](
	[TrialNo] [int] IDENTITY(1,1) NOT NULL,
	[Prisoner_Lawyers_Prisoner_BATCH_NO] [varchar](8) NOT NULL,
	[Prisoner_Lawyers_LawyerID] [varchar](8) NOT NULL,
	[JudgeID] [int] NOT NULL,
	[CourtID] [int] NOT NULL,
	[Verdict] [varchar](255) NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK__Trial__EF13EEEEFFC7DAB2] PRIMARY KEY CLUSTERED 
(
	[TrialNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Judges who handled cases whose prisoners are released]    Script Date: 12/7/2020 5:00:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Judges who handled cases whose prisoners are released]
as
(select FirstName+' '+LastName as 'JudgesWhoVerdicted' from Judge
where JudgeID in (select JudgeID from Trial where Prisoner_Lawyers_Prisoner_BATCH_NO in (select Prisoner_BATCH_NO from PrisonerCrimeHistory where StatusID = (select StatusID From StatusPrisoner_CurrentCrime where [Description] = 'Released'))) )
GO
/****** Object:  Table [dbo].[Prisoner]    Script Date: 12/7/2020 5:00:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prisoner](
	[Prisoner_BATCH_NO] [varchar](8) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[DateOfBirth] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Prisoner_BATCH_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PrisonerSearch]    Script Date: 12/7/2020 5:00:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[PrisonerSearch]
as
select pri.Prisoner_BATCH_NO, pri.FirstName, pri.LastName, priL.LawyerID, tri.TrialNo, tri.JudgeID, pch.CrimeID, pch.StartSentence, pch.StatusID from Prisoner pri LEFT JOIN Prisoner_Lawyers priL on pri.Prisoner_BATCH_NO = priL.Prisoner_BATCH_NO 
LEFT JOIN  Trial tri on priL.LawyerID = tri.Prisoner_Lawyers_LawyerID and priL.Prisoner_BATCH_NO = tri.Prisoner_Lawyers_Prisoner_BATCH_NO
LEFT JOIN PrisonerCrimeHistory pch on pri.Prisoner_BATCH_NO= pch.Prisoner_BATCH_NO
GO
/****** Object:  Table [dbo].[City]    Script Date: 12/7/2020 5:00:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[Jails_Count] [int] NULL,
	[Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Court]    Script Date: 12/7/2020 5:00:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Court](
	[CourtID] [int] IDENTITY(1,1) NOT NULL,
	[CityID] [int] NOT NULL,
	[Area] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CourtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District_Jail]    Script Date: 12/7/2020 5:00:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District_Jail](
	[DistrictID] [int] IDENTITY(1,1) NOT NULL,
	[CityId] [int] NOT NULL,
	[DistrictName] [varchar](100) NOT NULL,
	[Capacity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DistrictJail_has_Prisoner]    Script Date: 12/7/2020 5:00:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DistrictJail_has_Prisoner](
	[DJP_ID] [int] IDENTITY(1,1) NOT NULL,
	[DistrictID] [int] NOT NULL,
	[PrisonerID] [varchar](8) NOT NULL,
	[TransferredTo_DJ] [int] NULL,
	[DateofArrival] [date] NOT NULL,
 CONSTRAINT [PK__District__4B06EF2D84484CED] PRIMARY KEY CLUSTERED 
(
	[DJP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 12/7/2020 5:00:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[BATCH_NO] [varchar](8) NOT NULL,
	[DistrictID] [int] NOT NULL,
	[ReportsTo] [varchar](8) NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Contact] [varchar](100) NULL,
	[Designation] [varchar](100) NOT NULL,
	[Password_Access] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Staff__216FC02C109B570A] PRIMARY KEY CLUSTERED 
(
	[BATCH_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [Jails_Count], [Name]) VALUES (1, 5, N'Karachi')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Court] ON 

INSERT [dbo].[Court] ([CourtID], [CityID], [Area]) VALUES (1, 1, N'Gulistan-e-Johar')
INSERT [dbo].[Court] ([CourtID], [CityID], [Area]) VALUES (2, 1, N'Gulshan-e-Iqbal')
INSERT [dbo].[Court] ([CourtID], [CityID], [Area]) VALUES (3, 1, N'Defence')
INSERT [dbo].[Court] ([CourtID], [CityID], [Area]) VALUES (4, 1, N'Lyari')
INSERT [dbo].[Court] ([CourtID], [CityID], [Area]) VALUES (5, 1, N'Clifton')
SET IDENTITY_INSERT [dbo].[Court] OFF
GO
SET IDENTITY_INSERT [dbo].[Crime] ON 

INSERT [dbo].[Crime] ([CrimeID], [Description], [MinSentence], [MaxSentence]) VALUES (1, N'Theft', N'2 weeks', N'8 years')
INSERT [dbo].[Crime] ([CrimeID], [Description], [MinSentence], [MaxSentence]) VALUES (2, N'Murder', N'Life Sentence', N'Capital Punishment')
INSERT [dbo].[Crime] ([CrimeID], [Description], [MinSentence], [MaxSentence]) VALUES (3, N'Corporate Fraud', N'2 months', N'16 years')
INSERT [dbo].[Crime] ([CrimeID], [Description], [MinSentence], [MaxSentence]) VALUES (4, N'Domestic Abuse', N'2 months', N'18 months')
INSERT [dbo].[Crime] ([CrimeID], [Description], [MinSentence], [MaxSentence]) VALUES (5, N'Tax Evasion', N'2 weeks', N'13 years')
INSERT [dbo].[Crime] ([CrimeID], [Description], [MinSentence], [MaxSentence]) VALUES (6, N'Official secrets act violation', N'3 years', N'70 years')
SET IDENTITY_INSERT [dbo].[Crime] OFF
GO
SET IDENTITY_INSERT [dbo].[District_Jail] ON 

INSERT [dbo].[District_Jail] ([DistrictID], [CityId], [DistrictName], [Capacity]) VALUES (1, 1, N'Gulistan-e-Johar', 60)
INSERT [dbo].[District_Jail] ([DistrictID], [CityId], [DistrictName], [Capacity]) VALUES (2, 1, N'Gulshan-e-Iqbal', 100)
INSERT [dbo].[District_Jail] ([DistrictID], [CityId], [DistrictName], [Capacity]) VALUES (3, 1, N'Defence', 200)
INSERT [dbo].[District_Jail] ([DistrictID], [CityId], [DistrictName], [Capacity]) VALUES (4, 1, N'Liyari', 600)
INSERT [dbo].[District_Jail] ([DistrictID], [CityId], [DistrictName], [Capacity]) VALUES (5, 1, N'Clifton', 300)
SET IDENTITY_INSERT [dbo].[District_Jail] OFF
GO
SET IDENTITY_INSERT [dbo].[DistrictJail_has_Prisoner] ON 

INSERT [dbo].[DistrictJail_has_Prisoner] ([DJP_ID], [DistrictID], [PrisonerID], [TransferredTo_DJ], [DateofArrival]) VALUES (1, 1, N'XXXX0001', NULL, CAST(N'2001-05-01' AS Date))
INSERT [dbo].[DistrictJail_has_Prisoner] ([DJP_ID], [DistrictID], [PrisonerID], [TransferredTo_DJ], [DateofArrival]) VALUES (2, 5, N'XXXX0003', NULL, CAST(N'2013-03-05' AS Date))
INSERT [dbo].[DistrictJail_has_Prisoner] ([DJP_ID], [DistrictID], [PrisonerID], [TransferredTo_DJ], [DateofArrival]) VALUES (3, 4, N'XXXX0006', NULL, CAST(N'2012-01-01' AS Date))
INSERT [dbo].[DistrictJail_has_Prisoner] ([DJP_ID], [DistrictID], [PrisonerID], [TransferredTo_DJ], [DateofArrival]) VALUES (4, 3, N'XXXX0007', NULL, CAST(N'2005-10-20' AS Date))
INSERT [dbo].[DistrictJail_has_Prisoner] ([DJP_ID], [DistrictID], [PrisonerID], [TransferredTo_DJ], [DateofArrival]) VALUES (5, 1, N'XXXX0010', NULL, CAST(N'2019-05-05' AS Date))
SET IDENTITY_INSERT [dbo].[DistrictJail_has_Prisoner] OFF
GO
INSERT [dbo].[Judge] ([JudgeID], [FirstName], [LastName], [Contact]) VALUES (1111, N'Jennie', N'Jane', N'03331234567')
INSERT [dbo].[Judge] ([JudgeID], [FirstName], [LastName], [Contact]) VALUES (1112, N'Lalisa', N'Manoban', N'03331234576')
INSERT [dbo].[Judge] ([JudgeID], [FirstName], [LastName], [Contact]) VALUES (1113, N'Kim', N'Jisoo', N'03331234675')
INSERT [dbo].[Judge] ([JudgeID], [FirstName], [LastName], [Contact]) VALUES (1114, N'Roseanne', N'Park', N'03331234765')
INSERT [dbo].[Judge] ([JudgeID], [FirstName], [LastName], [Contact]) VALUES (1115, N'Park', N'Miyeon', N'03331235764')
GO
INSERT [dbo].[Lawyer] ([LawyerID], [FirstName], [LastName], [Contact], [LawFirm]) VALUES (N'YYYY0001', N'Kim', N'Namjoon', N'03331245345', N'State Affairs Co.')
INSERT [dbo].[Lawyer] ([LawyerID], [FirstName], [LastName], [Contact], [LawFirm]) VALUES (N'YYYY0002', N'Park', N'Jimin', N'03331245346', N'Attorney Town Bros.')
INSERT [dbo].[Lawyer] ([LawyerID], [FirstName], [LastName], [Contact], [LawFirm]) VALUES (N'YYYY0003', N'Kim', N'Seokjin', N'03331258427', N'Ground Law Creations')
INSERT [dbo].[Lawyer] ([LawyerID], [FirstName], [LastName], [Contact], [LawFirm]) VALUES (N'YYYY0004', N'Jeon', N'Jungkook', N'03332167854', N'Cushion Fights Co.')
INSERT [dbo].[Lawyer] ([LawyerID], [FirstName], [LastName], [Contact], [LawFirm]) VALUES (N'YYYY0005', N'Min', N'Yoongi', N'03314538758', N'BigHit Labels')
GO
INSERT [dbo].[Prisoner] ([Prisoner_BATCH_NO], [FirstName], [LastName], [DateOfBirth]) VALUES (N'XXXX0001', N'Dialdi', N'Bajwa', CAST(N'1984-11-09' AS Date))
INSERT [dbo].[Prisoner] ([Prisoner_BATCH_NO], [FirstName], [LastName], [DateOfBirth]) VALUES (N'XXXX0002', N'Dibias', N'Kareem', CAST(N'1991-12-30' AS Date))
INSERT [dbo].[Prisoner] ([Prisoner_BATCH_NO], [FirstName], [LastName], [DateOfBirth]) VALUES (N'XXXX0003', N'Pamza', N'Patel', CAST(N'1992-07-23' AS Date))
INSERT [dbo].[Prisoner] ([Prisoner_BATCH_NO], [FirstName], [LastName], [DateOfBirth]) VALUES (N'XXXX0004', N'Deeam', N'Michael', CAST(N'1977-07-08' AS Date))
INSERT [dbo].[Prisoner] ([Prisoner_BATCH_NO], [FirstName], [LastName], [DateOfBirth]) VALUES (N'XXXX0005', N'Maudurnty', N'Muriel', CAST(N'1999-01-05' AS Date))
INSERT [dbo].[Prisoner] ([Prisoner_BATCH_NO], [FirstName], [LastName], [DateOfBirth]) VALUES (N'XXXX0006', N'Estatestix', N'Lestrade', CAST(N'1990-04-14' AS Date))
INSERT [dbo].[Prisoner] ([Prisoner_BATCH_NO], [FirstName], [LastName], [DateOfBirth]) VALUES (N'XXXX0007', N'Linabre', N'Holmes', CAST(N'1985-08-21' AS Date))
INSERT [dbo].[Prisoner] ([Prisoner_BATCH_NO], [FirstName], [LastName], [DateOfBirth]) VALUES (N'XXXX0008', N'Hikmat', N'Shafeeq', CAST(N'1978-07-30' AS Date))
INSERT [dbo].[Prisoner] ([Prisoner_BATCH_NO], [FirstName], [LastName], [DateOfBirth]) VALUES (N'XXXX0009', N'Kareen', N'Saleem', CAST(N'1987-07-20' AS Date))
INSERT [dbo].[Prisoner] ([Prisoner_BATCH_NO], [FirstName], [LastName], [DateOfBirth]) VALUES (N'XXXX0010', N'Ruhama', N'Naeem', CAST(N'2001-12-23' AS Date))
GO
INSERT [dbo].[Prisoner_Lawyers] ([LawyerID], [Prisoner_BATCH_NO], [DateOfAppointment], [StateAppointed]) VALUES (N'YYYY0001', N'XXXX0002', CAST(N'2008-02-02' AS Date), 0)
INSERT [dbo].[Prisoner_Lawyers] ([LawyerID], [Prisoner_BATCH_NO], [DateOfAppointment], [StateAppointed]) VALUES (N'YYYY0001', N'XXXX0006', CAST(N'2012-01-09' AS Date), 1)
INSERT [dbo].[Prisoner_Lawyers] ([LawyerID], [Prisoner_BATCH_NO], [DateOfAppointment], [StateAppointed]) VALUES (N'YYYY0002', N'XXXX0001', CAST(N'2001-08-01' AS Date), 0)
INSERT [dbo].[Prisoner_Lawyers] ([LawyerID], [Prisoner_BATCH_NO], [DateOfAppointment], [StateAppointed]) VALUES (N'YYYY0002', N'XXXX0005', CAST(N'2015-06-03' AS Date), 0)
INSERT [dbo].[Prisoner_Lawyers] ([LawyerID], [Prisoner_BATCH_NO], [DateOfAppointment], [StateAppointed]) VALUES (N'YYYY0002', N'XXXX0010', CAST(N'2019-06-20' AS Date), 1)
INSERT [dbo].[Prisoner_Lawyers] ([LawyerID], [Prisoner_BATCH_NO], [DateOfAppointment], [StateAppointed]) VALUES (N'YYYY0003', N'XXXX0003', CAST(N'2014-01-13' AS Date), 0)
INSERT [dbo].[Prisoner_Lawyers] ([LawyerID], [Prisoner_BATCH_NO], [DateOfAppointment], [StateAppointed]) VALUES (N'YYYY0003', N'XXXX0008', CAST(N'2000-07-18' AS Date), 0)
INSERT [dbo].[Prisoner_Lawyers] ([LawyerID], [Prisoner_BATCH_NO], [DateOfAppointment], [StateAppointed]) VALUES (N'YYYY0003', N'XXXX0009', CAST(N'2013-02-09' AS Date), 1)
INSERT [dbo].[Prisoner_Lawyers] ([LawyerID], [Prisoner_BATCH_NO], [DateOfAppointment], [StateAppointed]) VALUES (N'YYYY0004', N'XXXX0004', CAST(N'2008-08-08' AS Date), 0)
INSERT [dbo].[Prisoner_Lawyers] ([LawyerID], [Prisoner_BATCH_NO], [DateOfAppointment], [StateAppointed]) VALUES (N'YYYY0005', N'XXXX0003', CAST(N'2013-03-13' AS Date), 1)
INSERT [dbo].[Prisoner_Lawyers] ([LawyerID], [Prisoner_BATCH_NO], [DateOfAppointment], [StateAppointed]) VALUES (N'YYYY0005', N'XXXX0007', CAST(N'2005-11-25' AS Date), 1)
GO
INSERT [dbo].[PrisonerCrimeHistory] ([DateOfCrime], [CrimeID], [Prisoner_BATCH_NO], [StatusID], [StartSentence], [EndSentence], [Final_TrialNo]) VALUES (CAST(N'1999-03-23' AS Date), 2, N'XXXX0008', 1, CAST(N'2000-08-01' AS Date), NULL, 10)
INSERT [dbo].[PrisonerCrimeHistory] ([DateOfCrime], [CrimeID], [Prisoner_BATCH_NO], [StatusID], [StartSentence], [EndSentence], [Final_TrialNo]) VALUES (CAST(N'2000-11-28' AS Date), 2, N'XXXX0001', 2, CAST(N'2001-09-01' AS Date), CAST(N'2021-09-01' AS Date), 2)
INSERT [dbo].[PrisonerCrimeHistory] ([DateOfCrime], [CrimeID], [Prisoner_BATCH_NO], [StatusID], [StartSentence], [EndSentence], [Final_TrialNo]) VALUES (CAST(N'2005-03-03' AS Date), 6, N'XXXX0007', 2, CAST(N'2005-12-25' AS Date), CAST(N'2065-12-25' AS Date), 9)
INSERT [dbo].[PrisonerCrimeHistory] ([DateOfCrime], [CrimeID], [Prisoner_BATCH_NO], [StatusID], [StartSentence], [EndSentence], [Final_TrialNo]) VALUES (CAST(N'2007-11-18' AS Date), 1, N'XXXX0002', 3, CAST(N'2008-02-29' AS Date), CAST(N'2008-06-29' AS Date), 3)
INSERT [dbo].[PrisonerCrimeHistory] ([DateOfCrime], [CrimeID], [Prisoner_BATCH_NO], [StatusID], [StartSentence], [EndSentence], [Final_TrialNo]) VALUES (CAST(N'2008-07-25' AS Date), 3, N'XXXX0004', 3, CAST(N'2008-12-15' AS Date), CAST(N'2009-02-15' AS Date), 5)
INSERT [dbo].[PrisonerCrimeHistory] ([DateOfCrime], [CrimeID], [Prisoner_BATCH_NO], [StatusID], [StartSentence], [EndSentence], [Final_TrialNo]) VALUES (CAST(N'2011-03-06' AS Date), 2, N'XXXX0006', 2, CAST(N'2012-03-01' AS Date), NULL, 8)
INSERT [dbo].[PrisonerCrimeHistory] ([DateOfCrime], [CrimeID], [Prisoner_BATCH_NO], [StatusID], [StartSentence], [EndSentence], [Final_TrialNo]) VALUES (CAST(N'2013-02-02' AS Date), 3, N'XXXX0003', 2, CAST(N'2013-04-01' AS Date), CAST(N'2018-04-01' AS Date), 6)
INSERT [dbo].[PrisonerCrimeHistory] ([DateOfCrime], [CrimeID], [Prisoner_BATCH_NO], [StatusID], [StartSentence], [EndSentence], [Final_TrialNo]) VALUES (CAST(N'2015-04-21' AS Date), 5, N'XXXX0005', 3, CAST(N'2015-07-03' AS Date), CAST(N'2018-07-03' AS Date), 7)
INSERT [dbo].[PrisonerCrimeHistory] ([DateOfCrime], [CrimeID], [Prisoner_BATCH_NO], [StatusID], [StartSentence], [EndSentence], [Final_TrialNo]) VALUES (CAST(N'2019-03-13' AS Date), 4, N'XXXX0010', 4, NULL, NULL, NULL)
GO
INSERT [dbo].[Staff] ([BATCH_NO], [DistrictID], [ReportsTo], [FirstName], [LastName], [Contact], [Designation], [Password_Access]) VALUES (N'VVVV0001', 1, NULL, N'Fizza', N'Rubab ', N'03331231234', N'IG', N'12345678')
INSERT [dbo].[Staff] ([BATCH_NO], [DistrictID], [ReportsTo], [FirstName], [LastName], [Contact], [Designation], [Password_Access]) VALUES (N'VVVV0002', 1, N'VVVV0001', N'Batool', N'Ahmed', N'03332345654', N'Superintendent Jail', N'23456789')
INSERT [dbo].[Staff] ([BATCH_NO], [DistrictID], [ReportsTo], [FirstName], [LastName], [Contact], [Designation], [Password_Access]) VALUES (N'VVVV0003', 1, N'VVVV0001', N'Mubaraka ', N'Shabbir', N'03324537658', N'Policeman', N'34564523')
INSERT [dbo].[Staff] ([BATCH_NO], [DistrictID], [ReportsTo], [FirstName], [LastName], [Contact], [Designation], [Password_Access]) VALUES (N'VVVV0004', 2, NULL, N'Adnan ', N'Asif', N'03315869305', N'IG', N'23574645')
INSERT [dbo].[Staff] ([BATCH_NO], [DistrictID], [ReportsTo], [FirstName], [LastName], [Contact], [Designation], [Password_Access]) VALUES (N'VVVV0005', 2, N'VVVV0004', N'Sameer', N'Pervez', N'03365497894', N'Medical Officer', N'32346754')
INSERT [dbo].[Staff] ([BATCH_NO], [DistrictID], [ReportsTo], [FirstName], [LastName], [Contact], [Designation], [Password_Access]) VALUES (N'VVVV0006', 2, N'VVVV0004', N'Aqib', N'Khan', N'033643956783', N'Superintendint', N'76345897')
INSERT [dbo].[Staff] ([BATCH_NO], [DistrictID], [ReportsTo], [FirstName], [LastName], [Contact], [Designation], [Password_Access]) VALUES (N'VVVV0007', 3, NULL, N'Ayesha ', N'Azhar', N'03326948579', N'IG', N'23080548')
INSERT [dbo].[Staff] ([BATCH_NO], [DistrictID], [ReportsTo], [FirstName], [LastName], [Contact], [Designation], [Password_Access]) VALUES (N'VVVV0008', 3, N'VVVV0007', N'Warda', N'Haider', N'03339934589', N'Law Officer', N'49853958')
INSERT [dbo].[Staff] ([BATCH_NO], [DistrictID], [ReportsTo], [FirstName], [LastName], [Contact], [Designation], [Password_Access]) VALUES (N'VVVV0009', 3, N'VVVV0007', N'Khizra ', N'Ishaq', N'03354859358', N'Police Woman', N'12345678')
INSERT [dbo].[Staff] ([BATCH_NO], [DistrictID], [ReportsTo], [FirstName], [LastName], [Contact], [Designation], [Password_Access]) VALUES (N'VVVV0010', 4, NULL, N'Hafsa ', N'Laeeq', N'03335670809', N'IG', N'23456789')
INSERT [dbo].[Staff] ([BATCH_NO], [DistrictID], [ReportsTo], [FirstName], [LastName], [Contact], [Designation], [Password_Access]) VALUES (N'VVVV0011', 4, N'VVVV0010', N'Amna', N'Khurram', N'03345678090', N'Drafts Woman', N'34567890')
INSERT [dbo].[Staff] ([BATCH_NO], [DistrictID], [ReportsTo], [FirstName], [LastName], [Contact], [Designation], [Password_Access]) VALUES (N'VVVV0012', 4, N'VVVV0010', N'Fazilat', N'Arif', N'03125432678', N'Deputy Inspector', N'45678321')
INSERT [dbo].[Staff] ([BATCH_NO], [DistrictID], [ReportsTo], [FirstName], [LastName], [Contact], [Designation], [Password_Access]) VALUES (N'VVVV0013', 5, NULL, N'Raazia ', N'Shahid', N'03147685435', N'IG', N'76543218')
INSERT [dbo].[Staff] ([BATCH_NO], [DistrictID], [ReportsTo], [FirstName], [LastName], [Contact], [Designation], [Password_Access]) VALUES (N'VVVV0014', 5, N'VVVV0013', N'Sara', N'Naqvi', N'03339985348', N'Superintendint', N'58469320')
INSERT [dbo].[Staff] ([BATCH_NO], [DistrictID], [ReportsTo], [FirstName], [LastName], [Contact], [Designation], [Password_Access]) VALUES (N'VVVV0015', 5, N'VVVV0013', N'Hassan', N'Salman', N'03358745473', N'Policeman', N'54632658')
GO
SET IDENTITY_INSERT [dbo].[StatusPrisoner_CurrentCrime] ON 

INSERT [dbo].[StatusPrisoner_CurrentCrime] ([StatusID], [Description]) VALUES (1, N'On Parole')
INSERT [dbo].[StatusPrisoner_CurrentCrime] ([StatusID], [Description]) VALUES (2, N'Imprisoned')
INSERT [dbo].[StatusPrisoner_CurrentCrime] ([StatusID], [Description]) VALUES (3, N'Released')
INSERT [dbo].[StatusPrisoner_CurrentCrime] ([StatusID], [Description]) VALUES (4, N'Waiting for Trial')
SET IDENTITY_INSERT [dbo].[StatusPrisoner_CurrentCrime] OFF
GO
SET IDENTITY_INSERT [dbo].[Trial] ON 

INSERT [dbo].[Trial] ([TrialNo], [Prisoner_Lawyers_Prisoner_BATCH_NO], [Prisoner_Lawyers_LawyerID], [JudgeID], [CourtID], [Verdict], [Date]) VALUES (1, N'XXXX0001', N'YYYY0002', 1111, 1, N'Life imprisonment', CAST(N'2001-09-01' AS Date))
INSERT [dbo].[Trial] ([TrialNo], [Prisoner_Lawyers_Prisoner_BATCH_NO], [Prisoner_Lawyers_LawyerID], [JudgeID], [CourtID], [Verdict], [Date]) VALUES (2, N'XXXX0001', N'YYYY0002', 1111, 1, N'20 years imprisonment due to murder on revenge - the victim had caused suicide of culprits best friend', CAST(N'2003-04-13' AS Date))
INSERT [dbo].[Trial] ([TrialNo], [Prisoner_Lawyers_Prisoner_BATCH_NO], [Prisoner_Lawyers_LawyerID], [JudgeID], [CourtID], [Verdict], [Date]) VALUES (3, N'XXXX0002', N'YYYY0001', 1112, 2, N'4 months - subject to leniency showed by victim of theft', CAST(N'2008-02-29' AS Date))
INSERT [dbo].[Trial] ([TrialNo], [Prisoner_Lawyers_Prisoner_BATCH_NO], [Prisoner_Lawyers_LawyerID], [JudgeID], [CourtID], [Verdict], [Date]) VALUES (4, N'XXXX0003', N'YYYY0005', 1114, 5, N'7 years - charges pressed by opposing corporate company and 2 million rupees fine', CAST(N'2013-04-01' AS Date))
INSERT [dbo].[Trial] ([TrialNo], [Prisoner_Lawyers_Prisoner_BATCH_NO], [Prisoner_Lawyers_LawyerID], [JudgeID], [CourtID], [Verdict], [Date]) VALUES (5, N'XXXX0004', N'YYYY0004', 1115, 3, N'18 Million rupees fine pressed by Co-landings co due to cyber fraud - 2 months imprisonment', CAST(N'2008-12-15' AS Date))
INSERT [dbo].[Trial] ([TrialNo], [Prisoner_Lawyers_Prisoner_BATCH_NO], [Prisoner_Lawyers_LawyerID], [JudgeID], [CourtID], [Verdict], [Date]) VALUES (6, N'XXXX0003', N'YYYY0003', 1114, 5, N'Two years reduced from sentence - sue charges reduced to 1 million', CAST(N'2014-05-13' AS Date))
INSERT [dbo].[Trial] ([TrialNo], [Prisoner_Lawyers_Prisoner_BATCH_NO], [Prisoner_Lawyers_LawyerID], [JudgeID], [CourtID], [Verdict], [Date]) VALUES (7, N'XXXX0005', N'YYYY0002', 1113, 4, N'3 years jail because of corporal activities on taxayable resourses yet taxes are nonpaid by 7 years', CAST(N'2015-07-03' AS Date))
INSERT [dbo].[Trial] ([TrialNo], [Prisoner_Lawyers_Prisoner_BATCH_NO], [Prisoner_Lawyers_LawyerID], [JudgeID], [CourtID], [Verdict], [Date]) VALUES (8, N'XXXX0006', N'YYYY0001', 1113, 4, N'Life imprisonment', CAST(N'2012-03-01' AS Date))
INSERT [dbo].[Trial] ([TrialNo], [Prisoner_Lawyers_Prisoner_BATCH_NO], [Prisoner_Lawyers_LawyerID], [JudgeID], [CourtID], [Verdict], [Date]) VALUES (9, N'XXXX0007', N'YYYY0005', 1115, 3, N'60 years of jail due to leak of classified government secrets to opposing agency', CAST(N'2005-12-25' AS Date))
INSERT [dbo].[Trial] ([TrialNo], [Prisoner_Lawyers_Prisoner_BATCH_NO], [Prisoner_Lawyers_LawyerID], [JudgeID], [CourtID], [Verdict], [Date]) VALUES (10, N'XXXX0008', N'YYYY0003', 1111, 1, N'Life imprisonment due to murder due to anger caused by excess alcohol consumption', CAST(N'2000-08-01' AS Date))
INSERT [dbo].[Trial] ([TrialNo], [Prisoner_Lawyers_Prisoner_BATCH_NO], [Prisoner_Lawyers_LawyerID], [JudgeID], [CourtID], [Verdict], [Date]) VALUES (11, N'XXXX0009', N'YYYY0003', 1114, 5, N'Trial Suspended due to lack of evidence on prosecutions side - for two weeks', CAST(N'2013-03-15' AS Date))
INSERT [dbo].[Trial] ([TrialNo], [Prisoner_Lawyers_Prisoner_BATCH_NO], [Prisoner_Lawyers_LawyerID], [JudgeID], [CourtID], [Verdict], [Date]) VALUES (12, N'XXXX0009', N'YYYY0003', 1114, 5, N'Two months given to the defendants victim to get better by psychological treatment for testament in court', CAST(N'2013-03-29' AS Date))
INSERT [dbo].[Trial] ([TrialNo], [Prisoner_Lawyers_Prisoner_BATCH_NO], [Prisoner_Lawyers_LawyerID], [JudgeID], [CourtID], [Verdict], [Date]) VALUES (13, N'XXXX0009', N'YYYY0003', 1114, 5, N'Defendant claimed innocent', CAST(N'2013-05-29' AS Date))
SET IDENTITY_INSERT [dbo].[Trial] OFF
GO
/****** Object:  Index [Court_FKIndex1]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [Court_FKIndex1] ON [dbo].[Court]
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_10]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_10] ON [dbo].[Court]
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [District_Jail_FKIndex1]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [District_Jail_FKIndex1] ON [dbo].[District_Jail]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_02]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_02] ON [dbo].[District_Jail]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [DistrictJail_has_Prisoner_FKIndex2]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [DistrictJail_has_Prisoner_FKIndex2] ON [dbo].[DistrictJail_has_Prisoner]
(
	[PrisonerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [DistrictJail_has_Prisoner_FKIndex3]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [DistrictJail_has_Prisoner_FKIndex3] ON [dbo].[DistrictJail_has_Prisoner]
(
	[TransferredTo_DJ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_10]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_10] ON [dbo].[DistrictJail_has_Prisoner]
(
	[PrisonerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_17]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_17] ON [dbo].[DistrictJail_has_Prisoner]
(
	[DistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_19]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_19] ON [dbo].[DistrictJail_has_Prisoner]
(
	[TransferredTo_DJ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_08]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_08] ON [dbo].[Prisoner_Lawyers]
(
	[LawyerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_09]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_09] ON [dbo].[Prisoner_Lawyers]
(
	[Prisoner_BATCH_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Lawyer_has_Prisoner_FKIndex1]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [Lawyer_has_Prisoner_FKIndex1] ON [dbo].[Prisoner_Lawyers]
(
	[LawyerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Lawyer_has_Prisoner_FKIndex2]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [Lawyer_has_Prisoner_FKIndex2] ON [dbo].[Prisoner_Lawyers]
(
	[Prisoner_BATCH_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_14]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_14] ON [dbo].[PrisonerCrimeHistory]
(
	[CrimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_15]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_15] ON [dbo].[PrisonerCrimeHistory]
(
	[Prisoner_BATCH_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_16]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_16] ON [dbo].[PrisonerCrimeHistory]
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PrisonerCrimeHistory_FKIndex1]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [PrisonerCrimeHistory_FKIndex1] ON [dbo].[PrisonerCrimeHistory]
(
	[CrimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PrisonerCrimeHistory_FKIndex2]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [PrisonerCrimeHistory_FKIndex2] ON [dbo].[PrisonerCrimeHistory]
(
	[Prisoner_BATCH_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PrisonerCrimeHistory_FKIndex3]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [PrisonerCrimeHistory_FKIndex3] ON [dbo].[PrisonerCrimeHistory]
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_01]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_01] ON [dbo].[Staff]
(
	[ReportsTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_03]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_03] ON [dbo].[Staff]
(
	[DistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Staff_FKIndex1]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [Staff_FKIndex1] ON [dbo].[Staff]
(
	[ReportsTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Staff_FKIndex2]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [Staff_FKIndex2] ON [dbo].[Staff]
(
	[DistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_11]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_11] ON [dbo].[Trial]
(
	[CourtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_12]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_12] ON [dbo].[Trial]
(
	[JudgeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_13]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_13] ON [dbo].[Trial]
(
	[Prisoner_Lawyers_LawyerID] ASC,
	[Prisoner_Lawyers_Prisoner_BATCH_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Trial_FKIndex1]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [Trial_FKIndex1] ON [dbo].[Trial]
(
	[CourtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Trial_FKIndex2]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [Trial_FKIndex2] ON [dbo].[Trial]
(
	[JudgeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Trial_FKIndex3]    Script Date: 12/7/2020 5:00:18 AM ******/
CREATE NONCLUSTERED INDEX [Trial_FKIndex3] ON [dbo].[Trial]
(
	[Prisoner_Lawyers_LawyerID] ASC,
	[Prisoner_Lawyers_Prisoner_BATCH_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Court]  WITH CHECK ADD FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[District_Jail]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[DistrictJail_has_Prisoner]  WITH CHECK ADD  CONSTRAINT [FK__DistrictJ__Distr__3E52440B] FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District_Jail] ([DistrictID])
GO
ALTER TABLE [dbo].[DistrictJail_has_Prisoner] CHECK CONSTRAINT [FK__DistrictJ__Distr__3E52440B]
GO
ALTER TABLE [dbo].[DistrictJail_has_Prisoner]  WITH CHECK ADD  CONSTRAINT [FK__DistrictJ__Priso__3F466844] FOREIGN KEY([PrisonerID])
REFERENCES [dbo].[Prisoner] ([Prisoner_BATCH_NO])
GO
ALTER TABLE [dbo].[DistrictJail_has_Prisoner] CHECK CONSTRAINT [FK__DistrictJ__Priso__3F466844]
GO
ALTER TABLE [dbo].[DistrictJail_has_Prisoner]  WITH CHECK ADD  CONSTRAINT [FK__DistrictJ__Trans__403A8C7D] FOREIGN KEY([TransferredTo_DJ])
REFERENCES [dbo].[District_Jail] ([DistrictID])
GO
ALTER TABLE [dbo].[DistrictJail_has_Prisoner] CHECK CONSTRAINT [FK__DistrictJ__Trans__403A8C7D]
GO
ALTER TABLE [dbo].[Prisoner_Lawyers]  WITH CHECK ADD FOREIGN KEY([LawyerID])
REFERENCES [dbo].[Lawyer] ([LawyerID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Prisoner_Lawyers]  WITH CHECK ADD FOREIGN KEY([Prisoner_BATCH_NO])
REFERENCES [dbo].[Prisoner] ([Prisoner_BATCH_NO])
GO
ALTER TABLE [dbo].[PrisonerCrimeHistory]  WITH CHECK ADD FOREIGN KEY([CrimeID])
REFERENCES [dbo].[Crime] ([CrimeID])
GO
ALTER TABLE [dbo].[PrisonerCrimeHistory]  WITH CHECK ADD FOREIGN KEY([Prisoner_BATCH_NO])
REFERENCES [dbo].[Prisoner] ([Prisoner_BATCH_NO])
GO
ALTER TABLE [dbo].[PrisonerCrimeHistory]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[StatusPrisoner_CurrentCrime] ([StatusID])
GO
ALTER TABLE [dbo].[PrisonerCrimeHistory]  WITH CHECK ADD  CONSTRAINT [FK__PrisonerC__Trial__5AEE82B9] FOREIGN KEY([Final_TrialNo])
REFERENCES [dbo].[Trial] ([TrialNo])
GO
ALTER TABLE [dbo].[PrisonerCrimeHistory] CHECK CONSTRAINT [FK__PrisonerC__Trial__5AEE82B9]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK__Staff__DistrictI__48CFD27E] FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District_Jail] ([DistrictID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK__Staff__DistrictI__48CFD27E]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK__Staff__ReportsTo__47DBAE45] FOREIGN KEY([ReportsTo])
REFERENCES [dbo].[Staff] ([BATCH_NO])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK__Staff__ReportsTo__47DBAE45]
GO
ALTER TABLE [dbo].[Trial]  WITH CHECK ADD  CONSTRAINT [FK__Trial__3B75D760] FOREIGN KEY([Prisoner_Lawyers_LawyerID], [Prisoner_Lawyers_Prisoner_BATCH_NO])
REFERENCES [dbo].[Prisoner_Lawyers] ([LawyerID], [Prisoner_BATCH_NO])
GO
ALTER TABLE [dbo].[Trial] CHECK CONSTRAINT [FK__Trial__3B75D760]
GO
ALTER TABLE [dbo].[Trial]  WITH CHECK ADD  CONSTRAINT [FK__Trial__CourtID__398D8EEE] FOREIGN KEY([CourtID])
REFERENCES [dbo].[Court] ([CourtID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Trial] CHECK CONSTRAINT [FK__Trial__CourtID__398D8EEE]
GO
ALTER TABLE [dbo].[Trial]  WITH CHECK ADD  CONSTRAINT [FK__Trial__JudgeID__3A81B327] FOREIGN KEY([JudgeID])
REFERENCES [dbo].[Judge] ([JudgeID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Trial] CHECK CONSTRAINT [FK__Trial__JudgeID__3A81B327]
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableDistrict]    Script Date: 12/7/2020 5:00:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAvailableDistrict] @Prisoner varchar(8)
AS
SELECT DistrictID, DistrictName from District_Jail WHERE DistrictID not in (select DistrictID from DistrictJail_has_Prisoner where PrisonerID = @Prisoner and TransferredTo_DJ is NULL)


GO
/****** Object:  StoredProcedure [dbo].[SelectPrisonerLawyer]    Script Date: 12/7/2020 5:00:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectPrisonerLawyer] @Prisoners varchar(8)
AS
SELECT FirstName+' '+LastName as FullName, LawyerID from Lawyer WHERE LawyerID in (select LawyerID from Prisoner_Lawyers where Prisoner_BATCH_NO = @Prisoners)
GO
/****** Object:  StoredProcedure [dbo].[UpdateCurrentJail]    Script Date: 12/7/2020 5:00:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCurrentJail] @Prisoner varchar(8), @DistrictID INTEGER, @Date DATE 
AS
UPDATE DistrictJail_has_Prisoner 
set TransferredTo_DJ = @DistrictID
where DistrictID in (select DistrictID from DistrictJail_has_Prisoner where PrisonerID = @Prisoner and TransferredTo_DJ is NULL)
insert into DistrictJail_has_Prisoner 
values (@DistrictID, @Prisoner, NULL, @Date)
GO
USE [master]
GO
ALTER DATABASE [Prison_Khi] SET  READ_WRITE 
GO
