USE [StudentCenter]
GO
/****** Object:  User [StudentUser]    Script Date: 10/19/2014 9:43:49 PM ******/
CREATE USER [StudentUser] FOR LOGIN [StudentUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [StudentUser]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[Sequence] [decimal](18, 0) NOT NULL,
	[Village] [varchar](250) NULL,
	[Street] [varchar](2000) NULL,
	[PostalCode] [varchar](250) NULL,
	[Region] [varchar](250) NULL,
	[Country] [varchar](250) NULL,
	[CreatedBy] [varchar](250) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [varchar](250) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Donation]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donation](
	[DonationId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[DonationDate] [datetime] NOT NULL,
	[DonationAmount] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Donations] PRIMARY KEY CLUSTERED 
(
	[DonationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Education]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Education](
	[EducationId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[GradeLevel] [int] NOT NULL,
	[GradeYear] [int] NOT NULL,
	[Sequence] [decimal](18, 0) NULL,
	[CreatedBy] [varchar](250) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [varchar](250) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Education] PRIMARY KEY CLUSTERED 
(
	[EducationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EducationNoteXRef]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducationNoteXRef](
	[EducationNoteXRefId] [int] IDENTITY(1,1) NOT NULL,
	[EducationId] [int] NOT NULL,
	[NoteId] [int] NULL,
 CONSTRAINT [PK_EducationNotes] PRIMARY KEY CLUSTERED 
(
	[EducationNoteXRefId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Note]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Note](
	[NoteId] [int] IDENTITY(1,1) NOT NULL,
	[NoteType] [int] NOT NULL,
	[Body] [varchar](max) NOT NULL,
	[Sequence] [decimal](18, 0) NOT NULL,
	[CreatedBy] [varchar](250) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [varchar](250) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Note] PRIMARY KEY CLUSTERED 
(
	[NoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Person]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[PersonTypeId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[FirstName] [varchar](250) NULL,
	[MiddleName] [varchar](250) NULL,
	[LastName] [varchar](250) NULL,
	[BirthDay] [int] NULL,
	[BirthMonth] [int] NULL,
	[BirthYear] [int] NULL,
	[GraduationYear] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [varchar](250) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PersonAddressXRef]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonAddressXRef](
	[PersonAddressXRefId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_PersonAddressXRef] PRIMARY KEY CLUSTERED 
(
	[PersonAddressXRefId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonNoteXRef]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonNoteXRef](
	[PersonNoteXrefId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[NoteId] [int] NOT NULL,
 CONSTRAINT [PK_PersonNoteXref] PRIMARY KEY CLUSTERED 
(
	[PersonNoteXrefId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonPicture]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PersonPicture](
	[PersonPictureId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[Sequence] [decimal](18, 0) NULL,
	[FileName] [varchar](max) NOT NULL,
	[CreatedBy] [varchar](250) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [varchar](250) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_PersonPicture] PRIMARY KEY CLUSTERED 
(
	[PersonPictureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PersonType]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PersonType](
	[PersonTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PersonType] PRIMARY KEY CLUSTERED 
(
	[PersonTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PersonXRef]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonXRef](
	[PersonXRefId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[RelatedPersonId] [int] NOT NULL,
	[RelationshipTypeId] [int] NOT NULL,
 CONSTRAINT [PK_PersonXRef] PRIMARY KEY CLUSTERED 
(
	[PersonXRefId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonXRefDates]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonXRefDates](
	[PersonXRefDatesId] [int] IDENTITY(1,1) NOT NULL,
	[PersonXRefId] [int] NOT NULL,
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PersonXRefDates] PRIMARY KEY CLUSTERED 
(
	[PersonXRefDatesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RelationshipType]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RelationshipType](
	[RelationshipTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_RelationshipType] PRIMARY KEY CLUSTERED 
(
	[RelationshipTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemSettings]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemSettings](
	[SystemSettingsId] [int] IDENTITY(1,1) NOT NULL,
	[Owner] [varchar](250) NOT NULL,
	[Key] [varchar](250) NOT NULL,
	[Value] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[SystemSettingsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserSettings]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserSettings](
	[UserSettingsId] [int] IDENTITY(1,1) NOT NULL,
	[SystemSettingsId] [int] NOT NULL,
	[User] [varchar](250) NOT NULL,
	[Value] [varchar](max) NOT NULL,
 CONSTRAINT [PK_UserSettings] PRIMARY KEY CLUSTERED 
(
	[UserSettingsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [FK_Donation_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Donation] CHECK CONSTRAINT [FK_Donation_Person]
GO
ALTER TABLE [dbo].[Education]  WITH CHECK ADD  CONSTRAINT [FK_Education_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Education] CHECK CONSTRAINT [FK_Education_Person]
GO
ALTER TABLE [dbo].[EducationNoteXRef]  WITH CHECK ADD  CONSTRAINT [FK_EducationNote_Education] FOREIGN KEY([EducationId])
REFERENCES [dbo].[Education] ([EducationId])
GO
ALTER TABLE [dbo].[EducationNoteXRef] CHECK CONSTRAINT [FK_EducationNote_Education]
GO
ALTER TABLE [dbo].[EducationNoteXRef]  WITH CHECK ADD  CONSTRAINT [FK_EducationNoteXRef_Note] FOREIGN KEY([NoteId])
REFERENCES [dbo].[Note] ([NoteId])
GO
ALTER TABLE [dbo].[EducationNoteXRef] CHECK CONSTRAINT [FK_EducationNoteXRef_Note]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_PersonType] FOREIGN KEY([PersonTypeId])
REFERENCES [dbo].[PersonType] ([PersonTypeId])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_PersonType]
GO
ALTER TABLE [dbo].[PersonAddressXRef]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddressXRef_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[PersonAddressXRef] CHECK CONSTRAINT [FK_PersonAddressXRef_Address]
GO
ALTER TABLE [dbo].[PersonAddressXRef]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddressXRef_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonAddressXRef] CHECK CONSTRAINT [FK_PersonAddressXRef_Person]
GO
ALTER TABLE [dbo].[PersonNoteXRef]  WITH CHECK ADD  CONSTRAINT [FK_PersonNoteXRef_Note] FOREIGN KEY([NoteId])
REFERENCES [dbo].[Note] ([NoteId])
GO
ALTER TABLE [dbo].[PersonNoteXRef] CHECK CONSTRAINT [FK_PersonNoteXRef_Note]
GO
ALTER TABLE [dbo].[PersonNoteXRef]  WITH CHECK ADD  CONSTRAINT [FK_PersonNoteXRef_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonNoteXRef] CHECK CONSTRAINT [FK_PersonNoteXRef_Person]
GO
ALTER TABLE [dbo].[PersonPicture]  WITH CHECK ADD  CONSTRAINT [FK_PersonPicture_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonPicture] CHECK CONSTRAINT [FK_PersonPicture_Person]
GO
ALTER TABLE [dbo].[PersonXRef]  WITH CHECK ADD  CONSTRAINT [FK_PersonXRef_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonXRef] CHECK CONSTRAINT [FK_PersonXRef_Person]
GO
ALTER TABLE [dbo].[PersonXRef]  WITH CHECK ADD  CONSTRAINT [FK_PersonXRef_Person1] FOREIGN KEY([RelatedPersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonXRef] CHECK CONSTRAINT [FK_PersonXRef_Person1]
GO
ALTER TABLE [dbo].[PersonXRef]  WITH CHECK ADD  CONSTRAINT [FK_PersonXRef_RelationshipType] FOREIGN KEY([RelationshipTypeId])
REFERENCES [dbo].[RelationshipType] ([RelationshipTypeId])
GO
ALTER TABLE [dbo].[PersonXRef] CHECK CONSTRAINT [FK_PersonXRef_RelationshipType]
GO
ALTER TABLE [dbo].[PersonXRefDates]  WITH CHECK ADD  CONSTRAINT [FK_PersonXRefDates_PersonXRef] FOREIGN KEY([PersonXRefId])
REFERENCES [dbo].[PersonXRef] ([PersonXRefId])
GO
ALTER TABLE [dbo].[PersonXRefDates] CHECK CONSTRAINT [FK_PersonXRefDates_PersonXRef]
GO
ALTER TABLE [dbo].[UserSettings]  WITH CHECK ADD  CONSTRAINT [FK_UserSettings_SystemSettings] FOREIGN KEY([SystemSettingsId])
REFERENCES [dbo].[SystemSettings] ([SystemSettingsId])
GO
ALTER TABLE [dbo].[UserSettings] CHECK CONSTRAINT [FK_UserSettings_SystemSettings]
GO
/****** Object:  StoredProcedure [dbo].[Usp_Delete_Address_By_AddressId]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_Delete_Address_By_AddressId]
	@AddressId int
AS
BEGIN

BEGIN TRY;
	BEGIN TRAN;
		DELETE [dbo].[PersonAddressXRef]
		WHERE [AddressId] = @AddressId;

		DELETE [dbo].[Address]
		WHERE [AddressId] = @AddressId;

	COMMIT TRAN;
END TRY
BEGIN CATCH;
	ROLLBACK TRAN;
	THROW;
END CATCH;
	
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_Insert_Address]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_Insert_Address]--1,'charlotte',null, null, null,null, '11-18-2014','Jeremy','11-18-2014','jeremy'
	@PersonId int,
	@Village varchar(250) = NULL,
    @Street varchar(2000) = NULL,
    @PostalCode varchar(250) = NULL,
    @Region varchar(250) = NULL,
    @Country varchar(250) = NULL,         
	@CreatedOn datetime,
    @CreatedBy varchar(250),
    @ModifiedOn datetime,
    @ModifiedBy varchar(250)
AS
BEGIN

BEGIN TRY;
	BEGIN TRAN;
	--Let's first get the max sequence number
	DECLARE @sequence AS decimal(18,0);

	SELECT @sequence = ISNULL(MAX(a.[Sequence]), 0) + 1
	FROM [dbo].[Address] a
		INNER JOIN [dbo].PersonAddressXRef paxref ON paxref.[AddressId] = a.[AddressId]
	WHERE paxref.[PersonId] = @PersonId;

	--Then insert the address (getting the id)
	DECLARE @IdentityOutput TABLE ( AddressId int );
	
	INSERT INTO [dbo].[Address]
           ([Sequence]
           ,[Village]
           ,[Street]
           ,[PostalCode]
           ,[Region]
           ,[Country]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
	 OUTPUT inserted.AddressId into @IdentityOutput
     VALUES
           (@sequence,
		    @Village,
			@Street,
			@PostalCode,
			@Region,
			@Country,         			
			@CreatedBy,
			@CreatedOn,
			@ModifiedBy,
			@ModifiedOn);
	
	DECLARE @AddressId int;
	SELECT @AddressId = [AddressId] FROM @IdentityOutput;
	
	--Then we'll create the xref entry
	INSERT INTO [dbo].[PersonAddressXRef]
           ([PersonId]
           ,[AddressId])
     VALUES
           (@PersonId
           ,@AddressId);

	COMMIT TRAN;
END TRY
BEGIN CATCH;
	ROLLBACK TRAN;
	THROW;
END CATCH;
	
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_Insert_Education]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_Insert_Education]
	@PersonId int,
	@GradeLevel int,
    @GradeYear int,
    @Sequence decimal(18,0),
	@CreatedOn datetime,
    @CreatedBy varchar(250),
    @ModifiedOn datetime,
    @ModifiedBy varchar(250)
AS
BEGIN

	INSERT INTO [dbo].[Education]
           ([PersonId]
           ,[GradeLevel]
           ,[GradeYear]
           ,[Sequence]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
     VALUES
           (@PersonId
           ,@GradeLevel
           ,@GradeYear
           ,@Sequence
           ,@CreatedBy
           ,@CreatedOn
           ,@ModifiedBy
           ,@ModifiedOn);
	
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_Insert_Education_Note]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_Insert_Education_Note]
	@EducationId int,
	@NoteType int,
    @Body varchar(max),
	@CreatedOn datetime,
    @CreatedBy varchar(250),
    @ModifiedOn datetime,
    @ModifiedBy varchar(250)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN;

			--Let's first get the max sequence number
			DECLARE @Sequence AS decimal(18,0);

			SELECT @Sequence = MAX(n.[Sequence]) + 1
			FROM [dbo].[Note] n
				INNER JOIN [dbo].[EducationNoteXRef] enxref ON enxref.[NoteId] = n.[NoteId]				
			WHERE enxref.[EducationId] = @EducationId;

			--Then insert the note (getting the id)
			DECLARE @IdentityOutput TABLE ( NoteId int );

			INSERT INTO [dbo].[Note]
				   ([NoteType]
				   ,[Body]
				   ,[Sequence]
				   ,[CreatedBy]
				   ,[CreatedOn]
				   ,[ModifiedBy]
				   ,[ModifiedOn])
			OUTPUT inserted.NoteId into @IdentityOutput
			VALUES
				(@NoteType
				,@Body
				,@Sequence
				,@CreatedBy
				,@CreatedOn
				,@ModifiedBy
				,@ModifiedOn);
			

			--Then insert the xref record
			DECLARE @NoteId int;
			SELECT @NoteId = [NoteId] FROM @IdentityOutput;

			INSERT INTO [dbo].[EducationNoteXRef]
				   ([EducationId]
				   ,[NoteId])
			 VALUES
				   (@EducationId
				   ,@NoteId);

			COMMIT TRAN;
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN;
			THROW;
		END CATCH
	
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_Insert_Person]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_Insert_Person]
	@FirstName varchar(250) = null,
	@MiddleName varchar(250) = null,
	@LastName varchar(250) = null,
	@Active bit,
	@PersonTypeId int,
	@BirthDay int = null,
	@BirthMonth int = null,
	@BirthYear int = null,
	@CreatedOn datetime,
    @CreatedBy varchar(250),
    @ModifiedOn datetime,
    @ModifiedBy varchar(250)
AS
BEGIN
	
	INSERT INTO [dbo].[Person]
           ([FirstName]
           ,[MiddleName]
           ,[LastName]
		   ,[Active]
		   ,[PersonTypeId]
           ,[BirthDay]
		   ,[BirthMonth]
		   ,[BirthYear]		   
           ,[CreatedOn]
           ,[CreatedBy]
           ,[ModifiedOn]
           ,[ModifiedBy])
     VALUES
          (@FirstName,
           @MiddleName,
		   @LastName,
		   @Active,
		   @PersonTypeId,
		   @BirthDay,
		   @BirthMonth,
		   @BirthYear,
		   @CreatedOn,
		   @CreatedBy,
		   @ModifiedOn,
		   @ModifiedBy)
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_Select_Address_By_AddressId]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_Select_Address_By_AddressId]
	@AddressId int
AS
BEGIN

	SELECT   a.[AddressId]
			,a.[Sequence]
			,a.[Village]
			,a.[Street]
			,a.[PostalCode]
			,a.[Region]
			,a.[Country]
			,a.[CreatedBy]
			,a.[CreatedOn]
			,a.[ModifiedBy]
			,a.[ModifiedOn]
	FROM [dbo].[Address] a		
	WHERE
		a.[AddressId] = @AddressId;	
	
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_Select_Address_By_PersonId]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_Select_Address_By_PersonId]
	@PersonId int
AS
BEGIN

	SELECT   a.[AddressId]
			,a.[Sequence]
			,a.[Village]
			,a.[Street]
			,a.[PostalCode]
			,a.[Region]
			,a.[Country]
			,a.[CreatedBy]
			,a.[CreatedOn]
			,a.[ModifiedBy]
			,a.[ModifiedOn]
			,pxref.[PersonId]
	FROM [dbo].[Address] a
		INNER JOIN [dbo].[PersonAddressXRef] pxref ON pxref.[AddressId] = a.[AddressId]
	WHERE
		pxref.[PersonId] = @PersonId
	ORDER BY
		a.[Sequence] DESC;
	
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_Select_Education_By_PersonId]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_Select_Education_By_PersonId]--1
	@PersonId int
AS
BEGIN

	SELECT	 [EducationId]
			,[PersonId]
			,[GradeLevel]
			,[GradeYear]
			,[Sequence]
			,[CreatedBy]
			,[CreatedOn]
			,[ModifiedBy]
			,[ModifiedOn]
	FROM [dbo].[Education]
	WHERE
		[PersonId] = @PersonId
	ORDER BY
		[Sequence] DESC;
	
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_Select_Education_Note_By_PersonId]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_Select_Education_Note_By_PersonId]--1
	@PersonId int
AS
BEGIN

	SELECT	 n.[NoteId]
			,n.[NoteType]
			,n.[Body]
			,n.[Sequence]
			,n.[CreatedBy]
			,n.[CreatedOn]
			,n.[ModifiedBy]
			,n.[ModifiedOn]
	FROM [dbo].[Education] e
		INNER JOIN [dbo].[EducationNoteXRef] enxref ON enxref.[EducationId] = e.[EducationId]
		INNER JOIN [dbo].[Note] n ON n.[NoteId] = enxref.[NoteId]
	WHERE
		e.[PersonId] = @PersonId
	ORDER BY
		n.[Sequence] DESC;
	
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_Select_Person_By_PersonId]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_Select_Person_By_PersonId]
	@PersonId int
AS
BEGIN

	SELECT   p.[PersonId]
			,p.[PersonTypeId]
			,pt.[Description]
			,[Active]
			,[FirstName]
			,[MiddleName]
			,[LastName]
			,[BirthDay]
			,[BirthMonth]
			,[BirthYear]
			,[GraduationYear]
			,[CreatedOn]
			,[CreatedBy]
			,[ModifiedOn]
			,[ModifiedBy]
	FROM [dbo].[Person] p
		INNER JOIN [dbo].[PersonType] pt ON pt.[PersonTypeId] = p.[PersonTypeId]		
	WHERE p.PersonId = @PersonId;
	
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_Select_Person_Picture_By_PersonId]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_Select_Person_Picture_By_PersonId]--1
	@PersonId int
AS
BEGIN

	SELECT [PersonPictureId]
		  ,[PersonId]
		  ,[FileName]
		  ,[Sequence]
		  ,[CreatedBy]
		  ,[CreatedOn]
		  ,[ModifiedBy]
		  ,[ModifiedOn]
	FROM [dbo].[PersonPicture]		
	WHERE
		[PersonId] = @PersonId
	ORDER BY
		[Sequence];
	
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_Select_Person_Search]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_Select_Person_Search]
	@PersonId int = null,
	@Active bit = null,
	@FirstName varchar(250) = null,	
	@MiddleName varchar(250) = null,
	@LastName varchar(250) = null,
	@BirthDay int = null,
	@BirthMonth int = null,
	@BirthYear int = null
AS
BEGIN

	SELECT   p.[PersonId]
			,p.[PersonTypeId]
			,pt.[Description]
			,[Active]
			,[FirstName]
			,[MiddleName]
			,[LastName]
			,[BirthDay]
			,[BirthMonth]
			,[BirthYear]
			,[GraduationYear]
			,[CreatedOn]
			,[CreatedBy]
			,[ModifiedOn]
			,[ModifiedBy]
	FROM [dbo].[Person] p
		INNER JOIN [dbo].[PersonType] pt ON p.[PersonTypeId] = pt.[PersonTypeId]
	WHERE
		(@PersonId IS NULL OR [PersonId] = @PersonId)
	AND
		(@FirstName IS NULL OR [FirstName] LIKE '%' + @FirstName + '%')
	AND
		(@MiddleName IS NULL OR [MiddleName] LIKE '%' + @MiddleName + '%')
	AND
		(@LastName IS NULL OR [LastName] LIKE '%' + @LastName + '%')
	AND
		(@Active IS NULL OR [Active] = @Active)
	AND
		(@BirthDay IS NULL OR BirthDay = @BirthDay)
	AND
		(@BirthMonth IS NULL OR BirthMonth = @BirthMonth)
	AND
		(@BirthYear IS NULL OR BirthYear = @BirthYear)
	
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_Select_Sponser_By_StudentId]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_Select_Sponser_By_StudentId]
	@PersonId int
AS
BEGIN

	SELECT p.[PersonId]      	  
		,px.[RelatedPersonId]      
		,sponser.[FirstName]
		,sponser.[MiddleName]
		,sponser.[LastName]
		,sponser.[Active]
		,ptr.[Description]
		,d.[DonationId]
		,d.[DonationDate]
		,d.[DonationAmount]	  
	FROM [dbo].[Person] p
	INNER JOIN [dbo].[PersonXRef] px ON px.[PersonId] = p.[PersonId]
	INNER JOIN [dbo].[PersonType] pt ON pt.[PersonTypeId] = p.[PersonTypeId]
	INNER JOIN [dbo].[Person] sponser ON sponser.[PersonId] = px.[RelatedPersonId]
	INNER JOIN [dbo].[PersonType] ptr ON ptr.[PersonTypeId] = sponser.[PersonTypeId]  
	LEFT JOIN [dbo].[Donation] d ON d.[PersonId] = sponser.[PersonId]
	WHERE p.PersonId = @PersonId;
	
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_Select_SystemSetting]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_Select_SystemSetting]
	@Owner varchar(250),
	@Key varchar(250)
AS
BEGIN

	SELECT	 [SystemSettingsId]
			,[Owner]
			,[Key]
			,[Value]
	FROM [dbo].[SystemSettings]
	WHERE [Key] = @Key
	AND [Owner] = @Owner;
	
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_Update_Address]    Script Date: 10/19/2014 9:43:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_Update_Address]
	@AddressId int,	
	@Village nvarchar(250) = NULL,
    @Street nvarchar(2000) = NULL,
    @PostalCode varchar(250) = NULL,
    @Region varchar(250) = NULL,
    @Country varchar(250) = NULL,
    @ModifiedOn datetime,
    @ModifiedBy varchar(250)
AS
BEGIN

	UPDATE [dbo].[Address]
	SET  [Village] = @Village
        ,[Street] = @Street
        ,[PostalCode] = @PostalCode
        ,[Region] = @Region
        ,[Country] = @Country           
        ,[ModifiedBy] = @ModifiedBy
        ,[ModifiedOn] = @ModifiedOn
	WHERE
		[AddressId] = @AddressId;     
	
END
GO
