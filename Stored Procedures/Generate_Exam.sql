create PROCEDURE [dbo].[GenerateExam1]
    @Crs_ID INT,
    @Exam_Type VARCHAR(50),
    @Duration INT,
    @Exam_Date DATE,
    @Ins_ID INT,
    @Exam_ID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @InstructorName NVARCHAR(100) = '';
    DECLARE @CourseName NVARCHAR(100) = '';
    DECLARE @ValidCourses NVARCHAR(MAX) = '';
    DECLARE @QTY_TF INT = 4;
    DECLARE @QTY_MCQ INT = 4;

    BEGIN TRY
        -- التحقق من وجود المدرس
        IF NOT EXISTS (SELECT 1 FROM Instructor WHERE Ins_ID = @Ins_ID)
        BEGIN
            DECLARE @InstructorList NVARCHAR(MAX);
            SELECT @InstructorList = STRING_AGG(CAST(Ins_ID AS NVARCHAR(10)), ', ')
            FROM Instructor;

            RAISERROR('Error: Instructor with ID %d does not exist. Available instructors: %s', 16, 1, @Ins_ID, @InstructorList);
            RETURN -1;
        END

        SELECT @InstructorName = Fname + ' ' + Lname 
        FROM Person 
        WHERE P_ID = @Ins_ID;

        -- التحقق من وجود الكورس
        IF NOT EXISTS (SELECT 1 FROM Course WHERE Crs_ID = @Crs_ID)
        BEGIN
            DECLARE @SampleCourses NVARCHAR(1000);
            SELECT TOP 10 @SampleCourses = STRING_AGG(CONVERT(NVARCHAR(10), Crs_ID) + ' - ' + Crs_Name, ', ')
            FROM Course;

            RAISERROR('Error: Course with ID %d does not exist. Sample courses: %s', 16, 1, @Crs_ID, @SampleCourses);
            RETURN -1;
        END

        SELECT @CourseName = Crs_Name FROM Course WHERE Crs_ID = @Crs_ID;

        -- التحقق من الربط بين المدرس والكورس
        IF NOT EXISTS (SELECT 1 FROM Ins_Crs WHERE Ins_ID = @Ins_ID AND Crs_ID = @Crs_ID)
        BEGIN
            SELECT @ValidCourses = STRING_AGG(CONVERT(NVARCHAR(10), c.Crs_ID) + ' - ' + c.Crs_Name, ', ')
            FROM Ins_Crs ic
            JOIN Course c ON ic.Crs_ID = c.Crs_ID
            WHERE ic.Ins_ID = @Ins_ID;

            RAISERROR('Error: Instructor %d (%s) is not assigned to course %d (%s). This instructor teaches: %s', 
                    16, 1, @Ins_ID, @InstructorName, @Crs_ID, @CourseName, @ValidCourses);
            RETURN -1;
        END

        -- التحقق من توافر الأسئلة
        DECLARE @AvailableTF INT, @AvailableMCQ INT;

        SELECT @AvailableTF = COUNT(*)
        FROM Questions q
        INNER JOIN Crs_Qst cq ON q.Q_ID = cq.Q_ID
        WHERE cq.Crs_ID = @Crs_ID AND q.Q_Type = 'T/F';

        SELECT @AvailableMCQ = COUNT(*)
        FROM Questions q
        INNER JOIN Crs_Qst cq ON q.Q_ID = cq.Q_ID
        WHERE cq.Crs_ID = @Crs_ID AND q.Q_Type = 'MCQ';

        IF @AvailableTF < @QTY_TF OR @AvailableMCQ < @QTY_MCQ
        BEGIN
            RAISERROR('Error: Not enough questions for course %d (%s). Available: %d T/F, %d MCQ', 
                    16, 1, @Crs_ID, @CourseName, @AvailableTF, @AvailableMCQ);
            RETURN -1;
        END

        BEGIN TRANSACTION;

        -- توليد رقم الامتحان
        SELECT @Exam_ID = ISNULL(MAX(Exam_ID), 0) + 1 FROM Exam;

        -- إدخال الامتحان
        INSERT INTO Exam (Exam_ID, Exam_Type, [QTY_T/F], QTY_MCQ, Duration, Date, Ins_ID, Crs_ID)
        VALUES (@Exam_ID, @Exam_Type, @QTY_TF, @QTY_MCQ, @Duration, @Exam_Date, @Ins_ID, @Crs_ID);

        -- اختيار وإدخال الأسئلة
        INSERT INTO Exam_Qst (Exam_ID, Q_ID)
        SELECT @Exam_ID, Q_ID FROM (
            SELECT TOP (4) q.Q_ID
            FROM Questions q
            INNER JOIN Crs_Qst cq ON q.Q_ID = cq.Q_ID
            WHERE cq.Crs_ID = @Crs_ID AND q.Q_Type = 'T/F'
            ORDER BY NEWID()

            UNION ALL

            SELECT TOP (4) q.Q_ID
            FROM Questions q
            INNER JOIN Crs_Qst cq ON q.Q_ID = cq.Q_ID
            WHERE cq.Crs_ID = @Crs_ID AND q.Q_Type = 'MCQ'
            ORDER BY NEWID()
        ) AS SelectedQuestions;

        COMMIT TRANSACTION;

       PRINT '=== EXAM GENERATED SUCCESSFULLY ===';
PRINT 'Exam ID: ' + CAST(@Exam_ID AS NVARCHAR);
PRINT 'Course: ' + @CourseName + ' (ID: ' + CAST(@Crs_ID AS NVARCHAR) + ')';
PRINT 'Instructor: ' + @InstructorName + ' (ID: ' + CAST(@Ins_ID AS NVARCHAR) + ')';
PRINT 'Type: ' + @Exam_Type;
PRINT 'Date: ' + CONVERT(NVARCHAR(10), @Exam_Date, 120);
PRINT 'Questions: 4 T/F, 4 MCQ';


        RETURN 0;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR('Error generating exam: %s', 16, 1, @ErrorMessage);
        RETURN -1;
    END CATCH
END
GO