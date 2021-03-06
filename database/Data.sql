USE [StudentCenter]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

GO
INSERT [dbo].[Address] ([AddressId], [Sequence], [Village], [Street], [PostalCode], [Region], [Country], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, CAST(2 AS Decimal(18, 0)), N'Charlotte', N'5th Street', N'28202', N'Southeast', N'USA', N'jhurst', CAST(N'2014-09-14 00:00:00.000' AS DateTime), N'Jeremy', CAST(N'2014-10-19 04:36:17.020' AS DateTime))
GO
INSERT [dbo].[Address] ([AddressId], [Sequence], [Village], [Street], [PostalCode], [Region], [Country], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, CAST(1 AS Decimal(18, 0)), N'NoVillage', N'101 Main St', N'28282', N'South', N'USA', N'Jeremy', CAST(N'2014-11-18 00:00:00.000' AS DateTime), N'Jeremy', CAST(N'2014-10-19 02:51:34.580' AS DateTime))
GO
INSERT [dbo].[Address] ([AddressId], [Sequence], [Village], [Street], [PostalCode], [Region], [Country], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, CAST(3 AS Decimal(18, 0)), N'my villages', NULL, NULL, NULL, NULL, N'Jeremy', CAST(N'2014-10-19 03:31:03.113' AS DateTime), N'Jeremy', CAST(N'2014-10-19 03:53:51.380' AS DateTime))
GO
INSERT [dbo].[Address] ([AddressId], [Sequence], [Village], [Street], [PostalCode], [Region], [Country], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, CAST(4 AS Decimal(18, 0)), N'what', N'hey there', N'somewhere over there', NULL, NULL, N'Jeremy', CAST(N'2014-10-19 04:17:15.143' AS DateTime), N'Jeremy', CAST(N'2014-10-19 14:56:57.537' AS DateTime))
GO
INSERT [dbo].[Address] ([AddressId], [Sequence], [Village], [Street], [PostalCode], [Region], [Country], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, CAST(5 AS Decimal(18, 0)), NULL, N'101 w main st', N'adsf', NULL, NULL, N'Jeremy', CAST(N'2014-10-19 04:19:43.483' AS DateTime), N'Jeremy', CAST(N'2014-10-20 00:59:41.360' AS DateTime))
GO
INSERT [dbo].[Address] ([AddressId], [Sequence], [Village], [Street], [PostalCode], [Region], [Country], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, CAST(6 AS Decimal(18, 0)), N'justin', NULL, NULL, NULL, NULL, N'Jeremy', CAST(N'2014-10-20 00:14:51.610' AS DateTime), N'Jeremy', CAST(N'2014-10-20 00:58:42.833' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonType] ON 

GO
INSERT [dbo].[PersonType] ([PersonTypeId], [Description]) VALUES (1, N'Student')
GO
INSERT [dbo].[PersonType] ([PersonTypeId], [Description]) VALUES (2, N'Sponser')
GO
SET IDENTITY_INSERT [dbo].[PersonType] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

GO
INSERT [dbo].[Person] ([PersonId], [PersonTypeId], [Active], [FirstName], [MiddleName], [LastName], [BirthDay], [BirthMonth], [BirthYear], [GraduationYear], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (1, 1, 1, N'Jeremy', NULL, N'Hurst', 9, 11, 1960, 1999, CAST(N'2014-09-14 00:00:00.000' AS DateTime), N'Jeremy', CAST(N'2014-09-14 00:00:00.000' AS DateTime), N'Jeremy')
GO
INSERT [dbo].[Person] ([PersonId], [PersonTypeId], [Active], [FirstName], [MiddleName], [LastName], [BirthDay], [BirthMonth], [BirthYear], [GraduationYear], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (2, 1, 1, N'Justin', N'Hallon', N'Hurst', NULL, NULL, 1983, 2001, CAST(N'2014-09-14 00:00:00.000' AS DateTime), N'Jeremy', CAST(N'2014-09-14 00:00:00.000' AS DateTime), N'Jeremy')
GO
INSERT [dbo].[Person] ([PersonId], [PersonTypeId], [Active], [FirstName], [MiddleName], [LastName], [BirthDay], [BirthMonth], [BirthYear], [GraduationYear], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (3, 2, 1, N'Bill', NULL, N'Gates', NULL, NULL, NULL, NULL, CAST(N'2014-10-11 00:00:00.000' AS DateTime), N'Jeremy', CAST(N'2014-10-11 00:00:00.000' AS DateTime), N'Jeremy')
GO
INSERT [dbo].[Person] ([PersonId], [PersonTypeId], [Active], [FirstName], [MiddleName], [LastName], [BirthDay], [BirthMonth], [BirthYear], [GraduationYear], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (6, 2, 1, N'Melinda', NULL, N'Gates', NULL, NULL, NULL, NULL, CAST(N'2014-10-11 00:00:00.000' AS DateTime), N'Jeremy', CAST(N'2014-10-11 00:00:00.000' AS DateTime), N'Jeremy')
GO
INSERT [dbo].[Person] ([PersonId], [PersonTypeId], [Active], [FirstName], [MiddleName], [LastName], [BirthDay], [BirthMonth], [BirthYear], [GraduationYear], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (7, 1, 1, N'test', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2014-11-18 00:00:00.000' AS DateTime), N'test', CAST(N'2014-11-18 00:00:00.000' AS DateTime), N'test')
GO
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonAddressXRef] ON 

GO
INSERT [dbo].[PersonAddressXRef] ([PersonAddressXRefId], [PersonId], [AddressId]) VALUES (1, 1, 1)
GO
INSERT [dbo].[PersonAddressXRef] ([PersonAddressXRefId], [PersonId], [AddressId]) VALUES (3, 1, 6)
GO
INSERT [dbo].[PersonAddressXRef] ([PersonAddressXRefId], [PersonId], [AddressId]) VALUES (4, 1, 7)
GO
INSERT [dbo].[PersonAddressXRef] ([PersonAddressXRefId], [PersonId], [AddressId]) VALUES (5, 1, 8)
GO
INSERT [dbo].[PersonAddressXRef] ([PersonAddressXRefId], [PersonId], [AddressId]) VALUES (6, 1, 9)
GO
INSERT [dbo].[PersonAddressXRef] ([PersonAddressXRefId], [PersonId], [AddressId]) VALUES (7, 1, 10)
GO
SET IDENTITY_INSERT [dbo].[PersonAddressXRef] OFF
GO
SET IDENTITY_INSERT [dbo].[Education] ON 

GO
INSERT [dbo].[Education] ([EducationId], [PersonId], [GradeLevel], [GradeYear], [Sequence], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, 3, 2004, CAST(1 AS Decimal(18, 0)), N'jshurst', CAST(N'2014-10-06 00:00:00.000' AS DateTime), N'jshurst', CAST(N'2014-10-06 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Education] ([EducationId], [PersonId], [GradeLevel], [GradeYear], [Sequence], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, 4, 2005, CAST(2 AS Decimal(18, 0)), N'jshurst', CAST(N'2014-10-06 00:00:00.000' AS DateTime), N'jshurst', CAST(N'2014-10-06 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Education] OFF
GO
SET IDENTITY_INSERT [dbo].[EducationNoteXRef] ON 

GO
INSERT [dbo].[EducationNoteXRef] ([EducationNoteXRefId], [EducationId], [NoteId]) VALUES (1, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[EducationNoteXRef] OFF
GO
SET IDENTITY_INSERT [dbo].[RelationshipType] ON 

GO
INSERT [dbo].[RelationshipType] ([RelationshipTypeId], [Description]) VALUES (1, N'Sponser')
GO
INSERT [dbo].[RelationshipType] ([RelationshipTypeId], [Description]) VALUES (2, N'Father')
GO
INSERT [dbo].[RelationshipType] ([RelationshipTypeId], [Description]) VALUES (3, N'Mother')
GO
INSERT [dbo].[RelationshipType] ([RelationshipTypeId], [Description]) VALUES (4, N'Brother')
GO
INSERT [dbo].[RelationshipType] ([RelationshipTypeId], [Description]) VALUES (5, N'Sister')
GO
INSERT [dbo].[RelationshipType] ([RelationshipTypeId], [Description]) VALUES (6, N'Uncle')
GO
INSERT [dbo].[RelationshipType] ([RelationshipTypeId], [Description]) VALUES (7, N'Aunt')
GO
SET IDENTITY_INSERT [dbo].[RelationshipType] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonXRef] ON 

GO
INSERT [dbo].[PersonXRef] ([PersonXRefId], [PersonId], [RelatedPersonId], [RelationshipTypeId]) VALUES (1, 1, 3, 1)
GO
INSERT [dbo].[PersonXRef] ([PersonXRefId], [PersonId], [RelatedPersonId], [RelationshipTypeId]) VALUES (3, 1, 6, 1)
GO
SET IDENTITY_INSERT [dbo].[PersonXRef] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonPicture] ON 

GO
INSERT [dbo].[PersonPicture] ([PersonPictureId], [PersonId], [Sequence], [FileName], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, CAST(2 AS Decimal(18, 0)), N'test_pic_opt.jpg', N'Jeremy', CAST(N'2014-10-19 00:00:00.000' AS DateTime), N'Jeremy', CAST(N'2014-10-19 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[PersonPicture] ([PersonPictureId], [PersonId], [Sequence], [FileName], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, CAST(1 AS Decimal(18, 0)), N'jeremy_opt.jpg', N'Jeremy', CAST(N'2014-10-19 00:00:00.000' AS DateTime), N'Jeremy', CAST(N'2014-10-19 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PersonPicture] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemSettings] ON 

GO
INSERT [dbo].[SystemSettings] ([SystemSettingsId], [Owner], [Key], [Value]) VALUES (1, N'System', N'PersonPictureLocation', N'../../../sharedImages')
GO
INSERT [dbo].[SystemSettings] ([SystemSettingsId], [Owner], [Key], [Value]) VALUES (2, N'User', N'SystemBackgroundImageLocation', N'Default Should Go Here')
GO
INSERT [dbo].[SystemSettings] ([SystemSettingsId], [Owner], [Key], [Value]) VALUES (3, N'System', N'AuditTables', N'false')
GO
SET IDENTITY_INSERT [dbo].[SystemSettings] OFF
GO
SET IDENTITY_INSERT [dbo].[UserSettings] ON 

GO
INSERT [dbo].[UserSettings] ([UserSettingsId], [SystemSettingsId], [User], [Value]) VALUES (1, 2, N'Jeremy', N'Something other than Default')
GO
SET IDENTITY_INSERT [dbo].[UserSettings] OFF
GO
