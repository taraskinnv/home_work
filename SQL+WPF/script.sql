USE [Taraskin]
GO
/****** Object:  Table [dbo].[Picture]    Script Date: 24.04.2018 14:51:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Picture](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[picture] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Picture] ON 

INSERT [dbo].[Picture] ([id], [picture]) VALUES (1, N'C:\Users\taraskinnv\Desktop\Трител.stp')
INSERT [dbo].[Picture] ([id], [picture]) VALUES (2, N'C:\Users\taraskinnv\Desktop\translate.txt')
INSERT [dbo].[Picture] ([id], [picture]) VALUES (3, N'C:\Users\taraskinnv\Pictures\Безымянsdный.jpg')
INSERT [dbo].[Picture] ([id], [picture]) VALUES (4, N'C:\Users\taraskinnv\Pictures\Безымянный.png')
INSERT [dbo].[Picture] ([id], [picture]) VALUES (5, N'C:\Users\taraskinnv\Pictures\Безымянsdный.jpg')
SET IDENTITY_INSERT [dbo].[Picture] OFF
