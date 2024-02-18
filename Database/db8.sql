USE [wsr]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingToEvent](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [int] NOT NULL,
	[EventStartDate] [datetime] NOT NULL,
	[EventEndDate] [datetime] NULL,
	[ScheduleMonthId] [int] NULL,
	[IsChanged] [bit] NOT NULL,
	[CabinetId] [int] NOT NULL,
	[EventTypeId] [int] NOT NULL,
	[EventId] [int] NULL,
 CONSTRAINT [PK_Schedule1] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
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
CREATE TABLE [dbo].[Event](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Diagnosis] [nvarchar](1000) NOT NULL,
	[Price] [decimal](15, 2) NOT NULL,
	[Recomendations] [nvarchar](1000) NULL,
	[TypeId] [int] NOT NULL,
	[VoiceMessage] [varbinary](max) NULL,
	[PatientId] [int] NOT NULL,
 CONSTRAINT [PK_Therapy] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventHasHospitalization](
	[EventId] [int] NOT NULL,
	[HospitalizationCode] [int] NOT NULL,
 CONSTRAINT [PK_EventHasHospitalization] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC,
	[HospitalizationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventHasPatients](
	[BookingId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
 CONSTRAINT [PK_EventHasPatients] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC,
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitalization](
	[HospitalizationCode] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[Price] [decimal](15, 2) NOT NULL,
	[Goal] [nvarchar](500) NULL,
	[Department] [nvarchar](100) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[IsCanceled] [bit] NOT NULL,
	[CancelReason] [nvarchar](100) NOT NULL,
	[HospitalizationRoomId] [int] NULL,
 CONSTRAINT [PK_Hospitalization_1] PRIMARY KEY CLUSTERED 
(
	[HospitalizationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
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
	[InsurancePolicyNumber] [nvarchar](20) NOT NULL,
	[InsurancePolicyEndDate] [date] NULL,
	[InsuranceCompany] [nvarchar](100) NOT NULL,
	[PassportIssuedBy] [nvarchar](100) NOT NULL,
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Password] [varbinary](max) NULL,
	[Login] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SurName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[RegistrationDate] [datetime] NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
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
SET IDENTITY_INSERT [dbo].[BookingToEvent] ON 
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (1, 108, CAST(N'2024-02-19T06:40:47.460' AS DateTime), CAST(N'2024-02-19T06:45:47.460' AS DateTime), NULL, 0, 1, 11, 1)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (2, 108, CAST(N'2024-02-19T06:50:47.460' AS DateTime), CAST(N'2024-02-19T06:55:47.460' AS DateTime), NULL, 0, 1, 11, 2)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (3, 108, CAST(N'2024-02-19T07:00:47.460' AS DateTime), CAST(N'2024-02-19T07:05:47.460' AS DateTime), NULL, 0, 1, 11, 3)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (4, 108, CAST(N'2024-02-19T07:10:47.460' AS DateTime), CAST(N'2024-02-19T07:20:47.460' AS DateTime), NULL, 0, 1, 11, 4)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (17, 109, CAST(N'2024-02-19T07:20:15.000' AS DateTime), CAST(N'2024-02-19T07:30:47.000' AS DateTime), NULL, 0, 2, 11, 5)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (18, 109, CAST(N'2024-02-19T07:30:47.000' AS DateTime), CAST(N'2024-02-19T07:40:47.000' AS DateTime), NULL, 0, 2, 11, 6)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (19, 109, CAST(N'2024-02-19T07:40:47.000' AS DateTime), CAST(N'2024-02-19T07:50:47.000' AS DateTime), NULL, 0, 2, 11, 7)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (21, 110, CAST(N'2024-02-19T07:00:47.000' AS DateTime), CAST(N'2024-02-19T07:10:47.000' AS DateTime), NULL, 0, 3, 11, 8)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (22, 110, CAST(N'2024-02-19T07:10:47.000' AS DateTime), CAST(N'2024-02-19T07:20:47.000' AS DateTime), NULL, 0, 3, 11, 9)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (23, 110, CAST(N'2024-02-19T07:20:47.000' AS DateTime), CAST(N'2024-02-19T07:30:47.000' AS DateTime), NULL, 0, 3, 11, 10)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (24, 110, CAST(N'2024-02-19T07:30:47.000' AS DateTime), CAST(N'2024-02-19T07:40:47.000' AS DateTime), NULL, 0, 3, 11, 11)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (25, 111, CAST(N'2024-02-19T07:00:47.000' AS DateTime), CAST(N'2024-02-19T07:10:47.000' AS DateTime), NULL, 0, 4, 11, 12)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (26, 111, CAST(N'2024-02-19T07:10:47.000' AS DateTime), CAST(N'2024-02-19T07:20:47.000' AS DateTime), NULL, 0, 4, 11, 13)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (27, 111, CAST(N'2024-02-19T07:20:47.000' AS DateTime), CAST(N'2024-02-19T07:30:47.000' AS DateTime), NULL, 0, 4, 11, 14)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (28, 111, CAST(N'2024-02-19T07:30:47.000' AS DateTime), CAST(N'2024-02-19T07:40:47.000' AS DateTime), NULL, 0, 4, 11, 15)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (29, 112, CAST(N'2024-02-19T07:00:47.000' AS DateTime), CAST(N'2024-02-19T07:10:47.000' AS DateTime), NULL, 0, 5, 11, 16)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (30, 112, CAST(N'2024-02-19T07:10:47.000' AS DateTime), CAST(N'2024-02-19T07:20:47.000' AS DateTime), NULL, 0, 5, 11, 17)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (31, 112, CAST(N'2024-02-19T07:20:47.000' AS DateTime), CAST(N'2024-02-19T07:30:47.000' AS DateTime), NULL, 0, 5, 11, 18)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (32, 112, CAST(N'2024-02-19T07:30:47.000' AS DateTime), CAST(N'2024-02-19T07:40:47.000' AS DateTime), NULL, 0, 5, 11, 19)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (33, 112, CAST(N'2024-02-19T07:40:47.000' AS DateTime), CAST(N'2024-02-19T07:50:47.000' AS DateTime), NULL, 0, 5, 11, 20)
GO
INSERT [dbo].[BookingToEvent] ([BookingId], [DoctorId], [EventStartDate], [EventEndDate], [ScheduleMonthId], [IsChanged], [CabinetId], [EventTypeId], [EventId]) VALUES (35, 112, CAST(N'2024-02-26T07:40:47.000' AS DateTime), CAST(N'2024-02-27T07:40:47.000' AS DateTime), NULL, 0, 5, 12, NULL)
GO
SET IDENTITY_INSERT [dbo].[BookingToEvent] OFF
GO
SET IDENTITY_INSERT [dbo].[Cabinet] ON 
GO
INSERT [dbo].[Cabinet] ([CabinetId], [Number]) VALUES (1, 1)
GO
INSERT [dbo].[Cabinet] ([CabinetId], [Number]) VALUES (2, 2)
GO
INSERT [dbo].[Cabinet] ([CabinetId], [Number]) VALUES (3, 3)
GO
INSERT [dbo].[Cabinet] ([CabinetId], [Number]) VALUES (4, 4)
GO
INSERT [dbo].[Cabinet] ([CabinetId], [Number]) VALUES (5, 5)
GO
SET IDENTITY_INSERT [dbo].[Cabinet] OFF
GO
INSERT [dbo].[Doctor] ([DoctorId], [Specialization]) VALUES (108, N'Gastroenterologist')
GO
INSERT [dbo].[Doctor] ([DoctorId], [Specialization]) VALUES (109, N'Orthopedic Surgeon')
GO
INSERT [dbo].[Doctor] ([DoctorId], [Specialization]) VALUES (110, N'Pediatrician')
GO
INSERT [dbo].[Doctor] ([DoctorId], [Specialization]) VALUES (111, N'Neurologist')
GO
INSERT [dbo].[Doctor] ([DoctorId], [Specialization]) VALUES (112, N'Cardiologist')
GO
SET IDENTITY_INSERT [dbo].[Event] ON 
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (1, N'Heart Checkup', N'Coronary Artery Disease', CAST(200.00 AS Decimal(15, 2)), N'Regular exercise and a heart-healthy diet', 6, NULL, 1)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (2, N'Diabetes Management', N'Type 2 Diabetes', CAST(300.00 AS Decimal(15, 2)), N'Monitor blood sugar levels and maintain a healthy diet', 7, NULL, 2)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (3, N'Physical Therapy', N'Musculoskeletal Injury', CAST(400.00 AS Decimal(15, 2)), N'Strengthening and stretching exercises', 8, NULL, 3)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (4, N'Cancer Screening', N'Breast Cancer', CAST(500.00 AS Decimal(15, 2)), N'Regular mammograms and self-examinations', 9, NULL, 4)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (5, N'Psychotherapy', N'Anxiety Disorder', CAST(600.00 AS Decimal(15, 2)), N'Cognitive-behavioral therapy and medication', 9, NULL, 5)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (6, N'Dental Checkup', N'Gum Disease', CAST(700.00 AS Decimal(15, 2)), N'Proper oral hygiene and regular dental visits', 6, NULL, 6)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (7, N'Eye Exam', N'Astigmatism', CAST(800.00 AS Decimal(15, 2)), N'Corrective lenses or surgery', 7, NULL, 7)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (8, N'Hearing Test', N'Hearing Loss', CAST(900.00 AS Decimal(15, 2)), N'Hearing aids or cochlear implants', 8, NULL, 9)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (9, N'Speech Therapy', N'Stuttering', CAST(1000.00 AS Decimal(15, 2)), N'Speech exercises and behavioral techniques', 9, NULL, 8)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (10, N'Dietitian Consultation', N'Malnutrition', CAST(1100.00 AS Decimal(15, 2)), N'Personalized meal plans and nutrition education', 10, NULL, 10)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (11, N'Allergy Testing', N'Hay Fever', CAST(250.00 AS Decimal(15, 2)), N'Avoid allergens and take antihistamines', 6, NULL, 11)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (12, N'Dermatology Consultation', N'Eczema', CAST(350.00 AS Decimal(15, 2)), N'Topical creams and moisturizers', 6, NULL, 12)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (13, N'Nutritionist Consultation', N'Obesity', CAST(450.00 AS Decimal(15, 2)), N'Healthy eating habits and portion control', 7, NULL, 13)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (14, N'Gastroenterology Consultation', N'Irritable Bowel Syndrome', CAST(550.00 AS Decimal(15, 2)), N'Dietary modifications and stress management', 8, NULL, 14)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (15, N'Pulmonology Consultation', N'Asthma', CAST(650.00 AS Decimal(15, 2)), N'Inhalers and environmental triggers avoidance', 9, NULL, 15)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (16, N'Endocrinology Consultation', N'Thyroid Disorders', CAST(750.00 AS Decimal(15, 2)), N'Medication and lifestyle changes', 7, NULL, 16)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (17, N'Orthopedic Consultation', N'Arthritis', CAST(850.00 AS Decimal(15, 2)), N'Physical therapy and pain management', 8, NULL, 17)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (18, N'Neurology Consultation', N'Migraine', CAST(950.00 AS Decimal(15, 2)), N'Medication and stress reduction', 9, NULL, 18)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (19, N'Ophthalmology Consultation', N'Glaucoma', CAST(1050.00 AS Decimal(15, 2)), N'Eye drops and regular check-ups', 6, NULL, 19)
GO
INSERT [dbo].[Event] ([EventId], [Title], [Diagnosis], [Price], [Recomendations], [TypeId], [VoiceMessage], [PatientId]) VALUES (20, N'Urology Consultation', N'Prostate Enlargement', CAST(1150.00 AS Decimal(15, 2)), N'Medication and lifestyle changes', 6, NULL, 20)
GO
SET IDENTITY_INSERT [dbo].[Event] OFF
GO
SET IDENTITY_INSERT [dbo].[EventType] ON 
GO
INSERT [dbo].[EventType] ([TypeId], [Title]) VALUES (9, N'fiziotarapiya')
GO
INSERT [dbo].[EventType] ([TypeId], [Title]) VALUES (10, N'hirurgicheskoe lechenie')
GO
INSERT [dbo].[EventType] ([TypeId], [Title]) VALUES (7, N'instrumentalnaya diagnostika')
GO
INSERT [dbo].[EventType] ([TypeId], [Title]) VALUES (6, N'laboratornoe issledovanie')
GO
INSERT [dbo].[EventType] ([TypeId], [Title]) VALUES (8, N'lekarstvennaya terapia')
GO
INSERT [dbo].[EventType] ([TypeId], [Title]) VALUES (11, N'priem')
GO
INSERT [dbo].[EventType] ([TypeId], [Title]) VALUES (12, N'special')
GO
SET IDENTITY_INSERT [dbo].[EventType] OFF
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (1, 1, CAST(9902.66 AS Decimal(15, 2)), N'Etiam faucibus cursus urna. Ut tellus.', N'tempus vel pede morbi', CAST(N'2023-08-10T01:35:52.000' AS DateTime), CAST(N'2023-07-15T19:02:46.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (2, 2, CAST(4184.35 AS Decimal(15, 2)), N'Nullam porttitor lacus at turpis.', NULL, CAST(N'2023-09-08T15:25:14.000' AS DateTime), CAST(N'2024-02-01T08:03:04.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (3, 3, CAST(3514.60 AS Decimal(15, 2)), NULL, N'in felis eu sapien cursus vestibulum proin', CAST(N'2023-03-12T19:06:21.000' AS DateTime), CAST(N'2024-04-21T12:01:04.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (4, 4, CAST(6400.91 AS Decimal(15, 2)), N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.', NULL, CAST(N'2023-09-08T15:52:17.000' AS DateTime), CAST(N'2023-12-07T07:26:21.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (5, 5, CAST(1057.07 AS Decimal(15, 2)), NULL, NULL, CAST(N'2023-03-20T08:59:14.000' AS DateTime), CAST(N'2024-04-07T20:39:42.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (6, 6, CAST(9614.45 AS Decimal(15, 2)), N'Vivamus vestibulum sagittis sapien.', N'turpis adipiscing lorem vitae', CAST(N'2024-02-07T10:40:58.000' AS DateTime), CAST(N'2024-09-25T06:29:43.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (7, 7, CAST(2859.07 AS Decimal(15, 2)), N'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', N'in magna bibendum imperdiet nullam orci', CAST(N'2023-11-30T22:08:29.000' AS DateTime), CAST(N'2023-12-11T03:55:56.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (8, 8, CAST(2693.12 AS Decimal(15, 2)), NULL, N'odio justo sollicitudin ut', CAST(N'2023-05-01T02:07:38.000' AS DateTime), CAST(N'2024-02-03T07:28:39.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (9, 9, CAST(5764.38 AS Decimal(15, 2)), N'Donec quis orci eget orci vehicula condimentum.', NULL, CAST(N'2023-03-25T23:16:08.000' AS DateTime), CAST(N'2023-04-23T16:58:25.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (10, 10, CAST(9333.87 AS Decimal(15, 2)), N'Nulla facilisi.', NULL, CAST(N'2023-11-23T04:45:04.000' AS DateTime), CAST(N'2024-11-05T16:37:57.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (11, 11, CAST(4013.41 AS Decimal(15, 2)), N'Nullam molestie nibh in lectus. Pellentesque at nulla.', N'viverra pede ac', CAST(N'2023-05-15T16:54:09.000' AS DateTime), CAST(N'2023-11-26T09:39:02.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (12, 12, CAST(1794.16 AS Decimal(15, 2)), N'In quis justo.', N'lobortis vel dapibus at diam', CAST(N'2024-01-10T00:13:09.000' AS DateTime), CAST(N'2025-01-20T23:31:45.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (13, 13, CAST(8261.14 AS Decimal(15, 2)), N'In congue.', N'mi pede malesuada in imperdiet et commodo vulputate', CAST(N'2023-10-22T00:19:18.000' AS DateTime), CAST(N'2023-04-29T20:43:57.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (14, 14, CAST(8640.17 AS Decimal(15, 2)), N'Vivamus vel nulla eget eros elementum pellentesque.', N'lobortis vel dapibus at diam nam tristique', CAST(N'2023-08-27T03:12:33.000' AS DateTime), CAST(N'2023-09-17T20:32:18.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (15, 15, CAST(7742.10 AS Decimal(15, 2)), N'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', N'viverra pede ac diam cras pellentesque volutpat dui', CAST(N'2024-01-09T10:49:08.000' AS DateTime), CAST(N'2023-06-20T03:09:31.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (16, 16, CAST(2257.69 AS Decimal(15, 2)), NULL, NULL, CAST(N'2023-05-14T09:47:43.000' AS DateTime), CAST(N'2024-12-12T09:09:58.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (17, 17, CAST(9547.59 AS Decimal(15, 2)), NULL, NULL, CAST(N'2023-07-26T05:17:13.000' AS DateTime), CAST(N'2024-02-29T11:00:10.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (18, 18, CAST(1026.13 AS Decimal(15, 2)), N'Ut tellus. Nulla ut erat id mauris vulputate elementum.', NULL, CAST(N'2023-12-21T05:52:17.000' AS DateTime), CAST(N'2023-04-12T00:54:40.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (19, 19, CAST(9903.47 AS Decimal(15, 2)), N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', N'blandit ultrices enim lorem', CAST(N'2024-01-30T02:17:00.000' AS DateTime), CAST(N'2023-07-04T01:04:53.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (20, 20, CAST(6818.04 AS Decimal(15, 2)), N'Nulla nisl.', N'vestibulum sagittis', CAST(N'2023-05-02T23:31:39.000' AS DateTime), CAST(N'2024-03-03T20:27:34.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (21, 21, CAST(2462.68 AS Decimal(15, 2)), N'Phasellus id sapien in sapien iaculis congue.', N'suscipit ligula in lacus curabitur at ipsum ac tellus', CAST(N'2023-03-30T07:05:34.000' AS DateTime), CAST(N'2024-12-07T02:21:36.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (22, 22, CAST(4584.94 AS Decimal(15, 2)), NULL, N'lorem ipsum dolor sit', CAST(N'2023-10-06T02:20:08.000' AS DateTime), CAST(N'2023-07-24T20:00:11.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (23, 23, CAST(4249.91 AS Decimal(15, 2)), N'Aliquam non mauris.', N'turpis eget', CAST(N'2023-08-17T07:10:41.000' AS DateTime), CAST(N'2023-07-23T02:49:56.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (24, 24, CAST(7553.38 AS Decimal(15, 2)), N'Vivamus in felis eu sapien cursus vestibulum.', N'ultrices', CAST(N'2023-09-04T07:20:23.000' AS DateTime), CAST(N'2024-04-24T08:21:10.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (25, 25, CAST(2110.65 AS Decimal(15, 2)), N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.', N'odio donec vitae nisi nam ultrices libero non mattis', CAST(N'2023-07-31T10:51:39.000' AS DateTime), CAST(N'2024-03-05T16:57:30.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (26, 26, CAST(9190.61 AS Decimal(15, 2)), N'Duis consequat dui nec nisi volutpat eleifend.', N'lorem vitae mattis nibh ligula nec sem duis aliquam', CAST(N'2023-04-02T22:46:51.000' AS DateTime), CAST(N'2024-08-23T07:02:19.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (27, 27, CAST(3048.98 AS Decimal(15, 2)), N'Duis bibendum. Morbi non quam nec dui luctus rutrum.', N'rutrum rutrum neque aenean auctor gravida sem praesent id', CAST(N'2023-03-23T08:05:36.000' AS DateTime), CAST(N'2023-09-16T22:54:46.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (28, 28, CAST(8112.55 AS Decimal(15, 2)), NULL, N'quam fringilla rhoncus mauris enim leo rhoncus sed', CAST(N'2024-02-05T08:57:15.000' AS DateTime), CAST(N'2023-10-14T12:26:01.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (29, 29, CAST(1384.76 AS Decimal(15, 2)), NULL, N'et', CAST(N'2023-04-10T03:38:30.000' AS DateTime), CAST(N'2023-07-12T07:40:07.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (30, 30, CAST(5063.88 AS Decimal(15, 2)), N'Nunc purus. Phasellus in felis.', N'amet justo morbi ut', CAST(N'2023-07-08T15:52:16.000' AS DateTime), CAST(N'2025-02-13T05:54:51.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (31, 31, CAST(9590.48 AS Decimal(15, 2)), N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', N'lorem ipsum dolor sit amet consectetuer', CAST(N'2023-07-22T00:26:21.000' AS DateTime), CAST(N'2024-04-26T03:13:13.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (32, 32, CAST(1448.33 AS Decimal(15, 2)), NULL, N'mi integer ac neque duis bibendum', CAST(N'2023-12-12T10:17:07.000' AS DateTime), CAST(N'2023-04-30T15:01:00.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (33, 33, CAST(5803.52 AS Decimal(15, 2)), N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.', N'nulla ultrices aliquet maecenas leo odio condimentum id luctus', CAST(N'2023-02-23T03:06:46.000' AS DateTime), CAST(N'2024-05-17T09:14:26.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (34, 34, CAST(7450.88 AS Decimal(15, 2)), N'Morbi non lectus.', N'suspendisse ornare consequat lectus in est risus auctor sed', CAST(N'2023-08-10T06:10:29.000' AS DateTime), CAST(N'2023-09-04T03:43:50.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (35, 35, CAST(4635.24 AS Decimal(15, 2)), N'Suspendisse potenti. Cras in purus eu magna vulputate luctus.', N'lacus purus aliquet at feugiat non pretium', CAST(N'2023-04-21T17:38:05.000' AS DateTime), CAST(N'2024-02-18T09:24:14.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (36, 36, CAST(6913.17 AS Decimal(15, 2)), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', N'duis bibendum morbi non quam nec dui', CAST(N'2023-03-30T13:33:08.000' AS DateTime), CAST(N'2023-08-29T22:44:33.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (37, 37, CAST(9742.70 AS Decimal(15, 2)), N'Sed ante. Vivamus tortor.', N'volutpat in congue etiam justo', CAST(N'2023-06-10T20:21:03.000' AS DateTime), CAST(N'2024-11-10T23:44:54.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (38, 38, CAST(4575.84 AS Decimal(15, 2)), N'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.', NULL, CAST(N'2024-02-16T08:59:30.000' AS DateTime), CAST(N'2023-11-20T00:48:56.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (39, 39, CAST(6782.92 AS Decimal(15, 2)), NULL, N'iaculis', CAST(N'2024-01-03T05:14:52.000' AS DateTime), CAST(N'2024-11-18T15:56:42.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (40, 40, CAST(2249.43 AS Decimal(15, 2)), N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', NULL, CAST(N'2023-03-14T05:07:26.000' AS DateTime), CAST(N'2023-08-24T13:05:18.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (41, 41, CAST(2864.85 AS Decimal(15, 2)), NULL, NULL, CAST(N'2024-02-10T12:42:10.000' AS DateTime), CAST(N'2024-04-16T00:40:19.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (42, 42, CAST(6045.33 AS Decimal(15, 2)), N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.', N'praesent lectus vestibulum quam', CAST(N'2023-05-12T04:26:48.000' AS DateTime), CAST(N'2024-06-12T16:12:27.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (43, 43, CAST(9568.60 AS Decimal(15, 2)), NULL, NULL, CAST(N'2023-03-09T00:14:26.000' AS DateTime), CAST(N'2023-06-17T02:57:02.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (44, 44, CAST(2747.09 AS Decimal(15, 2)), N'In blandit ultrices enim.', N'in congue etiam justo etiam pretium', CAST(N'2023-09-22T15:39:01.000' AS DateTime), CAST(N'2023-05-10T10:55:22.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (45, 45, CAST(8862.19 AS Decimal(15, 2)), NULL, N'interdum mauris', CAST(N'2024-01-23T13:04:34.000' AS DateTime), CAST(N'2024-09-30T19:14:29.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (46, 46, CAST(8673.00 AS Decimal(15, 2)), NULL, NULL, CAST(N'2023-07-06T06:31:05.000' AS DateTime), CAST(N'2024-06-17T11:21:57.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (47, 47, CAST(1173.99 AS Decimal(15, 2)), N'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', N'vel lectus in quam fringilla', CAST(N'2023-03-06T15:46:28.000' AS DateTime), CAST(N'2025-01-26T13:22:34.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (48, 48, CAST(5970.04 AS Decimal(15, 2)), N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', NULL, CAST(N'2024-01-06T04:11:28.000' AS DateTime), CAST(N'2023-12-10T15:09:57.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (49, 49, CAST(7855.26 AS Decimal(15, 2)), N'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', NULL, CAST(N'2023-06-06T12:16:48.000' AS DateTime), CAST(N'2023-04-21T20:48:51.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (50, 50, CAST(8607.29 AS Decimal(15, 2)), N'Nunc purus. Phasellus in felis.', N'etiam vel augue vestibulum rutrum', CAST(N'2023-04-06T07:12:33.000' AS DateTime), CAST(N'2023-06-03T22:10:47.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (51, 51, CAST(7182.47 AS Decimal(15, 2)), N'In hac habitasse platea dictumst.', NULL, CAST(N'2024-01-05T22:42:57.000' AS DateTime), CAST(N'2024-09-28T14:25:34.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (52, 52, CAST(9639.25 AS Decimal(15, 2)), N'Morbi vel lectus in quam fringilla rhoncus.', NULL, CAST(N'2023-05-21T06:33:03.000' AS DateTime), CAST(N'2024-02-24T07:16:53.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (53, 53, CAST(7273.37 AS Decimal(15, 2)), N'Nulla justo.', NULL, CAST(N'2023-07-05T09:10:40.000' AS DateTime), CAST(N'2024-12-03T08:30:25.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (54, 54, CAST(7174.59 AS Decimal(15, 2)), N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', N'pretium', CAST(N'2023-08-29T07:42:15.000' AS DateTime), CAST(N'2023-11-02T02:57:26.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (55, 55, CAST(3765.19 AS Decimal(15, 2)), NULL, N'sapien quis libero nullam sit amet turpis elementum ligula', CAST(N'2024-01-18T01:23:56.000' AS DateTime), CAST(N'2023-12-25T01:17:09.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (56, 56, CAST(9140.13 AS Decimal(15, 2)), N'Proin interdum mauris non ligula pellentesque ultrices.', NULL, CAST(N'2023-10-16T08:31:04.000' AS DateTime), CAST(N'2025-01-24T15:30:14.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (57, 57, CAST(5513.02 AS Decimal(15, 2)), N'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.', NULL, CAST(N'2023-08-03T06:32:58.000' AS DateTime), CAST(N'2024-09-24T16:55:11.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (58, 58, CAST(3777.86 AS Decimal(15, 2)), NULL, N'pretium iaculis diam erat', CAST(N'2023-05-31T12:38:30.000' AS DateTime), CAST(N'2024-10-14T06:02:30.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (59, 59, CAST(8399.24 AS Decimal(15, 2)), N'Suspendisse potenti.', N'nascetur ridiculus', CAST(N'2024-01-06T09:35:33.000' AS DateTime), CAST(N'2024-01-26T12:50:46.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (60, 60, CAST(1138.17 AS Decimal(15, 2)), NULL, N'sit amet eros suspendisse accumsan tortor quis', CAST(N'2023-11-18T14:24:59.000' AS DateTime), CAST(N'2024-05-05T09:47:28.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (61, 61, CAST(1123.18 AS Decimal(15, 2)), N'Morbi ut odio.', N'tellus in sagittis dui vel nisl duis ac nibh', CAST(N'2024-01-13T13:46:54.000' AS DateTime), CAST(N'2023-10-06T22:38:24.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (62, 62, CAST(3219.05 AS Decimal(15, 2)), N'Nunc rhoncus dui vel sem. Sed sagittis.', NULL, CAST(N'2023-06-05T18:34:19.000' AS DateTime), CAST(N'2023-12-21T08:22:09.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (63, 63, CAST(8169.76 AS Decimal(15, 2)), NULL, N'viverra diam vitae', CAST(N'2023-03-21T10:17:50.000' AS DateTime), CAST(N'2023-07-22T12:47:40.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (64, 64, CAST(1206.75 AS Decimal(15, 2)), N'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', N'porttitor lacus at turpis donec posuere metus vitae', CAST(N'2023-05-04T14:30:13.000' AS DateTime), CAST(N'2024-03-10T23:07:39.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (65, 65, CAST(6841.08 AS Decimal(15, 2)), N'Morbi non lectus.', N'sagittis dui vel nisl duis ac', CAST(N'2023-05-30T04:12:21.000' AS DateTime), CAST(N'2025-02-05T03:09:12.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (66, 66, CAST(2412.90 AS Decimal(15, 2)), N'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', N'magna bibendum imperdiet nullam orci pede venenatis non', CAST(N'2023-03-20T16:23:45.000' AS DateTime), CAST(N'2024-09-09T10:29:48.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (67, 67, CAST(8388.40 AS Decimal(15, 2)), NULL, N'odio odio elementum eu interdum', CAST(N'2023-11-15T14:16:06.000' AS DateTime), CAST(N'2024-06-06T23:08:00.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (68, 68, CAST(2582.51 AS Decimal(15, 2)), N'Proin at turpis a pede posuere nonummy. Integer non velit.', N'pede justo', CAST(N'2023-04-11T12:03:43.000' AS DateTime), CAST(N'2024-06-27T07:01:27.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (69, 69, CAST(4609.87 AS Decimal(15, 2)), N'Suspendisse accumsan tortor quis turpis.', N'velit eu', CAST(N'2023-07-17T19:29:40.000' AS DateTime), CAST(N'2024-05-30T10:11:56.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (70, 70, CAST(9781.98 AS Decimal(15, 2)), N'Pellentesque at nulla. Suspendisse potenti.', N'morbi vel lectus in quam fringilla rhoncus mauris enim', CAST(N'2023-11-22T17:10:16.000' AS DateTime), CAST(N'2024-10-10T03:02:05.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (71, 71, CAST(5038.45 AS Decimal(15, 2)), N'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', N'dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis', CAST(N'2023-11-05T12:27:55.000' AS DateTime), CAST(N'2024-11-17T11:50:48.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (72, 72, CAST(6621.70 AS Decimal(15, 2)), N'Maecenas pulvinar lobortis est.', NULL, CAST(N'2023-07-15T22:51:18.000' AS DateTime), CAST(N'2025-01-31T06:32:05.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (73, 73, CAST(5738.24 AS Decimal(15, 2)), N'Nulla ut erat id mauris vulputate elementum. Nullam varius.', N'ut ultrices vel augue', CAST(N'2023-10-27T18:58:10.000' AS DateTime), CAST(N'2023-05-15T19:16:52.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (74, 74, CAST(8313.89 AS Decimal(15, 2)), N'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', N'nibh ligula nec sem duis aliquam convallis', CAST(N'2023-09-03T01:12:24.000' AS DateTime), CAST(N'2023-11-06T23:14:55.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (75, 75, CAST(7363.02 AS Decimal(15, 2)), NULL, N'nulla elit ac nulla sed vel enim sit', CAST(N'2023-12-16T21:38:06.000' AS DateTime), CAST(N'2024-06-18T11:11:08.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (76, 76, CAST(4662.03 AS Decimal(15, 2)), N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', N'viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum', CAST(N'2023-07-17T00:57:13.000' AS DateTime), CAST(N'2023-09-17T20:11:24.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (77, 77, CAST(9755.98 AS Decimal(15, 2)), NULL, N'tortor risus dapibus augue vel accumsan tellus', CAST(N'2023-08-10T23:15:44.000' AS DateTime), CAST(N'2024-03-06T13:58:04.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (78, 78, CAST(8089.41 AS Decimal(15, 2)), N'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', N'nulla eget eros elementum pellentesque quisque porta volutpat', CAST(N'2023-12-10T23:18:40.000' AS DateTime), CAST(N'2023-05-19T03:37:41.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (79, 79, CAST(8889.30 AS Decimal(15, 2)), N'Curabitur at ipsum ac tellus semper interdum.', N'magna vulputate luctus cum sociis natoque penatibus et', CAST(N'2023-06-29T07:26:24.000' AS DateTime), CAST(N'2024-11-28T01:09:55.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (80, 80, CAST(1685.69 AS Decimal(15, 2)), N'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', N'ultrices posuere cubilia curae mauris viverra diam vitae quam', CAST(N'2023-10-27T07:23:24.000' AS DateTime), CAST(N'2023-11-11T05:44:49.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (81, 81, CAST(5602.57 AS Decimal(15, 2)), N'In quis justo. Maecenas rhoncus aliquam lacus.', NULL, CAST(N'2023-10-27T02:00:18.000' AS DateTime), CAST(N'2025-02-17T15:15:00.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (82, 82, CAST(7147.49 AS Decimal(15, 2)), N'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', NULL, CAST(N'2023-03-15T12:50:13.000' AS DateTime), CAST(N'2023-04-20T18:51:16.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (83, 83, CAST(9789.06 AS Decimal(15, 2)), N'Maecenas tincidunt lacus at velit.', NULL, CAST(N'2023-05-31T11:20:41.000' AS DateTime), CAST(N'2023-09-23T23:59:58.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (84, 84, CAST(6919.42 AS Decimal(15, 2)), N'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', N'congue vivamus metus arcu adipiscing molestie', CAST(N'2023-12-31T02:57:59.000' AS DateTime), CAST(N'2024-06-30T21:04:32.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (85, 85, CAST(7599.85 AS Decimal(15, 2)), N'Phasellus id sapien in sapien iaculis congue.', N'elementum in', CAST(N'2023-07-04T20:36:28.000' AS DateTime), CAST(N'2024-09-28T03:15:56.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (86, 86, CAST(4442.06 AS Decimal(15, 2)), NULL, N'sem fusce', CAST(N'2023-03-23T22:01:00.000' AS DateTime), CAST(N'2023-12-08T08:52:48.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (87, 87, CAST(7570.81 AS Decimal(15, 2)), N'Sed ante. Vivamus tortor.', N'venenatis turpis enim blandit mi in porttitor pede justo', CAST(N'2023-10-08T04:35:58.000' AS DateTime), CAST(N'2023-05-05T11:43:09.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (88, 88, CAST(4791.15 AS Decimal(15, 2)), N'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', NULL, CAST(N'2023-03-23T08:50:36.000' AS DateTime), CAST(N'2023-08-03T19:10:52.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (89, 89, CAST(5010.46 AS Decimal(15, 2)), N'Duis aliquam convallis nunc.', N'velit id pretium iaculis diam erat fermentum', CAST(N'2023-04-25T00:56:03.000' AS DateTime), CAST(N'2023-12-08T04:50:44.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (90, 90, CAST(3520.03 AS Decimal(15, 2)), NULL, N'posuere cubilia curae mauris viverra diam vitae', CAST(N'2023-10-30T16:26:02.000' AS DateTime), CAST(N'2024-01-09T23:28:21.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (91, 91, CAST(4183.23 AS Decimal(15, 2)), N'Nullam porttitor lacus at turpis.', NULL, CAST(N'2023-12-01T11:26:35.000' AS DateTime), CAST(N'2025-02-10T19:08:55.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (92, 92, CAST(8265.40 AS Decimal(15, 2)), N'Donec semper sapien a libero. Nam dui.', N'in purus eu magna', CAST(N'2023-05-31T15:46:32.000' AS DateTime), CAST(N'2024-07-14T07:18:34.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (93, 93, CAST(2039.89 AS Decimal(15, 2)), N'Nullam varius. Nulla facilisi.', N'a suscipit nulla elit ac nulla sed vel enim', CAST(N'2023-09-22T17:01:06.000' AS DateTime), CAST(N'2023-04-12T13:26:59.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (94, 94, CAST(1464.82 AS Decimal(15, 2)), N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', N'lorem id ligula suspendisse ornare consequat lectus', CAST(N'2023-11-08T18:18:46.000' AS DateTime), CAST(N'2025-02-10T14:07:24.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (95, 95, CAST(2781.02 AS Decimal(15, 2)), NULL, N'nam nulla integer pede justo', CAST(N'2023-11-26T06:05:05.000' AS DateTime), CAST(N'2024-08-29T03:24:58.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (96, 96, CAST(2068.88 AS Decimal(15, 2)), NULL, NULL, CAST(N'2023-02-23T08:20:44.000' AS DateTime), CAST(N'2023-08-13T05:44:41.000' AS DateTime), 0, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (97, 97, CAST(3445.90 AS Decimal(15, 2)), NULL, NULL, CAST(N'2023-03-27T09:23:43.000' AS DateTime), CAST(N'2024-11-21T09:08:21.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (98, 98, CAST(8031.35 AS Decimal(15, 2)), N'Integer ac neque.', N'integer a nibh', CAST(N'2023-06-21T11:25:58.000' AS DateTime), CAST(N'2024-06-06T21:47:21.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (99, 99, CAST(9560.18 AS Decimal(15, 2)), N'Suspendisse potenti.', NULL, CAST(N'2023-03-06T08:23:48.000' AS DateTime), CAST(N'2023-03-26T17:15:31.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Hospitalization] ([HospitalizationCode], [PatientId], [Price], [Goal], [Department], [StartDate], [EndDate], [IsCanceled], [CancelReason], [HospitalizationRoomId]) VALUES (100, 100, CAST(8873.71 AS Decimal(15, 2)), N'Etiam justo. Etiam pretium iaculis justo.', N'quam turpis adipiscing lorem vitae mattis nibh ligula nec', CAST(N'2023-11-17T00:58:22.000' AS DateTime), CAST(N'2024-10-16T05:15:31.000' AS DateTime), 1, N'нет', NULL)
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (1, N'9080060062', CAST(N'2004-05-08' AS Date), 0, N'77 Anniversary Junction', N'9494364689 ', N'cseaward0@whitehouse.gov', N'VP Sales', NULL, 95, N'1911490257', CAST(N'2023-09-07' AS Date), N'Stark-Braun', N'Wisoky-Streich')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (2, N'6948036252', CAST(N'2003-03-04' AS Date), 0, N'3805 6th Center', N'3734046227 ', N'nfipp1@bbb.org', N'Community Outreach Specialist', NULL, 23, N'4926938219', CAST(N'2024-01-11' AS Date), N'Macejkovic and Sons', N'Stanton-Rosenbaum')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (3, N'6378146527', CAST(N'2003-07-28' AS Date), 1, N'246 Hermina Lane', N'8576164673 ', N'ccheng2@house.gov', N'Legal Assistant', NULL, 82, N'9136726192', CAST(N'2023-03-02' AS Date), N'Pacocha, Senger and Kuhlman', N'Schimmel-Rowe')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (4, N'8558247676', CAST(N'2000-03-21' AS Date), 1, N'7263 Russell Park', N'3975816545 ', N'jdyte3@census.gov', N'Structural Analysis Engineer', NULL, 44, N'1359028331', CAST(N'2023-12-14' AS Date), N'Haley, Doyle and Ritchie', N'McDermott and Sons')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (5, N'9092424978', CAST(N'2001-09-27' AS Date), 0, N'26 Donald Lane', N'5826239359 ', N'kpossell4@photobucket.com', N'Social Worker', NULL, 71, N'4138796673', CAST(N'2023-10-13' AS Date), N'Feeney and Sons', N'Skiles Inc')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (6, N'8468474479', CAST(N'2001-03-31' AS Date), 0, N'29 Walton Hill', N'2528435002 ', N'aheinert5@github.io', N'Food Chemist', NULL, 26, N'3525742320', CAST(N'2023-07-16' AS Date), N'Pollich, Dibbert and Schmeler', N'Lueilwitz-Johnston')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (7, N'8596533257', CAST(N'2003-09-23' AS Date), 0, N'2 North Crossing', N'7311513361 ', N'wgentiry6@nifty.com', N'Nurse', NULL, 84, N'1284316211', CAST(N'2023-08-01' AS Date), N'Willms, Hoeger and Heidenreich', N'Skiles, Conn and Greenholt')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (8, N'5783196312', CAST(N'2004-07-31' AS Date), 0, N'44 Grim Park', N'4225920579 ', N'eloughnan7@yolasite.com', N'Community Outreach Specialist', NULL, 79, N'4162222312', CAST(N'2023-11-27' AS Date), N'Volkman Group', N'Bode LLC')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (9, N'1221161091', CAST(N'2007-03-15' AS Date), 1, N'0849 Ohio Park', N'5313205134 ', N'jbonifant8@deviantart.com', N'Financial Advisor', NULL, 67, N'4882785803', CAST(N'2023-07-18' AS Date), N'Rath Group', N'Reinger Group')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (10, N'2904874666', CAST(N'2003-12-26' AS Date), 0, N'433 Myrtle Court', N'2387817883 ', N'lmenelaws9@ifeng.com', N'Mechanical Systems Engineer', NULL, 39, N'1626330441', CAST(N'2023-03-11' AS Date), N'Nicolas-Leuschke', N'Lang and Sons')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (11, N'0350033544', CAST(N'2000-09-19' AS Date), 1, N'1496 Brickson Park Plaza', N'2801992616 ', N'polivasa@cisco.com', N'VP Marketing', NULL, 82, N'3559981131', CAST(N'2023-09-03' AS Date), N'Howe-Klein', N'Halvorson-Jerde')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (12, N'8661859093', CAST(N'2005-11-19' AS Date), 0, N'19 Crowley Avenue', N'1283050299 ', N'flonghorneb@furl.net', N'Environmental Tech', NULL, 42, N'1957265361', CAST(N'2023-11-26' AS Date), N'Hartmann, Bauch and Hayes', N'Crist, Crooks and Mueller')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (13, N'7115879168', CAST(N'2004-02-26' AS Date), 1, N'56076 Haas Pass', N'5406820696 ', N'gkilcoynec@acquirethisname.com', N'Staff Scientist', NULL, 26, N'9166463009', CAST(N'2023-07-10' AS Date), N'Orn Inc', N'Jacobi-Kovacek')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (14, N'6620922422', CAST(N'2000-06-13' AS Date), 1, N'074 Brentwood Alley', N'6695561421 ', N'fpickstond@amazon.co.uk', N'Biostatistician II', NULL, 55, N'7120534629', CAST(N'2023-12-11' AS Date), N'Carroll, Bogan and Metz', N'Gerhold, Heidenreich and Yost')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (15, N'4984990694', CAST(N'2002-04-27' AS Date), 1, N'7 Monterey Place', N'9547892055 ', N'yboyete@jugem.jp', N'Staff Scientist', NULL, 87, N'0296981958', CAST(N'2023-10-04' AS Date), N'Reichert, Anderson and Hermann', N'Wintheiser-Senger')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (16, N'5212540798', CAST(N'2007-05-04' AS Date), 0, N'01 Donald Parkway', N'2926322155 ', N'imaccleayf@walmart.com', N'Payment Adjustment Coordinator', NULL, 92, N'7162797016', CAST(N'2024-01-17' AS Date), N'Ritchie and Sons', N'Frami-Considine')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (17, N'6052729058', CAST(N'2007-02-04' AS Date), 1, N'20054 Fisk Avenue', N'5484050896 ', N'iblaikg@bbc.co.uk', N'Accounting Assistant II', NULL, 51, N'1444316664', CAST(N'2023-03-28' AS Date), N'Miller and Sons', N'Ondricka-Skiles')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (18, N'3778830031', CAST(N'2005-02-28' AS Date), 1, N'66647 3rd Circle', N'5236098598 ', N'rmaccomeh@soup.io', N'Internal Auditor', NULL, 15, N'4436068269', CAST(N'2023-08-18' AS Date), N'Kirlin-McClure', N'Paucek LLC')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (19, N'7196764897', CAST(N'2001-05-18' AS Date), 1, N'0 Autumn Leaf Place', N'7452784297 ', N'kfitzpatricki@nbcnews.com', N'Human Resources Manager', NULL, 67, N'7648069679', CAST(N'2023-10-10' AS Date), N'Dibbert, Yundt and Kemmer', N'Gleichner LLC')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (20, N'0159536928', CAST(N'2004-07-04' AS Date), 0, N'5 Sloan Point', N'4345599201 ', N'mcastiglionij@com.com', N'VP Product Management', NULL, 60, N'5575690091', CAST(N'2023-02-22' AS Date), N'Hammes-Bernhard', N'Pollich-Stiedemann')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (21, N'0759706395', CAST(N'2004-11-28' AS Date), 1, N'823 Messerschmidt Crossing', N'6123126412 ', N'svignalk@time.com', N'Financial Analyst', NULL, 98, N'1517808324', CAST(N'2023-12-04' AS Date), N'Auer LLC', N'Schaden and Sons')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (22, N'7841013388', CAST(N'2007-05-23' AS Date), 0, N'76059 Kim Drive', N'6625799321 ', N'kduferl@arizona.edu', N'Teacher', NULL, 34, N'5808970407', CAST(N'2023-09-16' AS Date), N'Doyle, Rolfson and Doyle', N'Gottlieb, Robel and Kuphal')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (23, N'8544422640', CAST(N'2002-11-04' AS Date), 1, N'48 Springview Court', N'6423774618 ', N'raxstonm@marketwatch.com', N'VP Product Management', NULL, 81, N'9405817132', CAST(N'2023-11-27' AS Date), N'Homenick, Rutherford and Mraz', N'Casper-Funk')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (24, N'3475374811', CAST(N'2005-06-08' AS Date), 1, N'5 Kinsman Park', N'7626268026 ', N'braistrickn@reuters.com', N'Paralegal', NULL, 77, N'5521224742', CAST(N'2024-01-11' AS Date), N'Bartoletti LLC', N'Wolff, Raynor and Carroll')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (25, N'0050120158', CAST(N'2004-07-09' AS Date), 0, N'8 Springs Trail', N'9956903333 ', N'msynnoto@ibm.com', N'Registered Nurse', NULL, 75, N'2660962251', CAST(N'2023-03-04' AS Date), N'Hilpert Group', N'Boyle, Franecki and Hilll')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (26, N'8415530234', CAST(N'2000-05-09' AS Date), 0, N'52063 Monterey Court', N'2462168139 ', N'yalphegep@1und1.de', N'Mechanical Systems Engineer', NULL, 81, N'0251045943', CAST(N'2023-05-14' AS Date), N'Davis LLC', N'Okuneva, Stroman and Purdy')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (27, N'5693379183', CAST(N'2004-01-19' AS Date), 0, N'80 Golf Course Park', N'1945984679 ', N'rtrundleq@businessinsider.com', N'VP Product Management', NULL, 99, N'6311847043', CAST(N'2023-12-28' AS Date), N'Rosenbaum, Metz and Zulauf', N'Durgan, Kutch and Rice')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (28, N'2942391898', CAST(N'2001-09-05' AS Date), 0, N'7114 Golden Leaf Trail', N'9541602337 ', N'hdunfordr@xing.com', N'Technical Writer', NULL, 63, N'3993290585', CAST(N'2023-10-02' AS Date), N'Nitzsche-Denesik', N'Botsford, Abernathy and Gutmann')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (29, N'7813588002', CAST(N'2002-07-22' AS Date), 1, N'496 Valley Edge Pass', N'7388440935 ', N'lgaffneys@e-recht24.de', N'Graphic Designer', NULL, 98, N'3305422289', CAST(N'2023-03-23' AS Date), N'Mante Inc', N'Johnston and Sons')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (30, N'1431313270', CAST(N'2003-10-01' AS Date), 1, N'825 5th Drive', N'4027872230 ', N'cadelmant@phoca.cz', N'Information Systems Manager', NULL, 90, N'0795138660', CAST(N'2023-06-30' AS Date), N'Gottlieb-Mitchell', N'Boehm-Schaden')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (31, N'4635395545', CAST(N'2005-11-23' AS Date), 1, N'65370 Barby Drive', N'2322084792 ', N'easpoleu@ucsd.edu', N'Help Desk Technician', NULL, 87, N'1185846662', CAST(N'2023-04-13' AS Date), N'Murazik, Boyle and Kemmer', N'Pacocha and Sons')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (32, N'3200271515', CAST(N'2000-06-29' AS Date), 1, N'6 Anzinger Way', N'4257141227 ', N'ttevelovv@dailymotion.com', N'Quality Engineer', NULL, 12, N'7401541734', CAST(N'2023-08-11' AS Date), N'Cremin-Pagac', N'Reichert-Rath')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (33, N'3260153268', CAST(N'2005-12-06' AS Date), 0, N'3824 Westridge Lane', N'8046549775 ', N'hvalentiw@goodreads.com', N'Account Representative II', NULL, 70, N'5485601480', CAST(N'2023-05-22' AS Date), N'Roberts Group', N'Schmidt-Reynolds')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (34, N'5682312139', CAST(N'2002-11-12' AS Date), 1, N'516 Forest Dale Point', N'1332060256 ', N'nuzellix@hao123.com', N'Nurse Practicioner', NULL, 94, N'2437971599', CAST(N'2023-07-02' AS Date), N'Gorczany Inc', N'Mitchell, Kunde and Glover')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (35, N'5015214391', CAST(N'2002-12-22' AS Date), 1, N'7 Susan Center', N'8978321773 ', N'rrobbeyy@exblog.jp', N'Financial Analyst', NULL, 18, N'2829556976', CAST(N'2024-01-27' AS Date), N'Volkman, Jacobs and Halvorson', N'Mueller Group')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (36, N'1801814988', CAST(N'2007-11-17' AS Date), 0, N'889 Maple Wood Drive', N'1184699487 ', N'hmacparlandz@cargocollective.com', N'Editor', NULL, 99, N'1489328297', CAST(N'2023-08-12' AS Date), N'Stanton LLC', N'Kris-Hartmann')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (37, N'7317616885', CAST(N'2005-07-22' AS Date), 0, N'85718 Troy Trail', N'1349217375 ', N'btortoise10@chron.com', N'Speech Pathologist', NULL, 81, N'9695898211', CAST(N'2023-10-24' AS Date), N'Dietrich-Legros', N'Gerlach-Hilpert')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (38, N'9715527353', CAST(N'2004-02-19' AS Date), 0, N'0 Shasta Point', N'6972129631 ', N'edunderdale11@printfriendly.com', N'VP Accounting', NULL, 69, N'5365653769', CAST(N'2023-07-11' AS Date), N'Hayes and Sons', N'Cartwright, Heaney and Dickens')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (39, N'9718554610', CAST(N'2007-06-09' AS Date), 0, N'44 Manufacturers Terrace', N'1534426191 ', N'bmowson12@dion.ne.jp', N'Office Assistant IV', NULL, 65, N'5260490592', CAST(N'2024-01-29' AS Date), N'Kreiger LLC', N'Conn and Sons')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (40, N'5342385075', CAST(N'2007-12-17' AS Date), 1, N'21727 Eggendart Alley', N'5631110623 ', N'pevison13@goo.gl', N'Geologist IV', NULL, 25, N'6955217585', CAST(N'2023-12-23' AS Date), N'Berge, Franecki and Kilback', N'Harber Inc')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (41, N'6081591034', CAST(N'2007-06-11' AS Date), 0, N'843 Scoville Way', N'1178799785 ', N'smussetti14@webeden.co.uk', N'Web Designer II', NULL, 40, N'7248728888', CAST(N'2023-06-17' AS Date), N'Towne and Sons', N'Ryan-Baumbach')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (42, N'6448300767', CAST(N'2006-06-05' AS Date), 1, N'025 Bluestem Junction', N'5147410697 ', N'cdixie15@webs.com', N'Marketing Manager', NULL, 4, N'7630523661', CAST(N'2023-06-11' AS Date), N'Pollich-Morar', N'Bode Inc')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (43, N'3442864003', CAST(N'2007-10-08' AS Date), 1, N'3 Clemons Trail', N'5253361756 ', N'lsatch16@goo.gl', N'VP Quality Control', NULL, 52, N'6406647203', CAST(N'2023-05-13' AS Date), N'Beer, Trantow and Reichert', N'Mayer-Hamill')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (44, N'8317338576', CAST(N'2007-11-22' AS Date), 0, N'80176 Butternut Road', N'4242047796 ', N'egoad17@si.edu', N'Nuclear Power Engineer', NULL, 41, N'1840737093', CAST(N'2023-09-08' AS Date), N'Schuppe-Kerluke', N'West-Satterfield')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (45, N'4929324408', CAST(N'2004-02-11' AS Date), 1, N'720 Mosinee Pass', N'5541260717 ', N'cpinn18@deliciousdays.com', N'Director of Sales', NULL, 27, N'6382809136', CAST(N'2023-06-05' AS Date), N'Jakubowski Group', N'Stokes, Thompson and Hilll')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (46, N'1855969629', CAST(N'2004-07-04' AS Date), 0, N'5199 Arapahoe Road', N'9997762136 ', N'rzmitruk19@merriam-webster.com', N'Analog Circuit Design manager', NULL, 65, N'2494482798', CAST(N'2023-06-17' AS Date), N'Bergstrom, Padberg and Smitham', N'Leffler-Schaden')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (47, N'9647774591', CAST(N'2001-09-09' AS Date), 1, N'3 John Wall Drive', N'7127010999 ', N'gcordsen1a@mayoclinic.com', N'Financial Analyst', NULL, 50, N'1673036619', CAST(N'2023-09-07' AS Date), N'Bailey, Emmerich and Rohan', N'Schaefer LLC')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (48, N'7864965512', CAST(N'2006-07-05' AS Date), 0, N'14 Di Loreto Terrace', N'3179435958 ', N'rhansman1b@networkadvertising.org', N'Biostatistician II', NULL, 94, N'4905269334', CAST(N'2024-01-23' AS Date), N'Hirthe Group', N'Ondricka-Muller')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (49, N'8464297599', CAST(N'2004-12-15' AS Date), 0, N'42 Trailsway Avenue', N'7475128416 ', N'msarvar1c@ucsd.edu', N'Associate Professor', NULL, 18, N'2107973970', CAST(N'2023-08-01' AS Date), N'McGlynn and Sons', N'Ryan, Donnelly and Gislason')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (50, N'6188485746', CAST(N'2007-04-10' AS Date), 1, N'815 Vidon Alley', N'1328053206 ', N'joverill1d@ft.com', N'Programmer Analyst IV', NULL, 14, N'3607935041', CAST(N'2023-08-24' AS Date), N'Kautzer, Stroman and Cormier', N'Braun-Donnelly')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (51, N'8419050725', CAST(N'2007-06-24' AS Date), 0, N'66042 Golf Course Junction', N'4297315466 ', N'oclaisse1e@people.com.cn', N'Geological Engineer', NULL, 42, N'3218990505', CAST(N'2023-02-18' AS Date), N'Barrows LLC', N'Miller Group')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (52, N'3409014012', CAST(N'2006-03-02' AS Date), 0, N'59630 Vernon Avenue', N'2975357686 ', N'aformoy1f@ebay.co.uk', N'Staff Scientist', NULL, 55, N'5844955013', CAST(N'2023-10-20' AS Date), N'Vandervort-Volkman', N'Larkin, King and Bauch')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (53, N'2823639411', CAST(N'2001-08-08' AS Date), 1, N'59 Miller Avenue', N'2654953865 ', N'ebortoluzzi1g@cmu.edu', N'Research Associate', NULL, 76, N'0393476405', CAST(N'2023-07-15' AS Date), N'Moore-Russel', N'Cummings, Lehner and Senger')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (54, N'0700664157', CAST(N'2002-09-11' AS Date), 0, N'36719 Texas Avenue', N'2151546078 ', N'jlightfoot1h@marriott.com', N'Business Systems Development Analyst', NULL, 51, N'0972801308', CAST(N'2023-09-18' AS Date), N'Swaniawski Group', N'Rohan-Cartwright')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (55, N'2908508230', CAST(N'2004-02-06' AS Date), 0, N'4 Packers Junction', N'6161972822 ', N'psagg1i@simplemachines.org', N'VP Sales', NULL, 26, N'3573634702', CAST(N'2024-01-24' AS Date), N'Schowalter-Deckow', N'Kovacek-Rippin')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (56, N'3768251349', CAST(N'2006-12-24' AS Date), 1, N'1983 Manufacturers Drive', N'5969400092 ', N'abeagles1j@mayoclinic.com', N'Safety Technician IV', NULL, 44, N'2261252161', CAST(N'2023-11-13' AS Date), N'Macejkovic, Wuckert and Crona', N'Jacobs-Swift')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (57, N'1986370224', CAST(N'2007-04-20' AS Date), 1, N'68182 Boyd Junction', N'8341651042 ', N'bthurnham1k@tripod.com', N'Dental Hygienist', NULL, 72, N'6972174686', CAST(N'2023-05-16' AS Date), N'Hudson-Wehner', N'Hilpert LLC')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (58, N'7281972830', CAST(N'2004-10-19' AS Date), 1, N'23 Carioca Point', N'8026200720 ', N'emaffezzoli1l@4shared.com', N'Data Coordinator', NULL, 37, N'1745070788', CAST(N'2023-08-07' AS Date), N'Hessel-Douglas', N'O''Hara-Bergnaum')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (59, N'2873092629', CAST(N'2000-04-29' AS Date), 0, N'69166 Lotheville Way', N'6736036541 ', N'hgreenly1m@hexun.com', N'Paralegal', NULL, 15, N'1387239996', CAST(N'2023-06-03' AS Date), N'Windler-Nitzsche', N'Beer LLC')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (60, N'8494399667', CAST(N'2002-08-29' AS Date), 1, N'11163 Sherman Trail', N'9504704502 ', N'tbertenshaw1n@fotki.com', N'Compensation Analyst', NULL, 66, N'6311445123', CAST(N'2023-05-03' AS Date), N'Kirlin, Gerhold and Emmerich', N'Baumbach, Tromp and Murray')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (61, N'7140155631', CAST(N'2007-06-04' AS Date), 0, N'1043 Kingsford Lane', N'7351366160 ', N'bdavidge1o@51.la', N'Structural Engineer', NULL, 88, N'9779201394', CAST(N'2024-02-13' AS Date), N'Hegmann-Larson', N'Morissette LLC')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (62, N'8312464425', CAST(N'2002-02-23' AS Date), 0, N'0486 Rigney Terrace', N'5526628634 ', N'tdoding1p@princeton.edu', N'Account Executive', NULL, 15, N'8977252989', CAST(N'2023-07-11' AS Date), N'Trantow, Mitchell and Blanda', N'Monahan, Goyette and Feeney')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (63, N'5832940598', CAST(N'2005-05-06' AS Date), 1, N'17 Susan Park', N'5164931698 ', N'efayerman1q@rediff.com', N'Actuary', NULL, 82, N'0325149631', CAST(N'2023-04-22' AS Date), N'Monahan, Schneider and Dickens', N'Collier Group')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (64, N'9950964687', CAST(N'2003-09-01' AS Date), 1, N'1918 Aberg Street', N'3874366878 ', N'hdarmody1r@paypal.com', N'Biostatistician III', NULL, 78, N'1804682616', CAST(N'2023-12-21' AS Date), N'Little Group', N'Muller-Russel')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (65, N'4661059581', CAST(N'2005-01-04' AS Date), 0, N'691 Mayer Park', N'6138216224 ', N'fulyat1s@skype.com', N'Account Coordinator', NULL, 74, N'8793206879', CAST(N'2023-05-16' AS Date), N'Friesen and Sons', N'Mills-Parisian')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (66, N'7632372032', CAST(N'2007-09-26' AS Date), 1, N'185 Anzinger Plaza', N'2529834505 ', N'tlilley1t@time.com', N'Internal Auditor', NULL, 52, N'4200077043', CAST(N'2023-09-28' AS Date), N'Casper-Abernathy', N'Vandervort-Klein')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (67, N'8356724147', CAST(N'2004-06-20' AS Date), 0, N'9438 2nd Alley', N'3112331975 ', N'gwiddop1u@biblegateway.com', N'Environmental Tech', NULL, 59, N'2415511900', CAST(N'2023-03-22' AS Date), N'Simonis and Sons', N'Boyle-Monahan')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (68, N'9667402797', CAST(N'2000-12-15' AS Date), 0, N'1 Spohn Drive', N'5817848529 ', N'bjellico1v@ebay.com', N'Assistant Media Planner', NULL, 64, N'3347172728', CAST(N'2023-06-19' AS Date), N'Boyer Inc', N'Adams, Ryan and Bahringer')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (69, N'6096338380', CAST(N'2006-12-07' AS Date), 1, N'97 Bunting Hill', N'6325529932 ', N'dbernini1w@irs.gov', N'Nurse', NULL, 22, N'6221725984', CAST(N'2023-11-14' AS Date), N'Schaefer Inc', N'McClure, Paucek and Yost')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (70, N'1066208956', CAST(N'2007-04-16' AS Date), 0, N'1 Packers Terrace', N'5986474967 ', N'sdemeis1x@bigcartel.com', N'Database Administrator III', NULL, 52, N'9798347110', CAST(N'2023-09-07' AS Date), N'Howe-Gutmann', N'Jenkins Group')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (71, N'6430488551', CAST(N'2000-11-25' AS Date), 0, N'7 Southridge Crossing', N'9598041458 ', N'islessar1y@behance.net', N'Business Systems Development Analyst', NULL, 68, N'6542639624', CAST(N'2023-04-25' AS Date), N'Schaefer, Wolff and Nolan', N'Welch-Cummerata')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (72, N'1047899345', CAST(N'2001-03-13' AS Date), 1, N'909 Dottie Court', N'6569319515 ', N'hnaden1z@theglobeandmail.com', N'Systems Administrator IV', NULL, 65, N'5205403608', CAST(N'2023-09-01' AS Date), N'Nicolas, Heller and Bayer', N'Braun, Conn and Schinner')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (73, N'9387088979', CAST(N'2006-01-25' AS Date), 0, N'11396 Summerview Point', N'5359543187 ', N'jgait20@utexas.edu', N'Geological Engineer', NULL, 89, N'9493481719', CAST(N'2023-05-23' AS Date), N'Goyette-Weimann', N'Kovacek-Bogan')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (74, N'2440344869', CAST(N'2004-04-20' AS Date), 1, N'89 Eggendart Parkway', N'9056111475 ', N'nseeler21@t-online.de', N'Research Nurse', NULL, 17, N'5523974366', CAST(N'2023-10-23' AS Date), N'Mueller, Marquardt and Osinski', N'Crooks-Deckow')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (75, N'2591228841', CAST(N'2005-03-18' AS Date), 1, N'221 Maryland Terrace', N'9687541783 ', N'tcargo22@typepad.com', N'Recruiter', NULL, 83, N'3175474578', CAST(N'2023-02-21' AS Date), N'Purdy LLC', N'Champlin, Rowe and Zulauf')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (76, N'1532352212', CAST(N'2005-03-16' AS Date), 0, N'09 Rowland Plaza', N'4646063161 ', N'bsabate23@miitbeian.gov.cn', N'Occupational Therapist', NULL, 59, N'5859915802', CAST(N'2023-11-13' AS Date), N'Hayes-Rowe', N'Marvin Inc')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (77, N'5415041036', CAST(N'2003-08-03' AS Date), 0, N'5393 Maple Park', N'9019050965 ', N'kszabo24@cornell.edu', N'Director of Sales', NULL, 29, N'0742965295', CAST(N'2024-01-27' AS Date), N'Runolfsdottir, Jones and Morar', N'Gorczany Group')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (78, N'4503824384', CAST(N'2007-05-17' AS Date), 1, N'1883 Gulseth Park', N'2184881172 ', N'grozsa25@dot.gov', N'Professor', NULL, 64, N'4944394950', CAST(N'2023-07-19' AS Date), N'Sawayn-Renner', N'Schmidt-Rodriguez')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (79, N'6251567902', CAST(N'2006-04-27' AS Date), 0, N'6150 Moland Crossing', N'8507728644 ', N'atestro26@nhs.uk', N'Help Desk Operator', NULL, 64, N'5093153621', CAST(N'2023-06-04' AS Date), N'Cartwright-Wuckert', N'Mann, Herman and Hyatt')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (80, N'0990309851', CAST(N'2006-03-04' AS Date), 1, N'00779 Oneill Court', N'4023215309 ', N'lrimbault27@dion.ne.jp', N'Staff Scientist', NULL, 61, N'0722018126', CAST(N'2023-08-04' AS Date), N'Padberg Group', N'Dickinson Inc')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (81, N'4578615367', CAST(N'2001-04-22' AS Date), 0, N'6 Hintze Lane', N'6176732194 ', N'rspera28@mediafire.com', N'Social Worker', NULL, 61, N'5417442976', CAST(N'2023-07-17' AS Date), N'Feest-Roob', N'Streich Group')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (82, N'1792452454', CAST(N'2002-02-25' AS Date), 1, N'69081 Cottonwood Drive', N'9817387674 ', N'rhastin29@sun.com', N'Marketing Manager', NULL, 75, N'6108086432', CAST(N'2024-02-16' AS Date), N'Wilkinson Inc', N'Glover, Gislason and Bauch')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (83, N'5655819473', CAST(N'2000-11-18' AS Date), 1, N'2320 Carpenter Street', N'5443281983 ', N'bberlin2a@mashable.com', N'Help Desk Technician', NULL, 26, N'4823112806', CAST(N'2023-07-28' AS Date), N'Gulgowski-Mante', N'Casper and Sons')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (84, N'1793220700', CAST(N'2002-12-03' AS Date), 0, N'3227 Independence Avenue', N'7054765884 ', N'jcrossgrove2b@tinyurl.com', N'Web Designer I', NULL, 32, N'1403392048', CAST(N'2023-03-13' AS Date), N'Bergnaum and Sons', N'Walker-Rath')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (85, N'8374819138', CAST(N'2006-11-06' AS Date), 1, N'05242 Schurz Hill', N'3072356996 ', N'smccaghan2c@cocolog-nifty.com', N'Senior Sales Associate', NULL, 62, N'9409954584', CAST(N'2023-10-25' AS Date), N'Gutmann, Schneider and Hand', N'Green, MacGyver and VonRueden')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (86, N'0748436316', CAST(N'2005-12-08' AS Date), 1, N'610 Helena Lane', N'6061948273 ', N'rdowning2d@nytimes.com', N'Financial Analyst', NULL, 32, N'0732487293', CAST(N'2023-05-14' AS Date), N'Simonis, Grimes and Mraz', N'Wunsch, Funk and Leffler')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (87, N'2956282808', CAST(N'2000-07-04' AS Date), 1, N'958 Bartelt Crossing', N'6928221368 ', N'lelbourn2e@weather.com', N'Sales Representative', NULL, 42, N'9504605079', CAST(N'2023-06-29' AS Date), N'Gorczany Group', N'Howe, Dietrich and Purdy')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (88, N'4255855765', CAST(N'2000-03-07' AS Date), 0, N'64 Loftsgordon Road', N'6646066615 ', N'mmenichelli2f@guardian.co.uk', N'Information Systems Manager', NULL, 2, N'6939465960', CAST(N'2023-07-10' AS Date), N'Koelpin-Douglas', N'Runolfsdottir Group')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (89, N'6037566607', CAST(N'2002-05-24' AS Date), 1, N'0828 American Ash Trail', N'6802464935 ', N'oburth2g@cnn.com', N'Recruiter', NULL, 27, N'6563271065', CAST(N'2023-10-15' AS Date), N'Mosciski LLC', N'Cummings Group')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (90, N'4749367184', CAST(N'2004-11-25' AS Date), 1, N'709 Bluestem Center', N'8785575819 ', N'htratton2h@goo.ne.jp', N'Nuclear Power Engineer', NULL, 26, N'3281363059', CAST(N'2023-10-02' AS Date), N'Douglas and Sons', N'Turcotte LLC')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (91, N'5196188800', CAST(N'2004-09-17' AS Date), 1, N'70228 Marquette Court', N'1756785295 ', N'lpardal2i@amazon.co.jp', N'Product Engineer', NULL, 8, N'3115306881', CAST(N'2023-05-24' AS Date), N'Pagac and Sons', N'Grady Inc')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (92, N'9370813551', CAST(N'2004-09-16' AS Date), 1, N'33453 Ludington Place', N'1134788946 ', N'kchisnall2j@nbcnews.com', N'Environmental Specialist', NULL, 80, N'2114502546', CAST(N'2023-04-20' AS Date), N'Bruen, Batz and Hermiston', N'Keebler Group')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (93, N'5170595166', CAST(N'2008-02-14' AS Date), 1, N'954 Monica Street', N'9717487599 ', N'ssawart2k@sakura.ne.jp', N'Structural Engineer', NULL, 68, N'6509983206', CAST(N'2023-08-04' AS Date), N'Weissnat, Kessler and Predovic', N'Ebert-Metz')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (94, N'0290542111', CAST(N'2007-08-14' AS Date), 1, N'804 Milwaukee Lane', N'3393442496 ', N'lrichens2l@xrea.com', N'Business Systems Development Analyst', NULL, 84, N'6838535599', CAST(N'2023-11-24' AS Date), N'Kemmer LLC', N'Koelpin, O''Conner and Buckridge')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (95, N'9553944744', CAST(N'2006-03-19' AS Date), 1, N'78 Evergreen Circle', N'6675264258 ', N'nnobles2m@accuweather.com', N'Teacher', NULL, 15, N'3686927683', CAST(N'2023-10-03' AS Date), N'Kautzer-Leannon', N'Legros, Mraz and Johnston')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (96, N'1670658716', CAST(N'2003-12-17' AS Date), 1, N'01 Gulseth Park', N'9245336902 ', N'torteaux2n@linkedin.com', N'Associate Professor', NULL, 52, N'6838906678', CAST(N'2023-10-19' AS Date), N'Wisoky Inc', N'Swaniawski-Armstrong')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (97, N'4194878558', CAST(N'2000-06-28' AS Date), 0, N'37546 Summerview Crossing', N'6653306400 ', N'ssisey2o@hp.com', N'Staff Scientist', NULL, 51, N'9601918779', CAST(N'2023-05-12' AS Date), N'Oberbrunner LLC', N'Kassulke-Fritsch')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (98, N'9604159968', CAST(N'2000-05-13' AS Date), 0, N'353 Pierstorff Parkway', N'4163009015 ', N'lpoynor2p@zimbio.com', N'Geologist I', NULL, 51, N'3634003154', CAST(N'2024-02-11' AS Date), N'Runolfsson-Reinger', N'Mayert Inc')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (99, N'2675944955', CAST(N'2004-04-12' AS Date), 1, N'42 Summit Road', N'6256114587 ', N'zsoro2q@ft.com', N'Sales Representative', NULL, 45, N'7088039648', CAST(N'2024-01-09' AS Date), N'Hartmann Group', N'Fisher Group')
GO
INSERT [dbo].[Patient] ([PatientId], [Passport], [DateOfBirth], [IsMale], [Address], [PhoneNumber], [Email], [Job], [Photo], [MedicalCardNumber], [InsurancePolicyNumber], [InsurancePolicyEndDate], [InsuranceCompany], [PassportIssuedBy]) VALUES (100, N'1423157397', CAST(N'2002-01-25' AS Date), 1, N'8 Doe Crossing Parkway', N'9078329107 ', N'mbeechcraft2r@so-net.ne.jp', N'Office Assistant I', NULL, 14, N'1788224744', CAST(N'2023-05-11' AS Date), N'Frami, Jacobs and Mosciski', N'Senger and Sons')
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (1, NULL, N'sjinkins0', N'Stearn', N'Jinkins', NULL, CAST(N'2023-04-16T11:45:55.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (2, NULL, N'llamey1', N'Luce', N'Lamey', NULL, CAST(N'2023-09-14T02:03:26.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (3, NULL, N'ltalloe2', N'Lilli', N'Talloe', NULL, CAST(N'2024-01-30T07:35:18.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (4, NULL, N'vchinge3', N'Vail', N'Chinge', NULL, CAST(N'2023-04-26T12:07:21.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (5, NULL, N'jdrinkale4', N'Jim', N'Drinkale', NULL, CAST(N'2023-11-05T04:32:58.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (6, NULL, N'gwike5', N'Graeme', N'Wike', NULL, CAST(N'2023-05-29T05:44:47.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (7, NULL, N'jkiddle6', N'Jermain', N'Kiddle', NULL, CAST(N'2023-08-08T08:23:45.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (8, NULL, N'dbarfield7', N'Den', N'Barfield', NULL, CAST(N'2023-08-11T00:56:31.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (9, NULL, N'rpitkin8', N'Ranee', N'Pitkin', NULL, CAST(N'2023-08-24T23:24:09.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (10, NULL, N'hdaingerfield9', N'Harley', N'Daingerfield', NULL, CAST(N'2023-11-11T23:56:50.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (11, NULL, N'ncutsfortha', N'Niki', N'Cutsforth', NULL, CAST(N'2024-01-13T17:56:34.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (12, NULL, N'shaddintonb', N'Sunshine', N'Haddinton', NULL, CAST(N'2023-06-23T03:40:22.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (13, NULL, N'dblowingc', N'Dorelia', N'Blowing', NULL, CAST(N'2023-07-29T10:57:52.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (14, NULL, N'ohugod', N'Ortensia', N'Hugo', NULL, CAST(N'2023-12-05T11:05:03.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (15, NULL, N'cworhame', N'Conan', N'Worham', NULL, CAST(N'2024-02-09T16:41:28.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (16, NULL, N'estinsonf', N'Etan', N'Stinson', NULL, CAST(N'2023-08-07T22:02:03.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (17, NULL, N'ewarsopg', N'Elfrida', N'Warsop', NULL, CAST(N'2023-09-12T14:19:14.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (18, NULL, N'dschultheissh', N'Derward', N'Schultheiss', NULL, CAST(N'2023-03-29T16:21:04.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (19, NULL, N'rcouldwelli', N'Remington', N'Couldwell', NULL, CAST(N'2023-09-05T05:44:16.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (20, NULL, N'festabrookj', N'Felita', N'Estabrook', NULL, CAST(N'2023-06-29T06:56:51.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (21, NULL, N'ecaustonk', N'Elinore', N'Causton', NULL, CAST(N'2023-04-18T23:55:30.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (22, NULL, N'lmallockl', N'Lance', N'Mallock', NULL, CAST(N'2023-05-10T09:36:28.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (23, NULL, N'mdykinsm', N'Murial', N'Dykins', NULL, CAST(N'2023-11-28T15:51:33.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (24, NULL, N'sburdounn', N'Seana', N'Burdoun', NULL, CAST(N'2023-06-16T21:18:47.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (25, NULL, N'leustaceo', N'Lilia', N'Eustace', NULL, CAST(N'2024-02-06T01:39:20.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (26, NULL, N'blovittp', N'Brucie', N'Lovitt', NULL, CAST(N'2023-06-14T12:46:45.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (27, NULL, N'skildayq', N'Sascha', N'Kilday', NULL, CAST(N'2024-02-06T18:30:53.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (28, NULL, N'egarfittr', N'Elyn', N'Garfitt', NULL, CAST(N'2023-11-11T03:55:01.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (29, NULL, N'sohartagans', N'Sibylla', N'O''Hartagan', NULL, CAST(N'2023-07-30T19:27:25.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (30, NULL, N'hjosephst', N'Hilly', N'Josephs', NULL, CAST(N'2023-08-12T14:07:45.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (31, NULL, N'sweldrakeu', N'Sybila', N'Weldrake', NULL, CAST(N'2023-07-22T18:22:55.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (32, NULL, N'rstellmanv', N'Reamonn', N'Stellman', NULL, CAST(N'2023-10-30T12:22:31.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (33, NULL, N'nmeriothw', N'Nell', N'Merioth', NULL, CAST(N'2023-09-26T20:16:43.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (34, NULL, N'adunbobbinx', N'Adria', N'Dunbobbin', NULL, CAST(N'2023-09-13T15:39:07.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (35, NULL, N'acraisfordy', N'Anders', N'Craisford', NULL, CAST(N'2023-09-12T06:13:31.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (36, NULL, N'jsizlandz', N'Jeane', N'Sizland', NULL, CAST(N'2023-08-05T08:12:20.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (37, NULL, N'cflockhart10', N'Cynde', N'Flockhart', NULL, CAST(N'2024-01-01T22:08:54.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (38, NULL, N'grichly11', N'George', N'Richly', NULL, CAST(N'2023-08-07T22:17:32.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (39, NULL, N'cfishpoole12', N'Clint', N'Fishpoole', NULL, CAST(N'2023-06-02T22:13:30.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (40, NULL, N'bgillham13', N'Blake', N'Gillham', NULL, CAST(N'2023-05-25T06:55:33.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (41, NULL, N'sbengtsen14', N'Steward', N'Bengtsen', NULL, CAST(N'2023-10-26T01:20:23.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (42, NULL, N'hlehrmann15', N'Heriberto', N'Lehrmann', NULL, CAST(N'2023-08-28T23:01:13.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (43, NULL, N'wmcvane16', N'Wallas', N'McVane', NULL, CAST(N'2023-11-20T17:15:39.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (44, NULL, N'gberthot17', N'Gaby', N'Berthot', NULL, CAST(N'2023-04-30T09:51:41.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (45, NULL, N'hedmeads18', N'Harland', N'Edmeads', NULL, CAST(N'2023-09-12T09:40:54.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (46, NULL, N'rsurguine19', N'Rochelle', N'Surguine', NULL, CAST(N'2023-08-08T08:11:49.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (47, NULL, N'ffetherstone1a', N'Forster', N'Fetherstone', NULL, CAST(N'2023-06-21T11:33:39.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (48, NULL, N'bleheude1b', N'Brant', N'Leheude', NULL, CAST(N'2023-12-06T21:06:54.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (49, NULL, N'ashapiro1c', N'Alexina', N'Shapiro', NULL, CAST(N'2023-12-08T14:48:22.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (50, NULL, N'bozintsev1d', N'Burl', N'Ozintsev', NULL, CAST(N'2023-10-17T15:38:36.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (51, NULL, N'mgowlett1e', N'Melania', N'Gowlett', NULL, CAST(N'2023-12-31T23:03:13.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (52, NULL, N'mpotteril1f', N'Murray', N'Potteril', NULL, CAST(N'2023-11-19T14:09:21.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (53, NULL, N'ekeming1g', N'Elfie', N'Keming', NULL, CAST(N'2023-10-06T19:27:08.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (54, NULL, N'fphette1h', N'Frederico', N'Phette', NULL, CAST(N'2023-07-05T13:11:32.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (55, NULL, N'hplane1i', N'Haze', N'Plane', NULL, CAST(N'2023-12-05T09:24:40.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (56, NULL, N'pchalder1j', N'Parke', N'Chalder', NULL, CAST(N'2023-06-17T14:17:40.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (57, NULL, N'diremonger1k', N'Diana', N'Iremonger', NULL, CAST(N'2023-08-30T18:28:07.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (58, NULL, N'sflaubert1l', N'Susan', N'Flaubert', NULL, CAST(N'2023-11-24T11:08:46.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (59, NULL, N'asouness1m', N'Anatollo', N'Souness', NULL, CAST(N'2023-12-08T20:46:28.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (60, NULL, N'rhorbath1n', N'Rosamund', N'Horbath', NULL, CAST(N'2024-02-04T13:00:28.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (61, NULL, N'jvicent1o', N'Juliet', N'Vicent', NULL, CAST(N'2023-10-20T15:38:59.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (62, NULL, N'sfarron1p', N'Sascha', N'Farron', NULL, CAST(N'2024-01-05T20:35:13.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (63, NULL, N'cminchinden1q', N'Carleen', N'Minchinden', NULL, CAST(N'2023-05-04T06:10:42.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (64, NULL, N'ctumbridge1r', N'Corene', N'Tumbridge', NULL, CAST(N'2023-07-26T01:23:07.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (65, NULL, N'clombard1s', N'Cleavland', N'Lombard', NULL, CAST(N'2023-06-16T14:27:17.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (66, NULL, N'ealcide1t', N'Esra', N'Alcide', NULL, CAST(N'2023-06-21T15:22:07.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (67, NULL, N'gjindracek1u', N'Gawen', N'Jindracek', NULL, CAST(N'2023-05-28T12:57:19.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (68, NULL, N'lpabst1v', N'Lian', N'Pabst', NULL, CAST(N'2023-05-03T19:21:31.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (69, NULL, N'smccullum1w', N'Shelley', N'McCullum', NULL, CAST(N'2023-04-24T11:44:54.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (70, NULL, N'ktappington1x', N'Kata', N'Tappington', NULL, CAST(N'2023-05-02T14:05:50.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (71, NULL, N'ifurzey1y', N'Ira', N'Furzey', NULL, CAST(N'2023-05-03T09:28:05.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (72, NULL, N'fkembley1z', N'Farris', N'Kembley', NULL, CAST(N'2023-05-27T22:29:13.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (73, NULL, N'rbagshaw20', N'Romona', N'Bagshaw', NULL, CAST(N'2023-08-16T20:59:57.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (74, NULL, N'rcornner21', N'Ruprecht', N'Cornner', NULL, CAST(N'2023-08-31T11:34:59.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (75, NULL, N'cpoznanski22', N'Claiborn', N'Poznanski', NULL, CAST(N'2023-11-06T04:49:04.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (76, NULL, N'colford23', N'Cornelia', N'Olford', NULL, CAST(N'2023-04-28T22:40:06.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (77, NULL, N'drate24', N'Darrick', N'Rate', NULL, CAST(N'2023-06-15T01:18:06.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (78, NULL, N'civie25', N'Clifford', N'Ivie', NULL, CAST(N'2023-03-23T21:02:16.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (79, NULL, N'urosbotham26', N'Ulrich', N'Rosbotham', NULL, CAST(N'2023-12-13T06:17:21.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (80, NULL, N'cmeriel27', N'Casi', N'Meriel', NULL, CAST(N'2023-04-28T01:47:54.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (81, NULL, N'kboyton28', N'Kelsey', N'Boyton', NULL, CAST(N'2024-01-04T12:13:27.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (82, NULL, N'dmacias29', N'Dun', N'Macias', NULL, CAST(N'2023-03-25T01:24:08.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (83, NULL, N'cmontier2a', N'Cynde', N'Montier', NULL, CAST(N'2023-03-17T05:42:33.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (84, NULL, N'jdrable2b', N'Jessalin', N'Drable', NULL, CAST(N'2023-04-13T14:43:26.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (85, NULL, N'molohan2c', N'Mirabelle', N'Olohan', NULL, CAST(N'2024-01-16T22:02:45.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (86, NULL, N'spetit2d', N'Saudra', N'Petit', NULL, CAST(N'2023-08-09T20:54:28.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (87, NULL, N'sbullick2e', N'Skye', N'Bullick', NULL, CAST(N'2023-11-21T17:05:19.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (88, NULL, N'rtregale2f', N'Ruggiero', N'Tregale', NULL, CAST(N'2023-08-27T02:54:21.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (89, NULL, N'aandrusov2g', N'Aidan', N'Andrusov', NULL, CAST(N'2023-06-20T18:09:59.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (90, NULL, N'ebonavia2h', N'Evelina', N'Bonavia', NULL, CAST(N'2023-04-13T20:36:24.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (91, NULL, N'bcaban2i', N'Blaine', N'Caban', NULL, CAST(N'2023-12-31T12:08:23.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (92, NULL, N'adavern2j', N'Aundrea', N'Davern', NULL, CAST(N'2023-08-03T01:56:02.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (93, NULL, N'mlanphier2k', N'Madelon', N'Lanphier', NULL, CAST(N'2023-05-27T09:20:25.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (94, NULL, N'mkneebone2l', N'Moira', N'Kneebone', NULL, CAST(N'2024-02-07T08:42:00.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (95, NULL, N'bwoller2m', N'Bil', N'Woller', NULL, CAST(N'2023-05-23T13:59:39.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (96, NULL, N'sgladebeck2n', N'Shirlee', N'Gladebeck', NULL, CAST(N'2024-01-12T16:51:12.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (97, NULL, N'landrejs2o', N'Lillis', N'Andrejs', NULL, CAST(N'2023-04-11T21:06:19.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (98, NULL, N'bwheater2p', N'Benedicta', N'Wheater', NULL, CAST(N'2023-10-10T12:19:10.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (99, NULL, N'gepperson2q', N'Gerda', N'Epperson', NULL, CAST(N'2023-09-14T05:43:06.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (100, NULL, N'yswyndley2r', N'Yuma', N'Swyndley', NULL, CAST(N'2023-06-01T15:21:36.000' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (108, 0x03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4, N'doc1', N'Egor', N'Ivanov', NULL, CAST(N'2024-02-18T04:48:42.660' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (109, 0x03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4, N'doc2', N'Dmitry', N'Ivanov', NULL, CAST(N'2024-02-18T04:48:50.297' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (110, 0x03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4, N'doc3', N'Alex', N'Ivanov', NULL, CAST(N'2024-02-18T04:48:55.863' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (111, 0x03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4, N'doc4', N'Mihail', N'Ivanov', NULL, CAST(N'2024-02-18T04:49:04.350' AS DateTime), 0)
GO
INSERT [dbo].[User] ([UserId], [Password], [Login], [Name], [SurName], [Patronymic], [RegistrationDate], [IsAdmin]) VALUES (112, 0x03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4, N'doc5', N'Ivan', N'Ivanov', NULL, CAST(N'2024-02-18T04:49:15.580' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[EventHasHospitalization] ADD  CONSTRAINT [UQ_Event] UNIQUE NONCLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventHasHospitalization] ADD  CONSTRAINT [UQ_HasHospitalization] UNIQUE NONCLUSTERED 
(
	[HospitalizationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[EventType] ADD  CONSTRAINT [UQ_TherapyType] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [UQ_Patient] UNIQUE NONCLUSTERED 
(
	[InsurancePolicyNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookingToEvent] ADD  CONSTRAINT [DF_ScheduleItem_EventStartDate]  DEFAULT (getdate()) FOR [EventStartDate]
GO
ALTER TABLE [dbo].[BookingToEvent] ADD  CONSTRAINT [DF_Schedule_IsChanged]  DEFAULT ((0)) FOR [IsChanged]
GO
ALTER TABLE [dbo].[BookingToEvent] ADD  CONSTRAINT [DF_BookingToEvent_EventTypeId]  DEFAULT ((1)) FOR [EventTypeId]
GO
ALTER TABLE [dbo].[Event] ADD  CONSTRAINT [DF_Therapy_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Event] ADD  CONSTRAINT [DF_Event_PatientId]  DEFAULT ((1)) FOR [PatientId]
GO
ALTER TABLE [dbo].[Hospitalization] ADD  CONSTRAINT [DF_Hospitalization_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Hospitalization] ADD  CONSTRAINT [DF_Hospitalization_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Hospitalization] ADD  CONSTRAINT [DF_Hospitalization_IsCanceled]  DEFAULT ((0)) FOR [IsCanceled]
GO
ALTER TABLE [dbo].[Hospitalization] ADD  CONSTRAINT [DF_Hospitalization_CancelReason]  DEFAULT (N'нет') FOR [CancelReason]
GO
ALTER TABLE [dbo].[ScheduleMonth] ADD  CONSTRAINT [DF_ScheduleMonth_Year]  DEFAULT (datepart(year,getdate())) FOR [Year]
GO
ALTER TABLE [dbo].[ScheduleMonth] ADD  CONSTRAINT [DF_ScheduleMonth_IsApproved]  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_RegistrationDate]  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsAdmin]  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[BookingToEvent]  WITH CHECK ADD  CONSTRAINT [FK_BookingToEvent_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([EventId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BookingToEvent] CHECK CONSTRAINT [FK_BookingToEvent_Event]
GO
ALTER TABLE [dbo].[BookingToEvent]  WITH CHECK ADD  CONSTRAINT [FK_BookingToEvent_EventType] FOREIGN KEY([EventTypeId])
REFERENCES [dbo].[EventType] ([TypeId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BookingToEvent] CHECK CONSTRAINT [FK_BookingToEvent_EventType]
GO
ALTER TABLE [dbo].[BookingToEvent]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Cabinet] FOREIGN KEY([CabinetId])
REFERENCES [dbo].[Cabinet] ([CabinetId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BookingToEvent] CHECK CONSTRAINT [FK_Schedule_Cabinet]
GO
ALTER TABLE [dbo].[BookingToEvent]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Doctor] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([DoctorId])
GO
ALTER TABLE [dbo].[BookingToEvent] CHECK CONSTRAINT [FK_Schedule_Doctor]
GO
ALTER TABLE [dbo].[BookingToEvent]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_ScheduleMonth] FOREIGN KEY([ScheduleMonthId])
REFERENCES [dbo].[ScheduleMonth] ([ScheduleMonthId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BookingToEvent] CHECK CONSTRAINT [FK_Schedule_ScheduleMonth]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_User] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[User] ([UserId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_User]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Patient]
GO
ALTER TABLE [dbo].[EventHasHospitalization]  WITH CHECK ADD  CONSTRAINT [FK_EventHasHospitalization_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([EventId])
GO
ALTER TABLE [dbo].[EventHasHospitalization] CHECK CONSTRAINT [FK_EventHasHospitalization_Event]
GO
ALTER TABLE [dbo].[EventHasHospitalization]  WITH CHECK ADD  CONSTRAINT [FK_EventHasHospitalization_Hospitalization] FOREIGN KEY([HospitalizationCode])
REFERENCES [dbo].[Hospitalization] ([HospitalizationCode])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[EventHasHospitalization] CHECK CONSTRAINT [FK_EventHasHospitalization_Hospitalization]
GO
ALTER TABLE [dbo].[EventHasPatients]  WITH CHECK ADD  CONSTRAINT [FK_EventHasPatients_BookingToEvent] FOREIGN KEY([BookingId])
REFERENCES [dbo].[BookingToEvent] ([BookingId])
GO
ALTER TABLE [dbo].[EventHasPatients] CHECK CONSTRAINT [FK_EventHasPatients_BookingToEvent]
GO
ALTER TABLE [dbo].[EventHasPatients]  WITH CHECK ADD  CONSTRAINT [FK_EventHasPatients_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[EventHasPatients] CHECK CONSTRAINT [FK_EventHasPatients_Patient]
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
ALTER TABLE [dbo].[Hospitalization]  WITH CHECK ADD  CONSTRAINT [FK_Hospitalization_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Hospitalization] CHECK CONSTRAINT [FK_Hospitalization_Patient]
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
ALTER TABLE [dbo].[WorkHours]  WITH CHECK ADD  CONSTRAINT [FK_WorkHours_ScheduleWorkDayTemplate] FOREIGN KEY([ScheduleTemplateId])
REFERENCES [dbo].[ScheduleWorkDayTemplate] ([ScheduleTemplateId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[WorkHours] CHECK CONSTRAINT [FK_WorkHours_ScheduleWorkDayTemplate]
GO
