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
	[Department] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsCanceled] [bit] NOT NULL,
	[CancelReason] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Hospitalization] PRIMARY KEY CLUSTERED 
(
	[HospitalizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Hospitalization] UNIQUE NONCLUSTERED 
(
	[HospitalizationCode] ASC
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
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_PatientPassport] UNIQUE NONCLUSTERED 
(
	[Passport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_MedicalCardId] UNIQUE NONCLUSTERED 
(
	[MedicalCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Patient] UNIQUE NONCLUSTERED 
(
	[InsurancePolicyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_TherapyType] UNIQUE NONCLUSTERED 
(
	[Title] ASC
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
