/*===============================================================
 ✅ DATA WAREHOUSE STRUCTURE: Dimensions, Facts, and Relationships
===============================================================*/

-- ===================================
-- 🧱 DIMENSION TABLES
-- ===================================

-- Time Dimension
CREATE TABLE [dbo].[Dim_Time] (
    [Date] DATE PRIMARY KEY,
    [Year] INT,
    [Month] INT,
    [Quarter] INT
);
GO

-- Student
CREATE TABLE [dbo].[Dim_Student] (
    [SK_Student] INT IDENTITY(1,1) PRIMARY KEY,
    [STD_ID] INT,
    [SSN] BIGINT NOT NULL,
    [Fname] NVARCHAR(50) NOT NULL,
    [Lname] NVARCHAR(50) NOT NULL,
    [Email] NVARCHAR(50) NOT NULL,
    [Marital_Status] NVARCHAR(50) NOT NULL CHECK ([Marital_Status] IN ('Married', 'Single', 'Divorced')),
    [City] NVARCHAR(50) NOT NULL,
    [Street] NVARCHAR(50),
    [Gender] NVARCHAR(50) NOT NULL CHECK ([Gender] IN ('Male', 'Female')),
    [Bdate] DATE NOT NULL,
    [PhoneNumbers] NVARCHAR(MAX) NOT NULL,
    [Track_ID] INT,
    [Branch_ID] INT,
    [Intake_ID] INT,
    [MilitaryStatus] NVARCHAR(50) CHECK ([MilitaryStatus] IN ('Completed', 'Exempted', 'Postponed')),
    [SM_URL] NVARCHAR(255)
);
GO

-- Instructor
create TABLE [dbo].[Dim_Instructor] (
    [SK_Instructor] INT IDENTITY(1,1) PRIMARY KEY,
    [Ins_ID] INT  ,
    [SSN] BIGINT NOT NULL,
    [Fname] NVARCHAR(50) NOT NULL,
    [Lname] NVARCHAR(50) NOT NULL,
    [Email] NVARCHAR(50) NOT NULL,
    [Marital_Status] NVARCHAR(50) NOT NULL CHECK ([Marital_Status] IN ('Married', 'Single', 'Divorced')),
    [City] NVARCHAR(50) NOT NULL,
    [Street] NVARCHAR(50),
    [Gender] NVARCHAR(50) NOT NULL CHECK ([Gender] IN ('Male', 'Female')),
    [Bdate] DATE NOT NULL,
    [PhoneNumbers] NVARCHAR(MAX) NOT NULL,
    [HiringDate] DATE,
    [Salary] INT,
    [Dept_ID] INT 
);
GO

-- Manager
create TABLE [dbo].[Dim_Manager] (
    [SK_Manager] INT IDENTITY(1,1) PRIMARY KEY,
    [M_ID] INT ,
    [SSN] BIGINT NOT NULL,
    [Fname] NVARCHAR(50) NOT NULL,
    [Lname] NVARCHAR(50) NOT NULL,
    [Email] NVARCHAR(50) NOT NULL,
    [Marital_Status] NVARCHAR(50) NOT NULL CHECK ([Marital_Status] IN ('Married', 'Single', 'Divorced')),
    [City] NVARCHAR(50) NOT NULL,
    [Street] NVARCHAR(50),
    [Gender] NVARCHAR(50) NOT NULL CHECK ([Gender] IN ('Male', 'Female')),
    [Bdate] DATE NOT NULL,
    [PhoneNumbers] NVARCHAR(MAX) NOT NULL,
    [HiringDate] DATE,
    [Salary] INT
);
GO

-- Department
CREATE TABLE [dbo].[Dim_Department] (
    [SK_Department] INT IDENTITY(1,1) PRIMARY KEY,
    [Dept_ID] INT UNIQUE,
    [Dept_Name] NVARCHAR(255) NOT NULL UNIQUE,
    [Supervisor_ID] INT
);
GO

-- Track
CREATE TABLE [dbo].[Dim_Track] (
    [SK_Track] INT IDENTITY(1,1) PRIMARY KEY,
    [Track_ID] INT UNIQUE,
    [Track_Name] NVARCHAR(255),
    [Dept_ID] INT
);
GO

-- Course
CREATE TABLE [dbo].[Dim_Course] (
    [SK_Course] INT IDENTITY(1,1) PRIMARY KEY,
    [Crs_ID] INT,
    [Crs_Desc] NVARCHAR(255),
    [Crs_Name] NVARCHAR(255),
    [Hours] INT,
    [Topic_ID] INT
);
GO

-- Topic
CREATE TABLE [dbo].[Dim_Topic] (
    [SK_Topic] INT IDENTITY(1,1) PRIMARY KEY,
    [Topic_ID] INT UNIQUE,
    [Topic_Name] NVARCHAR(255)
);
GO

-- Intake
CREATE TABLE [dbo].[Dim_Intake] (
    [SK_Intake] INT IDENTITY(1,1) PRIMARY KEY,
    [Intake_ID] INT UNIQUE,
    [Start_Date] DATE,
    [End_Date] DATE,
    [Type] NVARCHAR(10)
);
GO

-- Branch
CREATE TABLE [dbo].[Dim_Branch] (
    [SK_Branch] INT IDENTITY(1,1) PRIMARY KEY,
    [Branch_ID] INT UNIQUE,
    [Location] NVARCHAR(255),
    [BranchName] NVARCHAR(255),
    [M_ID] INT
);
GO

-- Certificate
CREATE TABLE [dbo].[Dim_Certificate] (
    [SK_Certificate] INT IDENTITY(1,1) PRIMARY KEY,
    [Crtf_ID] INT,
    [Crtf_Name] NVARCHAR(255),
    [Provider] NVARCHAR(255),
    [Field] NVARCHAR(255),
    [Crtf_URL] NVARCHAR(255)
);
GO

-- Company
CREATE TABLE [dbo].[Dim_Company] (
    [SK_Company] INT IDENTITY(1,1) PRIMARY KEY,
    [Company_ID] INT,
    [Company_Name] NVARCHAR(255),
    [Scope] NVARCHAR(255)
);
GO

-- Freelance Platform
CREATE TABLE [dbo].[Dim_Freelance_Platform] (
    [SK_Freelance_Platform] INT IDENTITY(1,1) PRIMARY KEY,
    [Free_ID] INT,
    [FreelanceName] NVARCHAR(255)
);
GO

-- Questions
CREATE TABLE [dbo].[Dim_Questions] (
    [SK_Questions] INT IDENTITY(1,1) PRIMARY KEY,
    [Q_ID] INT,
    [QST_Content] NVARCHAR(255),
    [Q_Type] NVARCHAR(50),
    [Answer] NVARCHAR(255)
);
GO

-- Exam
CREATE TABLE [dbo].[Dim_Exam] (
    [SK_Exam] INT IDENTITY(1,1) PRIMARY KEY,
    [Exam_ID] INT,
    [Exam_Type] NVARCHAR(50),
    [QTY_T/F] INT,
    [QTY_MCQ] INT,
    [Duration] INT,
    [Date] DATE,
    [Ins_ID] INT,
    [Crs_ID] INT
);
GO

-- ===================================
-- 📊 FACT TABLES
-- ===================================

-- Student Exam Question
CREATE TABLE [dbo].[Fact_Std_Exam_Qst] (
    [SK_Std_Exam_Qst] INT IDENTITY(1,1) PRIMARY KEY,
    [SK_Exam] INT,
    [SK_Student] INT,
    [SK_Question] INT,
    [Std_Ans] NVARCHAR(255),
    [Correct_Ans] NVARCHAR(250),
    [Grade] INT
);
GO

-- Student Freelance
CREATE TABLE [dbo].[Fact_Std_Freelance] (
    [SK_Std_Freelance] INT IDENTITY(1,1) PRIMARY KEY,
    [SK_Freelance_Platform] INT,
    [SK_Student] INT,
    [Detail] NVARCHAR(255),
    [SK_Time] DATE,
    [Cost] INT
);
GO

-- Student Employment
CREATE TABLE [dbo].[Fact_Std_Company] (
    [SK_Std_Company] INT IDENTITY(1,1) PRIMARY KEY,
    [SK_Company] INT,
    [SK_Student] INT,
    [Job_Role] NVARCHAR(255),
    [SK_Time] DATE,
    [Salary] INT
);
GO

-- Student Certificate
CREATE TABLE [dbo].[Fact_Student_Crtf] (
    [SK_Student_Crtf] INT IDENTITY(1,1) PRIMARY KEY,
    [SK_Certificate] INT,
    [SK_Student] INT,
    [SK_Time] DATE
);
GO

-- ===================================
-- 🔗 RELATIONSHIPS (FOREIGN KEYS)
-- ===================================

-- Dimensions FK
ALTER TABLE [dbo].[Dim_Student]
  ADD FOREIGN KEY (Track_ID) REFERENCES Dim_Track(Track_ID),
      FOREIGN KEY (Branch_ID) REFERENCES Dim_Branch(Branch_ID),
      FOREIGN KEY (Intake_ID) REFERENCES Dim_Intake(Intake_ID);

ALTER TABLE [dbo].[Dim_Track]
  ADD FOREIGN KEY (Dept_ID) REFERENCES Dim_Department(Dept_ID);

ALTER TABLE [dbo].[Dim_Instructor]
  ADD FOREIGN KEY (Dept_ID) REFERENCES Dim_Department(Dept_ID);

ALTER TABLE [dbo].[Dim_Department]
  ADD FOREIGN KEY (Supervisor_ID) REFERENCES Dim_Instructor(Ins_ID);

ALTER TABLE [dbo].[Dim_Course]
  ADD FOREIGN KEY (Topic_ID) REFERENCES Dim_Topic(Topic_ID);

ALTER TABLE [dbo].[Dim_Branch]
  ADD FOREIGN KEY (M_ID) REFERENCES Dim_Manager(M_ID);

-- Facts FK
ALTER TABLE [dbo].[Fact_Std_Exam_Qst]
  ADD FOREIGN KEY (SK_Student) REFERENCES Dim_Student(SK_Student),
      FOREIGN KEY (SK_Exam) REFERENCES Dim_Exam(SK_Exam),
      FOREIGN KEY (SK_Question) REFERENCES Dim_Questions(SK_Questions);

ALTER TABLE [dbo].[Fact_Std_Freelance]
  ADD FOREIGN KEY (SK_Student) REFERENCES Dim_Student(SK_Student),
      FOREIGN KEY (SK_Freelance_Platform) REFERENCES Dim_Freelance_Platform(SK_Freelance_Platform),
      FOREIGN KEY (SK_Time) REFERENCES Dim_Time([Date]);

ALTER TABLE [dbo].[Fact_Std_Company]
  ADD FOREIGN KEY (SK_Student) REFERENCES Dim_Student(SK_Student),
      FOREIGN KEY (SK_Company) REFERENCES Dim_Company(SK_Company),
      FOREIGN KEY (SK_Time) REFERENCES Dim_Time([Date]);

ALTER TABLE [dbo].[Fact_Student_Crtf]
  ADD FOREIGN KEY (SK_Student) REFERENCES Dim_Student(SK_Student),
      FOREIGN KEY (SK_Certificate) REFERENCES Dim_Certificate(SK_Certificate),
      FOREIGN KEY (SK_Time) REFERENCES Dim_Time([Date]);
GO
