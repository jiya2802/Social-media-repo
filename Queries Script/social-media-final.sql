USE [master]
GO
/****** Object:  Database [social_media]    Script Date: 30-05-2024 07:03:31 PM ******/
CREATE DATABASE [social_media] ON  PRIMARY 
( NAME = N'social_media', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\social_media.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'social_media_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\social_media_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [social_media].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [social_media] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [social_media] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [social_media] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [social_media] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [social_media] SET ARITHABORT OFF 
GO
ALTER DATABASE [social_media] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [social_media] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [social_media] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [social_media] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [social_media] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [social_media] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [social_media] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [social_media] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [social_media] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [social_media] SET  ENABLE_BROKER 
GO
ALTER DATABASE [social_media] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [social_media] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [social_media] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [social_media] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [social_media] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [social_media] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [social_media] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [social_media] SET RECOVERY FULL 
GO
ALTER DATABASE [social_media] SET  MULTI_USER 
GO
ALTER DATABASE [social_media] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [social_media] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'social_media', N'ON'
GO
USE [social_media]
GO
/****** Object:  Schema [social_media]    Script Date: 30-05-2024 07:03:31 PM ******/
CREATE SCHEMA [social_media]
GO
/****** Object:  Table [dbo].[forgot_password_token]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forgot_password_token](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[token] [varchar](max) NULL,
	[time_to_expire] [date] NULL,
	[email] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](255) NULL,
	[dob] [date] NULL,
	[bio] [nvarchar](max) NULL,
	[image_url] [nvarchar](max) NULL,
	[email] [varchar](255) NULL,
	[contact] [varchar](15) NULL,
	[account_status] [int] NULL,
	[created_at] [datetime] NULL,
	[edited_at] [datetime] NULL,
	[active_yn] [int] NULL,
	[token] [varchar](max) NULL,
	[time_to_expire] [datetime] NULL,
	[password] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [social_media].[chats]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [social_media].[chats](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sender_id] [int] NULL,
	[receiver_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [social_media].[comments]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [social_media].[comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[post_id] [int] NULL,
	[comment] [nvarchar](max) NULL,
	[active_yn] [int] NULL,
	[comment_time] [datetime] NULL,
	[user_name] [varchar](255) NULL,
	[user_image] [nvarchar](max) NULL,
	[no_of_replies] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [social_media].[followers]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [social_media].[followers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[follower_id] [int] NULL,
	[is_active] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [social_media].[following]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [social_media].[following](
	[id] [int] NOT NULL,
	[user_id] [int] NULL,
	[following_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [social_media].[likes]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [social_media].[likes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[post_id] [int] NULL,
	[active_yn] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [social_media].[messages]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [social_media].[messages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[message] [nvarchar](max) NULL,
	[time_stamp] [datetime] NULL,
	[chat_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [social_media].[post_tag]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [social_media].[post_tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NULL,
	[tag_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [social_media].[posts]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [social_media].[posts](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[media_url] [varchar](255) NULL,
	[caption] [nvarchar](100) NULL,
	[no_of_likes] [int] NULL,
	[no_of_comments] [int] NULL,
	[created_at] [datetime] NULL,
	[edited_at] [datetime] NULL,
	[active_yn] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [social_media].[reply_comments]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [social_media].[reply_comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[comment] [nvarchar](max) NULL,
	[comment_id] [int] NULL,
	[user_id] [int] NULL,
	[active_yn] [int] NULL,
	[user_name] [varchar](255) NULL,
	[user_image] [nvarchar](max) NULL,
	[comment_time] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [social_media].[requests]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [social_media].[requests](
	[request_id] [int] IDENTITY(1,1) NOT NULL,
	[sender_id] [int] NULL,
	[receiver_id] [int] NULL,
	[requested_at] [datetime] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[request_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [social_media].[saves]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [social_media].[saves](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[post_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [social_media].[status]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [social_media].[status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [social_media].[tags]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [social_media].[tags](
	[tag_id] [int] IDENTITY(1,1) NOT NULL,
	[tag_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [social_media].[user_relationships]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [social_media].[user_relationships](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[related_user_id] [int] NOT NULL,
	[relationship_type] [char](1) NOT NULL,
	[is_active] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [account_status]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [edited_at]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((1)) FOR [active_yn]
GO
ALTER TABLE [social_media].[comments] ADD  DEFAULT ((1)) FOR [active_yn]
GO
ALTER TABLE [social_media].[comments] ADD  DEFAULT (getdate()) FOR [comment_time]
GO
ALTER TABLE [social_media].[comments] ADD  DEFAULT ((0)) FOR [no_of_replies]
GO
ALTER TABLE [social_media].[followers] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [social_media].[likes] ADD  DEFAULT ((1)) FOR [active_yn]
GO
ALTER TABLE [social_media].[messages] ADD  DEFAULT (getdate()) FOR [time_stamp]
GO
ALTER TABLE [social_media].[posts] ADD  DEFAULT ((0)) FOR [no_of_likes]
GO
ALTER TABLE [social_media].[posts] ADD  DEFAULT ((0)) FOR [no_of_comments]
GO
ALTER TABLE [social_media].[posts] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [social_media].[posts] ADD  DEFAULT (getdate()) FOR [edited_at]
GO
ALTER TABLE [social_media].[posts] ADD  DEFAULT ((1)) FOR [active_yn]
GO
ALTER TABLE [social_media].[reply_comments] ADD  DEFAULT ((1)) FOR [active_yn]
GO
ALTER TABLE [social_media].[reply_comments] ADD  DEFAULT (getdate()) FOR [comment_time]
GO
ALTER TABLE [social_media].[requests] ADD  DEFAULT (getdate()) FOR [requested_at]
GO
ALTER TABLE [social_media].[user_relationships] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [social_media].[user_relationships] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [social_media].[user_relationships] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[forgot_password_token]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [social_media].[chats]  WITH CHECK ADD FOREIGN KEY([receiver_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [social_media].[chats]  WITH CHECK ADD FOREIGN KEY([sender_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [social_media].[comments]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [social_media].[posts] ([post_id])
GO
ALTER TABLE [social_media].[comments]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [social_media].[followers]  WITH CHECK ADD FOREIGN KEY([follower_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [social_media].[followers]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [social_media].[following]  WITH CHECK ADD FOREIGN KEY([following_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [social_media].[following]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [social_media].[likes]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [social_media].[posts] ([post_id])
GO
ALTER TABLE [social_media].[likes]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [social_media].[messages]  WITH CHECK ADD FOREIGN KEY([chat_id])
REFERENCES [social_media].[chats] ([id])
GO
ALTER TABLE [social_media].[post_tag]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [social_media].[posts] ([post_id])
GO
ALTER TABLE [social_media].[post_tag]  WITH CHECK ADD FOREIGN KEY([tag_id])
REFERENCES [social_media].[tags] ([tag_id])
GO
ALTER TABLE [social_media].[posts]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [social_media].[reply_comments]  WITH CHECK ADD FOREIGN KEY([comment_id])
REFERENCES [social_media].[comments] ([id])
GO
ALTER TABLE [social_media].[reply_comments]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [social_media].[requests]  WITH CHECK ADD FOREIGN KEY([receiver_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [social_media].[requests]  WITH CHECK ADD FOREIGN KEY([sender_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [social_media].[requests]  WITH CHECK ADD FOREIGN KEY([status])
REFERENCES [social_media].[status] ([id])
GO
ALTER TABLE [social_media].[saves]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [social_media].[posts] ([post_id])
GO
ALTER TABLE [social_media].[saves]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [social_media].[user_relationships]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
/****** Object:  StoredProcedure [dbo].[sp_registerUser]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sp_registerUser]
@user_name VARCHAR(255),
@email VARCHAR(200),
@contact VARCHAR(20),
@password VARCHAR(200),
@image NVARCHAR(MAX),
@dob DATE,
@bio NVARCHAR(MAX)
AS
BEGIN
	DECLARE @hashedPwd VARBINARY(MAX) = HASHBYTES('SHA2_256' , @password)
	INSERT INTO dbo.users(user_name, email , contact , password,image_url,dob,bio)
	VALUES(@user_name , @email ,@contact , @hashedPwd,@image,@dob,@bio)

END

GO
/****** Object:  StoredProcedure [dbo].[sp_validate_token]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_validate_token]
@user_id INT,
@token VARCHAR(MAX)
AS
BEGIN
	DECLARE @count INT 
	select @count=count(1) from dbo.users where user_id=@user_id and token=@token and time_to_expire > GETDATE()
	IF @count = 1
	BEGIN
		select 1 as ValidYN
	END
	ELSE
	BEGIN
		select 0 as ValidYN
	END
END
GO
/****** Object:  StoredProcedure [social_media].[fetchUserDetails]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [social_media].[fetchUserDetails] 
    @userId INT
AS
BEGIN

    DECLARE @FollowersCount INT;
    DECLARE @FollowingCount INT;
    DECLARE @PostsCount INT;

    -- Count followers
    SELECT @FollowersCount = COUNT(*)
    FROM social_media.user_relationships ur
    INNER JOIN dbo.users u ON u.user_id = ur.related_user_id
    WHERE ur.user_id = @userId 
      AND ur.relationship_type = 'R'
	  AND is_active = 1;

    -- Count following
    SELECT @FollowingCount = (
        SELECT COUNT(*)
        FROM (
            -- Fetch users that the given user is following
            SELECT ur.related_user_id AS following_id
            FROM [social_media].[user_relationships] ur
            WHERE ur.user_id = @userId AND ur.relationship_type = 'F' AND [is_active] = 1

            UNION

            -- Fetch users that are following the given user
            SELECT ur.user_id AS following_id
            FROM [social_media].[user_relationships] ur
            WHERE ur.related_user_id = @userId AND ur.relationship_type = 'F' AND [is_active] = 1
        ) AS SubQuery
    );

    -- Select user details with counts and posts
    SELECT
        u.[user_id],
        u.[user_name],
        u.[dob],
        u.[bio],
        u.[image_url],
        @PostsCount AS [posts_count],
        @FollowersCount AS [followers_count],
        @FollowingCount AS [following_count],
        (
            SELECT
                p.[post_id] AS [id],
                p.[media_url]
            FROM
                [social_media].[posts] p
            WHERE
                p.[user_id] = @userId
            AND
                p.active_yn = 1
            FOR JSON PATH
        ) AS [posts]
    FROM
        [social_media].[dbo].[users] u
    WHERE
        u.[user_id] = @userId
    AND
        u.active_yn = 1;
END;
GO
/****** Object:  StoredProcedure [social_media].[sp_add_follower]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [social_media].[sp_add_follower]
    @user_id INT,          -- The user who is being followed
    @follower_id INT       -- The user who is following
AS
BEGIN
    -- Check if the reverse follower relationship exists
    IF EXISTS (
        SELECT 1
        FROM social_media.user_relationships
        WHERE user_id = @follower_id
          AND related_user_id = @user_id
          AND relationship_type = 'R'
    )
    BEGIN
        -- Update the reverse relationship to type 'F'
        UPDATE social_media.user_relationships
        SET relationship_type = 'F',
            updated_at = GETDATE()
        WHERE user_id = @follower_id
          AND related_user_id = @user_id
          AND relationship_type = 'R';
    END
	ELSE IF EXISTS (
        SELECT 1
        FROM social_media.user_relationships
        WHERE related_user_id = @follower_id
          AND user_id = @user_id
          AND relationship_type = 'R'
    )
    BEGIN
        -- Update the reverse relationship to type 'F'
        UPDATE social_media.user_relationships
        SET relationship_type = 'F',
            updated_at = GETDATE()
        WHERE user_id = @user_id
          AND related_user_id = @follower_id
          AND relationship_type = 'R';
    END
    ELSE
    BEGIN
        -- Insert the new follower relationship
        INSERT INTO social_media.user_relationships (user_id, related_user_id, relationship_type, is_active, created_at, updated_at)
        VALUES (@user_id, @follower_id, 'R', 1, GETDATE(), GETDATE());
    END
END;
GO
/****** Object:  StoredProcedure [social_media].[sp_create_post]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [social_media].[sp_create_post]
    @caption VARCHAR(MAX),
    @media_url VARCHAR(100),
    @user_id INT,
	@tags NVARCHAR(MAX),
    @created_at DATETIME = NULL
    
AS
BEGIN
    IF (@created_at IS NULL)
    BEGIN
        SET @created_at = GETDATE()
    END

	DECLARE @tag_table TABLE (tag_name NVARCHAR(MAX));

    INSERT INTO social_media.tags (tag_name)
    SELECT value
	FROM STRING_SPLIT(@tags, ',') s
	WHERE NOT EXISTS (SELECT 1 FROM social_media.tags WHERE tag_name = value)
	
	INSERT INTO social_media.posts (media_url, caption,user_id, created_at)
    VALUES (@media_url, @caption, @user_id, @created_at);
	
	DECLARE @post_id INT
	SELECT @post_id=SCOPE_IDENTITY();

	INSERT INTO social_media.post_tag(post_id,tag_id)
	SELECT @post_id,tag_id
	FROM social_media.tags 
	WHERE tag_name IN (SELECT value FROM STRING_SPLIT(@tags, ','))
	
END
GO
/****** Object:  StoredProcedure [social_media].[sp_delete_comment]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [social_media].[sp_delete_comment]
    @user_id INT,
    @post_id INT,
    @comment_id INT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM social_media.Comments C
        JOIN social_media.Posts P ON C.Post_id = P.Post_id
        WHERE C.id = @comment_id
        AND (P.User_id = @user_id OR C.User_id = @user_id)
    )
	BEGIN
		UPDATE social_media.comments
		SET active_yn = 0
		WHERE id = @comment_id

		UPDATE social_media.reply_comments
		SET active_yn = 0
		WHERE comment_id = @comment_id

		UPDATE social_media.posts
		SET no_of_comments = no_of_comments - 1
		WHERE post_id = @post_id
	END
END;
GO
/****** Object:  StoredProcedure [social_media].[sp_delete_reply_comment]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [social_media].[sp_delete_reply_comment]
    @user_id INT,
    @comment_id INT,
    @reply_id INT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM social_media.reply_comments rc
        JOIN social_media.comments c ON rc.comment_id = c.id
        WHERE rc.id = @reply_id
        AND (c.user_id = @user_id OR rc.user_id = @user_id)
    )
    BEGIN
        UPDATE social_media.reply_comments
		SET active_yn = 0
		WHERE id = @reply_id

		UPDATE social_media.comments
		SET no_of_replies = no_of_replies - 1
		WHERE id = @comment_id
    END;
END;
GO
/****** Object:  StoredProcedure [social_media].[sp_fetch_a_single_post]    Script Date: 23-06-2024 12:36:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [social_media].[sp_fetch_a_single_post]
    @user_id INT,
    @post_id INT
AS
BEGIN
    DROP TABLE IF EXISTS #temptable;

    -- Creating a temporary table with post_id and tags
    SELECT pt.post_id, STRING_AGG(t.tag_name, ',') AS tags
    INTO #temptable
    FROM social_media.post_tag pt
    INNER JOIN social_media.tags t ON pt.tag_id = t.tag_id
    INNER JOIN social_media.posts p ON p.post_id = pt.post_id
    GROUP BY pt.post_id;

    DECLARE @is_liked BIT = 0;
    DECLARE @isSaved BIT = 0;

    BEGIN
        -- Selecting posts from users that the given user_id is following
        SELECT p.post_id,
               p.media_url,
               p.caption,
               p.no_of_likes,
               p.no_of_comments,
               p.created_at,
               u.image_url,
               p.user_id,
               u.user_name,
               t.tags,
               CASE WHEN pl.user_id IS NOT NULL AND pl.active_yn = 1 THEN 1 ELSE 0 END AS is_liked, -- Check if the user has liked the post
               CASE WHEN ps.user_id IS NOT NULL THEN 1 ELSE 0 END AS isSaved -- Check if the user has saved the post
        FROM social_media.posts p
        INNER JOIN dbo.users u ON u.user_id = p.user_id
        LEFT JOIN #temptable t ON t.post_id = p.post_id
        LEFT JOIN social_media.likes pl ON pl.post_id = p.post_id AND pl.user_id = @user_id
        LEFT JOIN social_media.saves ps ON ps.post_id = p.post_id AND ps.user_id = @user_id
        WHERE p.post_id = @post_id;
    END
END
GO
/****** Object:  StoredProcedure [social_media].[sp_fetch_all_posts]    Script Date: 23-06-2024 12:38:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER  PROCEDURE [social_media].[sp_fetch_all_posts]
    @user_id INT,
    @category_id INT = NULL
AS
BEGIN
    DROP TABLE IF EXISTS #temptable;

    -- Creating a temporary table with post_id and tags
    SELECT pt.post_id, STRING_AGG(t.tag_name, ',') AS tags
    INTO #temptable
    FROM social_media.post_tag pt
    INNER JOIN social_media.tags t ON pt.tag_id = t.tag_id
    INNER JOIN social_media.posts p ON p.post_id = pt.post_id
    GROUP BY pt.post_id;

    DECLARE @is_liked BIT = 0;
    DECLARE @isSaved BIT = 0;

    IF @category_id IS NULL
    BEGIN
        -- Selecting posts from users that the given user_id is following
        SELECT p.post_id,
               p.media_url,
               p.caption,
               p.no_of_likes,
               p.no_of_comments,
               p.created_at,
               u.image_url,
               p.user_id,
               u.user_name,
               t.tags,
               f.following_id AS following_id,
               CASE WHEN pl.user_id IS NOT NULL AND pl.active_yn = 1 THEN 1 ELSE 0 END AS is_liked, -- Check if the user has liked the post
               CASE WHEN ps.user_id IS NOT NULL THEN 1 ELSE 0 END AS isSaved -- Check if the user has saved the post
        FROM social_media.posts p
        INNER JOIN (
            SELECT ur.related_user_id AS following_id
            FROM social_media.user_relationships ur
            WHERE ur.user_id = @user_id AND ur.relationship_type = 'F'
            
            UNION
            
            SELECT ur.user_id AS following_id
            FROM social_media.user_relationships ur
            WHERE ur.related_user_id = @user_id AND ur.relationship_type = 'F'

            UNION

            SELECT ur.related_user_id AS following_id
            FROM social_media.user_relationships ur
            WHERE ur.user_id = @user_id AND ur.relationship_type = 'R'

        ) f ON p.user_id = f.following_id
        INNER JOIN dbo.users u ON u.user_id = p.user_id
        LEFT JOIN #temptable t ON t.post_id = p.post_id
        LEFT JOIN social_media.likes pl ON pl.post_id = p.post_id AND pl.user_id = @user_id -- Check if the user has liked the post
        LEFT JOIN social_media.saves ps ON ps.post_id = p.post_id AND ps.user_id = @user_id -- Check if the user has saved the post
    END
END
GO
/****** Object:  StoredProcedure [social_media].[sp_fetch_comments]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [social_media].[sp_fetch_comments]
    @postId Int
AS
BEGIN
    Select c.id,c.user_id,c.comment,c.active_yn,p.no_of_comments,c.post_id,c.comment_time,u.user_name,u.image_url as user_image,c.no_of_replies as ReplyCount  from social_media.comments c
	INNER JOIN social_media.posts p
	ON p.post_id = c.post_id
	INNER JOIN dbo.users u
	ON u.user_id = c.user_id
	WHERE c.post_id=@postId
	AND c.active_yn=1
END
GO
/****** Object:  StoredProcedure [social_media].[sp_fetch_followers]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/******************************
* Store Procedure : social_media.sp_fetch_followers
* Author          : Anjala
* Date            : 10/23/2023
* Description     : Script to fetch followers
* Test Code       : EXEC social_media.sp_fetch_followers @user_id = 1
* Revision        : 
******************************/

CREATE PROCEDURE  [social_media].[sp_fetch_followers] 
    @user_id INT
AS
BEGIN
    SELECT ur.related_user_id AS follower_id, u.user_name
    FROM social_media.user_relationships ur
    INNER JOIN dbo.users u ON u.user_id = ur.related_user_id
    WHERE ur.user_id = @user_id 
      AND ur.relationship_type = 'R'
	  AND is_active = 1;
END;
GO
/****** Object:  StoredProcedure [social_media].[sp_fetch_following]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [social_media].[sp_fetch_following]
    @user_id INT
AS
BEGIN
    -- Fetch users that the given user is following
    SELECT ur.related_user_id AS following_id, u.user_name
    FROM social_media.user_relationships ur
    INNER JOIN dbo.users u ON u.user_id = ur.related_user_id
    WHERE ur.user_id = @user_id AND ur.relationship_type = 'F'
	AND is_active = 1
    
    UNION
    
    -- Fetch users that are following the given user (if needed for completeness)
    SELECT ur.user_id AS following_id, u.user_name
    FROM social_media.user_relationships ur
    INNER JOIN dbo.users u ON u.user_id = ur.user_id
    WHERE ur.related_user_id = @user_id AND ur.relationship_type = 'F'
	AND is_active = 1;
END;
GO
/****** Object:  StoredProcedure [social_media].[sp_fetch_likes_post]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [social_media].[sp_fetch_likes_post]
    @post_id INT
AS
BEGIN
    SELECT l.id,
	u.user_name
	FROM social_media.likes l
	INNER JOIN dbo.users u
	ON u.user_id = l.user_id
	WHERE l.post_id = @post_id
	AND l.active_yn = 1
END;
GO
/****** Object:  StoredProcedure [social_media].[sp_fetch_reply_comments]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [social_media].[sp_fetch_reply_comments]
    @comment_id INT
AS
BEGIN
    SELECT rc.id AS reply_id,
           rc.user_id AS reply_user_id,
           rc.comment AS reply_comment,
           rc.comment_time AS reply_comment_time,
           u.user_name AS reply_user_name,
           u.image_url AS reply_user_image
    FROM social_media.reply_comments rc
    INNER JOIN dbo.users u ON rc.user_id = u.user_id
    WHERE rc.comment_id = @comment_id
	AND rc.active_yn=1;
END;
GO
/****** Object:  StoredProcedure [social_media].[sp_fetch_users_to_add_as_friends]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [social_media].[sp_fetch_users_to_add_as_friends] 
    @user_id INT
AS
BEGIN
    -- Fetch users who have no relationship with the given user
    SELECT u.user_id, u.user_name, u.image_url
    FROM dbo.users u
    WHERE u.user_id != @user_id
      AND u.user_id NOT IN (
          SELECT ur.related_user_id
          FROM social_media.user_relationships ur
          WHERE ur.user_id = @user_id
      )
      AND u.user_id NOT IN (
          SELECT ur.user_id
          FROM social_media.user_relationships ur
          WHERE ur.related_user_id = @user_id
      );
END;
GO
/****** Object:  StoredProcedure [social_media].[sp_generateFPToken]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [social_media].[sp_generateFPToken]
@email VARCHAR(200)
AS
BEGIN
    DECLARE @user_id INT;
	    DECLARE @token VARCHAR(MAX);


    SET @user_id = (SELECT user_id FROM users WHERE email = @email);
	    SET @token = NEWID()



    INSERT INTO forgot_password_token (user_id, token, time_to_expire, email)
    VALUES (
        @user_id,
        @token,
        DATEADD(mi, 30, GETDATE()),
        @email
    );

	SELECT @token as token

END;

GO
/****** Object:  StoredProcedure [social_media].[sp_insert_comment]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [social_media].[sp_insert_comment]
    @user_id INT,
    @post_id INT,
    @comment_text NVARCHAR(MAX)
AS
BEGIN
	DECLARE @user_name VARCHAR(255)
	DECLARE @user_image NVARCHAR(MAX)
	SELECT @user_name = user_name,@user_image = image_url 
	FROM dbo.users 
	WHERE user_id = @user_id

    INSERT INTO social_media.comments (user_id, post_id, comment,user_name,user_image)
    VALUES (@user_id, @post_id, @comment_text,@user_name,@user_image);

	UPDATE social_media.posts
	SET no_of_comments = no_of_comments + 1
	WHERE post_id = @post_id
END;

GO
/****** Object:  StoredProcedure [social_media].[sp_insert_reply_comment]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [social_media].[sp_insert_reply_comment]
    @user_id INT,
    @comment_id INT,
    @reply_text NVARCHAR(MAX)
AS
BEGIN
    DECLARE @user_name VARCHAR(255)
    DECLARE @user_image NVARCHAR(MAX)

    -- Fetch user_name and user_image based on user_id
    SELECT @user_name = user_name, @user_image = image_url 
    FROM dbo.users 
    WHERE user_id = @user_id;

    -- Insert reply comment with user_name and user_image
    INSERT INTO social_media.reply_comments (user_id, comment_id, comment, user_name, user_image)
    VALUES (@user_id, @comment_id, @reply_text, @user_name, @user_image);

	UPDATE social_media.comments
	SET no_of_replies = no_of_replies + 1
	WHERE id = @comment_id
END;
GO
/****** Object:  StoredProcedure [social_media].[sp_like_post]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [social_media].[sp_like_post] 
    @user_id INT,
    @post_id INT
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM social_media.likes
        WHERE user_id = @user_id
        AND post_id = @post_id
    )
    BEGIN
        INSERT INTO social_media.likes (user_id, post_id)
        VALUES (@user_id, @post_id);

        UPDATE social_media.posts
        SET no_of_likes = no_of_likes + 1
        WHERE post_id = @post_id;
    END
	ELSE
	BEGIN
		UPDATE social_media.likes
        SET Active_yn = 1
        WHERE user_id = @user_id
        AND post_id = @post_id;

        UPDATE social_media.posts
        SET no_of_likes = no_of_likes + 1
        WHERE post_id = @post_id;
	END
END;
GO
/****** Object:  StoredProcedure [social_media].[sp_LoginUser]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [social_media].[sp_LoginUser] 
@user_name VARCHAR(30) ,
@password VARCHAR(30)
AS 
BEGIN
	DECLARE @hashedpwd VARBINARY(MAX) =HASHBYTES('SHA2_256', @password)
	DECLARE @count int
	select @count=count(1) from dbo.users where user_name=@user_name and password=@hashedpwd
	IF @count=1
	BEGIN
		update dbo.users
		SET token = NEWID(),
			time_to_expire=DATEADD(mi ,30, GETDATE())
		select * ,1 as validYN 
		FROM dbo.users where user_name=@user_name
	END
	ELSE
	BEGIN
		select 0 as validYN
	END
END
GO
/****** Object:  StoredProcedure [social_media].[sp_remove_follower]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/******************************
* Store Procedure : medium.sp_fetch_my_blogs
* Author          : Anjala
* Date            : 10/23/2023
* Description     : Script to fetch my blogs
* Test Code       : EXEC social_media.sp_create_post 'sample.jpg','sample',1,'Maths,SP,test',1,1
* Revision        : 
******************************/

CREATE PROCEDURE [social_media].[sp_remove_follower]
   @follower_id INT
AS
BEGIN
    UPDATE social_media.user_relationships
    SET is_active = 0
    WHERE related_user_id = @follower_id AND relationship_type = 'R';
END
GO
/****** Object:  StoredProcedure [social_media].[sp_SavePost]    Script Date: 23-06-2024 12:43:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE     PROCEDURE [social_media].[sp_SavePost] 
@user_id INT,
@post_id INT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM social_media.saves WHERE post_id = @post_id AND user_id = @user_id)
	BEGIN
        INSERT INTO social_media.saves (post_id, user_id) VALUES (@post_id ,@user_id)
		SELECT * FROM social_media.saves WHERE post_id = @post_id AND user_id = @user_id
    END 

END

GO
/****** Object:  StoredProcedure [social_media].[sp_unlike_post]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [social_media].[sp_unlike_post]
    @user_id INT,
    @post_id INT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM social_media.likes
        WHERE user_id = @user_id
        AND post_id = @post_id
    )
    BEGIN
        UPDATE social_media.likes
        SET Active_yn = 0
        WHERE user_id = @user_id
        AND post_id = @post_id;

        UPDATE social_media.posts
        SET no_of_likes = no_of_likes - 1
        WHERE post_id = @post_id;
    END
END;
GO
/****** Object:  StoredProcedure [social_media].[sp_UnSavePost]    Script Date: 23-06-2024 12:45:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE     PROCEDURE [social_media].[sp_UnSavePost]
@user_id  INT,
@post_id INT
 AS
BEGIN
    DELETE FROM social_media.saves WHERE post_id = @post_id AND user_id = @user_id;
END;


GO
/****** Object:  StoredProcedure [social_media].[sp_validateEmail]    Script Date: 30-05-2024 07:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [social_media].[sp_validateEmail]
@email VARCHAR(100)
AS
BEGIN
	DECLARE @count INT 
	select @count=count(1) from users where email=@email
	IF @count = 1
	BEGIN
		select 1 as ValidYN
	END
	ELSE
	BEGIN
		select 0 as ValidYN
	END

END

GO
/****** Object:  StoredProcedure [dbo].[UpdateAccountStatus]    Script Date: 23-06-2024 12:46:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[UpdateAccountStatus]
    @user_id INT,
    @account_status INT
AS
BEGIN
    UPDATE dbo.users
    SET account_status = @account_status
    WHERE user_id = @user_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserBio]    Script Date: 23-06-2024 12:46:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[UpdateUserBio]
    @user_id INT,
    @newBio NVARCHAR(MAX)
AS
BEGIN
    UPDATE dbo.users
    SET bio = @newBio
    WHERE user_id =@user_id;
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateUserDetails]    Script Date: 23-06-2024 12:47:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[UpdateUserDetails]
    @user_id INT,
    @newUsername VARCHAR(255)
AS
BEGIN
    UPDATE dbo.users
    SET user_name = @newUsername
    WHERE user_id =@user_id;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserProfilePicture]    Script Date: 23-06-2024 12:47:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateUserProfilePicture]
    @user_id INT,
    @image_url NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.users
    SET image_url = @image_url
    WHERE user_id = @user_id;
END
GO
/****** Object:  StoredProcedure [social_media].[fetchSaveDetails]    Script Date: 23-06-2024 12:48:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [social_media].[fetchSaveDetails] 
    @userId INT
AS
BEGIN
    DECLARE @FollowersCount INT;
    DECLARE @FollowingCount INT;
    DECLARE @PostsCount INT;

    -- Count followers
    SELECT @FollowersCount = COUNT(*)
    FROM social_media.user_relationships ur
    INNER JOIN dbo.users u ON u.user_id = ur.related_user_id
    WHERE ur.user_id = @userId 
      AND ur.relationship_type = 'R'
      AND is_active = 1;

    -- Count following
    SELECT @FollowingCount = (
        SELECT COUNT(*)
        FROM (
            SELECT ur.related_user_id AS following_id
            FROM [social_media].[user_relationships] ur
            WHERE ur.user_id = @userId AND ur.relationship_type = 'F' AND [is_active] = 1

            UNION

            SELECT ur.user_id AS following_id
            FROM [social_media].[user_relationships] ur
            WHERE ur.related_user_id = @userId AND ur.relationship_type = 'F' AND [is_active] = 1
        ) AS SubQuery
    );

    -- Count posts
    SELECT @PostsCount = COUNT(*)
    FROM social_media.posts p
    WHERE p.user_id = @userId
      AND p.active_yn = 1;

    -- Select user details with counts, posts, and saved posts
    SELECT
        u.[user_id],
        u.[user_name],
        u.[dob],
        u.[bio],
        u.[image_url],
        @PostsCount AS [posts_count],
        @FollowersCount AS [followers_count],
        @FollowingCount AS [following_count],
        (
            SELECT
                p.[post_id] AS [id],
                p.[media_url]
            FROM
                [social_media].[posts] p
            WHERE
                p.[user_id] = @userId
                AND p.active_yn = 1
            FOR JSON PATH
        ) AS [posts],
        ISNULL((
            SELECT
                sp.[post_id] AS [id],
                sp.[media_url]
            FROM
                [social_media].[posts] sp
            INNER JOIN
                [social_media].[saves] s ON sp.post_id = s.post_id
            WHERE
                s.user_id = @userId
                AND sp.active_yn = 1
            FOR JSON PATH
        ), '[]') AS [saved_posts]
    FROM
       dbo.users u
    WHERE
        u.[user_id] = @userId
        AND u.active_yn = 1;
END;
GO
/****** Object:  StoredProcedure [social_media].[sp_ChangePassword]    Script Date: 23-06-2024 12:52:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [social_media].[sp_ChangePassword]
@user_id INT,
@current_password VARCHAR(30),
@new_password VARCHAR(30)
AS
BEGIN
    DECLARE @hashedCurrentPassword VARBINARY(MAX) = HASHBYTES('SHA2_256', @current_password)
    DECLARE @hashedNewPassword VARBINARY(MAX) = HASHBYTES('SHA2_256', @new_password)

    IF EXISTS (SELECT 1 FROM dbo.users WHERE user_id = @user_id AND password = @hashedCurrentPassword)
    BEGIN
        UPDATE dbo.users
        SET password = @hashedNewPassword
        WHERE user_id = @user_id
    END

END
GO
/****** Object:  StoredProcedure [social_media].[sp_DeactivateUser]    Script Date: 23-06-2024 12:53:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [social_media].[sp_DeactivateUser]
    @user_id INT
AS
BEGIN
    UPDATE dbo.users
    SET is_deactivated = 1
    WHERE user_id = @user_id;
END
GO
/****** Object:  StoredProcedure [social_media].[sp_fetch_saved_posts]    Script Date: 23-06-2024 12:53:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [social_media].[sp_fetch_saved_posts]
    @user_id INT
AS
BEGIN
    DROP TABLE IF EXISTS #temptable;

    -- Creating a temporary table with post_id and tags
    SELECT pt.post_id, STRING_AGG(t.tag_name, ',') AS tags
    INTO #temptable
    FROM social_media.post_tag pt
    INNER JOIN social_media.tags t ON pt.tag_id = t.tag_id
    GROUP BY pt.post_id;

    -- Fetch saved posts for the given user_id
    SELECT p.post_id,
           p.media_url,
           p.caption,
           p.no_of_likes,
           p.no_of_comments,
           p.created_at,
           u.image_url,
           p.user_id,
           u.user_name,
           t.tags,
           1 AS is_saved -- Since these are saved posts, is_saved is always 1
    FROM social_media.posts p
    INNER JOIN social_media.saves s ON s.post_id = p.post_id AND s.user_id = @user_id
    INNER JOIN dbo.users u ON u.user_id = p.user_id
    LEFT JOIN #temptable t ON t.post_id = p.post_id;
END
GO
/****** Object:  StoredProcedure [social_media].[sp_LogoutUser]    Script Date: 23-06-2024 12:55:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [social_media].[sp_LogoutUser]
    @user_id INT
AS
BEGIN
    UPDATE dbo.users
    SET token = NULL,
        time_to_expire = NULL
    WHERE user_id = @user_id;
END
GO

USE [master]
GO
ALTER DATABASE [social_media] SET  READ_WRITE 
GO
