CREATE PROC [dbo].[Exam_ans1]
    @Std_ID INT,
    @Exam_ID INT,
    @ans1 NVARCHAR(MAX),
    @ans2 NVARCHAR(MAX),
    @ans3 NVARCHAR(MAX),
    @ans4 NVARCHAR(MAX),
    @ans5 NVARCHAR(MAX),
    @ans6 NVARCHAR(MAX),
    @ans7 NVARCHAR(MAX),
    @ans8 NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    -- جدول مؤقت لتجميع الأسئلة مع إجابات الطالب
    CREATE TABLE #t (
        incr INT IDENTITY(1,1),
        ExamQst_ID INT,
        STD_ID INT,
        Std_Ans NVARCHAR(MAX)
    );

    -- جلب الأسئلة المرتبطة بالامتحان
    INSERT INTO #t (ExamQst_ID, STD_ID)
    SELECT ExamQst_ID, @Std_ID
    FROM Exam_Qst
    WHERE Exam_ID = @Exam_ID;

    -- التحقق من أن عدد الأسئلة = 8
    IF (SELECT COUNT(*) FROM #t) <> 8
    BEGIN
        RAISERROR('Error: Exam must contain exactly 8 questions.', 16, 1);
        RETURN;
    END

    -- تحديث الإجابات بناءً على ترتيب الأسئلة
    UPDATE #t SET Std_Ans = @ans1 WHERE incr = 1;
    UPDATE #t SET Std_Ans = @ans2 WHERE incr = 2;
    UPDATE #t SET Std_Ans = @ans3 WHERE incr = 3;
    UPDATE #t SET Std_Ans = @ans4 WHERE incr = 4;
    UPDATE #t SET Std_Ans = @ans5 WHERE incr = 5;
    UPDATE #t SET Std_Ans = @ans6 WHERE incr = 6;
    UPDATE #t SET Std_Ans = @ans7 WHERE incr = 7;
    UPDATE #t SET Std_Ans = @ans8 WHERE incr = 8;

    -- إدخال البيانات إلى جدول الإجابات
    INSERT INTO Std_Exam_Qst (ExamQst_ID, STD_ID, Std_Ans)
    SELECT ExamQst_ID, STD_ID, Std_Ans
    FROM #t;

    -- تنظيف الجدول المؤقت
    DROP TABLE #t;
END
GO