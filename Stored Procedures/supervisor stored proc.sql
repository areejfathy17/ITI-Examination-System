Create PROCEDURE GetSupervisorDetails
    @Ins_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- ���� �� ��� Ins_ID ����� �� ���� Supervisor
    IF NOT EXISTS (
        SELECT 1 FROM dbo.Supervisor WHERE Ins_ID = @Ins_ID
    )
    BEGIN
        RAISERROR('Supervisor not found for the given supervisor ID.', 16, 1);
        RETURN;
    END

    -- ��� ������ ������
    SELECT 
        i.Ins_ID AS Supervisor_ID,
        CONCAT(p.Fname, ' ', p.Lname) AS FullName,
        d.Dept_Name AS Department,
        p.SSN,
        p.City,
        p.Gender,
		s.StartDate,
		s.EndDate
    FROM dbo.Supervisor s
    JOIN dbo.Instructor i ON s.Ins_ID = i.Ins_ID
    JOIN dbo.Person p ON i.Ins_ID = p.P_ID
    JOIN dbo.Department d ON i.Dept_ID = d.Dept_ID
    WHERE s.Ins_ID = @Ins_ID;
END

EXEC GetSupervisorDetails  42


-- insert supervisor 

CREATE PROCEDURE InsertSupervisor
    @Ins_ID INT,
    @Dept_ID INT,
    @StartDate DATE = NULL,
    @EndDate DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. ���� �� Instructor �����
    IF NOT EXISTS (SELECT 1 FROM dbo.Instructor WHERE Ins_ID = @Ins_ID)
    BEGIN
        RAISERROR('Instructor ID does not exist.', 16, 1);
        RETURN;
    END

    -- 2. ���� �� Department �����
    IF NOT EXISTS (SELECT 1 FROM dbo.Department WHERE Dept_ID = @Dept_ID)
    BEGIN
        RAISERROR('Department ID does not exist.', 16, 1);
        RETURN;
    END

    -- 3. ���� �� ������ �� ���� ������ �� ��� �����
    IF EXISTS (
        SELECT 1 
        FROM dbo.Supervisor 
        WHERE Ins_ID = @Ins_ID AND Dept_ID = @Dept_ID
    )
    BEGIN
        RAISERROR('This supervisor is already assigned to this department.', 16, 1);
        RETURN;
    END

    -- 4. ��� StartDate �� �� �����
    IF @StartDate IS NULL
    BEGIN
        SET @StartDate = GETDATE();
    END

    -- 5. ���� �� EndDate (�� ������) ��� StartDate
    IF @EndDate IS NOT NULL AND @EndDate <= @StartDate
    BEGIN
        RAISERROR('EndDate must be after StartDate.', 16, 1);
        RETURN;
    END

    -- 6. ����� ��������
    INSERT INTO dbo.Supervisor (Dept_ID, Ins_ID, StartDate, EndDate)
    VALUES (@Dept_ID, @Ins_ID, @StartDate, @EndDate);

    PRINT 'Supervisor inserted successfully.';
END

EXEC InsertSupervisor 
    @Ins_ID = 73,
    @Dept_ID = 2,
    @StartDate = '2025-06-14',
    @EndDate = NULL;


--UPDATE supervisor 

Create PROCEDURE UpdateSupervisorDetails
    @Ins_ID INT,
    @NewFname VARCHAR(50),
    @NewLname VARCHAR(50),
    @NewCity VARCHAR(50),
    @NewGender VARCHAR(10),
    @NewDept_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- ���� �� ������ ����� �� ���� Supervisor
    IF NOT EXISTS (SELECT 1 FROM dbo.Supervisor WHERE Ins_ID = @Ins_ID)
    BEGIN
        RAISERROR('Supervisor not found.', 16, 1);
        RETURN;
    END

    -- ���� �� ����� ������ �����
    IF NOT EXISTS (SELECT 1 FROM dbo.Department WHERE Dept_ID = @NewDept_ID)
    BEGIN
        RAISERROR('Department ID does not exist.', 16, 1);
        RETURN;
    END

    -- ����� ������ �����
    UPDATE dbo.Person
    SET Fname = @NewFname,
        Lname = @NewLname,
        City = @NewCity,
        Gender = @NewGender
    WHERE P_ID = @Ins_ID;

    -- ����� ����� �� ���� Instructor
    UPDATE dbo.Instructor
    SET Dept_ID = @NewDept_ID
    WHERE Ins_ID = @Ins_ID;

    -- ����� ������ ���� Supervisor
    UPDATE dbo.Supervisor
    SET Dept_ID = @NewDept_ID,
        StartDate = GETDATE(),
        EndDate = NULL
    WHERE Ins_ID = @Ins_ID;

    PRINT 'Supervisor details updated successfully.';
END


EXEC UpdateSupervisorDetails
    @Ins_ID = 42,
    @NewFname = 'Ahmed',
    @NewLname = 'Khaled',
    @NewCity = 'Alexandria',
    @NewGender = 'Male',
    @NewDept_ID = 3;


--delete supervisor 
CREATE PROCEDURE DeleteSupervisor
    @Ins_ID INT,
    @Dept_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- ���� �� ������ ����� �� ���� Supervisor ���� �����
    IF NOT EXISTS (
        SELECT 1 
        FROM dbo.Supervisor 
        WHERE Ins_ID = @Ins_ID AND Dept_ID = @Dept_ID
    )
    BEGIN
        RAISERROR('Supervisor not found for the given Instructor ID and Department ID.', 16, 1);
        RETURN;
    END

    -- ��� ������
    DELETE FROM dbo.Supervisor
    WHERE Ins_ID = @Ins_ID AND Dept_ID = @Dept_ID;

    PRINT 'Supervisor deleted successfully.';
END


EXEC DeleteSupervisor 
    @Ins_ID = 73,
    @Dept_ID = 2;
