-- Certificate Table
-- Certificate Select SP

CREATE PROC Certificate_Select_SP @certificate_ID int
as
	BEGIN
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Certificate] WHERE [Crtf_ID] = @certificate_ID)
	BEGIN
	PRINT 'Error: Certificate ID does not exist.';
	RETURN;
	END
		select *
		from [dbo].[Certificate]
		where Crtf_ID = @certificate_ID
	END

-- Validation
Certificate_Select_SP 10

-----------------------------------------------------------------------------------------------------------

-- Certificate	INSERT SP

Create PROC Certificate_Insert_SP @Crtf_Name nvarchar(max), @Provider nvarchar(max), @Field nvarchar(max), @Crtf_URL nvarchar(max)
as
		INSERT INTO  [dbo].[Certificate] ([Crtf_Name],[Provider],[Field],[Crtf_URL])
		values (@Crtf_Name, @Provider, @Field, @Crtf_URL)

-- Validation
Certificate_Insert_SP 'python for data analysis', 'free code camp', 'programming', 'www.freecode/python.com'

-----------------------------------------------------------------------------------------------------------

-- Certificate Update SP

CREATE PROC Certificate_Update_SP @certificate_ID int, @Crtf_Name nvarchar(max), @Provider nvarchar(max), @Field nvarchar(max), @Crtf_URL nvarchar(max)
as
	BEGIN
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Certificate] WHERE [Crtf_ID] = @certificate_ID)
	BEGIN
	PRINT 'Error: Certificate ID does not exist.';
	RETURN;
	END
	update [dbo].[Certificate]
	set [Crtf_Name] = @Crtf_Name, [Provider] = @Provider, [Field] = @Field, [Crtf_URL] = @Crtf_URL
	where [Crtf_ID] = @certificate_ID
	END

-----------------------------------------------------------------------------------------------------------

-- Certificate Delete SP

CREATE PROC Certificate_Delete_SP @certificate_ID int
as
	BEGIN
	IF NOT EXISTS (SELECT 1 FROM [dbo].[Certificate] WHERE [Crtf_ID] = @certificate_ID)
	BEGIN
	PRINT 'Error: Certificate ID does not exist.';
	RETURN;
	END
	DELETE FROM [dbo].[Certificate]
	where [Crtf_ID] = @certificate_ID
	END

-----------------------------------------------------------------------------------------------------------
