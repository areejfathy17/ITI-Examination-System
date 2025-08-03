-- Exam Table
-- Exam Select SP

Create PROC Exam_Select_SP @Exam_ID int
as
	BEGIN
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Exam] WHERE [Exam_ID] = @Exam_ID)
	BEGIN
	PRINT 'Error: Exam ID does not exist.';
	RETURN;
	END
		select *
		from [dbo].[Exam]
		where [Exam_ID] = @Exam_ID
	END

-- Validation
Exam_Select_SP 10

-----------------------------------------------------------------------------------------------------------

-- Exam	INSERT SP

Create PROC Exam_Insert_SP @Exam_ID int, @Exam_Type nvarchar(max), @QTY_TF int, @QTY_MCQ int, @Duration int, @Date Date, @Ins_ID int, @Crs_ID int
as
	BEGIN
		IF EXISTS (SELECT 1 FROM [dbo].[Exam] WHERE [Exam_ID] = @Exam_ID)
	BEGIN
		PRINT 'Error: Exam ID IS exist.';
		RETURN;
	END
		INSERT INTO [dbo].[Exam] ([Exam_ID],[Exam_Type],[QTY_T/F],[QTY_MCQ],[Duration],[Date],[Ins_ID],[Crs_ID])
		values (@Exam_ID, @Exam_Type, @QTY_TF, @QTY_MCQ, @Duration, @Date, @Ins_ID, @Crs_ID)
	End

-- Validation
Exam_Insert_SP 1000, 'Final', 5, 3, 30, '2025/06/14', 21, 30

-----------------------------------------------------------------------------------------------------------

-- Exam Update SP

CREATE PROC Exam_Update_SP @Exam_ID int, @Exam_Type nvarchar(max), @QTY_TF int, @QTY_MCQ int, @Duration int, @Date Date, @Ins_ID int, @Crs_ID int
as
	BEGIN
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Exam] WHERE [Exam_ID] = @Exam_ID)
	BEGIN
	PRINT 'Error: Exam ID does not exist.';
	RETURN;
	END
	update [dbo].[Exam]
	set [Exam_ID] = @Exam_ID, [Exam_Type] = @Exam_Type, [QTY_T/F] = @QTY_TF, [QTY_MCQ] = @QTY_MCQ, [Duration] = @Duration, [Date] = @Date, [Ins_ID] = @Ins_ID, [Crs_ID] = @Crs_ID
	where [Exam_ID] = @Exam_ID
	END

-----------------------------------------------------------------------------------------------------------

-- Exam Delete SP

CREATE PROC Exam_Delete_SP @Exam_ID int
as
	BEGIN
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Exam] WHERE [Exam_ID] = @Exam_ID)
	BEGIN
	PRINT 'Error: Exam ID does not exist.';
	RETURN;
	END
	DELETE FROM [dbo].[Exam]
	where [Exam_ID] = @Exam_ID
	END

-----------------------------------------------------------------------------------------------------------
