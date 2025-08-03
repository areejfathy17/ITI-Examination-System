
-- Course Table
-- Course Select SP

CREATE PROC Course_Select_SP @Crs_ID int
as
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		IF @Crs_ID IS NULL OR @Crs_ID <= 0
		BEGIN
			SELECT 'Invalid Course ID input.' AS Message;
			RETURN;
		END
		IF NOT EXISTS (SELECT 1 FROM Course WHERE Crs_ID = @Crs_ID)
		BEGIN
			SELECT 'Error: Course ID does not exist.' AS Message;
			RETURN;
		END

		select *
		from Course
		where Crs_ID = @Crs_ID
	END TRY
	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
		RETURN;
	END CATCH
END

-- Validation
Course_Select_SP 78

-----------------------------------------------------------------------------------------------------------
-- Course INSERT SP

CREATE PROC Course_Insert_SP @Crs_ID INT,
							 @Crs_Name nvarchar(max),
							 @Crs_Desc nvarchar(max),
							 @Hours INT,
							 @Topic_ID INT
as
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		IF @Crs_ID IS NULL OR @Crs_ID <= 0
		BEGIN
			SELECT 'Invalid Course ID' AS Message;
			RETURN;
		END
		IF @Topic_ID IS NULL OR @Topic_ID <= 0
		BEGIN
			SELECT 'Invalid Topic ID' AS Message;
			RETURN;
		END
		IF EXISTS (SELECT 1 FROM Course WHERE Crs_ID = @Crs_ID)
		BEGIN
			RAISERROR('Error: Course ID already exists.',16,1);
			RETURN;
		END
		IF NOT EXISTS (SELECT 1 FROM Topic WHERE Topic_ID = @Topic_ID)
		BEGIN
			SELECT 'No Topic with ID ' + CAST(@Topic_ID AS nvarchar) AS Message;
			RETURN;
		END
		INSERT INTO  Course (Crs_ID,Crs_Name,Crs_Desc,Hours,Topic_ID)
		values (@Crs_ID, @Crs_Name, @Crs_Desc, @Hours, @Topic_ID);

		SELECT 'Course inserted successfully' AS Message;
	END TRY
	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
		RETURN;
	END CATCH
END;

-- Validation
Course_Insert_SP 106,'BI','Business Intelligence',34,20

-----------------------------------------------------------------------------------------------------------
-- Course Update SP

CREATE PROC Course_Update_SP @Crs_ID int,
							 @Crs_Name nvarchar(max),
							 @Crs_Desc nvarchar(max),
							 @Hours INT,
							 @Topic_ID INT
as
BEGIN	
	SET NOCOUNT ON;
	BEGIN TRY
		IF @Crs_ID IS NULL OR @Crs_ID <= 0
		BEGIN
			SELECT 'Invalid Course ID.' AS Message;
			RETURN;
		END
		IF NOT EXISTS (SELECT 1 FROM Course WHERE Crs_ID = @Crs_ID)
		BEGIN
			SELECT 'Error: Course ID does not exist.' AS Message;
			RETURN;
		END
		IF NOT EXISTS (SELECT 1 FROM Topic WHERE Topic_ID = @Topic_ID)
		BEGIN
			SELECT 'No Topic with ID ' + CAST(@Topic_ID AS nvarchar) AS Message;
			RETURN;
		END

		UPDATE Course
		set Crs_Name = @Crs_Name,
			Crs_Desc = @Crs_Desc,
			Hours = @Hours,
			Topic_ID = @Topic_ID
		where Crs_ID = @Crs_ID

		SELECT 'Course updated successfully.' AS Message;
		RETURN;
	END TRY

	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
		RETURN;
	END CATCH
END

-- Validation
Course_Update_SP 103,'BI','Business Intelligence',34,20

-----------------------------------------------------------------------------------------------------------
-- Course Delete SP

CREATE PROC Course_Delete_SP @Crs_ID int
as
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
	IF @Crs_ID IS NULL OR @Crs_ID <= 0
	BEGIN
		SELECT 'Error: Invalid Course ID input.' AS Message;
		RETURN;
	END
	IF NOT EXISTS (SELECT 1 FROM Course WHERE Crs_ID = @Crs_ID)
	BEGIN
		SELECT 'Error: Course ID does not exist.' AS Message;
		RETURN;
	END
	DELETE FROM Course
	where Crs_ID = @Crs_ID;
	SELECT 'Course deleted successfully.' AS Message;
	END TRY
	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
		RETURN;
	END CATCH
END

-- Validation
Course_Delete_SP 106

-----------------------------------------------------------------------------------------------------------
