
-- Questions Table
-- Questions Select SP

CREATE PROC Questions_Select_SP @Q_ID int
as
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		IF @Q_ID IS NULL OR @Q_ID <= 0
		BEGIN
			SELECT 'Invalid Question ID input.' AS Message;
			RETURN;
		END
		IF NOT EXISTS (SELECT 1 FROM Questions WHERE Q_ID = @Q_ID)
		BEGIN
			SELECT 'Error: Question ID does not exist.' AS Message;
			RETURN;
		END

		select *
		from Questions
		where Q_ID = @Q_ID
	END TRY
	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
		RETURN;
	END CATCH
END

-- Validation
Questions_Select_SP 400

-----------------------------------------------------------------------------------------------------------
-- Questions INSERT SP

CREATE PROC Questions_Insert_SP @Q_ID INT,
								@QST_Content nvarchar(max),
								@Q_Type nvarchar(max),
								@Answer nvarchar(max)
as
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		IF @Q_ID IS NULL OR @Q_ID <= 0
		BEGIN
			SELECT 'Invalid Question ID' AS Message;
			RETURN;
		END

		IF EXISTS (SELECT 1 FROM Questions WHERE Q_ID = @Q_ID)
		BEGIN
			RAISERROR('Error: Question ID already exists.',16,1);
			RETURN;
		END

		IF @Q_Type NOT IN ('MCQ','T/F')
		BEGIN
			SELECT 'Question type is not valid.' AS Message;
			RETURN;
		END

		IF @Q_Type = 'T/F' AND @Answer NOT IN ('True','False')
		BEGIN
			SELECT 'Answer must be "True" or "False" for T/F questions.' AS Message;
			RETURN;
		END

		INSERT INTO  Questions (Q_ID, QST_Content, Q_Type, Answer)
		values (@Q_ID, @QST_Content, @Q_Type, @Answer);

		SELECT 'Question is inserted successfully' AS Message;
	END TRY
	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
		RETURN;
	END CATCH
END;

-- Validation
Questions_Insert_SP 1007,'fdgbrtghtd','T/F','True'

-----------------------------------------------------------------------------------------------------------
-- Questions Update SP

CREATE PROC Questions_Update_SP @Q_ID INT,
								@QST_Content nvarchar(max),
								@Q_Type nvarchar(max),
								@Answer nvarchar(max)
as
BEGIN	
	SET NOCOUNT ON;
	BEGIN TRY
		IF @Q_ID IS NULL OR @Q_ID <= 0
		BEGIN
			SELECT 'Invalid Question ID.' AS Message;
			RETURN;
		END

		IF @Q_Type NOT IN ('MCQ','T/F')
		BEGIN
			SELECT 'Question type is not valid.' AS Message;
			RETURN;
		END

		IF NOT EXISTS (SELECT 1 FROM Questions WHERE Q_ID = @Q_ID)
		BEGIN
			SELECT 'Error: Question ID does not exist.' AS Message;
			RETURN;
		END

		IF @Q_Type = 'T/F' AND @Answer NOT IN ('True','False')
		BEGIN
			SELECT 'Answer must be "True" or "False" for T/F questions.' AS Message;
			RETURN;
		END

		UPDATE Questions
		set QST_Content = @QST_Content,
			Q_Type = @Q_Type,
			Answer = @Answer
		where Q_ID = @Q_ID

		SELECT 'Question is updated successfully.' AS Message;
		RETURN;
	END TRY

	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
		RETURN;
	END CATCH
END

-- Validation
Questions_Update_SP 1007,'fdgbrtghtd','T/F','False'

-----------------------------------------------------------------------------------------------------------
-- Questions Delete SP

CREATE PROC Questions_Delete_SP @Q_ID int
as
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
	IF @Q_ID IS NULL OR @Q_ID <= 0
	BEGIN
		SELECT 'Error: Invalid Question ID input.' AS Message;
		RETURN;
	END
	IF NOT EXISTS (SELECT 1 FROM Questions WHERE Q_ID = @Q_ID)
	BEGIN
		SELECT 'Error: Question ID does not exist.' AS Message;
		RETURN;
	END
	DELETE FROM Questions
	where Q_ID = @Q_ID;

	SELECT 'Question is deleted successfully.' AS Message;
	END TRY
	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
		RETURN;
	END CATCH
END

-- Validation
Questions_Delete_SP 1007

-----------------------------------------------------------------------------------------------------------
