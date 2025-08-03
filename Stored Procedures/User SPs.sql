use [ITI Examination System]

-- User Table
-- User Select SP

CREATE PROC User_Select_SP @User_ID int
as
	BEGIN
	IF NOT EXISTS (SELECT 1 FROM [dbo].[User] WHERE [AccountID] = @User_ID)
	BEGIN
	PRINT 'Error: Account ID does not exist.';
	RETURN;
	END
		select *
		from [dbo].[User]
		where AccountID = @User_ID
	END

-- Validation
User_Select_SP 100

-----------------------------------------------------------------------------------------------------------

-- User	INSERT SP

CREATE PROC User_Insert_SP @User_ID int, @Role nvarchar(max), @UserName nvarchar(max), @Pass nvarchar(max)
as
	BEGIN
	IF EXISTS (SELECT 1 FROM [dbo].[User] WHERE [AccountID] = @User_ID)
	BEGIN
	PRINT 'Error: Account ID is already in use.';
	RETURN;
	END
		INSERT INTO  [dbo].[User] ([AccountID],[Role],[UserName],[Password])
		values (@User_ID, @Role, @UserName, @Pass)
	END

-- Validation
User_Insert_SP 3000,'Student','Marwa','1234'

-----------------------------------------------------------------------------------------------------------

-- User	Update SP

CREATE PROC User_Update_SP @User_ID int, @Role nvarchar(max), @username nvarchar(max), @pass nvarchar(max)
as
	BEGIN
	IF NOT EXISTS (SELECT 1 FROM [dbo].[User] WHERE [AccountID] = @User_ID)
	BEGIN
	PRINT 'Error: Account ID does not exist.';
	RETURN;
	END
	update [dbo].[User]
	set Role = @Role, UserName = @username, Password = @pass
	where AccountID = @User_ID
	END

-----------------------------------------------------------------------------------------------------------

-- User Delete SP

CREATE PROC User_Delete_SP @User_ID int
as
	BEGIN
	IF NOT EXISTS (SELECT 1 FROM [dbo].[User] WHERE [AccountID] = @User_ID)
	BEGIN
	PRINT 'Error: Account ID does not exist.';
	RETURN;
	END
	DELETE FROM [dbo].[User]
	where AccountID = @User_ID
	END

-----------------------------------------------------------------------------------------------------------