Create PROC [dbo].[Exam_Correction1] 
    @Std_ID INT, 
    @Exam_ID INT
AS
BEGIN
    -- Check if student exists
    IF NOT EXISTS (SELECT 1 FROM Student WHERE STD_ID = @Std_ID)
    BEGIN
        SELECT 'There is no student with that number.' AS Message
        RETURN
    END

    -- Check if exam exists
    IF NOT EXISTS (SELECT 1 FROM Exam WHERE Exam_ID = @Exam_ID)
    BEGIN
        SELECT 'There is no exam with that number.' AS Message
        RETURN
    END

    -- Check if student took this exam
    IF NOT EXISTS (
        SELECT 1 
        FROM Std_Exam_Qst qse
        JOIN Exam_Qst qe ON qse.ExamQst_ID = qe.ExamQst_ID
        WHERE qe.Exam_ID = @Exam_ID AND qse.STD_ID = @Std_ID
    )
    BEGIN
        SELECT 'This student did not take this exam.' AS Message
        RETURN
    END

    -- Update Grades for this student and this exam only
    UPDATE qse
    SET Grade = CASE 
        WHEN qse.Std_Ans = qse.Correct_Ans THEN 1 
        ELSE 0 
    END
    FROM Std_Exam_Qst qse
    JOIN Exam_Qst qe ON qse.ExamQst_ID = qe.ExamQst_ID
    WHERE qse.STD_ID = @Std_ID AND qe.Exam_ID = @Exam_ID;

    -- Return only Exam_ID and Percentage
    SELECT 
        @Exam_ID AS Exam_ID,
        CONCAT(CAST(SUM(qse.Grade) * 100.0 / COUNT(*) AS DECIMAL(5,2)),'%') AS Percentage
    FROM Std_Exam_Qst qse
    JOIN Exam_Qst qe ON qse.ExamQst_ID = qe.ExamQst_ID
    WHERE qse.STD_ID = @Std_ID AND qe.Exam_ID = @Exam_ID;
END
GO