USE [master]
GO
/****** Object:  Database [Dating]    Script Date: 05-11-2023 20:57:28 ******/
CREATE DATABASE [Dating]
GO

USE [Dating]
GO

CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Password2] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[DeleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[Height] [int] NOT NULL,
	[AboutMe] [nvarchar](255) NULL,
	[CityId] [int] NULL,
	[GenderId] [int] NULL,
	[UsersId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Active_Users_Profiles]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_Active_Users_Profiles]
as
select p.Id, p.UserName, p.BirthDate, p.Height, p.AboutMe, p.CityId, p.GenderId, p.UsersId
from [Users] as u inner join UserProfile as p
on u.Id = p.UsersId
where u.DeleteDate is null
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GenderName] [nvarchar](50) NOT NULL,
	[Elaborate] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Active_Users_Profiles_With_FK_Details]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_Active_Users_Profiles_With_FK_Details]
as
select p.Id, p.UserName, p.BirthDate, p.Height, p.AboutMe, p.CityId, p.GenderId, p.Id as UserId, ci.CityName, ge.GenderName, ge.Elaborate
from [Users] as u inner join UserProfile as p
on u.Id = p.UsersId
inner join City as ci
on p.CityId = ci.Id
inner join Gender ge
on p.GenderId = ge.Id
where u.DeleteDate is null
GO
/****** Object:  View [dbo].[getACities]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[getACities]
as
select * from City where CItyName like 'A%'
GO
/****** Object:  View [dbo].[ProfileMen]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ProfileMen]
as
select Id, username, genderId from UserProfile where GenderId = 1
GO
/****** Object:  View [dbo].[ProfileWomen]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ProfileWomen]
as
select Id, username, genderId from UserProfile where GenderId = 2
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Liker] [int] NOT NULL,
	[Likee] [int] NOT NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sender] [int] NOT NULL,
	[Receiver] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Msg] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OldMessages]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OldMessages](
	[Id] [int] NOT NULL,
	[Sender] [int] NOT NULL,
	[Receiver] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Msg] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfilePictures]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfilePictures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[PicURL] [nvarchar](100) NOT NULL,
	[UserProfileId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[City] ([Id], [CityName]) VALUES (3450, N'Allerød')
INSERT [dbo].[City] ([Id], [CityName]) VALUES (3460, N'Birkerød')
INSERT [dbo].[City] ([Id], [CityName]) VALUES (3300, N'Frederiksværk')
INSERT [dbo].[City] ([Id], [CityName]) VALUES (3200, N'Helsinge')
INSERT [dbo].[City] ([Id], [CityName]) VALUES (3000, N'Helsingør')
INSERT [dbo].[City] ([Id], [CityName]) VALUES (3400, N'Hillerød')
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([Id], [GenderName], [Elaborate]) VALUES (1, N'Male', N'I think of myself as 100% man')
INSERT [dbo].[Gender] ([Id], [GenderName], [Elaborate]) VALUES (2, N'Female', N'I think of myself as 100% woman')
INSERT [dbo].[Gender] ([Id], [GenderName], [Elaborate]) VALUES (3, N'Gay', N'Man - I like men')
INSERT [dbo].[Gender] ([Id], [GenderName], [Elaborate]) VALUES (4, N'Lesbian', N'Woman - (man) I like women')
INSERT [dbo].[Gender] ([Id], [GenderName], [Elaborate]) VALUES (5, N'Asexual', N'I think of myself as having no sex ')
INSERT [dbo].[Gender] ([Id], [GenderName], [Elaborate]) VALUES (6, N'TransSexual', N'modified body to transition from one gender or sex to another')
INSERT [dbo].[Gender] ([Id], [GenderName], [Elaborate]) VALUES (7, N'hermaphrodite ', N'having both male and female sex organs or other sexual characteristics')
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([Id], [UserName], [BirthDate], [Height], [AboutMe], [CityId], [GenderId], [UsersId]) VALUES (1, N'KrudtUglen', CAST(N'1967-07-26T00:00:00.000' AS DateTime), 180, N'Just tooooo nice', 3400, 1, 1)
INSERT [dbo].[UserProfile] ([Id], [UserName], [BirthDate], [Height], [AboutMe], [CityId], [GenderId], [UsersId]) VALUES (2, N'BigTrouble', CAST(N'1977-10-26T00:00:00.000' AS DateTime), 190, N'Tallish girlie', 3450, 4, 2)
INSERT [dbo].[UserProfile] ([Id], [UserName], [BirthDate], [Height], [AboutMe], [CityId], [GenderId], [UsersId]) VALUES (3, N'Singasongman', CAST(N'1897-11-07T00:00:00.000' AS DateTime), 193, N'Musika para me', 3000, 3, 3)
INSERT [dbo].[UserProfile] ([Id], [UserName], [BirthDate], [Height], [AboutMe], [CityId], [GenderId], [UsersId]) VALUES (4, N'UllaBulla', CAST(N'2001-11-07T00:00:00.000' AS DateTime), 173, N'Bloody me', 3200, 4, 4)
INSERT [dbo].[UserProfile] ([Id], [UserName], [BirthDate], [Height], [AboutMe], [CityId], [GenderId], [UsersId]) VALUES (5, N'Bennyman', CAST(N'2003-10-17T00:00:00.000' AS DateTime), 93, N'Up HIll', 3460, 3, 5)
INSERT [dbo].[UserProfile] ([Id], [UserName], [BirthDate], [Height], [AboutMe], [CityId], [GenderId], [UsersId]) VALUES (6, N'Delilah', CAST(N'1923-11-11T00:00:00.000' AS DateTime), 93, N'Oldie', 3460, 2, 6)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Login], [Password], [Password2], [CreateDate], [DeleteDate]) VALUES (1, N'Palle', N'Westermann', N'pwe@tec.dk', N'prut', N'prut123.', N'prut123.', CAST(N'2023-04-12T10:42:21.570' AS DateTime), NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Login], [Password], [Password2], [CreateDate], [DeleteDate]) VALUES (2, N'Hansi', N'Hinterseer', N'hansi@lousymusic.com', N'hansi', N'hansi123.', N'hansi123.', CAST(N'2023-04-12T10:42:21.570' AS DateTime), NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Login], [Password], [Password2], [CreateDate], [DeleteDate]) VALUES (3, N'Ulla', N'Drac', N'drac@lousymusic.com', N'drac', N'drac123.', N'drac123.', CAST(N'2023-04-12T10:42:21.570' AS DateTime), NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Login], [Password], [Password2], [CreateDate], [DeleteDate]) VALUES (4, N'Benny', N'Hill', N'Hill@humour.com', N'Hill', N'Hill123.', N'Hill123.', CAST(N'2023-04-12T10:42:21.570' AS DateTime), NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Login], [Password], [Password2], [CreateDate], [DeleteDate]) VALUES (5, N'Delilah', N'Mums', N'lilah@bt.dk', N'Laila', N'Laila123.', N'Laila123.', CAST(N'2023-04-12T10:42:21.570' AS DateTime), NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Login], [Password], [Password2], [CreateDate], [DeleteDate]) VALUES (6, N'Karla', N'Kumme', N'karla@tec.dk', N'karla', N'karla123.', N'karla123.', CAST(N'2023-04-12T10:42:21.570' AS DateTime), NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Login], [Password], [Password2], [CreateDate], [DeleteDate]) VALUES (7, N'Kurt', N'Red', N'kurt@who.dk', N'kurta', N'kurta1', N'kurta2', CAST(N'2023-11-05T19:02:17.913' AS DateTime), NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Login], [Password], [Password2], [CreateDate], [DeleteDate]) VALUES (8, N'Ditte', N'Larsen', N'ditte@google.com', N'ditte', N'ditte1', N'ditte1', CAST(N'2023-11-05T20:54:26.713' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__City__886159E5409D3C8C]    Script Date: 05-11-2023 20:57:28 ******/
ALTER TABLE [dbo].[City] ADD UNIQUE NONCLUSTERED 
(
	[CityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Gender__F7C17715470B3869]    Script Date: 05-11-2023 20:57:28 ******/
ALTER TABLE [dbo].[Gender] ADD UNIQUE NONCLUSTERED 
(
	[GenderName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__UserProf__C9F28456D8C34DBB]    Script Date: 05-11-2023 20:57:28 ******/
ALTER TABLE [dbo].[UserProfile] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Idx_GenderId]    Script Date: 05-11-2023 20:57:28 ******/
CREATE NONCLUSTERED INDEX [Idx_GenderId] ON [dbo].[UserProfile]
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Likes] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Messages] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[UserProfile] ADD  DEFAULT ((0)) FOR [Height]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD FOREIGN KEY([Likee])
REFERENCES [dbo].[UserProfile] ([Id])
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD FOREIGN KEY([Liker])
REFERENCES [dbo].[UserProfile] ([Id])
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD FOREIGN KEY([Receiver])
REFERENCES [dbo].[UserProfile] ([Id])
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD FOREIGN KEY([Sender])
REFERENCES [dbo].[UserProfile] ([Id])
GO
ALTER TABLE [dbo].[ProfilePictures]  WITH CHECK ADD FOREIGN KEY([UserProfileId])
REFERENCES [dbo].[UserProfile] ([Id])
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([Id])
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD FOREIGN KEY([UsersId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD CHECK  (([BirthDate]<=dateadd(year,(-18),getdate())))
GO
/****** Object:  StoredProcedure [dbo].[GetUserProfileById]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUserProfileById] @Id int
as
begin
	select Id, UserName, BirthDate, Height, AboutMe CityId, GenderId, UsersId from UserProfile where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[GetUserProfileByUserName]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUserProfileByUserName] @UserName nvarchar(50)
as
begin
	select Id, UserName, BirthDate, Height, AboutMe CityId, GenderId, UsersId from UserProfile where UserName = @UserName
end
GO
/****** Object:  StoredProcedure [dbo].[GetUserProfiles]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUserProfiles]
as
begin
	select Id, UserName, BirthDate, Height, AboutMe CityId, GenderId, UsersId from UserProfile
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserProfiles]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateUserProfiles] @Id int, @UserName nvarchar(50), @BirthDate DateTime, @Height int, @AboutMe nvarchar(255), @CityId int, @GenderId int, @UsersId int
as
begin
	update UserProfile set 
	UserName = @UserName,
	BirthDate = @BirthDate,
	Height = @Height,
	AboutMe = @AboutMe,
	CityId = @CityId,
	GenderId = @GenderId,
	UsersId = @UsersId
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[usp_AddNewUser]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
create proc [dbo].[usp_AddNewUser]
		@FirstName nvarchar(50)
	  ,@LastName nvarchar(50)
      ,@Email nvarchar(50)
      ,@Login nvarchar(50)
      ,@Password nvarchar(50)
      ,@Password2 nvarchar(50)
as
INSERT INTO	Users 
(
      [FirstName]
      ,[LastName]
      ,[Email]
      ,[Login]
      ,[Password]
      ,[Password2]
)
VALUES
(
	  @FirstName
	  ,@LastName
      ,@Email
      ,@Login
      ,@Password
      ,@Password2
)
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllCities]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllCities]
as
begin
select  Id, CityName from [dbo].[City]
end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllUsers]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE proc [dbo].[usp_GetAllUsers]
as
SELECT [Id]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[Login]
      ,[Password]
      ,[Password2]
      ,[CreateDate]
      ,[DeleteDate]
  FROM [Dating].[dbo].[Users]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserById]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[usp_GetUserById] @id int
as
SELECT	Id, 
		FirstName, 
		LastName, 
		Email,
		[Login],
		[Password],
		[Password2],
		CreateDate,
		DeleteDate
FROM Users 
WHERE 
		Id = @id
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUsersByNameText]    Script Date: 05-11-2023 20:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[usp_GetUsersByNameText] @txt nvarchar(30)
as
SELECT	Id, 
		FirstName, 
		LastName, 
		Email 
FROM Users 
WHERE 
		FirstName like '%' + @txt + '%' OR 
		LastName like '%' + @txt + '%'
GO
USE [master]
GO
ALTER DATABASE [Dating] SET  READ_WRITE 
GO
