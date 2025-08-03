-- Questions_Choices Table
------------------------------------------SELECT_SP--------------------------------------------------
Create PROC Questions_Choices_SELECT_SP @Q_ID INT 
AS
	BEGIN 
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Questions_Choices] WHERE Q_ID= @Q_ID)
	BEGIN
	PRINT 'Error:Q_ID does not exist.'
	RETURN;
	END
		select Choice
		from [dbo].[Questions_Choices]
		where Q_ID= @Q_ID
	END
--Validation
Questions_Choices_SELECT_SP 4
------------------------------------------INSERT_SP--------------------------------------------------
ِCreate PROC Questions_Choices_INSERT_SP
    @Q_ID  INT,
    @Choice NVARCHAR(MAX)
AS
BEGIN 
    -- التحقق من أن نفس الاختيار لنفس السؤال مش موجود بالفعل
    IF EXISTS (
        SELECT 1 
        FROM [dbo].[Questions_Choices] 
        WHERE Q_ID = @Q_ID AND Choice = @Choice
    )
    BEGIN
        PRINT 'Error: This choice already exists for the question.'
        RETURN;
    END

    -- الإضافة
    INSERT INTO [dbo].[Questions_Choices](Q_ID, Choice)
    VALUES (@Q_ID, @Choice)

    PRINT 'Choice inserted successfully.';
END


Questions_Choices_INSERT_SP 100 ,'t'
-----------------------------------------UPDATE_SP--------------------------------------------------
CREATE PROC Questions_Choices_UPDATE_SP 
    @Q_ID INT,
    @Old_Choice NVARCHAR(255),
    @New_Choice NVARCHAR(255)
AS
BEGIN 
    -- تحقق من وجود السؤال
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Questions] WHERE Q_ID = @Q_ID)
    BEGIN
        PRINT 'Error: Q_ID does not exist in Questions table.';
        RETURN;
    END

    -- تحقق من وجود الاختيار القديم
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Questions_Choices] WHERE Q_ID = @Q_ID AND Choice = @Old_Choice)
    BEGIN
        PRINT 'Error: Old choice does not exist.';
        RETURN;
    END

    -- تحقق أن الاختيار الجديد مش مكرر بالفعل
    IF EXISTS (SELECT 1 FROM [dbo].[Questions_Choices] WHERE Q_ID = @Q_ID AND Choice = @New_Choice)
    BEGIN
        PRINT 'Error: New choice already exists for this question.';
        RETURN;
    END

    -- تنفيذ التحديث
    UPDATE [dbo].[Questions_Choices]
    SET Choice = @New_Choice
    WHERE Q_ID = @Q_ID AND Choice = @Old_Choice;

    PRINT 'Choice updated successfully.';
END


EXEC Questions_Choices_UPDATE_SP 
    @Q_ID = 200,
    @Old_Choice ='F',
    @New_Choice = 'FALSE';


------------------Questions_Choices_UPDATE_SP 10,'F'
-----------------------------------------DELETE_SP--------------------------------------------------
Create PROC Questions_Choices_Delete_SP 
    @Q_ID INT,
    @Choice NVARCHAR(MAX)
AS
BEGIN 
    -- التحقق من وجود السؤال والاختيار معًا
    IF NOT EXISTS (
        SELECT 1 FROM [dbo].[Questions_Choices] 
        WHERE Q_ID = @Q_ID AND Choice = @Choice
    )
    BEGIN
        PRINT 'Error: This choice does not exist for the question.';
        RETURN;
    END

    -- تنفيذ الحذف
    DELETE FROM [dbo].[Questions_Choices]
    WHERE Q_ID = @Q_ID AND Choice = @Choice;

    PRINT 'Choice deleted successfully.';
END

--Validation
Questions_Choices_Delete_SP 
    @Q_ID = 100, 
    @Choice = 't';
