
-- Topic Table
-- Topic Select SP

CREATE PROC Topic_Select_SP @Topic_ID int
as
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		IF @Topic_ID IS NULL OR @Topic_ID <= 0
		BEGIN
			SELECT 'Invalid Topic ID input.' AS Message;
			RETURN;
		END
		IF NOT EXISTS (SELECT 1 FROM Topic WHERE Topic_ID = @Topic_ID)
		BEGIN
			SELECT 'Error: Topic ID does not exist.' AS Message;
			RETURN;
		END

		select *
		from Topic
		where Topic_ID = @Topic_ID
	END TRY
	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
	END CATCH
	RETURN;
END

-- Validation
Topic_Select_SP 7

-----------------------------------------------------------------------------------------------------------
-- Topic INSERT SP

CREATE PROC Topic_Insert_SP @Topic_ID INT,
							@Topic_Name nvarchar(max)
as
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		IF @Topic_ID IS NULL OR @Topic_ID <= 0
		BEGIN
			SELECT 'Invalid Topic ID' AS Message;
			RETURN;
		END
		IF EXISTS (SELECT 1 FROM Topic WHERE Topic_ID = @Topic_ID)
		BEGIN
			RAISERROR('Error: Topic ID already exists.',16,1);
			RETURN;
		END

		INSERT INTO  Topic(Topic_ID,Topic_Name)
		values (@Topic_ID, @Topic_Name);

		SELECT 'Topic inserted successfully' AS Message;
	END TRY
	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
		RETURN;
	END CATCH
END;

-- Validation
Topic_Insert_SP 55,'Data Analytics'

-----------------------------------------------------------------------------------------------------------
-- Topic Update SP

Create PROC Topic_Update_SP @Topic_ID INT,
						 	 @Topic_Name nvarchar(max)
as
BEGIN	
	SET NOCOUNT ON;
	BEGIN TRY
		IF @Topic_ID IS NULL OR @Topic_ID <= 0
		BEGIN
			SELECT 'Invalid Topic ID.' AS Message;
			RETURN;
		END
		IF NOT EXISTS (SELECT 1 FROM Topic WHERE Topic_ID = @Topic_ID)
		BEGIN
			SELECT 'No Topic with ID ' + CAST(@Topic_ID AS nvarchar) AS Message;
			RETURN;
		END

		UPDATE Topic
		set Topic_Name = @Topic_Name
		where Topic_ID = @Topic_ID

		SELECT 'Topic updated successfully.' AS Message;
		RETURN;
	END TRY

	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
		RETURN;
	END CATCH
END

-- Validation
Topic_Update_SP 55,'Data Analysis'

-----------------------------------------------------------------------------------------------------------
-- Topic Delete SP

CREATE PROC Topic_Delete_SP @Topic_ID int
as
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
	IF @Topic_ID IS NULL OR @Topic_ID <= 0
	BEGIN
		SELECT 'Error: Invalid Topic ID input.' AS Message;
		RETURN;
	END
	IF NOT EXISTS (SELECT 1 FROM Topic WHERE Topic_ID = @Topic_ID)
	BEGIN
		SELECT 'Error: Topic ID does not exist.' AS Message;
		RETURN;
	END
	DELETE FROM Topic
	where Topic_ID = @Topic_ID;
	SELECT 'Topic deleted successfully.' AS Message;
	END TRY
	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
		RETURN;
	END CATCH
END

-- Validation
Topic_Delete_SP 55

-----------------------------------------------------------------------------------------------------------
