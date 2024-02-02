USE [MisChampionship]
GO

INSERT INTO [dbo].[User] (Name, Surname, Patronymic, PhoneNumber, Password, Email)
VALUES (N'Иван', N'Иванов', N'Иванович', N'71234567890', HASHBYTES('SHA2_256', '1234'),'mail@gmail.com')


