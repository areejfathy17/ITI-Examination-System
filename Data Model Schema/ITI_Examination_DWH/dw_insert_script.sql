
USE [dataware]
GO

/*-- Dim_Branch
INSERT INTO Dim_Branch (Branch_ID, Location, BranchName, M_ID)
SELECT Branch_ID, Location, BranchName, M_ID
FROM [ITI Examination System].dbo.Branch;
GO*/

/*-- Dim_Certificate
INSERT INTO Dim_Certificate (Crtf_ID, Crtf_Name, Provider, Field, Crtf_URL)
SELECT Crtf_ID, Crtf_Name, Provider, Field, Crtf_URL
FROM [ITI Examination System].dbo.Certificate;
GO*/

/*-- Dim_Company
INSERT INTO Dim_Company (Company_ID, Company_Name, Scope)
SELECT Company_ID, Company_Name, Scope
FROM [ITI Examination System].dbo.Company;
GO*/

/*-- Dim_Course
INSERT INTO Dim_Course (Crs_ID, Crs_Desc, Crs_Name, Hours, Topic_ID)
SELECT Crs_ID, Crs_Desc, Crs_Name, Hours, Topic_ID
FROM [ITI Examination System].dbo.Course;
GO*/

/*-- Dim_Department
INSERT INTO Dim_Department (Dept_ID, Dept_Name)
SELECT Dept_ID, Dept_Name
FROM [ITI Examination System].dbo.Department;
GO*/

/*-- Dim_Exam
INSERT INTO Dim_Exam (Exam_ID, Exam_Type, [QTY_T/F], QTY_MCQ, Duration, Date, Ins_ID, Crs_ID)
SELECT Exam_ID, Exam_Type, [QTY_T/F], QTY_MCQ, Duration, Date, Ins_ID, Crs_ID
FROM [ITI Examination System].dbo.Exam;
GO*/

/*-- Dim_Freelance_Platform
INSERT INTO Dim_Freelance_Platform (Free_ID, FreelanceName)
SELECT Free_ID, FreelanceName
FROM [ITI Examination System].dbo.Freelance_Platform;
GO*/

/*-- Dim_Instructor
INSERT INTO Dim_Instructor (Ins_ID, SSN, Fname, Lname, Email, Marital_Status, City, Street, Gender, Bdate, PhoneNumbers, HiringDate, Salary, Dept_ID)
SELECT i.Ins_ID, p.SSN, p.Fname, p.Lname, p.Email, p.Marital_Status, p.City, p.Street, p.Gender, p.Bdate,
       STRING_AGG(ph.Phone, ', ') WITHIN GROUP (ORDER BY ph.Phone), i.HiringDate, i.Salary, i.Dept_ID
FROM [ITI Examination System].dbo.Instructor i
JOIN [ITI Examination System].dbo.Person p ON i.Ins_ID = p.P_ID
LEFT JOIN [ITI Examination System].dbo.Phone ph ON ph.P_ID = p.P_ID
GROUP BY i.Ins_ID, p.SSN, p.Fname, p.Lname, p.Email, p.Marital_Status, p.City, p.Street, p.Gender, p.Bdate, i.HiringDate, i.Salary, i.Dept_ID;
GO*/

/*-- Dim_Manager
INSERT INTO Dim_Manager (M_ID, SSN, Fname, Lname, Email, Marital_Status, City, Street, Gender, Bdate, PhoneNumbers, HiringDate, Salary)
SELECT m.M_ID, p.SSN, p.Fname, p.Lname, p.Email, p.Marital_Status, p.City, p.Street, p.Gender, p.Bdate,
       STRING_AGG(ph.Phone, ', ') WITHIN GROUP (ORDER BY ph.Phone), m.HiringDate, m.Salary
FROM [ITI Examination System].dbo.Manager m
JOIN [ITI Examination System].dbo.Person p ON m.M_ID = p.P_ID
LEFT JOIN [ITI Examination System].dbo.Phone ph ON ph.P_ID = p.P_ID
GROUP BY m.M_ID, p.SSN, p.Fname, p.Lname, p.Email, p.Marital_Status, p.City, p.Street, p.Gender, p.Bdate, m.HiringDate, m.Salary;
GO*/

-- Dim_Student
INSERT INTO Dim_Student (STD_ID, SSN, Fname, Lname, Email, Marital_Status, City, Street, Gender, Bdate, PhoneNumbers, Track_ID, Branch_ID, Intake_ID, MilitaryStatus, SM_URL)
SELECT s.STD_ID, p.SSN, p.Fname, p.Lname, p.Email, p.Marital_Status, p.City, p.Street, p.Gender, p.Bdate,
       STRING_AGG(ph.Phone, ', ') WITHIN GROUP (ORDER BY ph.Phone), s.Track_ID, s.Branch_ID, s.Intake_ID, s.MilitaryStatus, s.SM_URL
FROM [ITI Examination System].dbo.Student s
JOIN [ITI Examination System].dbo.Person p ON s.STD_ID = p.P_ID
LEFT JOIN [ITI Examination System].dbo.Phone ph ON ph.P_ID = p.P_ID
GROUP BY s.STD_ID, p.SSN, p.Fname, p.Lname, p.Email, p.Marital_Status, p.City, p.Street, p.Gender, p.Bdate, s.Track_ID, s.Branch_ID, s.Intake_ID, s.MilitaryStatus, s.SM_URL;
GO

/*-- Dim_Topic
INSERT INTO Dim_Topic (Topic_ID, Topic_Name)
SELECT Topic_ID, Topic_Name
FROM [ITI Examination System].dbo.Topic;
GO*/

/*-- Dim_Track
INSERT INTO Dim_Track (Track_ID, Track_Name, Dept_ID)
SELECT Track_ID, Track_Name, Dept_ID
FROM [ITI Examination System].dbo.Track;
GO*/

/*-- Dim_Questions
INSERT INTO Dim_Questions (Q_ID, QST_Content, Q_Type, Answer)
SELECT Q_ID, QST_Content, Q_Type, Answer
FROM [ITI Examination System].dbo.Questions;
GO*/

INSERT INTO Dim_Intake (Intake_ID, Start_Date, End_Date, Type)
SELECT Intake_ID, Start_Date, End_Date, Type
FROM [ITI Examination System].dbo.Intake;
GO


-- Fact_Std_Company
INSERT INTO Fact_Std_Company (SK_Company, SK_Student, Job_Role, SK_Time, Salary)
SELECT 
    dc.SK_Company, ds.SK_Student, sc.Job_Role, sc.Hiring_Date, sc.Salary
FROM [ITI Examination System].dbo.Std_Company sc
JOIN Dim_Company dc ON dc.Company_ID = sc.Company_ID
JOIN Dim_Student ds ON ds.STD_ID = sc.STD_ID
WHERE EXISTS (
    SELECT 1 FROM Dim_Time dt WHERE dt.Date = sc.Hiring_Date
);
GO

-- Fact_Std_Exam_Qst
INSERT INTO Fact_Std_Exam_Qst (SK_Exam, SK_Student, SK_Question, Std_Ans, Correct_Ans, Grade)
SELECT 
    de.SK_Exam, ds.SK_Student, dq.SK_Questions, seq.Std_Ans, seq.Correct_Ans, seq.Grade
FROM [ITI Examination System].dbo.Std_Exam_Qst seq
JOIN [ITI Examination System].dbo.Exam_Qst eq ON eq.ExamQst_ID = seq.ExamQst_ID
JOIN Dim_Exam de ON de.Exam_ID = eq.Exam_ID
JOIN Dim_Student ds ON ds.STD_ID = seq.STD_ID
JOIN Dim_Questions dq ON dq.Q_ID = eq.Q_ID;
GO

-- Fact_Std_Freelance
INSERT INTO Fact_Std_Freelance (SK_Freelance_Platform, SK_Student, Detail, SK_Time, Cost)
SELECT 
    df.SK_Freelance_Platform, ds.SK_Student, sf.Detail, sf.Date, sf.Cost
FROM [ITI Examination System].dbo.Std_Freelance sf
JOIN Dim_Student ds ON ds.STD_ID = sf.STD_ID
JOIN Dim_Freelance_Platform df ON df.Free_ID = sf.Free_ID
WHERE EXISTS (
    SELECT 1 FROM Dim_Time dt WHERE dt.Date = sf.Date
);
GO

-- Fact_Student_Crtf
INSERT INTO Fact_Student_Crtf (SK_Certificate, SK_Student, SK_Time)
SELECT 
    dc.SK_Certificate, ds.SK_Student, sc.Date
FROM [ITI Examination System].dbo.Student_Crtf sc
JOIN Dim_Certificate dc ON dc.Crtf_ID = sc.Crtf_ID
JOIN Dim_Student ds ON ds.STD_ID = sc.STD_ID
WHERE EXISTS (
    SELECT 1 FROM Dim_Time dt WHERE dt.Date = sc.Date
);
GO