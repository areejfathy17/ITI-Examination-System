INSERT INTO [dbo].[Department] (Dept_Name) VALUES
('Information Technology'),
('Software Engineering'),
('Data Science'),
('Cloud Computing'),
('Cyber Security'),
('Digital Marketing'),
('Quality Control'),
('Human Resources'),
('Finance'),
('Operations');
INSERT INTO [dbo].[Department] (Dept_Name) VALUES
('Artificial Intelligence'),
('Network Administration'),
('Game Development'),
('UI/UX Design'),
('Business Analysis'),
('Technical Support'),
('Research & Development'),
('Project Management'),
('Database Administration'),
('System Integration');

INSERT INTO [dbo].[Topic] (Topic_ID, Topic_Name) VALUES
(1, 'Programming Fundamentals'),
(2, 'Web Development Basics'),
(3, 'Database Management'),
(4, 'Operating Systems'),
(5, 'Network Security'),
(6, 'Cloud Platforms'),
(7, 'Machine Learning'),
(8, 'Data Analysis'),
(9, 'Software Testing'),
(10, 'Project Management Methodologies');
INSERT INTO [dbo].[Topic] (Topic_ID, Topic_Name) VALUES
(11, 'Algorithms & Data Structures'),
(12, 'Mobile Application Development'),
(13, 'Cybersecurity Principles'),
(14, 'DevOps Practices'),
(15, 'Big Data Technologies'),
(16, 'Artificial Intelligence Concepts'),
(17, 'Frontend Frameworks'),
(18, 'Backend Development'),
(19, 'UI/UX Principles'),
(20, 'Internet of Things (IoT)');

INSERT INTO [dbo].[Intake] (Start_Date, End_Date, Type) VALUES
('2023-09-01', '2024-03-01', 'Fall'),
('2024-02-15', '2024-08-15', 'Spring'),
('2024-09-01', '2025-03-01', 'Fall'),
('2025-02-15', '2025-08-15', 'Spring'),
('2023-06-01', '2023-08-30', 'Summer'),
('2024-06-01', '2024-08-30', 'Summer'),
('2025-01-01', '2025-06-30', 'Winter'),
('2024-01-01', '2024-06-30', 'Winter'),
('2023-03-10', '2023-09-10', 'Autumn'),
('2024-03-10', '2024-09-10', 'Autumn');



INSERT INTO [dbo].[Company] (Company_Name, Scope) VALUES
('Vodafone Egypt', 'International'),
('Etisalat Misr', 'Local'),
('Orange Egypt', 'International'),
('IBM Egypt', 'International'),
('Raya Contact Center', 'Local'),
('Valeo Egypt', 'International'),
('ITWorx', 'Local'),
('Microsoft Egypt', 'International'),
('Majid Al Futtaim', 'International'),
('Fawry', 'Local');
INSERT INTO [dbo].[Company] (Company_Name, Scope) VALUES
('Symphony Solutions', 'International'),
('DXC Technology', 'International'),
('EG Gate', 'Local'),
('Xceed', 'International'),
('Teleperformance Egypt', 'International'),
('Secom', 'Local'),
('MobiServe', 'Local'),
('Nokia Siemens Networks', 'International'),
('Giza Systems', 'Local'),
('Link Development', 'Local');


INSERT INTO [dbo].[Freelance_Platform] (FreelanceName) VALUES
('Upwork'),
('Fiverr'),
('Freelancer'),
('Guru'),
('Toptal'),
('PeoplePerHour'),
('Behance'),
('Dribbble'),
('FlexJobs'),
('SolidGigs');
INSERT INTO [dbo].[Freelance_Platform] (FreelanceName) VALUES
('Legiit'),
('SEOClerks'),
('Truelancer'),
('Remote.co'),
('We Work Remotely'),
('Hubstaff Talent'),
('CloudPeeps'),
('Contently'),
('Skyword'),
('Aquent');



INSERT INTO [dbo].[Certificate] (Crtf_Name, Provider, Field, Crtf_URL) VALUES
('AWS Certified Solutions Architect – Associate', 'Amazon Web Services', 'Cloud Computing', 'https://aws.amazon.com/certification/'),
('Microsoft Certified: Azure Developer Associate', 'Microsoft', 'Cloud Computing', 'https://learn.microsoft.com/en-us/certifications/azure-developer/'),
('Google Certified Professional Data Engineer', 'Google', 'Data Engineering', 'https://cloud.google.com/certification/data-engineer'),
('Certified ScrumMaster (CSM)', 'Scrum Alliance', 'Agile Project Management', 'https://www.scrumalliance.org/certifications/practitioners/csm-certification'),
('CompTIA Security+', 'CompTIA', 'Cyber Security', 'https://www.comptia.org/certifications/security'),
('PMP: Project Management Professional', 'Project Management Institute (PMI)', 'Project Management', 'https://www.pmi.org/certifications/project-management-professional-pmp'),
('Cisco Certified Network Associate (CCNA)', 'Cisco', 'Networking', 'https://www.cisco.com/c/en/us/training-events/training-certifications/certifications/associate/ccna.html'),
('Certified Ethical Hacker (CEH)', 'EC-Council', 'Cyber Security', 'https://www.eccouncil.org/programs/certified-ethical-hacker-ceh/'),
('IBM Data Analyst Professional Certificate', 'IBM', 'Data Analysis', 'https://www.coursera.org/professional-certificates/ibm-data-analyst'),
('Salesforce Administrator Certification', 'Salesforce', 'CRM', 'https://trailhead.salesforce.com/credentials/administrator');
INSERT INTO [dbo].[Certificate] (Crtf_Name, Provider, Field, Crtf_URL) VALUES
('Oracle Certified Professional, Java SE 11 Developer', 'Oracle', 'Software Development', 'https://education.oracle.com/java-se-11-developer-ocp/pexam_1Z0-819'),
('Certified Kubernetes Administrator (CKA)', 'Linux Foundation', 'Cloud Native', 'https://training.linuxfoundation.org/certification/certified-kubernetes-administrator-cka/'),
('Certified Information Systems Security Professional (CISSP)', 'ISC2', 'Cyber Security', 'https://www.isc2.org/Certifications/CISSP'),
('PRINCE2 Foundation', 'AXELOS', 'Project Management', 'https://www.axelos.com/certifications/prince2/prince2-foundation'),
('Certified Public Accountant (CPA)', 'AICPA', 'Finance', 'https://www.aicpa.org/career/licensing/cpa-exam.html'),
('Google Ads Search Certification', 'Google', 'Digital Marketing', 'https://skillshop.withgoogle.com/certification/google-ads-search'),
('HubSpot Inbound Marketing', 'HubSpot', 'Digital Marketing', 'https://academy.hubspot.com/courses/inbound-marketing'),
('Tableau Desktop Specialist', 'Tableau', 'Data Visualization', 'https://www.tableau.com/learn/certification/desktop-specialist'),
('ITIL 4 Foundation', 'AXELOS', 'IT Service Management', 'https://www.axelos.com/certifications/itil-certifications/itil-4-foundation'),
('Professional Scrum Product Owner (PSPO I)', 'Scrum.org', 'Agile Product Management', 'https://www.scrum.org/courses/professional-scrum-product-owner-i-training');




INSERT INTO [dbo].[Person] (SSN, Fname, Lname, Email, Marital_Status, City, Street, Gender, Bdate) VALUES
(12345678901234, 'Ahmed', 'Ali', 'ahmed.ali@example.com', 'Single', 'Cairo', 'Nasr City St', 'Male', '1990-05-15'),
(23456789012345, 'Fatma', 'Mohamed', 'fatma.mohamed@example.com', 'Married', 'Giza', 'El Haram St', 'Female', '1988-11-22'),
(34567890123456, 'Mohamed', 'Hassan', 'mohamed.hassan@example.com', 'Single', 'Alexandria', 'Corniche St', 'Male', '1995-03-01'),
(45678901234567, 'Sara', 'Ibrahim', 'sara.ibrahim@example.com', 'Divorced', 'Mansoura', 'Gomhoria St', 'Female', '1985-07-09'),
(56789012345678, 'Khaled', 'Mahmoud', 'khaled.mahmoud@example.com', 'Married', 'Luxor', 'Nile St', 'Male', '1992-01-20'),
(67890123456789, 'Nour', 'El-Din', 'nour.eldin@example.com', 'Single', 'Aswan', 'Market St', 'Male', '1998-09-03'),
(78901234567890, 'Layla', 'Abdullah', 'layla.abdullah@example.com', 'Married', 'Suez', 'Port St', 'Female', '1980-04-28'),
(89012345678901, 'Omar', 'Kamal', 'omar.kamal@example.com', 'Single', 'Assiut', 'El Thawra St', 'Male', '1993-12-11'),
(90123456789012, 'Hala', 'Farouk', 'hala.farouk@example.com', 'Married', 'Tanta', 'El Bahr St', 'Female', '1975-02-07'),
(12345098765432, 'Youssef', 'Adel', 'youssef.adel@example.com', 'Single', 'Fayoum', 'Lake Qarun St', 'Male', '1996-08-25');
-- Adding more rows for Person
INSERT INTO [dbo].[Person] (SSN, Fname, Lname, Email, Marital_Status, City, Street, Gender, Bdate) VALUES
(11223344556677, 'Aisha', 'Mostafa', 'aisha.mostafa@example.com', 'Single', 'Cairo', 'Zamalek St', 'Female', '1999-01-01'),
(22334455667788, 'Mina', 'Naguib', 'mina.naguib@example.com', 'Married', 'Giza', 'Mohandessin St', 'Male', '1987-06-20'),
(33445566778899, 'Zainab', 'Hussein', 'zainab.hussein@example.com', 'Single', 'Alexandria', 'Montazah St', 'Female', '2000-03-10'),
(44556677889900, 'Tarek', 'Amer', 'tarek.amer@example.com', 'Divorced', 'Cairo', 'Maadi St', 'Male', '1982-11-05'),
(55667788990011, 'Salma', 'Wael', 'salma.wael@example.com', 'Married', 'Giza', 'Dokki St', 'Female', '1991-09-18'),
(66778899001122, 'Amr', 'Said', 'amr.said@example.com', 'Single', 'Cairo', 'Heliopolis St', 'Male', '1997-07-07'),
(77889900112233, 'Dina', 'Fouad', 'dina.fouad@example.com', 'Married', 'Alexandria', 'Smouha St', 'Female', '1984-02-14'),
(88990011223344, 'Karim', 'Essam', 'karim.essam@example.com', 'Single', 'Suez', 'Faisal St', 'Male', '1994-04-30'),
(99001122334455, 'Rana', 'Magdy', 'rana.magdy@example.com', 'Divorced', 'Mansoura', 'Talkha St', 'Female', '1979-10-23'),
(10112233445566, 'Adam', 'Sherif', 'adam.sherif@example.com', 'Single', 'Cairo', 'Rehab City', 'Male', '1996-12-01'),
(11223344556670, 'Nada', 'Hany', 'nada.hany@example.com', 'Married', 'Giza', '6 October City', 'Female', '1989-03-25'),
(22334455667780, 'Sameh', 'Bahaa', 'sameh.bahaa@example.com', 'Single', 'Alexandria', 'Mandara', 'Male', '1998-05-12'),
(33445566778890, 'Yara', 'Ashraf', 'yara.ashraf@example.com', 'Divorced', 'Cairo', 'New Cairo', 'Female', '1983-08-08'),
(44556677889900, 'Hani', 'Adel', 'hani.adel@example.com', 'Married', 'Giza', 'Zayed City', 'Male', '1990-11-19'),
(55667788990010, 'Lamia', 'Gamal', 'lamia.gamal@example.com', 'Single', 'Cairo', 'Mokattam', 'Female', '1995-02-28'),
(66778899001120, 'Mostafa', 'Wael', 'mostafa.wael@example.com', 'Married', 'Alexandria', 'Miami', 'Male', '1986-07-03'),
(77889900112230, 'Menna', 'Khaled', 'menna.khaled@example.com', 'Single', 'Suez', 'Ataka', 'Female', '1999-09-15'),
(88990011223340, 'Seif', 'Ahmed', 'seif.ahmed@example.com', 'Divorced', 'Mansoura', 'Sherbin', 'Male', '1981-04-01'),
(99001122334450, 'Mai', 'Ali', 'mai.ali@example.com', 'Married', 'Tanta', 'Kafr El Zayat', 'Female', '1977-06-09'),
(10112233445560, 'Fady', 'Magdy', 'fady.magdy@example.com', 'Single', 'Fayoum', 'Sinnuris', 'Male', '1997-01-14');
-- Continuing with more Person data to reach ~200 rows
DECLARE @i INT = 31;
DECLARE @ssn_base BIGINT = 10000000000000;
DECLARE @fname NVARCHAR(50);
DECLARE @lname NVARCHAR(50);
DECLARE @email NVARCHAR(50);
DECLARE @marital_status NVARCHAR(50);
DECLARE @city NVARCHAR(50);
DECLARE @street NVARCHAR(50);
DECLARE @gender NVARCHAR(50);
DECLARE @bdate DATE;

WHILE @i <= 200
BEGIN
    SET @fname = CASE WHEN @i % 2 = 0 THEN 'MaleName' + CAST(@i AS NVARCHAR) ELSE 'FemaleName' + CAST(@i AS NVARCHAR) END;
    SET @lname = 'Surname' + CAST(@i AS NVARCHAR);
    SET @email = LOWER(@fname) + '.' + LOWER(@lname) + '@example.com';
    SET @marital_status = CASE WHEN @i % 3 = 0 THEN 'Married' WHEN @i % 3 = 1 THEN 'Single' ELSE 'Divorced' END;
    SET @city = CASE @i % 5
        WHEN 0 THEN 'Cairo'
        WHEN 1 THEN 'Giza'
        WHEN 2 THEN 'Alexandria'
        WHEN 3 THEN 'Mansoura'
        ELSE 'Suez'
    END;
    SET @street = @city + ' St ' + CAST(@i AS NVARCHAR);
    SET @gender = CASE WHEN @i % 2 = 0 THEN 'Male' ELSE 'Female' END;
    SET @bdate = DATEADD(day, -(@i * 100), GETDATE()); -- Roughly spread out birth dates
    
    INSERT INTO [dbo].[Person] (SSN, Fname, Lname, Email, Marital_Status, City, Street, Gender, Bdate) VALUES
    (@ssn_base + @i, @fname, @lname, @email, @marital_status, @city, @street, @gender, @bdate);

    SET @i = @i + 1;
END;


INSERT INTO [dbo].[Phone] (P_ID, Phone) VALUES
(1, '01001234567'),
(2, '01112345678'),
(3, '01223456789'),
(4, '01556789012'),
(5, '01098765432'),
(6, '01123456789'),
(7, '01234567890'),
(8, '01012345670'),
(9, '01109876540'),
(10, '01210987650');
-- Adding more phone numbers, ensuring unique (P_ID, Phone) pairs
DECLARE @p_id INT = 1;
DECLARE @phone_num_base BIGINT = 01000000000;

WHILE @p_id <= 200
BEGIN
    INSERT INTO [dbo].[Phone] (P_ID, Phone) VALUES
    (@p_id, CAST(@phone_num_base + @p_id AS VARCHAR(15)));
    
    -- Add a second phone number for some persons to show multiple phones
    IF @p_id % 5 = 0
    BEGIN
        INSERT INTO [dbo].[Phone] (P_ID, Phone) VALUES
        (@p_id, CAST(@phone_num_base + 1000000 + @p_id AS VARCHAR(15)));
    END;
    SET @p_id = @p_id + 1;
END;



INSERT INTO [dbo].[User] (AccountID, Role, UserName, Password) VALUES
(1, 'Student', 'ahmed.ali.std', 'pass123'),
(2, 'Student', 'fatma.mohamed.std', 'pass456'),
(3, 'Instructor', 'dr.mohamed.hassan.ins', 'ins_pass1'),
(4, 'Manager', 'sara.ibrahim.mgr', 'mgr_pass1'),
(5, 'Student', 'khaled.mahmoud.std', 'pass789'),
(6, 'Student', 'nour.eldin.std', 'pass101'),
(7, 'Instructor', 'layla.abdullah.ins', 'ins_pass2'),
(8, 'Student', 'omar.kamal.std', 'pass112'),
(9, 'Manager', 'hala.farouk.mgr', 'mgr_pass2'),
(10, 'Student', 'youssef.adel.std', 'pass131');
-- Adding more user accounts, linking to Person P_IDs
DECLARE @p_id_user INT = 11;
DECLARE @account_id_base INT = 10;
DECLARE @username_prefix NVARCHAR(50);
DECLARE @role NVARCHAR(50);

WHILE @p_id_user <= 200
BEGIN
    SET @account_id_base = @account_id_base + 1;
    SELECT @username_prefix = LOWER(Fname) + '.' + LOWER(Lname) FROM [dbo].[Person] WHERE P_ID = @p_id_user;
    
    SET @role = CASE WHEN @p_id_user % 7 = 0 THEN 'Manager' WHEN @p_id_user % 3 = 0 THEN 'Instructor' ELSE 'Student' END;
    
    INSERT INTO [dbo].[User] (AccountID, Role, UserName, Password) VALUES
    (@account_id_base, @role, @username_prefix + '.' + LOWER(SUBSTRING(@role, 1, 3)), 'password' + CAST(@account_id_base AS NVARCHAR));
    
    SET @p_id_user = @p_id_user + 1;
END;



INSERT INTO [dbo].[User_Person] (P_ID, AccountID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
-- Link the rest of the generated persons to user accounts
DECLARE @p_id_up INT = 11;
DECLARE @account_id_up INT = 11;

WHILE @p_id_up <= 200
BEGIN
    INSERT INTO [dbo].[User_Person] (P_ID, AccountID) VALUES
    (@p_id_up, @account_id_up);
    
    SET @p_id_up = @p_id_up + 1;
    SET @account_id_up = @account_id_up + 1;
END;



INSERT INTO [dbo].[Manager] (M_ID, HiringDate, Salary) VALUES
(4, '2020-01-01', 15000),
(9, '2019-06-10', 16000);
-- Adding more managers, ensure M_ID exists in Person
DECLARE @m_id_val INT;
DECLARE @hiring_date DATE;
DECLARE @salary INT;
DECLARE @person_cursor CURSOR;
DECLARE @bdate DATE; -- Declare @bdate here

SET @person_cursor = CURSOR FOR
SELECT P_ID, Bdate FROM [dbo].[Person] WHERE P_ID IN (SELECT AccountID FROM [dbo].[User] WHERE Role = 'Manager');

OPEN @person_cursor;
FETCH NEXT FROM @person_cursor INTO @m_id_val, @bdate;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @hiring_date = DATEADD(year, 5, @bdate); -- Hiring date 5 years after birthdate (arbitrary)
    SET @salary = 15000 + (ABS(CHECKSUM(NEWID())) % 5000); -- Random salary between 15000 and 20000
    INSERT INTO [dbo].[Manager] (M_ID, HiringDate, Salary) VALUES
    (@m_id_val, @hiring_date, @salary);
    
    FETCH NEXT FROM @person_cursor INTO @m_id_val, @bdate;
END;
CLOSE @person_cursor;
DEALLOCATE @person_cursor;


INSERT INTO [dbo].[Branch] (Location, BranchName, M_ID) VALUES
('Nasr City, Cairo', 'ITI Nasr City', 4),
('Smart Village, Giza', 'ITI Smart Village', 9),
('Alexandria', 'ITI Alexandria', 4),
('Assiut', 'ITI Assiut', 9),
('Mansoura', 'ITI Mansoura', 4),
('Ismailia', 'ITI Ismailia', 9),
('Minya', 'ITI Minya', 4);
-- Adding more branches, ensuring M_ID is valid
DECLARE @manager_ids TABLE (M_ID INT);
INSERT INTO @manager_ids SELECT M_ID FROM [dbo].[Manager];

DECLARE @branch_count INT = 1;
DECLARE @manager_id_for_branch INT;
DECLARE @branch_name_prefix NVARCHAR(255);
DECLARE @location_prefix NVARCHAR(255);

WHILE @branch_count <= 20
BEGIN
    SELECT TOP 1 @manager_id_for_branch = M_ID FROM @manager_ids ORDER BY NEWID(); -- Select a random manager
    
    SET @branch_name_prefix = 'Branch ' + CAST(@branch_count AS NVARCHAR);
    SET @location_prefix = 'City ' + CAST(@branch_count AS NVARCHAR);

    INSERT INTO [dbo].[Branch] (Location, BranchName, M_ID) VALUES
    (@location_prefix, @branch_name_prefix, @manager_id_for_branch);

    SET @branch_count = @branch_count + 1;
END;



INSERT INTO [dbo].[Track] (Track_Name, Dept_ID) VALUES
('Web Development', 1),
('Mobile Development', 1),
('Data Analytics', 3),
('Cyber Security Specialist', 5),
('Cloud Solutions Architect', 4),
('AI Engineer', 1),
('Game Development', 1),
('UI/UX Designer', 1),
('Business Intelligence', 3),
('Network Engineer', 5);
-- Add more tracks, ensuring Dept_ID exists in Department
DECLARE @dept_ids TABLE (Dept_ID INT);
INSERT INTO @dept_ids SELECT Dept_ID FROM [dbo].[Department];

DECLARE @track_count INT = 1;
DECLARE @department_id_for_track INT;
DECLARE @track_name_prefix NVARCHAR(255);

WHILE @track_count <= 30
BEGIN
    SELECT TOP 1 @department_id_for_track = Dept_ID FROM @dept_ids ORDER BY NEWID();
    
    SET @track_name_prefix = 'Track ' + CAST(@track_count AS NVARCHAR);

    INSERT INTO [dbo].[Track] (Track_Name, Dept_ID) VALUES
    (@track_name_prefix, @department_id_for_track);

    SET @track_count = @track_count + 1;
END;



INSERT INTO [dbo].[Instructor] (Ins_ID, HiringDate, Salary, Dept_ID) VALUES
(3, '2021-03-01', 10000, 1),
(7, '2022-01-15', 11000, 3);
-- Adding more instructors, ensuring Ins_ID exists in Person and Dept_ID exists in Department
DECLARE @ins_id_val INT;
DECLARE @dept_id_ins INT;
DECLARE @person_bdate DATE;
DECLARE @hiring_date DATE; -- Declare @hiring_date here
DECLARE @salary INT; -- Declare @salary here

DECLARE @instructor_person_cursor CURSOR;

SET @instructor_person_cursor = CURSOR FOR
SELECT P.P_ID, P.Bdate, T.Dept_ID
FROM [dbo].[Person] P
INNER JOIN [dbo].[User_Person] UP ON P.P_ID = UP.P_ID
INNER JOIN [dbo].[User] U ON UP.AccountID = U.AccountID
CROSS JOIN (SELECT TOP 1 Dept_ID FROM [dbo].[Department] ORDER BY NEWID()) AS T -- Random department
WHERE U.Role = 'Instructor';

OPEN @instructor_person_cursor;
FETCH NEXT FROM @instructor_person_cursor INTO @ins_id_val, @person_bdate, @dept_id_ins;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @hiring_date = DATEADD(year, 3, @person_bdate); -- Hiring date 3 years after birthdate
    SET @salary = 8000 + (ABS(CHECKSUM(NEWID())) % 7000); -- Random salary between 8000 and 15000
    
    INSERT INTO [dbo].[Instructor] (Ins_ID, HiringDate, Salary, Dept_ID) VALUES
    (@ins_id_val, @hiring_date, @salary, @dept_id_ins);
    
    FETCH NEXT FROM @instructor_person_cursor INTO @ins_id_val, @person_bdate, @dept_id_ins;
END;
CLOSE @instructor_person_cursor;
DEALLOCATE @instructor_person_cursor;



INSERT INTO [dbo].[Supervisor] (Dept_ID, Ins_ID, StartDate, EndDate) VALUES
(1, 3, '2023-01-01', '2024-12-31'),
(3, 7, '2023-06-01', '2025-05-31');
-- Add more supervisors, ensuring valid Dept_ID and Ins_ID
DECLARE @dept_id_sup INT;
DECLARE @ins_id_sup INT;
DECLARE @start_date DATE;
DECLARE @end_date DATE;

-- Get all valid department and instructor IDs
DECLARE @all_dept_ids TABLE (Dept_ID INT);
INSERT INTO @all_dept_ids SELECT Dept_ID FROM [dbo].[Department];

DECLARE @all_ins_ids TABLE (Ins_ID INT);
INSERT INTO @all_ins_ids SELECT Ins_ID FROM [dbo].[Instructor];

DECLARE @sup_count INT = 1;
WHILE @sup_count <= 20
BEGIN
    SELECT TOP 1 @dept_id_sup = Dept_ID FROM @all_dept_ids ORDER BY NEWID();
    SELECT TOP 1 @ins_id_sup = Ins_ID FROM @all_ins_ids ORDER BY NEWID();
    
    SET @start_date = DATEADD(day, -ABS(CHECKSUM(NEWID())) % 3650, GETDATE()); -- Up to 10 years ago
    SET @end_date = DATEADD(day, ABS(CHECKSUM(NEWID())) % 730 + 365, @start_date); -- 1 to 3 years after start date

    -- Ensure unique (Dept_ID, Ins_ID) pairs if needed for real data, here it's fine for mock
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Supervisor] WHERE Dept_ID = @dept_id_sup AND Ins_ID = @ins_id_sup)
    BEGIN
        INSERT INTO [dbo].[Supervisor] (Dept_ID, Ins_ID, StartDate, EndDate) VALUES
        (@dept_id_sup, @ins_id_sup, @start_date, @end_date);
        SET @sup_count = @sup_count + 1;
    END;
END;



INSERT INTO [dbo].[Course] (Crs_ID, Crs_Desc, Crs_Name, Hours, Topic_ID) VALUES
(101, 'Introduction to Python Programming', 'Python Fundamentals', 40, 1),
(102, 'Building Dynamic Web Applications with React', 'React.js', 60, 2),
(103, 'Relational Database Design and SQL', 'Advanced SQL', 50, 3),
(104, 'Understanding Linux Operating System', 'Linux Administration', 45, 4),
(105, 'Cybersecurity Essentials', 'Network Security', 55, 5),
(106, 'Introduction to AWS Cloud Services', 'AWS Fundamentals', 35, 6),
(107, 'Machine Learning with Python', 'ML Basics', 70, 7),
(108, 'Data Visualization with Tableau', 'Tableau for Data', 40, 8),
(109, 'Software Testing Methodologies', 'QA Principles', 30, 9),
(110, 'Agile Project Management', 'Scrum & Agile', 25, 10);
-- Add more courses, ensuring Topic_ID exists in Topic
DECLARE @crs_id_val INT = 111;
DECLARE @topic_id_crs INT;
DECLARE @crs_name_prefix NVARCHAR(255);
DECLARE @crs_desc_prefix NVARCHAR(255);
DECLARE @hours INT;

DECLARE @all_topic_ids TABLE (Topic_ID INT);
INSERT INTO @all_topic_ids SELECT Topic_ID FROM [dbo].[Topic];

WHILE @crs_id_val <= 200
BEGIN
    SELECT TOP 1 @topic_id_crs = Topic_ID FROM @all_topic_ids ORDER BY NEWID();
    
    SET @crs_name_prefix = 'Course ' + CAST(@crs_id_val AS NVARCHAR);
    SET @crs_desc_prefix = 'Description for ' + @crs_name_prefix;
    SET @hours = 20 + (ABS(CHECKSUM(NEWID())) % 80); -- Hours between 20 and 100
    
    INSERT INTO [dbo].[Course] (Crs_ID, Crs_Desc, Crs_Name, Hours, Topic_ID) VALUES
    (@crs_id_val, @crs_desc_prefix, @crs_name_prefix, @hours, @topic_id_crs);
    
    SET @crs_id_val = @crs_id_val + 1;
END;


INSERT INTO [dbo].[Exam] (Exam_ID, Exam_Type, "QTY_T/F", QTY_MCQ, Duration, Date, Ins_ID, Crs_ID) VALUES
(1, 'Quiz', 5, 10, 30, '2024-06-10', 3, 101),
(2, 'Mid-Term', 10, 20, 60, '2024-07-15', 7, 103),
(3, 'Final', 15, 30, 90, '2024-08-20', 3, 102),
(4, 'Quiz', 7, 15, 45, '2024-06-12', 7, 104),
(5, 'Mid-Term', 12, 25, 75, '2024-07-20', 3, 105);
-- Add more exams, ensuring Ins_ID and Crs_ID exist
DECLARE @exam_id_val INT = 6;
DECLARE @exam_type NVARCHAR(50);
DECLARE @qty_tf INT;
DECLARE @qty_mcq INT;
DECLARE @duration INT;
DECLARE @exam_date DATE;
DECLARE @ins_id_exam INT;
DECLARE @crs_id_exam INT;

DECLARE @all_instructor_ids TABLE (Ins_ID INT);
INSERT INTO @all_instructor_ids SELECT Ins_ID FROM [dbo].[Instructor];

DECLARE @all_course_ids TABLE (Crs_ID INT);
INSERT INTO @all_course_ids SELECT Crs_ID FROM [dbo].[Course];

WHILE @exam_id_val <= 200
BEGIN
    SET @exam_type = CASE WHEN @exam_id_val % 3 = 0 THEN 'Final' WHEN @exam_id_val % 3 = 1 THEN 'Mid-Term' ELSE 'Quiz' END;
    SET @qty_tf = 5 + (ABS(CHECKSUM(NEWID())) % 10);
    SET @qty_mcq = 10 + (ABS(CHECKSUM(NEWID())) % 20);
    SET @duration = 30 + (ABS(CHECKSUM(NEWID())) % 60);
    SET @exam_date = DATEADD(day, ABS(CHECKSUM(NEWID())) % 365, GETDATE()); -- Within the next year
    
    SELECT TOP 1 @ins_id_exam = Ins_ID FROM @all_instructor_ids ORDER BY NEWID();
    SELECT TOP 1 @crs_id_exam = Crs_ID FROM @all_course_ids ORDER BY NEWID();

    INSERT INTO [dbo].[Exam] (Exam_ID, Exam_Type, "QTY_T/F", QTY_MCQ, Duration, Date, Ins_ID, Crs_ID) VALUES
    (@exam_id_val, @exam_type, @qty_tf, @qty_mcq, @duration, @exam_date, @ins_id_exam, @crs_id_exam);
    
    SET @exam_id_val = @exam_id_val + 1;
END;



INSERT INTO [dbo].[Questions] (Q_ID, QST_Content, Q_Type, Answer) VALUES
(1, 'What is the capital of Egypt?', 'MCQ', 'Cairo'),
(2, 'Is Python an object-oriented programming language?', 'T/F', 'True'),
(3, 'Which SQL keyword is used to extract data from a database?', 'MCQ', 'SELECT'),
(4, 'The primary function of an operating system is to manage computer hardware and software resources.', 'T/F', 'True'),
(5, 'What is the main purpose of a firewall?', 'MCQ', 'To control incoming and outgoing network traffic');
-- Add more questions
DECLARE @q_id_val INT = 6;
DECLARE @qst_content_prefix NVARCHAR(255);
DECLARE @q_type NVARCHAR(50);
DECLARE @answer_content NVARCHAR(255);

WHILE @q_id_val <= 200
BEGIN
    SET @q_type = CASE WHEN @q_id_val % 2 = 0 THEN 'T/F' ELSE 'MCQ' END;
    SET @qst_content_prefix = 'Question content for Q' + CAST(@q_id_val AS NVARCHAR);
    SET @answer_content = CASE WHEN @q_type = 'T/F' THEN CASE WHEN @q_id_val % 3 = 0 THEN 'True' ELSE 'False' END ELSE 'Answer for Q' + CAST(@q_id_val AS NVARCHAR) END;
    
    INSERT INTO [dbo].[Questions] (Q_ID, QST_Content, Q_Type, Answer) VALUES
    (@q_id_val, @qst_content_prefix, @q_type, @answer_content);
    
    SET @q_id_val = @q_id_val + 1;
END;




INSERT INTO [dbo].[Questions_Choices] (Q_ID, Choice) VALUES
(1, 'Cairo'),
(1, 'Giza'),
(1, 'Alexandria'),
(1, 'Luxor'),
(3, 'UPDATE'),
(3, 'SELECT'),
(3, 'INSERT'),
(3, 'DELETE'),
(5, 'To control incoming and outgoing network traffic'),
(5, 'To store all network data'),
(5, 'To accelerate internet speed'),
(5, 'To encrypt all communications');
-- Add more choices for MCQ questions (where Q_Type is 'MCQ')
DECLARE @q_id_choice INT;
DECLARE @choice_text NVARCHAR(255);

DECLARE @mcq_q_ids TABLE (Q_ID INT);
INSERT INTO @mcq_q_ids SELECT Q_ID FROM [dbo].[Questions] WHERE Q_Type = 'MCQ';

DECLARE @choice_cursor CURSOR;
SET @choice_cursor = CURSOR FOR
SELECT Q_ID FROM @mcq_q_ids;

OPEN @choice_cursor;
FETCH NEXT FROM @choice_cursor INTO @q_id_choice;

WHILE @@FETCH_STATUS = 0
BEGIN
    INSERT INTO [dbo].[Questions_Choices] (Q_ID, Choice) VALUES (@q_id_choice, 'Choice A for Q' + CAST(@q_id_choice AS NVARCHAR));
    INSERT INTO [dbo].[Questions_Choices] (Q_ID, Choice) VALUES (@q_id_choice, 'Choice B for Q' + CAST(@q_id_choice AS NVARCHAR));
    INSERT INTO [dbo].[Questions_Choices] (Q_ID, Choice) VALUES (@q_id_choice, 'Choice C for Q' + CAST(@q_id_choice AS NVARCHAR));
    INSERT INTO [dbo].[Questions_Choices] (Q_ID, Choice) VALUES (@q_id_choice, 'Choice D for Q' + CAST(@q_id_choice AS NVARCHAR));
    
    FETCH NEXT FROM @choice_cursor INTO @q_id_choice;
END;
CLOSE @choice_cursor;
DEALLOCATE @choice_cursor;




INSERT INTO [dbo].[Intake_Brch_Trk] (Track_ID, Branch_ID, Intake_ID) VALUES
(1, 1, 1),
(2, 1, 2),
(1, 2, 1),
(3, 2, 2),
(4, 1, 3);
-- Add more combinations to reach ~200 rows, ensuring valid foreign keys
DECLARE @track_id_ibt INT;
DECLARE @branch_id_ibt INT;
DECLARE @intake_id_ibt INT;

DECLARE @all_track_ids TABLE (Track_ID INT);
INSERT INTO @all_track_ids SELECT Track_ID FROM [dbo].[Track];

DECLARE @all_branch_ids TABLE (Branch_ID INT);
INSERT INTO @all_branch_ids SELECT Branch_ID FROM [dbo].[Branch];

DECLARE @all_intake_ids TABLE (Intake_ID INT);
INSERT INTO @all_intake_ids SELECT Intake_ID FROM [dbo].[Intake];

DECLARE @ibt_count INT = 1;
WHILE @ibt_count <= 200
BEGIN
    SELECT TOP 1 @track_id_ibt = Track_ID FROM @all_track_ids ORDER BY NEWID();
    SELECT TOP 1 @branch_id_ibt = Branch_ID FROM @all_branch_ids ORDER BY NEWID();
    SELECT TOP 1 @intake_id_ibt = Intake_ID FROM @all_intake_ids ORDER BY NEWID();

    -- Ensure unique combinations for the primary key (Track_ID, Branch_ID, Intake_ID)
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Intake_Brch_Trk] WHERE Track_ID = @track_id_ibt AND Branch_ID = @branch_id_ibt AND Intake_ID = @intake_id_ibt)
    BEGIN
        INSERT INTO [dbo].[Intake_Brch_Trk] (Track_ID, Branch_ID, Intake_ID) VALUES
        (@track_id_ibt, @branch_id_ibt, @intake_id_ibt);
        SET @ibt_count = @ibt_count + 1;
    END;
END;


INSERT INTO [dbo].[Student] (STD_ID, Track_ID, Branch_ID, Intake_ID, MilitaryStatus, SM_URL) VALUES
(1, 1, 1, 1, 'Completed', 'http://linkedin.com/in/student1'),
(2, 2, 1, 2, 'Exempted', 'http://github.com/student2'),
(5, 1, 2, 1, 'Postponed', 'http://linkedin.com/in/student5'),
(6, 3, 1, 3, 'Completed', 'http://github.com/student6'),
(8, 2, 2, 2, 'Exempted', 'http://linkedin.com/in/student8');
-- Add more students, ensuring STD_ID exists in Person and other foreign keys are valid
DECLARE @std_id_val INT;
DECLARE @track_id_std INT;
DECLARE @branch_id_std INT;
DECLARE @intake_id_std INT;
DECLARE @military_status NVARCHAR(50);
DECLARE @sm_url NVARCHAR(255);

DECLARE @all_track_ids_std TABLE (Track_ID INT);
INSERT INTO @all_track_ids_std SELECT Track_ID FROM [dbo].[Track];

DECLARE @all_branch_ids_std TABLE (Branch_ID INT);
INSERT INTO @all_branch_ids_std SELECT Branch_ID FROM [dbo].[Branch];

DECLARE @all_intake_ids_std TABLE (Intake_ID INT);
INSERT INTO @all_intake_ids_std SELECT Intake_ID FROM [dbo].[Intake];

DECLARE @student_person_cursor CURSOR;

SET @student_person_cursor = CURSOR FOR
SELECT P.P_ID
FROM [dbo].[Person] P
INNER JOIN [dbo].[User_Person] UP ON P.P_ID = UP.P_ID
INNER JOIN [dbo].[User] U ON UP.AccountID = U.AccountID
WHERE U.Role = 'Student';

OPEN @student_person_cursor;
FETCH NEXT FROM @student_person_cursor INTO @std_id_val;

WHILE @@FETCH_STATUS = 0
BEGIN
    SELECT TOP 1 @track_id_std = Track_ID FROM @all_track_ids_std ORDER BY NEWID();
    SELECT TOP 1 @branch_id_std = Branch_ID FROM @all_branch_ids_std ORDER BY NEWID();
    SELECT TOP 1 @intake_id_std = Intake_ID FROM @all_intake_ids_std ORDER BY NEWID();
    
    SET @military_status = CASE ABS(CHECKSUM(NEWID())) % 3
        WHEN 0 THEN 'Completed'
        WHEN 1 THEN 'Exempted'
        ELSE 'Postponed'
    END;
    SET @sm_url = 'http://linkedin.com/in/student' + CAST(@std_id_val AS NVARCHAR);

    INSERT INTO [dbo].[Student] (STD_ID, Track_ID, Branch_ID, Intake_ID, MilitaryStatus, SM_URL) VALUES
    (@std_id_val, @track_id_std, @branch_id_std, @intake_id_std, @military_status, @sm_url);
    
    FETCH NEXT FROM @student_person_cursor INTO @std_id_val;
END;
CLOSE @student_person_cursor;
DEALLOCATE @student_person_cursor;



INSERT INTO [dbo].[Std_Company] (Company_ID, STD_ID, Job_Role, Hiring_Date, Salary) VALUES
(1, 1, 'Software Engineer', '2024-01-01', 8000),
(2, 2, 'Data Analyst', '2024-03-10', 7500),
(1, 5, 'Junior Developer', '2024-02-15', 7000),
(3, 6, 'Cloud Specialist', '2024-04-01', 8500);
-- Add more student-company records, ensuring valid foreign keys
DECLARE @company_id_sc INT;
DECLARE @std_id_sc INT;
DECLARE @job_role NVARCHAR(255);
DECLARE @hiring_date_sc DATE;
DECLARE @salary_sc INT;

DECLARE @all_company_ids TABLE (Company_ID INT);
INSERT INTO @all_company_ids SELECT Company_ID FROM [dbo].[Company];

DECLARE @all_student_ids TABLE (STD_ID INT);
INSERT INTO @all_student_ids SELECT STD_ID FROM [dbo].[Student];

DECLARE @sc_count INT = 1;
WHILE @sc_count <= 50 -- Limit to 50 for variety, not all students are employed
BEGIN
    SELECT TOP 1 @company_id_sc = Company_ID FROM @all_company_ids ORDER BY NEWID();
    SELECT TOP 1 @std_id_sc = STD_ID FROM @all_student_ids ORDER BY NEWID();
    
    SET @job_role = CASE ABS(CHECKSUM(NEWID())) % 5
        WHEN 0 THEN 'Software Engineer'
        WHEN 1 THEN 'Data Analyst'
        WHEN 2 THEN 'Web Developer'
        WHEN 3 THEN 'DevOps Engineer'
        ELSE 'Junior Consultant'
    END;
    SET @hiring_date_sc = DATEADD(day, -ABS(CHECKSUM(NEWID())) % 730, GETDATE()); -- Within the last 2 years
    SET @salary_sc = 6000 + (ABS(CHECKSUM(NEWID())) % 4000); -- Salary between 6000 and 10000

    -- Ensure unique (Company_ID, STD_ID) pairs
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Std_Company] WHERE Company_ID = @company_id_sc AND STD_ID = @std_id_sc)
    BEGIN
        INSERT INTO [dbo].[Std_Company] (Company_ID, STD_ID, Job_Role, Hiring_Date, Salary) VALUES
        (@company_id_sc, @std_id_sc, @job_role, @hiring_date_sc, @salary_sc);
        SET @sc_count = @sc_count + 1;
    END;
END;




INSERT INTO [dbo].[Std_Freelance] (Free_ID, STD_ID, Detail, Date, Cost) VALUES
(1, 1, 'Developed a personal portfolio website', '2023-11-01', 500),
(2, 2, 'Data cleaning and analysis for a small business', '2023-12-05', 700),
(1, 6, 'Created a simple mobile app prototype', '2024-01-20', 600),
(3, 8, 'Wrote content for a tech blog', '2023-10-15', 300);
-- Add more student-freelance records
DECLARE @free_id_sf INT;
DECLARE @std_id_sf INT;
DECLARE @detail NVARCHAR(255);
DECLARE @date_sf DATE;
DECLARE @cost_sf INT;

DECLARE @all_free_ids TABLE (Free_ID INT);
INSERT INTO @all_free_ids SELECT Free_ID FROM [dbo].[Freelance_Platform];

DECLARE @all_student_ids_sf TABLE (STD_ID INT);
INSERT INTO @all_student_ids_sf SELECT STD_ID FROM [dbo].[Student];

DECLARE @sf_count INT = 1;
WHILE @sf_count <= 70 -- More freelance projects than full-time jobs
BEGIN
    SELECT TOP 1 @free_id_sf = Free_ID FROM @all_free_ids ORDER BY NEWID();
    SELECT TOP 1 @std_id_sf = STD_ID FROM @all_student_ids_sf ORDER BY NEWID();
    
    SET @detail = 'Freelance project detail ' + CAST(@sf_count AS NVARCHAR);
    SET @date_sf = DATEADD(day, -ABS(CHECKSUM(NEWID())) % 500, GETDATE()); -- Within the last ~1.5 years
    SET @cost_sf = 100 + (ABS(CHECKSUM(NEWID())) % 900); -- Cost between 100 and 1000

    -- For simplicity, let's allow duplicates in this context if a student did multiple projects on one platform.
    INSERT INTO [dbo].[Std_Freelance] (Free_ID, STD_ID, Detail, Date, Cost) VALUES
    (@free_id_sf, @std_id_sf, @detail, @date_sf, @cost_sf);
    SET @sf_count = @sf_count + 1;
END;




INSERT INTO [dbo].[Student_Crtf] (Crtf_ID, STD_ID, Date) VALUES
(1, 1, '2023-09-01'),
(5, 2, '2024-01-10'),
(2, 5, '2023-10-20'),
(4, 6, '2024-03-01');
-- Add more student-certificate records
DECLARE @crtf_id_scrtf INT;
DECLARE @std_id_scrtf INT;
DECLARE @date_scrtf DATE;

DECLARE @all_crtf_ids TABLE (Crtf_ID INT);
INSERT INTO @all_crtf_ids SELECT Crtf_ID FROM [dbo].[Certificate];

DECLARE @all_student_ids_scrtf TABLE (STD_ID INT);
INSERT INTO @all_student_ids_scrtf SELECT STD_ID FROM [dbo].[Student];

DECLARE @scrtf_count INT = 1;
WHILE @scrtf_count <= 100
BEGIN
    SELECT TOP 1 @crtf_id_scrtf = Crtf_ID FROM @all_crtf_ids ORDER BY NEWID();
    SELECT TOP 1 @std_id_scrtf = STD_ID FROM @all_student_ids_scrtf ORDER BY NEWID();
    
    SET @date_scrtf = DATEADD(day, -ABS(CHECKSUM(NEWID())) % 730, GETDATE()); -- Within the last 2 years

    -- Ensure unique (Crtf_ID, STD_ID) pairs as a student typically gets a certificate once
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Student_Crtf] WHERE Crtf_ID = @crtf_id_scrtf AND STD_ID = @std_id_scrtf)
    BEGIN
        INSERT INTO [dbo].[Student_Crtf] (Crtf_ID, STD_ID, Date) VALUES
        (@crtf_id_scrtf, @std_id_scrtf, @date_scrtf);
        SET @scrtf_count = @scrtf_count + 1;
    END;
END;



INSERT INTO [dbo].[Ins_Crs] (Crs_ID, Ins_ID) VALUES
(101, 3),
(103, 7),
(102, 3),
(104, 7);
-- Add more instructor-course records
DECLARE @crs_id_ic INT;
DECLARE @ins_id_ic INT;

DECLARE @all_crs_ids_ic TABLE (Crs_ID INT);
INSERT INTO @all_crs_ids_ic SELECT Crs_ID FROM [dbo].[Course];

DECLARE @all_ins_ids_ic TABLE (Ins_ID INT);
INSERT INTO @all_ins_ids_ic SELECT Ins_ID FROM [dbo].[Instructor];

DECLARE @ic_count INT = 1;
WHILE @ic_count <= 150
BEGIN
    SELECT TOP 1 @crs_id_ic = Crs_ID FROM @all_crs_ids_ic ORDER BY NEWID();
    SELECT TOP 1 @ins_id_ic = Ins_ID FROM @all_ins_ids_ic ORDER BY NEWID();

    -- Ensure unique (Crs_ID, Ins_ID) pairs
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Ins_Crs] WHERE Crs_ID = @crs_id_ic AND Ins_ID = @ins_id_ic)
    BEGIN
        INSERT INTO [dbo].[Ins_Crs] (Crs_ID, Ins_ID) VALUES
        (@crs_id_ic, @ins_id_ic);
        SET @ic_count = @ic_count + 1;
    END;
END;



INSERT INTO [dbo].[Crs_Qst] (Crs_ID, Q_ID) VALUES
(101, 1),
(101, 2),
(103, 3),
(104, 4),
(105, 5);
-- Add more course-question records
DECLARE @crs_id_cq INT;
DECLARE @q_id_cq INT;

DECLARE @all_crs_ids_cq TABLE (Crs_ID INT);
INSERT INTO @all_crs_ids_cq SELECT Crs_ID FROM [dbo].[Course];

DECLARE @all_q_ids_cq TABLE (Q_ID INT);
INSERT INTO @all_q_ids_cq SELECT Q_ID FROM [dbo].[Questions];

DECLARE @cq_count INT = 1;
WHILE @cq_count <= 300
BEGIN
    SELECT TOP 1 @crs_id_cq = Crs_ID FROM @all_crs_ids_cq ORDER BY NEWID();
    SELECT TOP 1 @q_id_cq = Q_ID FROM @all_q_ids_cq ORDER BY NEWID();

    -- Ensure unique (Crs_ID, Q_ID) pairs
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Crs_Qst] WHERE Crs_ID = @crs_id_cq AND Q_ID = @q_id_cq)
    BEGIN
        INSERT INTO [dbo].[Crs_Qst] (Crs_ID, Q_ID) VALUES
        (@crs_id_cq, @q_id_cq);
        SET @cq_count = @cq_count + 1;
    END;
END;



INSERT INTO [dbo].[Track_Crs] (Track_ID, Crs_ID) VALUES
(1, 101),
(1, 102),
(3, 103),
(4, 105),
(5, 106);
-- Add more track-course records
DECLARE @track_id_tc INT;
DECLARE @crs_id_tc INT;

DECLARE @all_track_ids_tc TABLE (Track_ID INT);
INSERT INTO @all_track_ids_tc SELECT Track_ID FROM [dbo].[Track];

DECLARE @all_crs_ids_tc TABLE (Crs_ID INT);
INSERT INTO @all_crs_ids_tc SELECT Crs_ID FROM [dbo].[Course];

DECLARE @tc_count INT = 1;
WHILE @tc_count <= 250
BEGIN
    SELECT TOP 1 @track_id_tc = Track_ID FROM @all_track_ids_tc ORDER BY NEWID();
    SELECT TOP 1 @crs_id_tc = Crs_ID FROM @all_crs_ids_tc ORDER BY NEWID();

    -- Ensure unique (Track_ID, Crs_ID) pairs
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Track_Crs] WHERE Track_ID = @track_id_tc AND Crs_ID = @crs_id_tc)
    BEGIN
        INSERT INTO [dbo].[Track_Crs] (Track_ID, Crs_ID) VALUES
        (@track_id_tc, @crs_id_tc);
        SET @tc_count = @tc_count + 1;
    END;
END;



INSERT INTO [dbo].[Exam_Qst] (Exam_ID, Q_ID) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5);
-- Add more exam-question records
DECLARE @exam_id_eq INT;
DECLARE @q_id_eq INT;
DECLARE @exam_qst_id_eq INT = 1;

DECLARE @all_exam_ids_eq TABLE (Exam_ID INT);
INSERT INTO @all_exam_ids_eq SELECT Exam_ID FROM [dbo].[Exam];

DECLARE @all_q_ids_eq TABLE (Q_ID INT);
INSERT INTO @all_q_ids_eq SELECT Q_ID FROM [dbo].[Questions];

DECLARE @eq_count INT = 1;
WHILE @eq_count <= 500
BEGIN
    SELECT TOP 1 @exam_id_eq = Exam_ID FROM @all_exam_ids_eq ORDER BY NEWID();
    SELECT TOP 1 @q_id_eq = Q_ID FROM @all_q_ids_eq ORDER BY NEWID();

    -- Ensure unique (Q_ID, Exam_ID) pairs
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Exam_Qst] WHERE Exam_ID = @exam_id_eq AND Q_ID = @q_id_eq)
    BEGIN
        INSERT INTO [dbo].[Exam_Qst] (Exam_ID, Q_ID) VALUES
        (@exam_id_eq, @q_id_eq);
        SET @eq_count = @eq_count + 1;
    END;
END;



INSERT INTO [dbo].[Std_Exam_Qst] (STD_ID, ExamQst_ID, Std_Ans, Correct_Ans, Grade) VALUES
(1, 1, 'Cairo', 1, 1),
(1, 2, 'True', 1, 1),
(2, 3, 'SELECT', 1, 1),
(2, 4, 'False', 0, 0), -- Incorrect answer
(5, 5, 'To control incoming and outgoing network traffic', 1, 1);

-- Add more student exam question records
DECLARE @std_id_seq INT;
DECLARE @examqst_id_seq INT;
DECLARE @q_id_seq INT;
DECLARE @std_ans NVARCHAR(255);
DECLARE @correct_ans BIT;
DECLARE @grade INT;
DECLARE @q_answer NVARCHAR(255);
DECLARE @q_type_seq NVARCHAR(50);

DECLARE @all_student_ids_seq TABLE (STD_ID INT);
INSERT INTO @all_student_ids_seq SELECT STD_ID FROM [dbo].[Student];

DECLARE @all_exam_qst_ids TABLE (ExamQst_ID INT, Q_ID INT);
INSERT INTO @all_exam_qst_ids SELECT ExamQst_ID, Q_ID FROM [dbo].[Exam_Qst];

DECLARE @seq_cursor CURSOR;

SET @seq_cursor = CURSOR FOR
SELECT EQ.ExamQst_ID, Q.Q_ID, Q.Answer, Q.Q_Type
FROM [dbo].[Exam_Qst] EQ
JOIN [dbo].[Questions] Q ON EQ.Q_ID = Q.Q_ID;

OPEN @seq_cursor;
FETCH NEXT FROM @seq_cursor INTO @examqst_id_seq, @q_id_seq, @q_answer, @q_type_seq;

DECLARE @seq_count INT = 1;
WHILE @seq_count <= 1000 AND @@FETCH_STATUS = 0
BEGIN
    SELECT TOP 1 @std_id_seq = STD_ID FROM @all_student_ids_seq ORDER BY NEWID();

    -- Generate a random answer, sometimes correct, sometimes incorrect
    IF @q_type_seq = 'T/F'
    BEGIN
        IF RAND() < 0.8 -- 80% chance of being correct
        BEGIN
            SET @std_ans = @q_answer;
            SET @correct_ans = 1;
            SET @grade = 1;
        END
        ELSE
        BEGIN
            SET @std_ans = CASE WHEN @q_answer = 'True' THEN 'False' ELSE 'True' END;
            SET @correct_ans = 0;
            SET @grade = 0;
        END
    END
    ELSE IF @q_type_seq = 'MCQ'
    BEGIN
        IF RAND() < 0.7 -- 70% chance of being correct for MCQ
        BEGIN
            -- Select the correct answer
            SET @std_ans = @q_answer;
            SET @correct_ans = 1;
            SET @grade = 1;
        END
        ELSE
        BEGIN
            -- Select a random incorrect choice
            SELECT TOP 1 @std_ans = Choice FROM [dbo].[Questions_Choices] WHERE Q_ID = @q_id_seq AND Choice <> @q_answer ORDER BY NEWID();
            IF @std_ans IS NULL -- Fallback if only correct choice exists or not enough choices
                SET @std_ans = 'Incorrect choice ' + CAST(ABS(CHECKSUM(NEWID())) % 100 AS NVARCHAR);
            SET @correct_ans = 0;
            SET @grade = 0;
        END
    END

    -- Ensure unique (ExamQst_ID, STD_ID) pairs
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Std_Exam_Qst] WHERE ExamQst_ID = @examqst_id_seq AND STD_ID = @std_id_seq)
    BEGIN
        INSERT INTO [dbo].[Std_Exam_Qst] (STD_ID, ExamQst_ID, Std_Ans, Correct_Ans, Grade) VALUES
        (@std_id_seq, @examqst_id_seq, @std_ans, @correct_ans, @grade);
        SET @seq_count = @seq_count + 1;
    END;
    
    FETCH NEXT FROM @seq_cursor INTO @examqst_id_seq, @q_id_seq, @q_answer, @q_type_seq;
END;
CLOSE @seq_cursor;
DEALLOCATE @seq_cursor;



