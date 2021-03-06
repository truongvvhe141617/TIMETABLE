USE [TimeTable]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 8/6/2021 10:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [int] NOT NULL,
	[ClassName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 8/6/2021 10:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [int] NOT NULL,
	[RoomName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 8/6/2021 10:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherID] [int] NOT NULL,
	[TeacherName] [varchar](50) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Time]    Script Date: 8/6/2021 10:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time](
	[Slot] [int] NOT NULL,
	[Time] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[Slot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeTable]    Script Date: 8/6/2021 10:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeTable](
	[ClassID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Slot] [int] NOT NULL,
	[RoomID] [int] NULL,
	[TeacherID] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (1, N'SE1401')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (2, N'SE1402')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (3, N'SE1403')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (4, N'SE1404')
INSERT [dbo].[Class] ([ClassID], [ClassName]) VALUES (5, N'SE1405')
GO
INSERT [dbo].[Room] ([RoomID], [RoomName]) VALUES (1, N'AL-201')
INSERT [dbo].[Room] ([RoomID], [RoomName]) VALUES (2, N'AL-202')
INSERT [dbo].[Room] ([RoomID], [RoomName]) VALUES (3, N'AL-203')
INSERT [dbo].[Room] ([RoomID], [RoomName]) VALUES (4, N'AL-204')
INSERT [dbo].[Room] ([RoomID], [RoomName]) VALUES (5, N'AL-205')
GO
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName]) VALUES (1, N'HungKD')
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName]) VALUES (2, N'VinhTT')
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName]) VALUES (3, N'ToanNM')
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName]) VALUES (4, N'LongDT')
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName]) VALUES (5, N'LoiND')
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName]) VALUES (6, N'BinhTV')
GO
INSERT [dbo].[Time] ([Slot], [Time]) VALUES (1, N'7h30'' - 9h')
INSERT [dbo].[Time] ([Slot], [Time]) VALUES (2, N'9h10'' - 10h40''')
INSERT [dbo].[Time] ([Slot], [Time]) VALUES (3, N'10h50'' - 12h20''')
INSERT [dbo].[Time] ([Slot], [Time]) VALUES (4, N'12h50'' - 14h20''')
INSERT [dbo].[Time] ([Slot], [Time]) VALUES (5, N'14h30'' - 16h')
INSERT [dbo].[Time] ([Slot], [Time]) VALUES (6, N'16h10'' - 17h40''')
GO
INSERT [dbo].[TimeTable] ([ClassID], [Date], [Slot], [RoomID], [TeacherID]) VALUES (1, CAST(N'2021-05-13T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[TimeTable] ([ClassID], [Date], [Slot], [RoomID], [TeacherID]) VALUES (1, CAST(N'2021-05-14T00:00:00.000' AS DateTime), 2, 1, 2)
INSERT [dbo].[TimeTable] ([ClassID], [Date], [Slot], [RoomID], [TeacherID]) VALUES (1, CAST(N'2021-05-15T00:00:00.000' AS DateTime), 3, 1, 5)
INSERT [dbo].[TimeTable] ([ClassID], [Date], [Slot], [RoomID], [TeacherID]) VALUES (1, CAST(N'2021-05-17T00:00:00.000' AS DateTime), 1, 1, 4)
INSERT [dbo].[TimeTable] ([ClassID], [Date], [Slot], [RoomID], [TeacherID]) VALUES (2, CAST(N'2021-05-14T00:00:00.000' AS DateTime), 3, 2, 2)
INSERT [dbo].[TimeTable] ([ClassID], [Date], [Slot], [RoomID], [TeacherID]) VALUES (2, CAST(N'2021-05-14T00:00:00.000' AS DateTime), 4, 1, 4)
INSERT [dbo].[TimeTable] ([ClassID], [Date], [Slot], [RoomID], [TeacherID]) VALUES (2, CAST(N'2021-05-17T00:00:00.000' AS DateTime), 1, 3, 1)
INSERT [dbo].[TimeTable] ([ClassID], [Date], [Slot], [RoomID], [TeacherID]) VALUES (3, CAST(N'2021-05-14T00:00:00.000' AS DateTime), 4, 5, 2)
INSERT [dbo].[TimeTable] ([ClassID], [Date], [Slot], [RoomID], [TeacherID]) VALUES (3, CAST(N'2021-05-16T00:00:00.000' AS DateTime), 3, 1, 1)
GO
