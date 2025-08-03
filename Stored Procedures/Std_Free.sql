?----Std_Freelance Table
------------------------------------------SELECT_SP--------------------------------------------------

Create proc Std_Freelance_SELECT_SP @Free_ID INT
                                    
AS
BEGIN 
	IF NOT EXISTS (Select 1 from [dbo].[Std_Freelance] where Free_ID=@Free_ID)
	BEGIN
	PRINT 'Error: Free_ID does not exist.';
	RETURN;
	END
	Select * 
	from [dbo].[Std_Freelance]
	where  Free_ID=@Free_ID
	PRINT 'Record retrieved successfully.';
	
END
--Validation
EXEC Std_Freelance_SELECT_SP 3
------------------------------------------INSERT_SP--------------------------------------------------
Create proc Std_Freelance_INSERT_SP @Free_ID INT
                                   ,@STD_ID INT
								   ,@Detail Nvarchar(max)
								   ,@Date date
								   ,@Cost int
AS
BEGIN 
	IF EXISTS (Select 1 from [dbo].[Std_Freelance] where Free_ID=@Free_ID and STD_ID=@STD_ID)
	BEGIN
	PRINT 'Error: This record already exists.';
    RETURN;
	RETURN;
	END
	Insert Into [dbo].[Std_Freelance] (Free_ID,STD_ID,Detail,Date,Cost)
	values (@Free_ID,@STD_ID,@Detail,@Date,@Cost)
END
--Validation
EXEC Std_Freelance_INSERT_SP 
    @Free_ID = 10, 
    @STD_ID = 2001, 
    @Detail = N'Website Design', 
    @Date = '2025-06-14', 
    @Cost = 3000;
------------------------------------------Update_SP--------------------------------------------------

CREATE OR ALTER PROC Std_Freelance_UPDATE_SP 
    @Free_ID INT,
    @STD_ID INT,
    @Detail NVARCHAR(MAX),
    @Date DATE,
    @Cost INT
AS
BEGIN 
    -- التحقق من وجود السجل قبل التعديل
    IF NOT EXISTS (
        SELECT 1 FROM [dbo].[Std_Freelance] 
        WHERE Free_ID = @Free_ID AND STD_ID = @STD_ID
    )
    BEGIN
        PRINT 'Error: Std_Freelance record does not exist.';
        RETURN;
    END

    -- التحقق من وجود Free_ID في جدول Freelance_Platform
    IF NOT EXISTS (
        SELECT 1 FROM [dbo].[Freelance_Platform] 
        WHERE Free_ID = @Free_ID
    )
    BEGIN
        PRINT 'Error: Free_ID does not exist in Freelance_Platform.';
        RETURN;
    END

    -- التحقق من وجود الطالب
    IF NOT EXISTS (
        SELECT 1 FROM [dbo].[Student]
        WHERE STD_ID = @STD_ID
    )
    BEGIN
        PRINT 'Error: STD_ID does not exist in Student.';
        RETURN;
    END

    -- تنفيذ التعديل
    UPDATE [dbo].[Std_Freelance]
    SET 
        Detail = @Detail,
        Date = @Date,
        Cost = @Cost
    WHERE Free_ID = @Free_ID AND STD_ID = @STD_ID;

    PRINT 'Record updated successfully.';
END
--Validation
Std_Freelance_UPDATE_SP  10,2001,'W', '2025-06-15',3
------------------------------------------Update_SP--------------------------------------------------
CREATE OR ALTER PROC Std_Freelance_DELETE_SP 
    @Free_ID INT,
    @STD_ID INT
AS
BEGIN 
    -- التحقق من وجود السجل المطلوب حذفه
    IF NOT EXISTS (
        SELECT 1 FROM [dbo].[Std_Freelance] 
        WHERE Free_ID = @Free_ID AND STD_ID = @STD_ID
    )
    BEGIN
        PRINT 'Error: Std_Freelance record does not exist.';
        RETURN;
    END

    -- تنفيذ الحذف
    DELETE FROM [dbo].[Std_Freelance]
    WHERE Free_ID = @Free_ID AND STD_ID = @STD_ID;

    PRINT 'Record deleted successfully.';
END

--Validation
Std_Freelance_DELETE_SP 10,2001

