-- INLINE VIEWS

-- INLINE VIEWS = SUBQUERY inside the from clause
-- First creates a temporary result (like a virtual table)
-- Then use that result in the main query.

-- SYNTAX
-- select columns
-- from (
--   select columns
--   from table
--   condition
-- ) As alias;

-- Inline view must have an alias
-- It behaves like a temporary table.

-- Q1. Get Employees whose salary is greater than average salary.

-- solving with subquery
SELECT 
    *
FROM
    employee
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            employee);

-- solving with inline view
SELECT 
    e.*
FROM
    employee e,
    (SELECT 
        AVG(salary) AS avg_salary
    FROM
        employee) d
WHERE
    e.salary > avg_salary;

-- Q2. Department wise average salary.
SELECT 
    d.dept_id, e.emp_name, d.avg_salary
FROM
    employee e
        JOIN
    (SELECT 
        dept_id, AVG(salary) AS avg_salary
    FROM
        employee
    GROUP BY dept_id) d ON e.dept_id = d.dept_id;

-- @3. Employees earning more than their department avg.
SELECT 
    d.dept_id, e.emp_name, e.salary, d.avg_salary
FROM
    employee e
        JOIN
    (SELECT 
        dept_id, AVG(salary) AS avg_salary
    FROM
        employee
    GROUP BY dept_id) d ON e.dept_id = d.dept_id
WHERE
    e.salary > d.avg_salary;

-- @4. Top salary per department
SELECT 
    e.*
FROM
    employee e
        JOIN
    (SELECT 
        dept_id, MAX(salary) AS Highest_salary
    FROM
        employee
    GROUP BY dept_id) d ON e.dept_id = d.dept_id
        AND e.salary = d.Highest_salary;

-- Q5. Find employees earning less than department avg.
SELECT 
    d.dept_id, e.emp_name, e.salary, d.avg_sal
FROM
    employee e
        JOIN
    (SELECT 
        dept_id, AVG(salary) AS avg_sal
    FROM
        employee
    GROUP BY dept_id) d ON e.dept_id = d.dept_id
WHERE
    e.salary < d.avg_sal;

-- Q6. Find 2nd Highest Salary using inline view
SELECT 
    MAX(salary) AS second_largest_sal
FROM
    (SELECT 
        salary
    FROM
        employee
    WHERE
        salary < (SELECT 
                MAX(salary)
            FROM
                employee)) AS d;

-- Q7.  Find department where avg_salary > 30000
SELECT 
    d.dept_name, e.avg_salary
FROM
    department d
        JOIN
    (SELECT 
        dept_id, AVG(salary) AS avg_salary
    FROM
        employee
    GROUP BY dept_id) e ON e.dept_id = d.dept_id
WHERE
    e.avg_salary > 30000;

-- Q8. Count employee per department.
SELECT 
    d.dept_id, d.dept_name, e.count_of_employee
FROM
    department d
        JOIN
    (SELECT 
        dept_id, COUNT(emp_id) AS count_of_employee
    FROM
        employee
    GROUP BY dept_id) e ON e.dept_id = d.dept_id;

-- Q9. Employee with minimum salary in each department.
SELECT 
    d.dept_id, e.emp_name, d.min_sal
FROM
    employee e
        JOIN
    (SELECT 
        dept_id, MIN(salary) AS min_sal
    FROM
        employee
    GROUP BY dept_id) d ON e.dept_id = d.dept_id
        AND e.salary = d.min_sal;