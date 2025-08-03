DECLARE @ExamID INT;

EXEC [dbo].[GenerateExam1]
    @Crs_ID = 16,            -- رقم الكورس (مثال)
    @Exam_Type = 'Final',     -- نوع الامتحان (مثال: 'Midterm' أو 'Final')
    --@QTY_TF = 4,              -- عدد أسئلة T/F
    --@QTY_MCQ = 4,             -- عدد أسئلة MCQ
    @Duration = 60,           -- المدة بالدقايق
    @Exam_Date = '2025-06-15',-- تاريخ الامتحان
    @Ins_ID = 42,           -- رقم المحاضر
    @Exam_ID = @ExamID OUTPUT -- إخراج رقم الامتحان الجديد

SELECT @ExamID AS Generated_Exam_ID;