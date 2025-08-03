CREATE TABLE [dbo].[Person] (
    [P_ID] INT IDENTITY(1,1) PRIMARY KEY,
    [SSN] BIGINT NOT NULL,
    [Fname] NVARCHAR(50) NOT NULL,
    [Lname] NVARCHAR(50) NOT NULL,
    [Email] NVARCHAR(50) NOT NULL,
    [Marital_Status] NVARCHAR(50) NOT NULL CHECK ([Marital_Status] IN ('Married', 'Single', 'Divorced')),
    [City] NVARCHAR(50) NOT NULL,
    [Street] NVARCHAR(50) NULL,
    [Gender] NVARCHAR(50) NOT NULL CHECK ([Gender] IN ('Male', 'Female')),
    [Bdate] DATE NOT NULL,
);
GO

CREATE TABLE [dbo].[Department] (
    [Dept_ID] INT IDENTITY(1,1) PRIMARY KEY,
    [Dept_Name] NVARCHAR(255) NOT NULL UNIQUE
);
GO

CREATE TABLE [dbo].[Branch] (
    [Branch_ID] INT IDENTITY(1,1) PRIMARY KEY,
    [Location] NVARCHAR(255) NOT NULL,
    [BranchName] NVARCHAR(255) NOT NULL UNIQUE,
	[M_ID] INT NOT NULL,
	FOREIGN KEY ([M_ID]) REFERENCES [dbo].[Manager]([M_ID])
);
GO

CREATE TABLE [dbo].[Track] (
    [Track_ID] INT IDENTITY(1,1) PRIMARY KEY,
    [Track_Name] NVARCHAR(255) NOT NULL UNIQUE,
    [Dept_ID] INT NOT NULL,
    FOREIGN KEY ([Dept_ID]) REFERENCES [dbo].[Department]([Dept_ID])
);
GO

CREATE TABLE [dbo].[Intake] (
    [Intake_ID] INT IDENTITY(1,1) PRIMARY KEY,
    [Start_Date] DATE NOT NULL,
    [End_Date] DATE NOT NULL,
    [Type] NVARCHAR(10) NOT NULL,
    CHECK ([End_Date] > [Start_Date])
);
GO

CREATE TABLE [dbo].[Student] (
    [STD_ID] INT PRIMARY KEY,
    [Track_ID] INT NOT NULL,
    [Branch_ID] INT NOT NULL,
    [Intake_ID] INT NOT NULL,
	[MilitaryStatus] NVARCHAR(50) NOT NULL CHECK ([MilitaryStatus] IN ('Completed', 'Exempted', 'Postponed')),
	[SM_URL] NVARCHAR(255),
    FOREIGN KEY ([STD_ID]) REFERENCES [dbo].[Person]([P_ID]) ,
    FOREIGN KEY ([Track_ID]) REFERENCES [dbo].[Track]([Track_ID]) ,
    FOREIGN KEY ([Branch_ID]) REFERENCES [dbo].[Branch]([Branch_ID]) ,
    FOREIGN KEY ([Intake_ID]) REFERENCES [dbo].[Intake]([Intake_ID])
);
GO

create table [dbo].[Instructor] (
	[Ins_ID] INT PRIMARY KEY,
	[HiringDate] Date NOT NULL,
	[Salary] INT NOT NULL,
	[Dept_ID] INT NOT NULL,
	FOREIGN KEY ([Dept_ID]) REFERENCES [dbo].[Department]([Dept_ID])
);
GO

CREATE TABLE [dbo].[Supervisor](
	[Dept_ID] [int] NOT NULL,
	[Ins_ID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	CHECK ([EndDate] > [StartDate]),
 CONSTRAINT [PK_Supervisor] PRIMARY KEY CLUSTERED 
(
	[Dept_ID] ASC,
	[Ins_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

create table [dbo].[Exam] (
	[Exam_ID] INT PRIMARY KEY,
	[Exam_Type] NVARCHAR(50) NOT NULL CHECK ([Exam_Type] IN ('Final', 'Mid-Term', 'Quiz')),
	[QTY_T/F] INT NOT NULL,
	[QTY_MCQ] INT NOT NULL,
	[Duration] INT NOT NULL,
	[Date] Date NOT NULL,
	[Ins_ID] INT NOT NULL,
	[Crs_ID] INT NOT NULL,
	FOREIGN KEY ([Ins_ID]) REFERENCES [dbo].[Instructor]([Ins_ID]),
	FOREIGN KEY ([Crs_ID]) REFERENCES [dbo].[Course]([Crs_ID])
);
GO

Create Table [dbo].[Course] (
	[Crs_ID] INT Primary Key,
	[Crs_Desc] NVARCHAR(255) NOT NULL,
	[Crs_Name] NVARCHAR(255) NOT NULL,
	[Hours] INT NOT NULL,
	[Topic_ID] INT NOT NULL,
	FOREIGN KEY ([Topic_ID]) REFERENCES [dbo].[Topic]([Topic_ID])
);
GO

create table [dbo].[Topic] (
	[Topic_ID] INT Primary Key,
	[Topic_Name] NVARCHAR(255) NOT NULL
);
GO

create table [dbo].[Questions] (
	[Q_ID] INT Primary Key,
	[QST_Content] NVARCHAR(255) NOT NULL,
	[Q_Type] NVARCHAR(50) NOT NULL CHECK ([Q_Type] IN ('T/F', 'MCQ')),
	[Answer] NVARCHAR(255) NOT NULL,
);
GO

CREATE TABLE [dbo].[Exam_Qst] (
    [ExamQst_ID] INT IDENTITY(1,1) PRIMARY KEY,
	[Exam_ID] INT NOT NULL,
    [Q_ID] INT NOT NULL,
    FOREIGN KEY ([Q_ID]) REFERENCES [dbo].[Questions]([Q_ID]),
    FOREIGN KEY ([Exam_ID]) REFERENCES [dbo].[Exam]([Exam_ID]),
    CONSTRAINT UQ_Exam_Questions UNIQUE ([Q_ID], [Exam_ID])
);
GO

create table [dbo].[Std_Exam_Qst] (
	[STD_ID] INT NOT NULL,
	[ExamQst_ID] INT NOT NULL,
	[Std_Ans] NVARCHAR(255),
	[Correct_Ans] BIT,
	[Grade] INT NOT NULL,
	PRIMARY KEY ([ExamQst_ID], [STD_ID]),
	FOREIGN KEY ([ExamQst_ID]) REFERENCES Exam_Qst([ExamQst_ID]),
	FOREIGN KEY ([STD_ID]) REFERENCES Student([STD_ID])
);
GO

CREATE TABLE [Intake_Brch_Trk] (
  [Track_ID] INT,
  [Branch_ID] INT,
  [Intake_ID] INT,
  PRIMARY KEY ([Track_ID], [Branch_ID], [Intake_ID]),
  FOREIGN KEY ([Track_ID]) REFERENCES [Track]([Track_ID]),
  FOREIGN KEY ([Branch_ID]) REFERENCES [Branch]([Branch_ID]),
  FOREIGN KEY ([Intake_ID]) REFERENCES [Intake]([Intake_ID])
);
GO

CREATE TABLE [dbo].[Phone] (
    [P_ID] INT NOT NULL,
    [Phone] Varchar(15) NOT NULL,
    PRIMARY KEY ([P_ID], [Phone]),
    FOREIGN KEY ([P_ID]) REFERENCES [dbo].[Person]([P_ID])
);
GO

CREATE TABLE [dbo].[Company] (
    [Company_ID] INT IDENTITY(1,1) PRIMARY KEY,
    [Company_Name] NVARCHAR(255) NOT NULL UNIQUE,
    [Scope] NVARCHAR(255) NULL CHECK ([Scope] IN ('Local', 'International'))
);
GO

CREATE TABLE [dbo].[Freelance_Platform] (
    [Free_ID] INT IDENTITY(1,1) PRIMARY KEY,
    [FreelanceName] NVARCHAR(255) NOT NULL UNIQUE
);
GO

CREATE TABLE [dbo].[Certificate] (
    [Crtf_ID] INT IDENTITY(1,1) PRIMARY KEY,
    [Crtf_Name] NVARCHAR(255) NOT NULL UNIQUE,
    [Provider] NVARCHAR(255) NOT NULL,
    [Field] NVARCHAR(255) NULL,
	[Crtf_URL] NVARCHAR(255) NULL
);
GO

CREATE TABLE [Std_Company] (
  [Company_ID] INT,
  [STD_ID] INT,
  [Job_Role] NVARCHAR(255) NOT NULL,
  [Hiring_Date] DATE NOT NULL,
  [Salary] INT CHECK([Salary] > 0),
  PRIMARY KEY ([Company_ID], [STD_ID]),
  FOREIGN KEY ([Company_ID]) REFERENCES [Company]([Company_ID]),
  FOREIGN KEY ([STD_ID]) REFERENCES [Student]([STD_ID])
);
GO

CREATE TABLE [Std_Freelance] (
  [Free_ID] INT,
  [STD_ID] INT,
  [Detail] NVARCHAR(255) NOT NULL,
  [Date] DATE NOT NULL,
  [Cost] INT NOT NULL CHECK([Cost] > 0),
  PRIMARY KEY ([Free_ID], [STD_ID]),
  FOREIGN KEY ([Free_ID]) REFERENCES [Freelance_Platform]([Free_ID]),
  FOREIGN KEY ([STD_ID]) REFERENCES [Student]([STD_ID])
);
GO

CREATE TABLE [Student_Crtf] (
  [Crtf_ID] INT,
  [STD_ID] INT,
  [Date] DATE NOT NULL,
  PRIMARY KEY ([Crtf_ID], [STD_ID]),
  FOREIGN KEY ([Crtf_ID]) REFERENCES [Certificate]([Crtf_ID]),
  FOREIGN KEY ([STD_ID]) REFERENCES [Student]([STD_ID])
);
GO