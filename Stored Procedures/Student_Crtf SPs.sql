-- Student_Crtf Table
-- Student_Crtf Select SP

Create PROC Student_Crtf_Select_SP @STD_ID int
as
	BEGIN
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Student_Crtf] WHERE [STD_ID] = @STD_ID)
	BEGIN
	PRINT 'Error: Student ID does not exist.';
	RETURN;
	END
		select *
		from [dbo].[Student_Crtf]
		where [STD_ID] = @STD_ID
	END

-- Validation
Student_Crtf_Select_SP 2000

-----------------------------------------------------------------------------------------------------------

-- Student_Crtf	INSERT SP

Create PROC Student_Crtf_Insert_SP @Crtf_ID int, @STD_ID int, @Date Date
as
	BEGIN
		IF EXISTS (SELECT 1 FROM [dbo].[Student_Crtf] WHERE [STD_ID] = @STD_ID and [Crtf_ID] = @Crtf_ID)
	BEGIN
		PRINT 'Error: Student ID IS exist.';
		RETURN;
	END
		INSERT INTO [dbo].[Student_Crtf] ([Crtf_ID],[STD_ID],[Date])
		values (@Crtf_ID, @STD_ID, @Date)
	End

-- Validation
Student_Crtf_Insert_SP 12,1997, '2025/06/14'

-----------------------------------------------------------------------------------------------------------

-- Student_Crtf Update SP

Create PROC Student_Crtf_Update_SP @Crtf_ID int, @STD_ID int, @Date Date
as
	BEGIN
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Student_Crtf] WHERE [STD_ID] = @STD_ID and [Crtf_ID] = @Crtf_ID)
	BEGIN
	PRINT 'Error: Student_Crtf ID does not exist.';
	RETURN;
	END
	update [dbo].[Student_Crtf]
	set [Crtf_ID] = @Crtf_ID, [STD_ID] = @STD_ID, [Date] = @Date
	where [STD_ID] = @STD_ID and [Crtf_ID] = @Crtf_ID
	END

-----------------------------------------------------------------------------------------------------------

-- Student_Crtf Delete SP

CREATE PROC Student_Crtf_Delete_SP @Crtf_ID int, @STD_ID int, @Date Date
as
	BEGIN
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Student_Crtf] WHERE [STD_ID] = @STD_ID and [Crtf_ID] = @Crtf_ID)
	BEGIN
	PRINT 'Error: Student_Crtf ID does not exist.';
	RETURN;
	END
	DELETE FROM [dbo].[Student_Crtf]
	where [STD_ID] = @STD_ID and [Crtf_ID] = @Crtf_ID
	END

-----------------------------------------------------------------------------------------------------------
