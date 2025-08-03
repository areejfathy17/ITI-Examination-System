
-- Person Table
-- Person Select SP

CREATE PROC Person_Select_SP @P_ID int
as
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		IF @P_ID IS NULL OR @P_ID <= 0
		BEGIN
			SELECT 'Invalid Person ID input.' AS Message;
			RETURN;
		END
		IF NOT EXISTS (SELECT 1 FROM Person WHERE [P_ID] = @P_ID)
		BEGIN
			SELECT 'Error: Person ID does not exist.' AS Message;
			RETURN;
		END

		select *
		from Person
		where P_ID = @P_ID
	END TRY
	BEGIN CATCH
		RAISERROR('An unexpected error occured.',16,1)
	END CATCH
END

-- Validation
Person_Select_SP 7865

-----------------------------------------------------------------------------------------------------------
-- Person INSERT SP

CREATE PROC Person_Insert_SP @SSN INT,
							 @FName nvarchar(max),
							 @LName nvarchar(max),
							 @Email nvarchar(max),
							 @Marital nvarchar(max),
							 @City nvarchar(max),
							 @Street nvarchar(max),
							 @Gender nvarchar(max),
							 @BDate Date
as
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		IF EXISTS (SELECT 1 FROM Person WHERE SSN = @SSN)
		BEGIN
			RAISERROR('Error: SSN already exists.',16,1);
			RETURN;
		END

		INSERT INTO  Person ([SSN],[Fname],[Lname],[Email],[Marital_Status],[City],[Street],[Gender],[Bdate])
		values (@SSN, @FName, @LName, @Email, @Marital, @City, @Street, @Gender, @BDate);

		DECLARE @NEWID INT = SCOPE_IDENTITY();

		SELECT 'Inserted successfully. New Person ID is ' + CAST(@NEWID AS NVARCHAR) AS Message;
	END TRY
	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
		RETURN;
	END CATCH
END;

-- Validation
Person_Insert_SP 546535433,'Mohamed','Amir','gb/fjknskj','Single','Mansoura','Elmosheer','Male','1985-06-23'

-----------------------------------------------------------------------------------------------------------
-- Person Update SP

CREATE PROC Person_Update_SP @P_ID int,
							 @SSN INT,
							 @FName nvarchar(max),
							 @LName nvarchar(max),
							 @Email nvarchar(max),
							 @Marital nvarchar(max),
							 @City nvarchar(max),
							 @Street nvarchar(max),
							 @Gender nvarchar(max),
							 @BDate Date
as
BEGIN	
	SET NOCOUNT ON;
	BEGIN TRY
		IF @P_ID IS NULL OR @P_ID <= 0
		BEGIN
			SELECT 'Invalid Person ID.' AS Message;
			RETURN;
		END
		IF NOT EXISTS (SELECT 1 FROM Person WHERE [P_ID] = @P_ID)
		BEGIN
			SELECT 'Error: Person ID does not exist.' AS Message;
			RETURN;
		END

		UPDATE Person
		set SSN = @SSN,
			Fname = @FName,
			Lname = @LName,
			Email = @Email,
			Marital_Status = @Marital,
			City = @City,
			Street = @Street,
			Gender = @Gender,
			Bdate = @BDate
		where P_ID = @P_ID

		SELECT 'Person record updated successfully.' AS Message;
		RETURN;
	END TRY

	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
		RETURN;
	END CATCH
END

-- Validation
Person_Update_SP 6002,546535433,'Ahmed','Hussein','gdtejknskj','Married','Tanta','Elmosheer','Male','1987-03-03'

-----------------------------------------------------------------------------------------------------------
-- Person Delete SP

Create PROC Person_Delete_SP @P_ID int
as
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
	IF @P_ID IS NULL OR @P_ID <= 0
	BEGIN
		SELECT 'Error: Invalid Person ID input.' AS Message;
		RETURN;
	END
	IF NOT EXISTS (SELECT 1 FROM Person WHERE [P_ID] = @P_ID)
	BEGIN
		SELECT 'Error: Person ID does not exist.' AS Message;
		RETURN;
	END
	DELETE FROM Phone
	where P_ID = @P_ID;
	DELETE FROM Person
	where P_ID = @P_ID;
	SELECT 'Record deleted successfully.' AS Message;
	END TRY
	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
		RETURN;
	END CATCH
END

-- Validation
Person_Delete_SP 6002

-----------------------------------------------------------------------------------------------------------
