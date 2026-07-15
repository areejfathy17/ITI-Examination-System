<h1 align="center">🎓 ITI Examination Analytics & Business Intelligence Platform</h1>

<p align="center">
  <b>An End-to-End Business Intelligence Solution for Automating and Analyzing Academic Examination Data</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white" />
  <img src="https://img.shields.io/badge/T--SQL-4479A1?style=for-the-badge&logo=databricks&logoColor=white" />
  <img src="https://img.shields.io/badge/SSIS-A4373A?style=for-the-badge&logo=microsoft&logoColor=white" />
  <img src="https://img.shields.io/badge/SSRS-8E44AD?style=for-the-badge&logo=microsoft&logoColor=white" />
  <img src="https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black" />
  <img src="https://img.shields.io/badge/Tableau-E97627?style=for-the-badge&logo=tableau&logoColor=white" />
  <img src="https://img.shields.io/badge/Data%20Warehouse-1B4F72?style=for-the-badge&logo=databricks&logoColor=white" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Tables-29-b71c1c?style=flat-square" />
  <img src="https://img.shields.io/badge/Stored%20Procedures-28-b71c1c?style=flat-square" />
  <img src="https://img.shields.io/badge/SSRS%20Reports-6-b71c1c?style=flat-square" />
  <img src="https://img.shields.io/badge/Power%20BI%20Dashboards-25%2B-b71c1c?style=flat-square" />
  <img src="https://img.shields.io/badge/Developers-4-b71c1c?style=flat-square" />
</p>

<p align="center">
  <i>Transforming raw examination data into actionable academic insights — from database design to interactive dashboards.</i>
</p>

<p align="center">
  <a href="#-project-overview">Overview</a> •
  <a href="#-end-to-end-bi-workflow">Workflow</a> •
  <a href="#-system-architecture">Architecture</a> •
  <a href="#-database-design">Database Design</a> •
  <a href="#-data-warehouse">Data Warehouse</a> •
  <a href="#-etl-process-ssis">ETL</a> •
  <a href="#-ssrs-reports">SSRS Reports</a> •
  <a href="#-power-bi-dashboards">Dashboards</a> •
  <a href="#-technology-stack">Tech Stack</a> •
  <a href="#-key-features">Features</a> •
  <a href="#-team-members">Team</a>
</p>

---

## 📌 Project Overview
A comprehensive Business Intelligence and Analytics platform that automates examination management through database engineering, ETL pipelines, data warehousing, operational reporting, and interactive dashboards, enabling data-driven academic decision-making.

---

## 🔄 End-to-End BI Workflow

```
Business Requirements
        ↓
   ERD Design
        ↓
Database Development
        ↓
 Stored Procedures
        ↓
  Data Warehouse
        ↓
   ETL (SSIS)
        ↓
  SSRS Reports
        ↓
Power BI Dashboards
```

| Phase | Description |
|---|---|
| **Business Requirements** | Gathered functional needs from academic stakeholders covering students, instructors, courses, and exams. |
| **ERD Design** | Modeled all entities and relationships using Draw.io to represent the full academic and operational domain. |
| **Database Development** | Implemented the ERD as a normalized SQL Server database with 29 tables enforcing referential integrity. |
| **Stored Procedures** | Built 28 stored procedures to encapsulate business logic for CRUD operations, exam generation, and evaluation. |
| **Data Warehouse** | Designed a star-schema warehouse with dedicated fact and dimension tables optimized for analytical queries. |
| **ETL (SSIS)** | Developed SSIS packages to extract, transform, and load data from the OLTP database into the warehouse. |
| **SSRS Reports** | Delivered 6 parameterized operational reports for departmental and administrative use. |
| **Power BI Dashboards** | Built 25+ interactive dashboards for executive, academic, and operational decision support. |

---

## 🗄 Database Design

### Entity Relationship Diagram (ERD)

The ERD models the complete academic ecosystem — Person, Student, Instructor, Manager, Course, Track, Department, Exam, Questions, Branch, Intake, Certificate, Company, and Freelance Platform entities — connected through supertype/subtype relationships and many-to-many associations resolved via junction tables.

![(images/architecture.png](https://github.com/areejfathy17/ITI-Examination-System/blob/main/ERD/Final_ERD.drawio%20.png)

### Database Mapping

The logical ERD was mapped into a fully normalized relational schema, resolving all many-to-many relationships into dedicated junction tables (e.g., `Ins_Crs`, `Crs_Qst`, `Track_Crs`, `Std_Exam_Qst`) and applying surrogate/foreign keys across 29 physical tables.

![Database Mapping](https://github.com/areejfathy17/ITI-Examination-System/blob/main/Mapping/Mapping_ITI_Examination_System.drawio%20.png)

---

## 🏢 Data Warehouse

### Star Schema Design

The warehouse follows a star schema architecture with conformed dimensions (`Dim_Student`, `Dim_Instructor`, `Dim_Course`, `Dim_Exam`, `Dim_Branch`, `Dim_Track`, `Dim_Department`, `Dim_Intake`, `Dim_Company`, `Dim_Certificate`, `Dim_Time`) surrounding multiple fact tables (`Fact_Std_Exam_Qst`, `Fact_Std_Company`, `Fact_Std_Freelance`, `Fact_Student_Crtf`). This design supports fast aggregation and slicing across student performance, exam results, and career-related metrics.

![Data Warehouse Schema](https://github.com/areejfathy17/ITI-Examination-System/blob/main/Data%20Model%20Schema/ITI_EXamination_DWH_Schema.png)

**Fact & Dimension Architecture:**
- **Fact tables** capture measurable, transactional events — exam attempts, grades, correct answers, certificates earned, and company/freelance engagements.
- **Dimension tables** provide descriptive context — who the student is, which course/instructor was involved, which branch/track/department they belong to, and when the event occurred (via `Dim_Time`).

---

## ⚙️ ETL Process (SSIS)

The ETL pipeline extracts data from multiple OLTP sources (Person, Instructor, Phone tables), sorts and merges them through Merge Join transformations, applies business logic via a Derived Column transformation, and loads the final conformed dataset into the data warehouse destination table.

![SSIS ETL Workflow](https://github.com/areejfathy17/ITI-Examination-System/blob/main/SSIS/SSIS_Screens/Data%20Flow%20of%20%20Dim_Ins.png)

**Workflow explanation:**
1. **OLE DB Sources** extract raw data from Person, Instructor, and Phone tables.
2. **Sort transformations** prepare each dataset for merge operations.
3. **Merge Join transformations** combine related datasets on common keys.
4. **Derived Column** applies calculated/business-rule fields.
5. **OLE DB Destination** loads the final transformed dataset into the warehouse.

---

## 📊 SSRS Reports

<table>
<tr><td>📄 <b>Student Grades Report</b></td><td>Detailed grade breakdown per student across exams and courses.</td></tr>
<tr><td>📄 <b>Student Details by Department</b></td><td>Departmental roster with demographic and enrollment details.</td></tr>
<tr><td>📄 <b>Instructor Courses Report</b></td><td>Courses assigned per instructor with scheduling details.</td></tr>
<tr><td>📄 <b>Exam Questions Report</b></td><td>Full question bank listing per exam, including type and answers.</td></tr>
<tr><td>📄 <b>Student Answers Report</b></td><td>Individual student responses matched against correct answers.</td></tr>
<tr><td>📄 <b>Department Performance Report</b></td><td>Aggregated performance metrics rolled up by department.</td></tr>
</table>

![SSRS Report Sample](https://github.com/areejfathy17/ITI-Examination-System/blob/main/SSRS/Exam%20Question%20FreeForm.pdf)

---

## 📈Sample of Power BI Dashboards

A suite of 25+ interactive dashboards was developed to support decision-making at every organizational level — from executive summaries to granular question-level quality analysis.
![Student Distribution Overview](https://github.com/areejfathy17/ITI-Examination-System/blob/main/Power%20BI%20Dashboards/student%20overview.png)
![General Exam Results Analysis](https://github.com/areejfathy17/ITI-Examination-System/blob/main/Power%20BI%20Dashboards/General%20Exam.png)

## 🧰 Technology Stack

| Layer | Technology | Description |
|---|---|---|
| ERD Design | Draw.io | Modeled entities, attributes, and relationships for the full academic domain. |
| Database Mapping | Draw.io / SQL Server | Translated the ERD into a normalized relational schema with resolved M:N relationships. |
| Database Development | SQL Server, T-SQL | Implemented 29 tables with constraints, keys, and referential integrity. |
| Stored Procedures | T-SQL | Encapsulated business logic across 28 procedures for CRUD and exam operations. |
| Data Warehouse | SQL Server, Star Schema | Designed fact and dimension tables optimized for analytical workloads. |
| ETL | SSIS | Automated extraction, transformation, and loading from OLTP to the warehouse. |
| SSRS Reporting | SQL Server Reporting Services | Delivered 6 parameterized operational reports. |
| Power BI Analytics | Power BI, DAX | Built 25+ dashboards with KPIs, drillthrough, and trend analysis. |
| Dashboard Development | Power BI, Tableau | Designed both executive and operational-level visual analytics. |
| Testing & Validation | Redgate SQL Data Generator, Excel | Generated realistic sample data and validated report/dashboard accuracy. |

---

## 📂 Project Repository Structure

```
ITI-Examination-System/
│
├── Database/
│   ├── ERD/                     # Draw.io ERD source files
│   ├── Schema/                  # Table creation scripts
│   ├── StoredProcedures/        # T-SQL stored procedures (28)
│   └── SampleData/              # Redgate-generated test data scripts
│
├── DataWarehouse/
│   ├── StarSchema/               # Fact & Dimension table scripts
│   └── DWH_Diagram/               # Warehouse schema diagrams
│
├── ETL/
│   ├── SSIS_Packages/             # .dtsx SSIS package files
│   └── DataFlow_Diagrams/         # ETL data flow documentation
│
├── SSRS_Reports/
│   ├── StudentGradesReport.rdl
│   ├── StudentDetailsByDepartment.rdl
│   ├── InstructorCoursesReport.rdl
│   ├── ExamQuestionsReport.rdl
│   ├── StudentAnswersReport.rdl
│   └── DepartmentPerformanceReport.rdl
│
├── PowerBI_Dashboards/
│   ├── ExecutiveDashboard.pbix
│   ├── StudentPerformanceDashboard.pbix
│   ├── CourseAnalyticsDashboard.pbix
│   ├── InstructorDashboard.pbix
│   ├── EmploymentDashboard.pbix
│   └── QuestionQualityDashboard.pbix
│
├── images/                        # README image assets
│
└── README.md
```

---

## 👥 Team Members

<table align="center">
<tr>
  <th>Name</th>
  <th>GitHub</th>
  <th>LinkedIn</th>
</tr>
<tr>
  <td>Ahmed Khaled</td>
  <td><a href="#">GitHub Profile</a></td>
  <td><a href="#">LinkedIn Profile</a></td>
</tr>
<tr>
  <td>Abdelaziz Ragab</td>
  <td><a href="#">GitHub Profile</a></td>
  <td><a href="#">LinkedIn Profile</a></td>
</tr>
<tr>
  <td>Marwa Aboelenin</td>
  <td><a href="#">GitHub Profile</a></td>
  <td><a href="#">LinkedIn Profile</a></td>
</tr>
<tr>
  <td><b>Areej Fathy</b></td>
  <td><a href="https://github.com/areejfathy17">github.com/areejfathy17</a></td>
  <td><a href="#">LinkedIn Profile</a></td>
</tr>
</table>

---


---

<p align="center">
  Made with 📊 and dedication by the ITI Business Intelligence Team
</p>
