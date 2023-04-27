USE [Competition_Task1_DW]
GO

/****** Object:  Table [dbo].[Dim_Aus_Sub_Postcode]    Script Date: 27/10/2022 2:48:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Aus_Sub_Postcode](
	[Suburb_Id] [int] NOT NULL,
	[Suburb_Key] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[State_Code] [nvarchar](255) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[PostCode] [float] NULL,
	[Suburb] [nvarchar](255) NULL,
 CONSTRAINT [PK_Aus_Sub_Postcode] PRIMARY KEY CLUSTERED 
(
	[Suburb_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



USE [Competition_Task1_DW]
GO

/****** Object:  Table [dbo].[NSW_Stations]    Script Date: 21/10/2022 2:35:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NSW_Stations](
	[Station_Id] [int] NOT NULL,
	[Train_Station] [nvarchar](255) NULL,
	[Street_Name] [nvarchar](255) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
 CONSTRAINT [PK_NSW_Stations] PRIMARY KEY CLUSTERED 
(
	[Station_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [Competition_Task1_DW]
GO

USE [Competition_Task1_DW]
GO

/****** Object:  Table [dbo].[Dim_NSW_School_Data]    Script Date: 27/10/2022 2:49:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_NSW_School_Data](
	[School_Id] [int] NOT NULL,
	[School_Key] [nvarchar](255) NULL,
	[School_Name] [nvarchar](255) NULL,
	[Street] [nvarchar](255) NULL,
	[Student_Number] [float] NULL,
	[Indigenous_Pct] [nvarchar](255) NULL,
	[lbote_pct] [nvarchar](255) NULL,
	[Level_of_Schooling] [nvarchar](255) NULL,
	[Selective_School] [nvarchar](255) NULL,
	[School_Specialty_Type] [nvarchar](255) NULL,
	[School_Subtype] [nvarchar](255) NULL,
	[School_Gender] [nvarchar](255) NULL,
	[Late_Opening_School] [nvarchar](255) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[Date_Extracted] [datetime] NULL,
 CONSTRAINT [PK_NSW_School_Data] PRIMARY KEY CLUSTERED 
(
	[School_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [Competition_Task1_DW]
GO

/****** Object:  Table [dbo].[NSW_Property_Value]    Script Date: 21/10/2022 2:36:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [Competition_Task1_DW]
GO

/****** Object:  Table [dbo].[Fact_NSW_Property_Value]    Script Date: 27/10/2022 2:43:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Fact_NSW_Property_Value](
	[Property_Id] [int] NOT NULL,
	[Suburb_Id] [int] NULL,
	[School_Id] [int] NULL,
	[Station_Id] [int] NULL,
	[Property_Median_Value] [float] NULL,
	[Property_Key] [nvarchar](255) NULL,
	[Updated_Year] [float] NULL,
	[Updated_Month] [float] NULL,
 CONSTRAINT [PK_NSW_Property_Value] PRIMARY KEY CLUSTERED 
(
	[Property_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Fact_NSW_Property_Value]  WITH CHECK ADD  CONSTRAINT [FK_NSW_Property_Value_NSW_Property_Value] FOREIGN KEY([Suburb_Id])
REFERENCES [dbo].[Dim_Aus_Sub_Postcode] ([Suburb_Id])
GO

ALTER TABLE [dbo].[Fact_NSW_Property_Value] CHECK CONSTRAINT [FK_NSW_Property_Value_NSW_Property_Value]
GO

ALTER TABLE [dbo].[Fact_NSW_Property_Value]  WITH CHECK ADD  CONSTRAINT [FK_NSW_Property_Value_NSW_Property_Value1] FOREIGN KEY([School_Id])
REFERENCES [dbo].[Dim_NSW_School_Data] ([School_Id])
GO

ALTER TABLE [dbo].[Fact_NSW_Property_Value] CHECK CONSTRAINT [FK_NSW_Property_Value_NSW_Property_Value1]
GO

ALTER TABLE [dbo].[Fact_NSW_Property_Value]  WITH CHECK ADD  CONSTRAINT [FK_NSW_Property_Value_NSW_Stations] FOREIGN KEY([Station_Id])
REFERENCES [dbo].[Dim_NSW_Stations] ([Station_Id])
GO

ALTER TABLE [dbo].[Fact_NSW_Property_Value] CHECK CONSTRAINT [FK_NSW_Property_Value_NSW_Stations]
GO

