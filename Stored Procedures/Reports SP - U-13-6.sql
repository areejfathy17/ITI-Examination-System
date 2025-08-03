-- 1. Report that returns the students information according to Department No parameter.

ALTER Proc Std_Details @Dept_ID int
as
IF EXISTS (
    SELECT 1
    FROM Student s
    JOIN Track t ON s.Track_ID = t.Track_ID
    JOIN Department d ON t.Dept_ID = d.Dept_ID
	JOIN Person P ON s.STD_ID = P.P_ID
	JOIN Intake ON s.Intake_ID = Intake.Intake_ID
	JOIN Branch B ON s.Branch_ID = B.Branch_ID
    WHERE t.Dept_ID = @Dept_ID
)
BEGIN
    SELECT 
        s.STD_ID,
		CONCAT(p.Fname, ' ', p.Lname) AS FullName,
		CONCAT(p.Street, ' ', p.City) AS Address,
		P.Email,
		P.Gender,
		P.Bdate AS DateOfBirth,
		t.Track_Name, 
        Intake.[Type] as Intake_Type, 
        B.BranchName, 
        s.MilitaryStatus
    FROM Student s
    JOIN Track t ON s.Track_ID = t.Track_ID
    JOIN Department d ON t.Dept_ID = d.Dept_ID
	JOIN Person P ON s.STD_ID = P.P_ID
	JOIN Intake ON s.Intake_ID = Intake.Intake_ID
	JOIN Branch B ON s.Branch_ID = B.Branch_ID
    WHERE t.Dept_ID = @Dept_ID
END
ELSE
BEGIN
    PRINT 'The department is not found'
END


-----------------------------------------------------------------------------------------------

-- 2. Report that takes the student ID and returns the grades of the student in all courses. %

Alter PROC [dbo].[Get_Student_Grades_Report]
    @Std_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- التحقق من وجود الطالب
    IF NOT EXISTS (SELECT 1 FROM Student WHERE STD_ID = @Std_ID)
    BEGIN
        PRINT 'Error: Student not found.';
        RETURN;
    END

    -- التقرير مع دمج الاسم الأول واسم العائلة
    SELECT 
        s.STD_ID,
        CONCAT(p.Fname, ' ', p.Lname) AS FullName,
        c.Crs_Name,
        COUNT(seq.Grade) AS Total_Questions,
        SUM(seq.Grade) AS Correct_Answers,
        CONCAT(CAST(SUM(seq.Grade) * 10.0 / COUNT(seq.Grade) AS DECIMAL(5,2)),'%') AS Percentage
    FROM Student s
    JOIN Person p ON s.STD_ID = p.P_ID
    JOIN Std_Exam_Qst seq ON s.STD_ID = seq.STD_ID
    JOIN Exam_Qst eq ON seq.ExamQst_ID = eq.ExamQst_ID
    JOIN Exam e ON eq.Exam_ID = e.Exam_ID
    JOIN Course c ON e.Crs_ID = c.Crs_ID
    WHERE s.STD_ID = @Std_ID
    GROUP BY s.STD_ID, p.Fname, p.Lname, c.Crs_Name
END
GO

-----------------------------------------------------------------------

-- 3. Report that takes the instructor ID and returns the name of the courses that he teaches and the number of student per course.

CREATE PROC [dbo].[Get_Instructor_Courses_And_StudentCount]
    @Ins_ID INT
AS
BEGIN
    SET NOCOUNT ON;
    -- التحقق من وجود المحاضر
    IF NOT EXISTS (SELECT 1 FROM Instructor WHERE Ins_ID = @Ins_ID)
    BEGIN
        PRINT 'Error: Instructor not found.';
        RETURN;
    END
    -- التقرير المطلوب
    SELECT 
        i.Ins_ID,
        CONCAT(p.Fname, ' ', p.Lname) AS Instructor_Name,
        c.Crs_Name,
        COUNT(DISTINCT s.STD_ID) AS Student_Count
    FROM Instructor i
    JOIN Person p ON i.Ins_ID = p.P_ID
    JOIN Ins_Crs ic ON i.Ins_ID = ic.Ins_ID
    JOIN Course c ON ic.Crs_ID = c.Crs_ID
    JOIN Track_Crs tc ON c.Crs_ID = tc.Crs_ID
    JOIN Track t ON tc.Track_ID = t.Track_ID
    JOIN Student s ON s.Track_ID = t.Track_ID
    WHERE i.Ins_ID = @Ins_ID
    GROUP BY i.Ins_ID, p.Fname, p.Lname, c.Crs_Name
END
GO

------------------------------------------------------------------------

-- 4. Report that takes course ID and returns its topics

CREATE PROC [dbo].[Get_Courses_By_Topic]
    @Topic_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- التحقق من وجود التوبك
    IF NOT EXISTS (SELECT 1 FROM Topic WHERE Topic_ID = @Topic_ID)
    BEGIN
        PRINT 'Error: Topic not found.';
        RETURN;
    END

    -- استعلام إرجاع الكورسات المرتبطة بالتوبك
    SELECT 
        t.Topic_ID,
        t.Topic_Name,
        c.Crs_Name
    FROM Course c
    INNER JOIN Topic t ON c.Topic_ID = t.Topic_ID
    WHERE t.Topic_ID = @Topic_ID;
END

------------------------------------------------------------------------

-- 5. Report that takes exam number and returns the Questions in it and choices [freeform report]

Alter PROC [dbo].[Get_Exam_Questions_Choices_Report]
    @Exam_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- تحقق من وجود الامتحان
    IF NOT EXISTS (SELECT 1 FROM Exam WHERE Exam_ID = @Exam_ID)
    BEGIN
        PRINT 'Error: Exam not found.';
        RETURN;
    END

    -- استعلام التقرير: الأسئلة والاختيارات الخاصة بالامتحان
   SELECT 
    cw.Exam_ID,
    cw.QST_Content AS Question,
    MAX(CASE WHEN cw.RowNum = 1 THEN cw.Choice END) AS Choice1,
    MAX(CASE WHEN cw.RowNum = 2 THEN cw.Choice END) AS Choice2,
    MAX(CASE WHEN cw.RowNum = 3 THEN cw.Choice END) AS Choice3,
    MAX(CASE WHEN cw.RowNum = 4 THEN cw.Choice END) AS Choice4
FROM (
    SELECT 
        e.Exam_ID,
        q.QST_Content,
        qc.Choice,
        ROW_NUMBER() OVER (PARTITION BY q.Q_ID ORDER BY qc.Choice) AS RowNum,
        q.Q_ID
    FROM Exam e
    INNER JOIN Exam_Qst eq ON e.Exam_ID = eq.Exam_ID
    INNER JOIN Questions q ON eq.Q_ID = q.Q_ID
    INNER JOIN Questions_Choices qc ON q.Q_ID = qc.Q_ID
    WHERE e.Exam_ID = @Exam_ID
) AS cw
GROUP BY cw.Exam_ID, cw.QST_Content, cw.Q_ID
ORDER BY cw.Q_ID;
END


-- 6. Report that takes exam number and the student ID then returns the Questions in this exam with the student answers.

SELECT Exam_Qst.Exam_ID, Std_Exam_Qst.STD_ID, Questions.QST_Content, Std_Exam_Qst.Std_Ans
FROM  Exam_Qst INNER JOIN
         Questions ON Exam_Qst.Q_ID = Questions.Q_ID INNER JOIN
         Std_Exam_Qst ON Exam_Qst.ExamQst_ID = Std_Exam_Qst.ExamQst_ID
where Exam_ID=127 and STD_ID=1403

-------------------- SP -----------------------
CREATE PROC [dbo].[Get_Student_Answers_Report]
    @Exam_ID INT,
    @STD_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- تحقق من وجود الامتحان والطالب
    IF NOT EXISTS (SELECT 1 FROM Exam WHERE Exam_ID = @Exam_ID)
    BEGIN
        PRINT 'Error: Exam not found.';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM Student WHERE STD_ID = @STD_ID)
    BEGIN
        PRINT 'Error: Student not found.';
        RETURN;
    END

    -- التحقق من أن الطالب أدى هذا الامتحان
    IF NOT EXISTS (
        SELECT 1 
        FROM Std_Exam_Qst qse
        JOIN Exam_Qst eq ON qse.ExamQst_ID = eq.ExamQst_ID
        WHERE eq.Exam_ID = @Exam_ID AND qse.STD_ID = @STD_ID
    )
    BEGIN
        PRINT 'Error: This student did not take this exam.';
        RETURN;
    END

    -- عرض الأسئلة وإجابات الطالب
    SELECT 
        eq.Exam_ID,
		s.STD_ID,
        q.QST_Content AS Question,
        seq.Std_Ans AS Student_Answer
    FROM Exam_Qst eq
    JOIN Questions q ON eq.Q_ID = q.Q_ID
    JOIN Std_Exam_Qst seq ON eq.ExamQst_ID = seq.ExamQst_ID
    JOIN Student s ON seq.STD_ID = s.STD_ID
    WHERE eq.Exam_ID = @Exam_ID AND s.STD_ID = @STD_ID
END

