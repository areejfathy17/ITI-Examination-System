--phone SELECT stored-------*******************************************************************

CREATE PROCEDURE GetPhoneByPersonID
    @P_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the P_ID exists
    IF EXISTS (SELECT 1 FROM dbo.Phone WHERE P_ID = @P_ID)
    BEGIN
        -- If exists, return the phone(s)
        SELECT Phone
        FROM dbo.Phone
        WHERE P_ID = @P_ID;
    END
    ELSE
    BEGIN
        -- If not exists, return a message
        RAISERROR('No phone number found for the given P_ID.', 16, 1);
    END
END;


--INSERT IN TABLE phone-------******************************************************************* 

Create PROCEDURE InsertPhoneForPerson
    @P_ID INT,
    @Phone VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Check if the person exists
    IF NOT EXISTS (SELECT 1 FROM dbo.Person WHERE P_ID = @P_ID)
    BEGIN
        RAISERROR('P_ID does not exist in Person table.', 16, 1);
        RETURN;
    END

    -- 2. Check if the phone number already exists globally
    IF EXISTS (SELECT 1 FROM dbo.Phone WHERE Phone = @Phone)
    BEGIN
        RAISERROR('This phone number is already registered.', 16, 1);
        RETURN;
    END

    -- 3. Check how many phone numbers already exist for this person
    DECLARE @PhoneCount INT;
    SELECT @PhoneCount = COUNT(*) FROM dbo.Phone WHERE P_ID = @P_ID;

    IF @PhoneCount >= 2
    BEGIN
        RAISERROR('Cannot add more than 2 phone numbers for the same person.', 16, 1);
        RETURN;
    END

    -- 4. Insert the new phone number
    INSERT INTO dbo.Phone (Phone, P_ID)
    VALUES (@Phone, @P_ID);
    
    PRINT 'Phone number inserted successfully.';
END

-- UPDATE phone-------*******************************************************************

Create PROCEDURE UpdatePhoneNumber
    @P_ID INT,
	@OldPhone nVARCHAR(20),
    @NewPhone nVARCHAR(20)
   
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if P_ID exists
    IF NOT EXISTS (SELECT 1 FROM dbo.Person WHERE P_ID = @P_ID)
    BEGIN
        RAISERROR('This P_ID does not exist.', 16, 1);
        RETURN;
    END

    -- Check if Old Phone exists for this person
    IF  NOT EXISTS (SELECT 1 FROM dbo.Phone WHERE Phone = @OldPhone AND P_ID = @P_ID)
    BEGIN
        RAISERROR('Old phone number not found for this person.', 16, 1);
        RETURN;
    END

    -- Check if New Phone already exists
    IF EXISTS (SELECT 1 FROM dbo.Phone WHERE Phone = @NewPhone)
    BEGIN
        RAISERROR('New phone number already exists.', 16, 1);
        RETURN;
    END

   
   -- Check phone number format
IF @NewPhone NOT LIKE '01[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' and LEN(@NewPhone) != 11
BEGIN
    RAISERROR('Phone number must start with 01 and be exactly 11 digits.', 16, 1);
    RETURN;
END


    -- Perform update
    UPDATE dbo.Phone
    SET Phone = @NewPhone
    WHERE Phone = @OldPhone AND P_ID = @P_ID;

    PRINT 'Phone number updated successfully.';
END


------ DELETE FROM phone -------******************************************************************* 

CREATE PROCEDURE DeletePhoneByStudent
    @P_ID INT,
    @Phone VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Check if the person exists
    IF NOT EXISTS (
        SELECT 1 FROM dbo.phone WHERE P_ID = @P_ID
    )
    BEGIN
        RAISERROR('Person ID does not exist.', 16, 1);
        RETURN;
    END

    -- 2. Check if the phone number exists for this student
    IF NOT EXISTS (
        SELECT 1 FROM dbo.Phone
        WHERE P_ID = @P_ID AND Phone = @Phone
    )
    BEGIN
        RAISERROR('This phone number does not exist for the specified Person.', 16, 1);
        RETURN;
    END

    -- 3. Delete the phone number
    DELETE FROM dbo.Phone
    WHERE P_ID = @P_ID AND Phone = @Phone;

    PRINT 'Phone number deleted successfully.';
END
