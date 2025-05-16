/* ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
Database Load Issues (follow if receiving permission denied when running SQL code below)

Possible Errors: 
- ERROR >>  duplicate key value violates unique constraint "company_dim_pkey"
- ERROR >> could not open file "C:\Users\...\company_dim.csv" for reading: Permission denied

1. Drop the Database 
            DROP DATABASE IF EXISTS sql_course;
2. Repeat steps to create database and load table schemas
            - 1_create_database.sql
            - 2_create_tables.sql
3. Open pgAdmin
4. In Object Explorer (left-hand pane), navigate to `sql_course` database
5. Right-click `sql_course` and select `PSQL Tool`
            - This opens a terminal window to write the following code
6. Get the absolute file path of your csv files
            1. Find path by right-clicking a CSV file in VS Code and selecting “Copy Path”
7. Paste the following into `PSQL Tool`, (with the CORRECT file path)

\copy company_dim FROM 'C:/Users/yaksn/OneDrive/Documents/Personal/Business Analysis/SQL Project/csv_files/company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_dim FROM 'C:/Users/yaksn/OneDrive/Documents/Personal/Business Analysis/SQL Project/csv_files/skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_postings_fact FROM 'C:/Users/yaksn/OneDrive/Documents/Personal/Business Analysis/SQL Project/csv_files/job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_job_dim FROM 'C:/Users/yaksn/OneDrive/Documents/Personal/Business Analysis/SQL Project/csv_files/skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

*/
SELECT * from job_postings_fact
LIMIT 50;

-- NOTE: This has been updated from the video to fix issues with encoding
COPY company_dim
FROM 'C:/Users/yaksn/OneDrive/Documents/Personal/Business Analysis/SQL Project/csv_files/company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM 'C:/Users/yaksn/OneDrive/Documents/Personal/Business Analysis/SQL Project/csv_files/skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM 'C:/Users/yaksn/OneDrive/Documents/Personal/Business Analysis/SQL Project/csv_files/job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM 'C:/Users/yaksn/OneDrive/Documents/Personal/Business Analysis/SQL Project/csv_files/skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

ALTER TABLE job_applied
rename column contact to contact_name

select
    *
FROM
    job_applied

   --1
 CREATE TABLE job_applied(
    job_id INT,
    application_sent_date date ,
    custom_resume boolean,
    resume_file_name varchar(255),
    cover_letter_sent boolean,
    cover_letter_file_name varchar (255),
    status varchar (50)
);