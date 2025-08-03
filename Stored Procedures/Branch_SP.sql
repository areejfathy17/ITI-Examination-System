use [ITI EXAMINATION SYSTEM_SP]
go
-- Branch Table
------------------------------------------SELECT_SP--------------------------------------------------

CREATE PROC Branch_Select_SP @Branch_ID int
as
	BEGIN
	IF NOT EXISTS(Select 1 from [dbo].[Branch] where [Branch_ID] = @Branch_ID)
	BEGIN
	PRINT 'Error: Branch_ID does not exist.'
	RETURN;
	END
		select * 
		from [dbo].[Branch]
		where [Branch_ID] = @Branch_ID
	END

-- Validation
Branch_Select_SP 5

------------------------------------------INSERT_SP--------------------------------------------------

Create PROC Branch_INSERT_SP 
			@Location nvarchar(max),
			@BranchName nvarchar(max),
			@M_ID INT
as 
	BEGIN
		INSERT INTO [dbo].[Branch] (Location,BranchName,M_ID)
		values(@Location,@BranchName,@M_ID)
	END


-- Validation
Branch_INSERT_SP 'Cairo','CairoBranch',2
------------------------------------------UPDATE_SP--------------------------------------------------
CREATE PROC Branch_Update_SP
    @Branch_ID INT,
    @Location NVARCHAR(MAX),
    @BranchName NVARCHAR(MAX),
    @M_ID INT
AS
BEGIN
    -- التحقق من وجود الفرع
    IF NOT EXISTS (
        SELECT 1 FROM [dbo].[Branch] WHERE Branch_ID = @Branch_ID
    )
    BEGIN
        PRINT 'Error: Branch_ID does not exist.';
        RETURN;
    END

    -- التحقق من أن M_ID موجود في جدول المديرين (اختياري لكن مفيد)
    IF NOT EXISTS (
        SELECT 1 FROM [dbo].[Manager] WHERE M_ID = @M_ID
    )
    BEGIN
        PRINT 'Error: Manager ID does not exist.';
        RETURN;
    END

    -- التحديث
    UPDATE [dbo].[Branch]
    SET 
        Location = @Location,
        BranchName = @BranchName,
        M_ID = @M_ID
    WHERE 
        Branch_ID = @Branch_ID;

    PRINT 'Branch updated successfully.';
END;
---Validation
Branch_Update_SP 8,'C','C',3

------------------------------------------DELETE_SP--------------------------------------------------
CREATE PROC Branch_Delete_SP
    @Branch_ID INT
AS
BEGIN
    -- التحقق من وجود الفرع
    IF NOT EXISTS (
        SELECT 1 FROM [dbo].[Branch] WHERE Branch_ID = @Branch_ID
    )
    BEGIN
        PRINT 'Error: Branch_ID does not exist.';
        RETURN;
    END

    -- حذف الفرع
    DELETE FROM [dbo].[Branch]
    WHERE Branch_ID = @Branch_ID;

    PRINT 'Branch deleted successfully.';
END;

---Validation
Branch_Delete_SP 8