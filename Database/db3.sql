/****** Object:  Database [MisChampionship]    Script Date: 01.02.2024 21:19:58 ******/
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
/****** Object:  Table [dbo].[Doctor]    Script Date: 01.02.2024 21:19:58 ******/
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
/****** Object:  Table [dbo].[Hospitalization]    Script Date: 01.02.2024 21:19:58 ******/
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
	[Department] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Hospitalization] PRIMARY KEY CLUSTERED 
(
	[HospitalizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsurancePolicy]    Script Date: 01.02.2024 21:19:58 ******/
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
/****** Object:  Table [dbo].[MedicalCard]    Script Date: 01.02.2024 21:19:58 ******/
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
/****** Object:  Table [dbo].[Patient]    Script Date: 01.02.2024 21:19:58 ******/
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
	[MedicalCardId] [int] NOT NULL,
	[InsurancePolicyId] [int] NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationStaff]    Script Date: 01.02.2024 21:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationStaff](
	[UserId] [int] NOT NULL,
	[Title] [nvarchar](10) NULL,
 CONSTRAINT [PK_RegistrationStaff] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 01.02.2024 21:19:58 ******/
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
/****** Object:  Table [dbo].[Therapy]    Script Date: 01.02.2024 21:19:58 ******/
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
/****** Object:  Table [dbo].[TherapyRecipe]    Script Date: 01.02.2024 21:19:58 ******/
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
/****** Object:  Table [dbo].[TherapyResult]    Script Date: 01.02.2024 21:19:58 ******/
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
/****** Object:  Table [dbo].[TherapyType]    Script Date: 01.02.2024 21:19:58 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 01.02.2024 21:19:58 ******/
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
SET IDENTITY_INSERT [dbo].[InsurancePolicy] ON 

INSERT [dbo].[InsurancePolicy] ([InsurancePolicyId], [Number], [EndDate], [Company]) VALUES (2, N'34563456', CAST(N'2024-02-08' AS Date), N'sdfg')
INSERT [dbo].[InsurancePolicy] ([InsurancePolicyId], [Number], [EndDate], [Company]) VALUES (4, N'34563456', CAST(N'2024-02-08' AS Date), N'sdfg')
INSERT [dbo].[InsurancePolicy] ([InsurancePolicyId], [Number], [EndDate], [Company]) VALUES (5, N'34563456', CAST(N'2024-02-08' AS Date), N'sdfg')
SET IDENTITY_INSERT [dbo].[InsurancePolicy] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalCard] ON 

INSERT [dbo].[MedicalCard] ([MedicalCardId], [MedicalCardStartDate], [NextVisitDate]) VALUES (1, CAST(N'2024-02-01T21:09:11.090' AS DateTime), NULL)
INSERT [dbo].[MedicalCard] ([MedicalCardId], [MedicalCardStartDate], [NextVisitDate]) VALUES (3, CAST(N'2024-02-01T21:13:46.050' AS DateTime), NULL)
INSERT [dbo].[MedicalCard] ([MedicalCardId], [MedicalCardStartDate], [NextVisitDate]) VALUES (4, CAST(N'2024-02-01T21:14:05.533' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[MedicalCard] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([PatientId], [Name], [SurName], [Patronymic], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardId], [InsurancePolicyId]) VALUES (0, N'xgnb', N'sdfgsdfg', N'sdfgsdfg', N'fghjfghj  ', CAST(N'2024-02-23' AS Date), 0, N'sdfg', N'45674564   ', N'egor.antipin.1995mail.ru@gmail.com', N'sdfg', NULL, 1, 2)
INSERT [dbo].[Patient] ([PatientId], [Name], [SurName], [Patronymic], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardId], [InsurancePolicyId]) VALUES (1, N'xgnb', N'sdfgsdfg', N'sdfgsdfg', N'sdfgsdfg  ', CAST(N'2024-02-23' AS Date), 0, N'cvbn', N'45674564   ', N'egor.antipin.1995mail.ru@gmail.com', N'sdfg', NULL, 3, 4)
INSERT [dbo].[Patient] ([PatientId], [Name], [SurName], [Patronymic], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardId], [InsurancePolicyId]) VALUES (2, N'xgnb', N'sdfgsdfg', N'sdfgsdfg', N'sdfgsdfg  ', CAST(N'2024-02-23' AS Date), 1, N'cvbn', N'45674564   ', N'egor.antipin.1995mail.ru@gmail.com', N'sdfg', NULL, 4, 5)
SET IDENTITY_INSERT [dbo].[Patient] OFF
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

INSERT [dbo].[User] ([UserId], [Name], [Surname], [Patronymic], [PhoneNumber], [Password], [Email]) VALUES (5, N'Иван', N'Иванов', N'Иванович', N'71234567890', 0x03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4, N'mail@gmail.com')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Hospitalization]    Script Date: 01.02.2024 21:19:58 ******/
ALTER TABLE [dbo].[Hospitalization] ADD  CONSTRAINT [UQ_Hospitalization] UNIQUE NONCLUSTERED 
(
	[HospitalizationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_MedicalCardId]    Script Date: 01.02.2024 21:19:58 ******/
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [UQ_MedicalCardId] UNIQUE NONCLUSTERED 
(
	[MedicalCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Patient]    Script Date: 01.02.2024 21:19:58 ******/
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [UQ_Patient] UNIQUE NONCLUSTERED 
(
	[InsurancePolicyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_TherapyType]    Script Date: 01.02.2024 21:19:58 ******/
ALTER TABLE [dbo].[TherapyType] ADD  CONSTRAINT [UQ_TherapyType] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Hospitalization] ADD  CONSTRAINT [DF_Hospitalization_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[MedicalCard] ADD  CONSTRAINT [DF_MedicalCard_MedicalCardStartDate]  DEFAULT (getdate()) FOR [MedicalCardStartDate]
GO
ALTER TABLE [dbo].[Therapy] ADD  CONSTRAINT [DF_Therapy_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Patronymic]  DEFAULT (N'нет') FOR [Patronymic]
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
