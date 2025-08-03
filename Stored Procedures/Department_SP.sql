-- DEPARTMENT Table
------------------------------------------SELECT_SP--------------------------------------------------
CREATE PROC DEPT_SELECT_SP @Dept_ID INT
AS
		BEGIN
		IF NOT EXISTS (SELECT 1 FROM [dbo].[Department] where Dept_ID=@Dept_ID)
		BEGIN
		PRINT 'Error: Dept_ID does not exist.'
		RETURN;
		END
		SELECT * 
		FROM [dbo].[Department]
		WHERE Dept_ID=@Dept_ID
		END
--Validation
DEPT_SELECT_SP 7
------------------------------------------INSERT_SP--------------------------------------------------

Create PROC DEPT_INSERT_SP @Dept_Name nvarchar(max)
AS
	BEGIN
		INSERT INTO [dbo].[Department] (Dept_Name)
		values(@Dept_Name)
	END

--Validation
DEPT_INSERT_SP 'Cairo'
------------------------------------------UPDATE_SP--------------------------------------------------
CREATE PROC DEPT_UPDATE_SP @Dept_ID INT,@Dept_Name nvarchar(max)
AS
		BEGIN
		IF NOT EXISTS (SELECT 1 FROM [dbo].[Department] where Dept_ID=@Dept_ID)
		BEGIN
		PRINT 'Error: Dept_ID does not exist.'
		RETURN;
		END
				UPDATE [dbo].[Department]
				SET Dept_Name=@Dept_Name
				WHERE Dept_ID=@Dept_ID
		END;
--Validation
DEPT_UPDATE_SP 7,'alex'

------------------------------------------DELETE_SP--------------------------------------------------
Create PROC DEPT_DELETE_SP @Dept_ID INT 
AS
		BEGIN
		IF NOT EXISTS (SELECT 1 FROM [dbo].[Department] where Dept_ID=@Dept_ID)
		BEGIN
		PRINT 'Error: Dept_ID does not exist.'
		RETURN;
		END
				DELETE FROM [dbo].[Department]
				WHERE Dept_ID=@Dept_ID
		END;

--Validation
DEPT_DELETE_SP 8