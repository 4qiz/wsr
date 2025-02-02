/****** Object:  Table [dbo].[Cabinet]    Script Date: 15.02.2024 19:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cabinet](
	[CabinetId] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
 CONSTRAINT [PK_Cabinet] PRIMARY KEY CLUSTERED 
(
	[CabinetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 15.02.2024 19:10:09 ******/
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
/****** Object:  Table [dbo].[Event]    Script Date: 15.02.2024 19:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventId] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Diagnosis] [nvarchar](1000) NOT NULL,
	[Price] [decimal](15, 2) NOT NULL,
	[HospitalizationCode] [int] NULL,
	[Recomendations] [nvarchar](1000) NULL,
	[TypeId] [int] NOT NULL,
	[MedicalCardId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[DirectionToEvent] [int] NULL,
	[VoiceMessage] [varbinary](max) NULL,
 CONSTRAINT [PK_Therapy] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_HospitalizationCode] UNIQUE NONCLUSTERED 
(
	[HospitalizationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventRecipe]    Script Date: 15.02.2024 19:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventRecipe](
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
/****** Object:  Table [dbo].[EventResult]    Script Date: 15.02.2024 19:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventResult](
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
/****** Object:  Table [dbo].[EventType]    Script Date: 15.02.2024 19:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventType](
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
/****** Object:  Table [dbo].[Hospitalization]    Script Date: 15.02.2024 19:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitalization](
	[HospitalizationCode] [int] NOT NULL,
	[MedicalCardId] [int] NOT NULL,
	[Price] [decimal](15, 2) NOT NULL,
	[Goal] [nvarchar](500) NULL,
	[Department] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[IsCanceled] [bit] NOT NULL,
	[CancelReason] [nvarchar](100) NOT NULL,
	[HospitalizationRoomId] [int] NULL,
 CONSTRAINT [PK_Hospitalization_1] PRIMARY KEY CLUSTERED 
(
	[HospitalizationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Hospitalization] UNIQUE NONCLUSTERED 
(
	[HospitalizationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalizationRoom]    Script Date: 15.02.2024 19:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalizationRoom](
	[HospitalizationRoomId] [int] IDENTITY(1,1) NOT NULL,
	[X] [int] NOT NULL,
	[Y] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[BedCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_HospitalizationRoom] PRIMARY KEY CLUSTERED 
(
	[HospitalizationRoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 15.02.2024 19:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientId] [int] NOT NULL,
	[Passport] [nchar](10) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[IsMale] [bit] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nchar](11) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Job] [nvarchar](200) NULL,
	[Photo] [varbinary](max) NULL,
	[MedicalCardNumber] [int] NULL,
	[InsurancePolicyNumber] [int] NOT NULL,
	[InsurancePolicyEndDate] [date] NULL,
	[InsuranceCompany] [nvarchar](100) NOT NULL,
	[PassportIssuedBy] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_PatientPassport] UNIQUE NONCLUSTERED 
(
	[Passport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Patient] UNIQUE NONCLUSTERED 
(
	[InsurancePolicyNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationStaff]    Script Date: 15.02.2024 19:10:09 ******/
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
/****** Object:  Table [dbo].[ScheduleItem]    Script Date: 15.02.2024 19:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleItem](
	[ScheduleId] [int] NOT NULL,
	[DoctorId] [int] NULL,
	[PatientId] [int] NULL,
	[EventId] [int] NULL,
	[EventStartDate] [datetime] NOT NULL,
	[ScheduleMonthId] [int] NULL,
	[IsChanged] [bit] NOT NULL,
	[EventEndDate] [datetime] NOT NULL,
	[CabinetId] [int] NULL,
 CONSTRAINT [PK_Schedule1] PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleMonth]    Script Date: 15.02.2024 19:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleMonth](
	[ScheduleMonthId] [int] NOT NULL,
	[Year] [smallint] NOT NULL,
	[Month] [tinyint] NOT NULL,
	[IsApproved] [bit] NOT NULL,
 CONSTRAINT [PK_ScheduleMonth] PRIMARY KEY CLUSTERED 
(
	[ScheduleMonthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleWorkDayTemplate]    Script Date: 15.02.2024 19:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleWorkDayTemplate](
	[ScheduleTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ScheduleWorkDayTemplate] PRIMARY KEY CLUSTERED 
(
	[ScheduleTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 15.02.2024 19:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Password] [varbinary](max) NOT NULL,
	[Login] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[SurName] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[RegistrationDate] [datetime] NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkHours]    Script Date: 15.02.2024 19:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkHours](
	[WorkHoursId] [int] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[ScheduleTemplateId] [int] NULL,
 CONSTRAINT [PK_WorkHours] PRIMARY KEY CLUSTERED 
(
	[WorkHoursId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event] ADD  CONSTRAINT [DF_Therapy_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Hospitalization] ADD  CONSTRAINT [DF_Hospitalization_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Hospitalization] ADD  CONSTRAINT [DF_Hospitalization_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Hospitalization] ADD  CONSTRAINT [DF_Hospitalization_IsCanceled]  DEFAULT ((0)) FOR [IsCanceled]
GO
ALTER TABLE [dbo].[ScheduleItem] ADD  CONSTRAINT [DF_Schedule_IsChanged]  DEFAULT ((0)) FOR [IsChanged]
GO
ALTER TABLE [dbo].[ScheduleMonth] ADD  CONSTRAINT [DF_ScheduleMonth_Year]  DEFAULT (datepart(year,getdate())) FOR [Year]
GO
ALTER TABLE [dbo].[ScheduleMonth] ADD  CONSTRAINT [DF_ScheduleMonth_IsApproved]  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_RegistrationDate]  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsAdmin]  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_User] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[User] ([UserId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_User]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Event] FOREIGN KEY([DirectionToEvent])
REFERENCES [dbo].[Event] ([EventId])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Event]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_EventType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[EventType] ([TypeId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_EventType]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Hospitalization] FOREIGN KEY([HospitalizationCode])
REFERENCES [dbo].[Hospitalization] ([HospitalizationCode])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Hospitalization]
GO
ALTER TABLE [dbo].[EventRecipe]  WITH CHECK ADD  CONSTRAINT [FK_TherapyRecipe_Therapy] FOREIGN KEY([TherapyId])
REFERENCES [dbo].[Event] ([EventId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[EventRecipe] CHECK CONSTRAINT [FK_TherapyRecipe_Therapy]
GO
ALTER TABLE [dbo].[EventResult]  WITH CHECK ADD  CONSTRAINT [FK_TherapyResult_Therapy] FOREIGN KEY([TherapyId])
REFERENCES [dbo].[Event] ([EventId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[EventResult] CHECK CONSTRAINT [FK_TherapyResult_Therapy]
GO
ALTER TABLE [dbo].[Hospitalization]  WITH CHECK ADD  CONSTRAINT [FK_Hospitalization_HospitalizationRoom] FOREIGN KEY([HospitalizationRoomId])
REFERENCES [dbo].[HospitalizationRoom] ([HospitalizationRoomId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Hospitalization] CHECK CONSTRAINT [FK_Hospitalization_HospitalizationRoom]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_User] FOREIGN KEY([PatientId])
REFERENCES [dbo].[User] ([UserId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_User]
GO
ALTER TABLE [dbo].[RegistrationStaff]  WITH CHECK ADD  CONSTRAINT [FK_RegistrationStaff_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RegistrationStaff] CHECK CONSTRAINT [FK_RegistrationStaff_User]
GO
ALTER TABLE [dbo].[ScheduleItem]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Cabinet] FOREIGN KEY([CabinetId])
REFERENCES [dbo].[Cabinet] ([CabinetId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ScheduleItem] CHECK CONSTRAINT [FK_Schedule_Cabinet]
GO
ALTER TABLE [dbo].[ScheduleItem]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Doctor] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([DoctorId])
GO
ALTER TABLE [dbo].[ScheduleItem] CHECK CONSTRAINT [FK_Schedule_Doctor]
GO
ALTER TABLE [dbo].[ScheduleItem]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([EventId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ScheduleItem] CHECK CONSTRAINT [FK_Schedule_Event]
GO
ALTER TABLE [dbo].[ScheduleItem]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ScheduleItem] CHECK CONSTRAINT [FK_Schedule_Patient]
GO
ALTER TABLE [dbo].[ScheduleItem]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_ScheduleMonth] FOREIGN KEY([ScheduleMonthId])
REFERENCES [dbo].[ScheduleMonth] ([ScheduleMonthId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ScheduleItem] CHECK CONSTRAINT [FK_Schedule_ScheduleMonth]
GO
ALTER TABLE [dbo].[WorkHours]  WITH CHECK ADD  CONSTRAINT [FK_WorkHours_ScheduleWorkDayTemplate] FOREIGN KEY([ScheduleTemplateId])
REFERENCES [dbo].[ScheduleWorkDayTemplate] ([ScheduleTemplateId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[WorkHours] CHECK CONSTRAINT [FK_WorkHours_ScheduleWorkDayTemplate]
GO
