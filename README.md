# ITI Automated Examination Management System

This project presents a complete solution to manage and automate the examination process at ITI – Tanta Branch. It covers students, instructors, courses, exams, and reporting — aiming to improve efficiency and enable data-driven decisions.

## Team Members

- [[Ahmed Khaled](https://github.com/ahmed-khaled-kash)
- [Abdelaziz Ragab](https://github.com/ZezoGobara)
- [Marwa Aboelenin](https://github.com/Marwa-13)

## Project Overview

The system streamlines exam workflows through:

- Managing students, instructors, courses, and exam data
- Generating and correcting multiple-choice and true/false exams
- Storing and processing data using stored procedures and ETL pipelines
- Producing reports and dashboards to support academic decision-making

## Tools and Technologies

- **SQL Server & SSMS** – Database design and stored procedures  
- **Redgate SQL Data Generator & Excel** – Test data creation  
- **SSIS** – ETL to transfer data to a data warehouse  
- **SSRS** – Static and printable reports  
- **Power BI** – Interactive dashboards and visual analytics  
- **draw.io** – ERD and system mapping

## SSRS Reports

The system includes several paginated reports to support administrative tasks:

- **Student Grades Report** – Displays student scores and pass/fail results
- **Student Details by Department** – Lists students grouped by department
- **Instructor Courses Report** – Shows each instructor’s course load
- **Exam Questions & Choices Report** – Lists exam questions and available choices
- **Student Answers Report** – Captures student responses per exam

All reports are powered by optimized stored procedures and include parameters for filtering (e.g., by department, exam ID, or student ID).

## Power BI Dashboards

A set of dashboards was created to provide visual insights and performance tracking:

- **Student Performance Dashboard** – Shows scores, pass rates, and top performers
- **Course & Instructor Dashboard** – Tracks course enrollment and instructor activity
- **Student Distribution Dashboard** – Analyzes students by department, track, gender, and location
- **Freelance & Employment Dashboard** – Highlights student outcomes after graduation
- **Question Quality Dashboard** – Evaluates question types and quality over exams
- **Drillthrough Pages** – Allow deeper exploration of individual student and course data

These dashboards help different stakeholders (e.g., instructors and managers) to make informed decisions based on data.

## Future Improvements

- Embed SSRS reports directly into Power BI for a unified experience  
- Add role-specific dashboards and filters  
- Enable mobile-friendly access to dashboards and reports
- 
This project reflects our effort to build a practical and data-driven examination system.
