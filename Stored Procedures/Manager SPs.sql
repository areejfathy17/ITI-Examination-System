-- Manager Table
-- Manager Select SP

Create PROC Manager_Select_SP @Manager_ID int
as
	BEGIN
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Manager] WHERE [M_ID] = @Manager_ID)
	BEGIN
	PRINT 'Error: Manager ID does not exist.';
	RETURN;
	END
		select *
		from [dbo].[Manager]
		where [M_ID] = @Manager_ID
	END

-- Validation
Manager_Select_SP 5

-----------------------------------------------------------------------------------------------------------

-- Manager	INSERT SP

Create PROC Manager_Insert_SP @Manager_ID int, @HiringDate Date, @Salary int
as
	BEGIN
		IF EXISTS (SELECT 1 FROM [dbo].[Manager] WHERE [M_ID] = @Manager_ID)
	BEGIN
		PRINT 'Error: Manager ID IS exist.';
		RETURN;
	END
		INSERT INTO [dbo].[Manager] ([M_ID],[HiringDate],[Salary])
		values (@Manager_ID, @HiringDate, @Salary)
	End

-- Validation
Manager_Insert_SP 50,'2025/06/14', 50000

-----------------------------------------------------------------------------------------------------------

-- Manager Update SP

CREATE PROC Manager_Update_SP @Manager_ID int, @HiringDate Date, @Salary int
as
	BEGIN
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Manager] WHERE [M_ID] = @Manager_ID)
	BEGIN
	PRINT 'Error: Manager ID does not exist.';
	RETURN;
	END
	update [dbo].[Manager]
	set [M_ID] = @Manager_ID, [HiringDate] = @HiringDate, [Salary] = @Salary
	where [M_ID] = @Manager_ID
	END

-----------------------------------------------------------------------------------------------------------

-- Manager Delete SP

CREATE PROC Manager_Delete_SP @Manager_ID int
as
	BEGIN
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Manager] WHERE [M_ID] = @Manager_ID)
	BEGIN
	PRINT 'Error: Manager ID does not exist.';
	RETURN;
	END
	DELETE FROM [dbo].[Manager]
	where [M_ID] = @Manager_ID
	END

-----------------------------------------------------------------------------------------------------------
