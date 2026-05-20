-- VIEWS

-- 🔹 What is a View?

-- A View is a virtual table created using a SQL query.
-- 👉 It does NOT store data physically
-- 👉 It always shows latest data from the base tables

-- 💡 Think of it like:
-- A saved SQL query that behaves like a table

-- 🔹 Real-Life Example
-- Imagine you're working in a company:
-- HR should see only employee names & departments
-- Not salaries (sensitive data)
-- Instead of giving full table access, you create a view

-- SYNTAX
-- CREATE VIEW view_name AS
-- SELECT column1, column2
-- FROM table_name
-- WHERE condition;

-- 🔹 Advantages of Views

-- ✔ Security (hide sensitive data)
-- ✔ Simplifies complex queries
-- ✔ Reusability
-- ✔ Always shows updated data

-- 🔹 Disadvantages

-- ❌ Can be slow (complex queries inside)
-- ❌ Limited updates in complex views

-- SYNTAX TO UPDATE VIEW
-- CREATE OR REPLACE VIEW emp_simple AS
-- SELECT emp_id, emp_name
-- FROM employee;

-- SYNTAX TO DROP VIEW
-- DROP VIEW emp_simple;

-- 🔥 Practice Questions (Very Important)
-- 1
-- Create a view showing employee names and salaries
CREATE VIEW show_emp_table AS
    SELECT 
        emp_name, salary
    FROM
        employee;
SELECT 
    *
FROM
    show_emp_table;

-- 2
-- Create a view showing employees with salary > 40,000
CREATE VIEW emp1 AS
    SELECT 
        emp_name, salary
    FROM
        employee
    WHERE
        salary > 40000;
SELECT 
    *
FROM
    emp1;
    
-- 3
-- Create a view combining employee name and department name
CREATE VIEW merge1 AS
    SELECT 
        e.emp_name, d.dept_name
    FROM
        employee e
            JOIN
        department d ON d.dept_id = e.dept_id;
SELECT 
    *
FROM
    merge1;
    
-- 4
-- Create a view showing average salary per department
CREATE VIEW avg_sal AS
    SELECT 
        dept_id, AVG(salary) as avg_salary
    FROM
        employee
    GROUP BY dept_id;
 SELECT 
    *
FROM
    avg_sal;
    
-- 5
-- Try updating a simple view
UPDATE emp1 
SET 
    salary = 45000
WHERE
    emp_id = 101;
SELECT 
    *
FROM
    emp1;
    
-- 📘 SQL Views Practice Set (Day 6 – Advanced)
-- 🔹 Basic Level (Warm-up)
-- 1
-- Create a view to show all employees from department 2
CREATE VIEW e1 AS
    SELECT 
        emp_id, dept_id, emp_name
    FROM
        employee
    WHERE
        dept_id = 2;
SELECT 
    *
FROM
    e1;

-- 2
-- Create a view to show employees with age > 30
CREATE VIEW e2 AS
    SELECT 
        emp_name, age
    FROM
        employee
    WHERE
        age > 30;
SELECT 
    *
FROM
    e2;

-- 3
-- Create a view that shows only emp_id and emp_name
CREATE VIEW e3 AS
    SELECT 
        emp_id, emp_name
    FROM
        employee;
SELECT 
    *
FROM
    e3;

-- 4
-- Create a view to show employees whose salary is between 30,000 and 70,000
CREATE VIEW e4 AS
    SELECT 
        emp_id, emp_name, salary
    FROM
        employee
    WHERE
        salary BETWEEN 30000 AND 70000;
SELECT 
    *
FROM
    e4;

-- 🔹 Medium Level (Concept Building)

-- 5
-- Create a view showing:
-- 👉 emp_name, salary, dept_name
CREATE VIEW e5 AS
    SELECT 
        e.emp_name, e.salary, d.dept_name
    FROM
        employee e
            JOIN
        department d ON d.dept_id = e.dept_id;
SELECT 
    *
FROM
    e5;

-- 6
-- Create a view to show:
-- 👉 employees working in 'HR' department
CREATE VIEW e6 AS
    SELECT 
        e.emp_name, d.dept_name
    FROM
        employee e
            JOIN
        department d ON d.dept_id = e.dept_id
    WHERE
        d.dept_name = 'HR';
SELECT 
    *
FROM
    e6;

-- 7
-- Create a view to show:
-- 👉 department-wise total salary
CREATE OR REPLACE VIEW e7 AS
    SELECT 
        d.dept_name, SUM(e.salary) AS Total_Salary
    FROM
        employee e
            JOIN
        department d ON e.dept_id = d.dept_id
    GROUP BY d.dept_id;
SELECT 
    *
FROM
    e7;

-- 8
-- Create a view to show:
-- 👉 employees earning above average salary
CREATE OR REPLACE VIEW e8 AS
    SELECT 
        emp_id, emp_name, salary
    FROM
        employee
    WHERE
        salary > (SELECT 
                AVG(salary) AS avgsalary
            FROM
                employee);
SELECT 
    *
FROM
    e8;

-- 9
-- Create a view to show:
-- 👉 employees with maximum salary
CREATE OR REPLACE VIEW e9 AS
    SELECT 
        *
    FROM
        employee
    WHERE
        salary = (SELECT 
                MAX(salary) AS max_sal
            FROM
                employee);
SELECT 
    *
FROM
    e9;

-- 🔹 Advanced Level (Interview Level 🔥)
-- 10
-- Create a view to show:
-- 👉 second highest salary employees
CREATE OR REPLACE VIEW e10 AS
    SELECT 
        *
    FROM
        employee
    WHERE
        salary = (SELECT 
                MAX(salary)
            FROM
                employee
            WHERE
                salary < (SELECT 
                        MAX(salary)
                    FROM
                        employee));
SELECT 
    *
FROM
    e10;

-- 11
-- Create a view showing:
-- 👉 department-wise employee count
CREATE OR REPLACE VIEW e11 AS
    SELECT 
        d.dept_name, COUNT(e.emp_id) AS county_of_emp
    FROM
        employee e
            JOIN
        department d ON d.dept_id = e.dept_id
    GROUP BY d.dept_name;
SELECT 
    *
FROM
    e11;

-- 12
-- Create a view to show:
-- 👉 employees whose salary is greater than their department average
CREATE OR REPLACE VIEW e12 AS
    SELECT 
        *
    FROM
        employee e
    WHERE
        salary > (SELECT 
                AVG(salary) AS avg_sal
            FROM
                employee
            WHERE
                dept_id = e.dept_id);
SELECT 
    *
FROM
    e12;

-- 13
-- Create a view to show:
-- 👉 top 3 highest paid employees
CREATE OR REPLACE VIEW e13 AS
    SELECT 
        *
    FROM
        employee
    ORDER BY salary DESC
    LIMIT 3;
SELECT 
    *
FROM
    e13;

-- 14
-- Create a view using subquery:
-- 👉 employees NOT in department 1
CREATE OR REPLACE VIEW e14 AS
    SELECT 
        *
    FROM
        employee
    WHERE
        dept_id IN (SELECT 
                dept_id
            FROM
                employee
            WHERE
                dept_id != 1);
SELECT 
    *
FROM
    e14;
