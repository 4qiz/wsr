CREATE DATABASE [MisChampionship]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MisChampionship', FILENAME = N'D:\ProgramFiles\SQLServer\MSSQL16.SQLEXPRESS\MSSQL\DATA\MisChampionship.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MisChampionship_log', FILENAME = N'D:\ProgramFiles\SQLServer\MSSQL16.SQLEXPRESS\MSSQL\DATA\MisChampionship_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MisChampionship] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MisChampionship].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MisChampionship] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MisChampionship] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MisChampionship] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MisChampionship] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MisChampionship] SET ARITHABORT OFF 
GO
ALTER DATABASE [MisChampionship] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MisChampionship] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MisChampionship] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MisChampionship] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MisChampionship] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MisChampionship] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MisChampionship] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MisChampionship] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MisChampionship] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MisChampionship] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MisChampionship] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MisChampionship] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MisChampionship] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MisChampionship] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MisChampionship] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MisChampionship] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MisChampionship] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MisChampionship] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MisChampionship] SET  MULTI_USER 
GO
ALTER DATABASE [MisChampionship] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MisChampionship] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MisChampionship] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MisChampionship] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MisChampionship] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MisChampionship] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MisChampionship] SET QUERY_STORE = ON
GO
ALTER DATABASE [MisChampionship] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_AdminUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[DoctorId] [int] NOT NULL,
	[Specialization] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Doctor_1] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitalization](
	[HospitalizationId] [int] IDENTITY(1,1) NOT NULL,
	[HospitalizationCode] [nvarchar](50) NOT NULL,
	[MedicalCardId] [int] NOT NULL,
	[Price] [decimal](15, 2) NOT NULL,
	[Goal] [nvarchar](500) NULL,
	[HospitalRoom] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsCanceled] [bit] NOT NULL,
	[CancelReason] [nvarchar](100) NOT NULL,
	[Bed] [char](1) NOT NULL,
 CONSTRAINT [PK_Hospitalization] PRIMARY KEY CLUSTERED 
(
	[HospitalizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsurancePolicy](
	[InsurancePolicyId] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](20) NOT NULL,
	[EndDate] [date] NOT NULL,
	[Company] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_InsurancePolicy] PRIMARY KEY CLUSTERED 
(
	[InsurancePolicyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalCard](
	[MedicalCardId] [int] IDENTITY(1,1) NOT NULL,
	[MedicalCardStartDate] [datetime] NOT NULL,
	[NextVisitDate] [datetime] NULL,
 CONSTRAINT [PK_MedicalCard] PRIMARY KEY CLUSTERED 
(
	[MedicalCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[SurName] [nvarchar](100) NOT NULL,
	[Patronymic] [nvarchar](100) NOT NULL,
	[Passport] [nchar](10) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[IsMale] [bit] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nchar](11) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Job] [nvarchar](200) NULL,
	[Photo] [varbinary](max) NULL,
	[MedicalCardId] [int] NULL,
	[InsurancePolicyId] [int] NOT NULL,
	[PassportIssuedBy] [nvarchar](100) NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationStaff](
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_RegistrationStaff] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheduleId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[MedicalCardId] [int] NOT NULL,
	[TherapyId] [int] NOT NULL,
	[Date] [int] NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Therapy](
	[TherapyId] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Diagnosis] [nvarchar](1000) NOT NULL,
	[Price] [decimal](15, 2) NOT NULL,
	[HospitalizationCode] [nvarchar](50) NULL,
	[Recomendations] [nvarchar](1000) NULL,
	[TypeId] [int] NOT NULL,
	[MedicalCardId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[Direction] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Therapy] PRIMARY KEY CLUSTERED 
(
	[TherapyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TherapyRecipe](
	[TherapyRecipeId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[TherapyId] [int] NULL,
	[Dosage] [nvarchar](50) NULL,
 CONSTRAINT [PK_TherapyRecipe] PRIMARY KEY CLUSTERED 
(
	[TherapyRecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TherapyResult](
	[TherapyResultId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[TherapyId] [int] NOT NULL,
 CONSTRAINT [PK_TherapyResult] PRIMARY KEY CLUSTERED 
(
	[TherapyResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TherapyType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TherapyType] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Patronymic] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nchar](11) NOT NULL,
	[Password] [varbinary](max) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Doctor] ([DoctorId], [Specialization]) VALUES (7, N'терапевт')
GO
SET IDENTITY_INSERT [dbo].[Hospitalization] ON 

INSERT [dbo].[Hospitalization] ([HospitalizationId], [HospitalizationCode], [MedicalCardId], [Price], [Goal], [HospitalRoom], [StartDate], [EndDate], [IsCanceled], [CancelReason], [Bed]) VALUES (2, N'0001', 1, CAST(0.00 AS Decimal(15, 2)), N'polechitsa', 103, NULL, NULL, 0, N';', N'?')
INSERT [dbo].[Hospitalization] ([HospitalizationId], [HospitalizationCode], [MedicalCardId], [Price], [Goal], [HospitalRoom], [StartDate], [EndDate], [IsCanceled], [CancelReason], [Bed]) VALUES (5, N'0002', 11, CAST(888.00 AS Decimal(15, 2)), N'vilechitsa', 103, NULL, NULL, 0, N'е', N'?')
SET IDENTITY_INSERT [dbo].[Hospitalization] OFF
GO
SET IDENTITY_INSERT [dbo].[InsurancePolicy] ON 

INSERT [dbo].[InsurancePolicy] ([InsurancePolicyId], [Number], [EndDate], [Company]) VALUES (2, N'34563456', CAST(N'2024-02-08' AS Date), N'sdfg')
INSERT [dbo].[InsurancePolicy] ([InsurancePolicyId], [Number], [EndDate], [Company]) VALUES (4, N'34563456', CAST(N'2024-02-08' AS Date), N'sdfg')
INSERT [dbo].[InsurancePolicy] ([InsurancePolicyId], [Number], [EndDate], [Company]) VALUES (5, N'34563456', CAST(N'2024-02-08' AS Date), N'sdfg')
INSERT [dbo].[InsurancePolicy] ([InsurancePolicyId], [Number], [EndDate], [Company]) VALUES (6, N't1', CAST(N'2024-02-01' AS Date), N't1')
INSERT [dbo].[InsurancePolicy] ([InsurancePolicyId], [Number], [EndDate], [Company]) VALUES (7, N'34563456', CAST(N'2024-02-16' AS Date), N'tyurtyuytr')
INSERT [dbo].[InsurancePolicy] ([InsurancePolicyId], [Number], [EndDate], [Company]) VALUES (8, N'34563456', CAST(N'2024-02-01' AS Date), N'sdfg')
INSERT [dbo].[InsurancePolicy] ([InsurancePolicyId], [Number], [EndDate], [Company]) VALUES (9, N'ASD', CAST(N'2024-02-01' AS Date), N'sdfg')
INSERT [dbo].[InsurancePolicy] ([InsurancePolicyId], [Number], [EndDate], [Company]) VALUES (12, N'fv', CAST(N'2024-02-01' AS Date), N'fv')
INSERT [dbo].[InsurancePolicy] ([InsurancePolicyId], [Number], [EndDate], [Company]) VALUES (13, N'прпр', CAST(N'2024-02-01' AS Date), N'пртпрт')
INSERT [dbo].[InsurancePolicy] ([InsurancePolicyId], [Number], [EndDate], [Company]) VALUES (14, N'р', CAST(N'2024-02-03' AS Date), N'р')
INSERT [dbo].[InsurancePolicy] ([InsurancePolicyId], [Number], [EndDate], [Company]) VALUES (15, N'dfgh', CAST(N'2024-02-01' AS Date), N'dfhg')
INSERT [dbo].[InsurancePolicy] ([InsurancePolicyId], [Number], [EndDate], [Company]) VALUES (16, N'q', CAST(N'2024-02-09' AS Date), N'q')
SET IDENTITY_INSERT [dbo].[InsurancePolicy] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalCard] ON 

INSERT [dbo].[MedicalCard] ([MedicalCardId], [MedicalCardStartDate], [NextVisitDate]) VALUES (1, CAST(N'2024-02-01T21:09:11.090' AS DateTime), NULL)
INSERT [dbo].[MedicalCard] ([MedicalCardId], [MedicalCardStartDate], [NextVisitDate]) VALUES (3, CAST(N'2024-02-01T21:13:46.050' AS DateTime), NULL)
INSERT [dbo].[MedicalCard] ([MedicalCardId], [MedicalCardStartDate], [NextVisitDate]) VALUES (4, CAST(N'2024-02-01T21:14:05.533' AS DateTime), NULL)
INSERT [dbo].[MedicalCard] ([MedicalCardId], [MedicalCardStartDate], [NextVisitDate]) VALUES (5, CAST(N'2024-02-02T17:10:54.790' AS DateTime), NULL)
INSERT [dbo].[MedicalCard] ([MedicalCardId], [MedicalCardStartDate], [NextVisitDate]) VALUES (6, CAST(N'2024-02-02T19:25:24.597' AS DateTime), NULL)
INSERT [dbo].[MedicalCard] ([MedicalCardId], [MedicalCardStartDate], [NextVisitDate]) VALUES (7, CAST(N'2024-02-02T19:29:58.177' AS DateTime), NULL)
INSERT [dbo].[MedicalCard] ([MedicalCardId], [MedicalCardStartDate], [NextVisitDate]) VALUES (8, CAST(N'2024-02-02T19:33:39.313' AS DateTime), NULL)
INSERT [dbo].[MedicalCard] ([MedicalCardId], [MedicalCardStartDate], [NextVisitDate]) VALUES (11, CAST(N'2024-02-02T20:19:06.723' AS DateTime), NULL)
INSERT [dbo].[MedicalCard] ([MedicalCardId], [MedicalCardStartDate], [NextVisitDate]) VALUES (12, CAST(N'2024-02-02T20:21:56.197' AS DateTime), NULL)
INSERT [dbo].[MedicalCard] ([MedicalCardId], [MedicalCardStartDate], [NextVisitDate]) VALUES (13, CAST(N'2024-02-02T20:22:30.467' AS DateTime), NULL)
INSERT [dbo].[MedicalCard] ([MedicalCardId], [MedicalCardStartDate], [NextVisitDate]) VALUES (14, CAST(N'2024-02-02T20:30:59.133' AS DateTime), NULL)
INSERT [dbo].[MedicalCard] ([MedicalCardId], [MedicalCardStartDate], [NextVisitDate]) VALUES (15, CAST(N'2024-02-02T21:24:24.867' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[MedicalCard] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([PatientId], [Name], [SurName], [Patronymic], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardId], [InsurancePolicyId], [PassportIssuedBy]) VALUES (0, N'xgnb', N'sdfgsdfg', N'sdfgsdfg', N'fghjfghj  ', CAST(N'2024-02-23' AS Date), 0, N'sdfg', N'45674564   ', N'egor.antipin.1995mail.ru@gmail.com', N'sdfg', NULL, 1, 2, NULL)
INSERT [dbo].[Patient] ([PatientId], [Name], [SurName], [Patronymic], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardId], [InsurancePolicyId], [PassportIssuedBy]) VALUES (1, N'asdf', N'sdfgsdfggtbr', N'thg', N'3         ', CAST(N'2024-02-03' AS Date), 1, N'fv', N'fv         ', N'zxcv@d', N'fv', NULL, 11, 12, NULL)
INSERT [dbo].[Patient] ([PatientId], [Name], [SurName], [Patronymic], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardId], [InsurancePolicyId], [PassportIssuedBy]) VALUES (2, N'не', N'рпрпо', N'рпо', N'4         ', CAST(N'2024-02-03' AS Date), 1, N'р', N'п          ', N'прьпри', N'при', NULL, 12, 13, NULL)
INSERT [dbo].[Patient] ([PatientId], [Name], [SurName], [Patronymic], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardId], [InsurancePolicyId], [PassportIssuedBy]) VALUES (3, N'епр', N'епр', N'рен', N'5         ', CAST(N'2024-02-03' AS Date), 1, N'sdfg', N'р          ', N'asdf@adsf', N'р', NULL, 13, 14, NULL)
INSERT [dbo].[Patient] ([PatientId], [Name], [SurName], [Patronymic], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardId], [InsurancePolicyId], [PassportIssuedBy]) VALUES (4, N'sdfg', N'sdfg', N'dsfg', N'7         ', CAST(N'2024-02-01' AS Date), 1, N'dfgh', N'dfgh       ', N'dfgh', N'dfgh', NULL, 14, 15, NULL)
INSERT [dbo].[Patient] ([PatientId], [Name], [SurName], [Patronymic], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardId], [InsurancePolicyId], [PassportIssuedBy]) VALUES (5, N'qr', N'qr', N'qr', N'8         ', CAST(N'2024-02-01' AS Date), 1, N'q', N'q          ', N'q', N'q', NULL, 15, 16, NULL)
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
INSERT [dbo].[RegistrationStaff] ([UserId]) VALUES (6)
GO
SET IDENTITY_INSERT [dbo].[TherapyType] ON 

INSERT [dbo].[TherapyType] ([TypeId], [Title]) VALUES (2, N'инструментальная
диагностика')
INSERT [dbo].[TherapyType] ([TypeId], [Title]) VALUES (1, N'лабораторное исследование')
INSERT [dbo].[TherapyType] ([TypeId], [Title]) VALUES (3, N'лекарственная терапия')
INSERT [dbo].[TherapyType] ([TypeId], [Title]) VALUES (4, N'физиотерапия')
INSERT [dbo].[TherapyType] ([TypeId], [Title]) VALUES (5, N'хирургическое лечение')
SET IDENTITY_INSERT [dbo].[TherapyType] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Name], [Surname], [Patronymic], [PhoneNumber], [Password], [Email]) VALUES (5, N'Иван', N'Иванов', N'Иванович', N'71234567890', 0x03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4, N'mail1@gmail.com')
INSERT [dbo].[User] ([UserId], [Name], [Surname], [Patronymic], [PhoneNumber], [Password], [Email]) VALUES (6, N'Dima', N'Иванов', N'Иванович', N'71234567890', 0x03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4, N'mail2@gmail.com')
INSERT [dbo].[User] ([UserId], [Name], [Surname], [Patronymic], [PhoneNumber], [Password], [Email]) VALUES (7, N'доктор', N'Иванов', N'Иванович', N'71234567890', 0x03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4, N'mail3@gmail.com')
INSERT [dbo].[User] ([UserId], [Name], [Surname], [Patronymic], [PhoneNumber], [Password], [Email]) VALUES (8, N'админ', N'Иванов', N'Иванович', N'71234567890', 0x03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4, N'mail4@gmail.com')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[Hospitalization] ADD  CONSTRAINT [UQ_Hospitalization] UNIQUE NONCLUSTERED 
(
	[HospitalizationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [IX_PatientPassport] UNIQUE NONCLUSTERED 
(
	[Passport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [UQ_MedicalCardId] UNIQUE NONCLUSTERED 
(
	[MedicalCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [UQ_Patient] UNIQUE NONCLUSTERED 
(
	[InsurancePolicyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[TherapyType] ADD  CONSTRAINT [UQ_TherapyType] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ_UserEmail] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Hospitalization] ADD  CONSTRAINT [DF_Hospitalization_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Hospitalization] ADD  CONSTRAINT [DF_Hospitalization_IsCanceled]  DEFAULT ((0)) FOR [IsCanceled]
GO
ALTER TABLE [dbo].[MedicalCard] ADD  CONSTRAINT [DF_MedicalCard_MedicalCardStartDate]  DEFAULT (getdate()) FOR [MedicalCardStartDate]
GO
ALTER TABLE [dbo].[Therapy] ADD  CONSTRAINT [DF_Therapy_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Patronymic]  DEFAULT (N'нет') FOR [Patronymic]
GO
ALTER TABLE [dbo].[AdminUser]  WITH NOCHECK ADD  CONSTRAINT [FK_AdminUser_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[AdminUser] NOCHECK CONSTRAINT [FK_AdminUser_User]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_User] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[User] ([UserId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_User]
GO
ALTER TABLE [dbo].[Hospitalization]  WITH CHECK ADD  CONSTRAINT [FK_Hospitalization_MedicalCard] FOREIGN KEY([MedicalCardId])
REFERENCES [dbo].[MedicalCard] ([MedicalCardId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Hospitalization] CHECK CONSTRAINT [FK_Hospitalization_MedicalCard]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_InsurancePolicy] FOREIGN KEY([InsurancePolicyId])
REFERENCES [dbo].[InsurancePolicy] ([InsurancePolicyId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_InsurancePolicy]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_MedicalCard] FOREIGN KEY([MedicalCardId])
REFERENCES [dbo].[MedicalCard] ([MedicalCardId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_MedicalCard]
GO
ALTER TABLE [dbo].[RegistrationStaff]  WITH CHECK ADD  CONSTRAINT [FK_RegistrationStaff_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RegistrationStaff] CHECK CONSTRAINT [FK_RegistrationStaff_User]
GO
ALTER TABLE [dbo].[Therapy]  WITH CHECK ADD  CONSTRAINT [FK_Therapy_Doctor] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([DoctorId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Therapy] CHECK CONSTRAINT [FK_Therapy_Doctor]
GO
ALTER TABLE [dbo].[Therapy]  WITH CHECK ADD  CONSTRAINT [FK_Therapy_MedicalCard] FOREIGN KEY([MedicalCardId])
REFERENCES [dbo].[MedicalCard] ([MedicalCardId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Therapy] CHECK CONSTRAINT [FK_Therapy_MedicalCard]
GO
ALTER TABLE [dbo].[Therapy]  WITH CHECK ADD  CONSTRAINT [FK_Therapy_TherapyType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[TherapyType] ([TypeId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Therapy] CHECK CONSTRAINT [FK_Therapy_TherapyType]
GO
ALTER TABLE [dbo].[TherapyRecipe]  WITH CHECK ADD  CONSTRAINT [FK_TherapyRecipe_Therapy] FOREIGN KEY([TherapyId])
REFERENCES [dbo].[Therapy] ([TherapyId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TherapyRecipe] CHECK CONSTRAINT [FK_TherapyRecipe_Therapy]
GO
ALTER TABLE [dbo].[TherapyResult]  WITH CHECK ADD  CONSTRAINT [FK_TherapyResult_Therapy] FOREIGN KEY([TherapyId])
REFERENCES [dbo].[Therapy] ([TherapyId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TherapyResult] CHECK CONSTRAINT [FK_TherapyResult_Therapy]
GO
ALTER DATABASE [MisChampionship] SET  READ_WRITE 
GO
