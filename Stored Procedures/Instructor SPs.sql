
-- Instructor Table
-- Instructor Select SP

CREATE PROC Instructor_Select_SP @Ins_ID int
as
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		IF @Ins_ID IS NULL OR @Ins_ID <= 0
		BEGIN
			SELECT 'Invalid Instructor ID input.' AS Message;
			RETURN;
		END
		IF NOT EXISTS (SELECT 1 FROM Instructor WHERE Ins_ID = @Ins_ID)
		BEGIN
			SELECT 'Error: Instructor ID does not exist.' AS Message;
			RETURN;
		END

		select *
		from Instructor
		where Ins_ID = @Ins_ID
	END TRY
	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
		RETURN;
	END CATCH
END

-- Validation
Instructor_Select_SP 70

-----------------------------------------------------------------------------------------------------------
-- Instructor INSERT SP

CREATE PROC Instructor_Insert_SP @Ins_ID INT,
								 @HiringDate DATE,
								 @Salary INT,
								 @Dept_ID INT
as
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		IF @Ins_ID IS NULL OR @Ins_ID <= 0
		BEGIN
			SELECT 'Invalid Instructor ID' AS Message;
			RETURN;
		END

		IF @Dept_ID IS NULL OR @Dept_ID <= 0
		BEGIN
			SELECT 'Invalid Department ID' AS Message;
			RETURN;
		END

		IF NOT EXISTS (SELECT 1 FROM Person WHERE P_ID = @Ins_ID)
		BEGIN
			RAISERROR('Error: Instructor ID does not exist in Person Table.',16,1);
			RETURN;
		END

		IF EXISTS (SELECT 1 FROM Instructor WHERE Ins_ID = @Ins_ID)
		BEGIN
			RAISERROR('Error: Instructor ID already exists.',16,1);
			RETURN;
		END
		IF NOT EXISTS (SELECT 1 FROM Department WHERE Dept_ID = @Dept_ID)
		BEGIN
			SELECT 'No Department with ID ' + CAST(@Dept_ID AS nvarchar) AS Message;
			RETURN;
		END

		INSERT INTO  Instructor (Ins_ID, HiringDate, Salary, Dept_ID)
		values (@Ins_ID, @HiringDate, @Salary, @Dept_ID);

		SELECT 'Instructor inserted successfully' AS Message;
	END TRY
	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
		RETURN;
	END CATCH
END;

-- Validation
Instructor_Insert_SP 79,'2024-03-10',17500,60

-----------------------------------------------------------------------------------------------------------
-- Instructor Update SP

CREATE PROC Instructor_Update_SP @Ins_ID INT,
								 @HiringDate DATE,
								 @Salary INT,
								 @Dept_ID INT
as
BEGIN	
	SET NOCOUNT ON;
	BEGIN TRY
		IF @Ins_ID IS NULL OR @Ins_ID <= 0
		BEGIN
			SELECT 'Invalid Instructor ID.' AS Message;
			RETURN;
		END

		IF @Dept_ID IS NULL OR @Dept_ID <= 0
		BEGIN
			SELECT 'Invalid Department ID' AS Message;
			RETURN;
		END

		IF NOT EXISTS (SELECT 1 FROM Instructor WHERE Ins_ID = @Ins_ID)
		BEGIN
			SELECT 'Error: Instructor ID does not exist.' AS Message;
			RETURN;
		END

		IF NOT EXISTS (SELECT 1 FROM Department WHERE Dept_ID = @Dept_ID)
		BEGIN
			SELECT 'No Department with ID ' + CAST(@Dept_ID AS nvarchar) AS Message;
			RETURN;
		END

		UPDATE Instructor
		set HiringDate = @HiringDate,
			Salary = @Salary,
			Dept_ID = @Dept_ID
		where Ins_ID = @Ins_ID

		SELECT 'Instructor details are updated successfully.' AS Message;
		RETURN;
	END TRY

	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
		RETURN;
	END CATCH
END

-- Validation
Instructor_Update_SP 76,'2019-09-08',18500,15
Instructor_Update_SP 76,'2019-09-08',18500,5
Instructor_Update_SP 90,'2019-09-08',18500,5

-----------------------------------------------------------------------------------------------------------
-- Instructor Delete SP

CREATE PROC Instructor_Delete_SP @Ins_ID int
as
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
	IF @Ins_ID IS NULL OR @Ins_ID <= 0
	BEGIN
		SELECT 'Error: Invalid Instructor ID input.' AS Message;
		RETURN;
	END
	IF NOT EXISTS (SELECT 1 FROM Instructor WHERE Ins_ID = @Ins_ID)
	BEGIN
		SELECT 'Error: Instructor ID does not exist.' AS Message;
		RETURN;
	END
	DELETE FROM Instructor
	where Ins_ID = @Ins_ID;

	SELECT 'Instructor deleted successfully.' AS Message;
	END TRY
	BEGIN CATCH
		SELECT 'Error: ' + ERROR_MESSAGE() AS Message;
		RETURN;
	END CATCH
END

-- Validation
Instructor_Delete_SP 78
Instructor_Delete_SP 76

-----------------------------------------------------------------------------------------------------------
