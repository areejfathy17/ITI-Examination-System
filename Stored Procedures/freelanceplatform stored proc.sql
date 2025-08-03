-- SELECT freelance--******************************************************************* 


Create PROCEDURE GetFreelancePlatformName
    @FreelanceName VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if FreelanceName exists
    IF NOT EXISTS (SELECT 1 FROM dbo.Freelance_Platform WHERE FreelanceName = @FreelanceName)
    BEGIN
        RAISERROR('FreelanceName does not exist in Freelance_Platform table.', 16, 1);
        RETURN;
    END

    -- Return the Free_ID
    SELECT Free_ID ,FreelanceName
    FROM dbo.Freelance_Platform
    WHERE FreelanceName = @FreelanceName;
END



EXECUTE GetFreelancePlatformName w3school

-- insert freelance--******************************************************************* 
CREATE PROCEDURE InsertFreelancePlatform
    @FreelancePlatformName VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Check if the name already exists
    IF EXISTS (
        SELECT 1 FROM dbo.Freelance_Platform WHERE FreelanceName = @FreelancePlatformName
    )
    BEGIN
        RAISERROR('This freelance platform already exists.', 16, 1);
        RETURN;
    END

    -- 2. Insert the new platform
    INSERT INTO dbo.Freelance_Platform (FreelanceName)
    VALUES (@FreelancePlatformName);

    PRINT 'Freelance platform inserted successfully.';
END




EXECUTE InsertFreelancePlatform w3school

-- update freelance--******************************************************************* 
Create PROCEDURE UpdateFreelancePlatformName
    @Free_ID INT,
    @NewFreelancePlatformName VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Check if the Free_ID exists
    IF NOT EXISTS (
        SELECT 1 FROM dbo.Freelance_Platform WHERE Free_ID = @Free_ID
    )
    BEGIN
        RAISERROR('Free_ID does not exist.', 16, 1);
        RETURN;
    END

    -- 2. Check if the new name already exists
    IF EXISTS (
        SELECT 1 FROM dbo.Freelance_Platform WHERE FreelanceName = @NewFreelancePlatformName
    )
    BEGIN
        RAISERROR('This freelance platform name already exists.', 16, 1);
        RETURN;
    END

    -- 3. Update the platform name
    UPDATE dbo.Freelance_Platform
    SET FreelanceName = @NewFreelancePlatformName
    WHERE Free_ID = @Free_ID;

    PRINT 'Freelance platform name updated successfully.';
END



--ßÏå
EXEC UpdateFreelancePlatformName 11, [mozaa we tofaha]
--Çæ
 EXEC UpdateFreelancePlatformName
    @Free_ID = 11,
    @NewFreelancePlatformName = 'mooza we tofaha';

SELECT freelancename
FROM freelance_platform
WHERE free_id =11


--delete freelance--******************************************************************* 


CREATE PROCEDURE DeleteFreelancePlatformByIDAndName
    @Free_ID INT,
    @FreelancePlatformName VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Check if the record with both ID and Name exists
    IF NOT EXISTS (
        SELECT 1 
        FROM dbo.Freelance_Platform 
        WHERE Free_ID = @Free_ID AND FreelanceName = @FreelancePlatformName
    )
    BEGIN
        RAISERROR('No matching record found with the given Free_ID and FreelancePlatformName.', 16, 1);
        RETURN;
    END

    -- 2. Delete the record
    DELETE FROM dbo.Freelance_Platform
    WHERE Free_ID = @Free_ID AND FreelanceName = @FreelancePlatformName;

    PRINT 'Freelance platform deleted successfully.';
END




EXECUTE DeleteFreelancePlatformByIDAndName 11 , [mozaa we tofaha]

SELECT  * FROM dbo.Freelance_Platform