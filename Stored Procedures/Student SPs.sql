-- Student Table
-- Student Select SP

Create PROC Student_Select_SP @Student_ID int
as
	BEGIN
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Student] WHERE [STD_ID] = @Student_ID)
	BEGIN
	PRINT 'Error: Student ID does not exist.';
	RETURN;
	END
		select *
		from [dbo].[Student]
		where [STD_ID] = @Student_ID
	END

-- Validation
Student_Select_SP 100

-----------------------------------------------------------------------------------------------------------

-- Student	INSERT SP

Create PROC Student_Insert_SP @Student_ID int, @Track_ID int, @Branch_ID int, @Intake_ID int, @MilitaryStatus nvarchar(max), @SocialPage_URL nvarchar(max)
as
	BEGIN
		IF EXISTS (SELECT 1 FROM [dbo].[Student] WHERE [STD_ID] = @Student_ID)
	BEGIN
		PRINT 'Error: Student ID IS exist.';
		RETURN;
	END
		INSERT INTO [dbo].[Student] ([STD_ID],[Track_ID],[Branch_ID],[Intake_ID],[MilitaryStatus],[SM_URL])
		values (@Student_ID, @Track_ID, @Branch_ID, @Intake_ID, @MilitaryStatus, @SocialPage_URL)
	End

-- Validation
Student_Insert_SP 7991, 48, 3, 47,'Completed', 'www.ahmedkhaled.com'

-----------------------------------------------------------------------------------------------------------

-- Student Update SP

CREATE PROC Student_Update_SP @Student_ID int, @Track_ID int, @Branch_ID int, @Intake_ID int, @MilitaryStatus nvarchar(max), @SocialPage_URL nvarchar(max)
as
	BEGIN
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Student] WHERE [STD_ID] = @Student_ID)
	BEGIN
	PRINT 'Error: Student ID does not exist.';
	RETURN;
	END
	update [dbo].[Student]
	set [STD_ID] = @Student_ID, [Track_ID] = @Track_ID, [Branch_ID] = @Branch_ID, [Intake_ID] = @Intake_ID, [MilitaryStatus] = @MilitaryStatus, [SM_URL] = @SocialPage_URL
	where [STD_ID] = @Student_ID
	END

-----------------------------------------------------------------------------------------------------------

-- Student Delete SP

CREATE PROC Student_Delete_SP @Student_ID int
as
	BEGIN
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Student] WHERE [STD_ID] = @Student_ID)
	BEGIN
	PRINT 'Error: Student ID does not exist.';
	RETURN;
	END
	DELETE FROM [dbo].[Student]
	where [STD_ID] = @Student_ID
	END

-----------------------------------------------------------------------------------------------------------
