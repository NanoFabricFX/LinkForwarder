IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Link')
CREATE TABLE [Link](
[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
[OriginUrl] [nvarchar](256) NULL,
[FwToken] [varchar](32) NULL,
[Note] [nvarchar](max) NULL,
[AkaName] [varchar](32) NULL,
[IsEnabled] [bit] NOT NULL,
[UpdateTimeUtc] [datetime] NOT NULL)

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'LinkTracking')
CREATE TABLE [LinkTracking](
[Id] UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
[LinkId] [int] NOT NULL,
[UserAgent] [nvarchar](256) NULL,
[IpAddress] [varchar](64) NULL,
[RequestTimeUtc] [datetime] NOT NULL)

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = N'FK_LinkTracking_Link')
ALTER TABLE [LinkTracking]  WITH CHECK ADD  CONSTRAINT [FK_LinkTracking_Link] FOREIGN KEY([LinkId])
REFERENCES [Link] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
ALTER TABLE [LinkTracking] CHECK CONSTRAINT [FK_LinkTracking_Link]