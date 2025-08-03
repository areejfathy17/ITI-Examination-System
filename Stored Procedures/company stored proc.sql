--SELECT company 
CREATE PROCEDURE GetCompanyByID
    @Company_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    --  Õﬁﬁ ≈‰ «·‘—ﬂ… „ÊÃÊœ…
    IF NOT EXISTS (
        SELECT 1 FROM dbo.Company WHERE Company_ID = @Company_ID
    )
    BEGIN
        RAISERROR('No company found with the given ID.', 16, 1);
        RETURN;
    END

    -- «” —Ã«⁄ »Ì«‰«  «·‘—ﬂ…
    SELECT Company_ID, Company_Name, Scope
    FROM dbo.Company
    WHERE Company_ID = @Company_ID;
END

EXECUTE GetCompanyByID 7


-- insert company 
CREATE PROCEDURE InsertCompany
    @Company_Name VARCHAR(100),
    @Scope VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    -- 1.  √ﬂœ ≈‰ «·‰Ê⁄ Local √Ê International ›ﬁÿ
    IF @Scope NOT IN ('local', 'international')
    BEGIN
        RAISERROR('Scope must be either ''local'' or ''international''.', 16, 1);
        RETURN;
    END

    -- 2.  Õﬁﬁ ≈‰ «·«”„ „‘ „ﬂ——
    IF EXISTS (SELECT 1 FROM dbo.Company WHERE Company_Name = @Company_Name)
    BEGIN
        RAISERROR('Company name already exists.', 16, 1);
        RETURN;
    END

    -- 3. «·≈÷«›…
    INSERT INTO dbo.Company (Company_Name, Scope)
    VALUES (@Company_Name, @Scope);

    PRINT 'Company inserted successfully.';
END

EXEC InsertCompany 
    @Company_Name = 'ITI Egypt', 
    @Scope = 'local';


-- update cpmpany 
CREATE PROCEDURE UpdateCompany
    @Company_ID INT,
    @NewCompany_Name VARCHAR(100),
    @NewScope VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    -- 1.  Õﬁﬁ ≈‰ «·‘—ﬂ… „ÊÃÊœ…
    IF NOT EXISTS (
        SELECT 1 FROM dbo.Company WHERE Company_ID = @Company_ID
    )
    BEGIN
        RAISERROR('Company_ID does not exist.', 16, 1);
        RETURN;
    END

    -- 2.  Õﬁﬁ ≈‰ «·‰Ê⁄ ’ÕÌÕ
    IF @NewScope NOT IN ('local', 'international')
    BEGIN
        RAISERROR('Scope must be either ''local'' or ''international''.', 16, 1);
        RETURN;
    END

    -- 3.  Õﬁﬁ ≈‰ «·«”„ «·ÃœÌœ „‘ „” Œœ„ ·‘—ﬂ…  «‰Ì…
    IF EXISTS (
        SELECT 1 FROM dbo.Company 
        WHERE Company_Name = @NewCompany_Name AND Company_ID <> @Company_ID
    )
    BEGIN
        RAISERROR('Another company already uses this name.', 16, 1);
        RETURN;
    END

    -- 4. «· ÕœÌÀ
    UPDATE dbo.Company
    SET Company_Name = @NewCompany_Name,
        Scope = @NewScope
    WHERE Company_ID = @Company_ID;

    PRINT 'Company updated successfully.';
END

EXEC UpdateCompany 
    @Company_ID = 51,
    @NewCompany_Name = 'ITI Egypt',
    @NewScope = 'international';


-- delete company 
CREATE PROCEDURE DeleteCompany
    @Company_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. «· Õﬁﬁ „‰ ÊÃÊœ «·‘—ﬂ…
    IF NOT EXISTS (
        SELECT 1 FROM dbo.Company WHERE Company_ID = @Company_ID
    )
    BEGIN
        RAISERROR('Company_ID does not exist in the Company table.', 16, 1);
        RETURN;
    END

    -- 2. «·Õ–›
    DELETE FROM dbo.Company
    WHERE Company_ID = @Company_ID;

    PRINT 'Company deleted successfully.';
END



EXEC DeleteCompany  51