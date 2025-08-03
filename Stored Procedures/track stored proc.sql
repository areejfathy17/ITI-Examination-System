--select track--***************************************************************************************

CREATE PROCEDURE GetTrackNameByID
    @Track_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if Track_ID exists
    IF NOT EXISTS (
        SELECT 1 FROM dbo.Track WHERE Track_ID = @Track_ID
    )
    BEGIN
        RAISERROR('Track_ID does not exist in the Track table.', 16, 1);
        RETURN;
    END

    -- Return the Track_Name
    SELECT Track_Name
    FROM dbo.Track
    WHERE Track_ID = @Track_ID;
END

EXECUTE dbo.GetTrackNameByID @Track_ID = 46-- int

SELECT *
FROM dbo.Track

--insert track--***************************************************************************************

CREATE PROCEDURE InsertTrack
    @Track_Name NVARCHAR(MAX),
    @Dept_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Check if the Dept_ID exists
    IF NOT EXISTS (
        SELECT 1 FROM dbo.Department WHERE Dept_ID = @Dept_ID
    )
    BEGIN
        RAISERROR('Dept_ID does not exist in Department table.', 16, 1);
        RETURN;
    END

    -- 2. Check if Track_Name already exists
    IF EXISTS (
        SELECT 1 FROM dbo.Track WHERE Track_Name = @Track_Name
    )
    BEGIN
        RAISERROR('This track name already exists.', 16, 1);
        RETURN;
    END

    -- 3. Insert new track with Dept_ID
    INSERT INTO dbo.Track (Track_Name, Dept_ID)
    VALUES (@Track_Name, @Dept_ID);

    PRINT 'Track inserted successfully.';
END


EXECUTE InsertTrack elzooz , 7 

--update track --***************************************************************************************
CREATE PROCEDURE UpdateTrack
    @Track_ID INT,
    @NewTrack_Name VARCHAR(100),
    @NewDept_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Check if Track_ID exists
    IF NOT EXISTS (
        SELECT 1 FROM dbo.Track WHERE Track_ID = @Track_ID
    )
    BEGIN
        RAISERROR('Track_ID does not exist in the Track table.', 16, 1);
        RETURN;
    END

    -- 2. Check if Dept_ID exists
    IF NOT EXISTS (
        SELECT 1 FROM dbo.Department WHERE Dept_ID = @NewDept_ID
    )
    BEGIN
        RAISERROR('Dept_ID does not exist in the Department table.', 16, 1);
        RETURN;
    END

    -- 3. Check if new track name is already used by another track
    IF EXISTS (
        SELECT 1 FROM dbo.Track 
        WHERE Track_Name = @NewTrack_Name AND Track_ID <> @Track_ID
    )
    BEGIN
        RAISERROR('Another track already has this name.', 16, 1);
        RETURN;
    END
End

    -- 4. Perform the update
    UPDATE dbo.Track
    SET Track_Name = @NewTrack_Name,
        Dept_ID = @NewDept_ID
    WHERE Track_ID = @Track_ID;

    PRINT 'Track updated successfully.';
END

EXECUTE UpdateTrack 64 , ai , 6



--delete track --***************************************************************************************

CREATE PROCEDURE DeleteTrack
    @Track_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Check if Track_ID exists
    IF NOT EXISTS (
        SELECT 1 FROM dbo.Track WHERE Track_ID = @Track_ID
    )
    BEGIN
        RAISERROR('Track_ID does not exist in the Track table.', 16, 1);
        RETURN;
    END

    -- 2. Delete the track
    DELETE FROM dbo.Track
    WHERE Track_ID = @Track_ID;

    PRINT 'Track deleted successfully.';
END

EXECUTE  DeleteTrack  64



