USE [master]
GO
/****** Object:  Database [BD_local_file]    Script Date: 17.02.2018 22:16:16 ******/
CREATE DATABASE [BD_local_file]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_local_file', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BD_local_file.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BD_local_file_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BD_local_file_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BD_local_file] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_local_file].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_local_file] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_local_file] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_local_file] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_local_file] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_local_file] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_local_file] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_local_file] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BD_local_file] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_local_file] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_local_file] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_local_file] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_local_file] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_local_file] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_local_file] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_local_file] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_local_file] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_local_file] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_local_file] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_local_file] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_local_file] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_local_file] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_local_file] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_local_file] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_local_file] SET RECOVERY FULL 
GO
ALTER DATABASE [BD_local_file] SET  MULTI_USER 
GO
ALTER DATABASE [BD_local_file] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_local_file] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_local_file] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_local_file] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_local_file', N'ON'
GO
USE [BD_local_file]
GO
/****** Object:  StoredProcedure [dbo].[Add_count_trans]    Script Date: 17.02.2018 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Add_count_trans]		--Добавление слова в таблицу Translate
@id int
as
begin
update Translate
set count_trans = count_trans+1
where Translate.id = @id
end;

GO
/****** Object:  StoredProcedure [dbo].[Add_transl]    Script Date: 17.02.2018 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Add_transl]		--Добавление слова в таблицу Translate
@lang_id int,
@word_id int,
@transl_id int
as
begin
insert Translate (id_loc, id_word, id_translate_word, count_trans) 
values (@lang_id, @word_id, @transl_id, 1)
end;

GO
/****** Object:  StoredProcedure [dbo].[Add_word]    Script Date: 17.02.2018 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Add_word]		--Добавление слова в таблицу Word
@word nvarchar(255),
@lang_id int
as
begin
insert Word (word_slovo, id_loc) 
values (@word, @lang_id)
end;

GO
/****** Object:  StoredProcedure [dbo].[language_id]    Script Date: 17.02.2018 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[language_id]		--поиск Locate_language.id language
@lang nvarchar(255)
as
begin
select Locate_language.id
from Locate_language
where Locate_language.languag =@lang
end;

GO
/****** Object:  StoredProcedure [dbo].[search_trans_id]    Script Date: 17.02.2018 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[search_trans_id]	--Поиск Translate.id 
@lang_lang nvarchar(255),
@id_word int,
@transl_id int
as
begin
select Translate.id
from Word, Translate, Locate_language
where Translate.id_word = @id_word and Translate.id_translate_word = @transl_id and Locate_language.languag = @lang_lang and Translate.id_word = Word.id
end;

GO
/****** Object:  StoredProcedure [dbo].[Word_s]    Script Date: 17.02.2018 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Word_s]
as
begin
select Word.word_slovo as col
from Word
end;

GO
/****** Object:  StoredProcedure [dbo].[Word_search]    Script Date: 17.02.2018 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--create table Locate_language
--(
--	id int primary key identity,
--	languag varchar(max) not null
--)


--create table Word
--(
--	id int primary key identity,
--	word_slovo varchar(max) not null,
--	id_loc int references Locate_language(id)
--)

 
--create table Translate
--(
--	id int primary key identity,
--	--translate_word varchar(max) not null,
--	id_loc int references Locate_language(id),
--	id_word int references Word(id),
--	id_translate_word int references Word(id),
--	count_trans int
--)


create proc [dbo].[Word_search]
@word nvarchar(255)
as
begin
select Word.word_slovo
from Word
where Word.word_slovo = @word
end;

GO
/****** Object:  StoredProcedure [dbo].[Word_search_id]    Script Date: 17.02.2018 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Word_search_id]
@word nvarchar(255)
as
begin
select Word.id
from Word
where Word.word_slovo = @word
end;

GO
/****** Object:  StoredProcedure [dbo].[Word_tr]    Script Date: 17.02.2018 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Word_tr]
@id_word int,
@lang nvarchar(255)
as
begin
select Word.word_slovo
from Word, Translate, Locate_language
where Translate.id_word = @id_word and Translate.id_translate_word = Word.id and Locate_language.languag = @lang
end;

GO
/****** Object:  Table [dbo].[Locate_language]    Script Date: 17.02.2018 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Locate_language](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languag] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Translate]    Script Date: 17.02.2018 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_loc] [int] NULL,
	[id_word] [int] NULL,
	[id_translate_word] [int] NULL,
	[count_trans] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Word]    Script Date: 17.02.2018 22:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Word](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[word_slovo] [varchar](max) NOT NULL,
	[id_loc] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Locate_language] ON 

INSERT [dbo].[Locate_language] ([id], [languag]) VALUES (1, N'ru')
INSERT [dbo].[Locate_language] ([id], [languag]) VALUES (2, N'en')
SET IDENTITY_INSERT [dbo].[Locate_language] OFF
SET IDENTITY_INSERT [dbo].[Translate] ON 

INSERT [dbo].[Translate] ([id], [id_loc], [id_word], [id_translate_word], [count_trans]) VALUES (1, 1, 1, 2, 1)
INSERT [dbo].[Translate] ([id], [id_loc], [id_word], [id_translate_word], [count_trans]) VALUES (2, 1, 8, 7, 3)
INSERT [dbo].[Translate] ([id], [id_loc], [id_word], [id_translate_word], [count_trans]) VALUES (3, 1, 8, 9, 1)
SET IDENTITY_INSERT [dbo].[Translate] OFF
SET IDENTITY_INSERT [dbo].[Word] ON 

INSERT [dbo].[Word] ([id], [word_slovo], [id_loc]) VALUES (1, N'on', 2)
INSERT [dbo].[Word] ([id], [word_slovo], [id_loc]) VALUES (2, N'вкл', 1)
INSERT [dbo].[Word] ([id], [word_slovo], [id_loc]) VALUES (3, N'off', 2)
INSERT [dbo].[Word] ([id], [word_slovo], [id_loc]) VALUES (4, N'Popular Categories', 2)
INSERT [dbo].[Word] ([id], [word_slovo], [id_loc]) VALUES (7, N'К сожалению!', 1)
INSERT [dbo].[Word] ([id], [word_slovo], [id_loc]) VALUES (8, N'Oops! That page can&rsquo;t be found.', 2)
INSERT [dbo].[Word] ([id], [word_slovo], [id_loc]) VALUES (9, N'', 2)
SET IDENTITY_INSERT [dbo].[Word] OFF
ALTER TABLE [dbo].[Translate]  WITH CHECK ADD FOREIGN KEY([id_loc])
REFERENCES [dbo].[Locate_language] ([id])
GO
ALTER TABLE [dbo].[Translate]  WITH CHECK ADD FOREIGN KEY([id_translate_word])
REFERENCES [dbo].[Word] ([id])
GO
ALTER TABLE [dbo].[Translate]  WITH CHECK ADD FOREIGN KEY([id_word])
REFERENCES [dbo].[Word] ([id])
GO
ALTER TABLE [dbo].[Word]  WITH CHECK ADD FOREIGN KEY([id_loc])
REFERENCES [dbo].[Locate_language] ([id])
GO
USE [master]
GO
ALTER DATABASE [BD_local_file] SET  READ_WRITE 
GO
