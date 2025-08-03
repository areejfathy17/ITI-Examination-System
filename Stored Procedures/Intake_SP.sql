-- INTAKE Table
------------------------------------------SELECT_SP--------------------------------------------------
CREATE PROC Intake_SELECT_SP @Intake_ID INT 
AS
	BEGIN 
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Intake] WHERE Intake_ID= @Intake_ID)
	BEGIN
	PRINT 'Error:Intake_ID does not exist.'
	RETURN;
	END
		select * 
		from [dbo].[Intake]
		where Intake_ID=@Intake_ID
	END

--Validation
Intake_SELECT_SP 24

------------------------------------------INSERT_SP--------------------------------------------------
CREATE PROC Intake_INSERT_SP 
					@Start_Date Date,
					@End_Date Date,
					@Type nvarchar(max)
AS
	BEGIN
		INSERT INTO [dbo].[Intake] (Start_Date,End_Date,Type)
		values(@Start_Date,@End_Date,@Type)
	END

--Validation
Intake_INSERT_SP 
@Start_Date = '2025-09-01',
@End_Date = '2026-06-01',
@Type = 'Full-Time';

-----------------------------------------UPDATE_SP--------------------------------------------------
CREATE PROC Intake_UPDATE_SP 
					@Intake_ID INT,	
					@Start_Date Date,
					@End_Date Date,
					@Type nvarchar(max)
AS
	
	BEGIN 
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Intake] WHERE Intake_ID= @Intake_ID)
	BEGIN
	PRINT 'Error:Intake_ID does not exist.'
	RETURN;
	END
		update [dbo].[Intake] 
        SET 	
			Start_Date=@Start_Date,
			End_Date=@End_Date,
			Type=@Type
		Where Intake_ID= @Intake_ID
			
	END
--Validation
Intake_UPDATE_SP 
    @Intake_ID = 48,
    @Start_Date = '2025-10-01',
    @End_Date = '2026-07-01',
    @Type = 'Evening';
------------------------------------------DELETE_SP--------------------------------------------------
CREATE PROC Intake_DELETE_SP @Intake_ID INT
AS
	
	BEGIN 
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Intake] WHERE Intake_ID= @Intake_ID)
	BEGIN
	PRINT 'Error:Intake_ID does not exist.'
	RETURN;
	END
		DELETE FROM [dbo].[Intake] 
		Where Intake_ID= @Intake_ID		
	END
--Validation
Intake_DELETE_SP 48