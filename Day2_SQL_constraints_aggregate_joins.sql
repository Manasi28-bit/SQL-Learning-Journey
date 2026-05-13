-- 🔹 What are Constraints?
-- Rules applied on table columns
-- Help maintain correct and valid data
-- Prevent wrong or duplicate data entry

-- 🔹 Unique Key
-- Allows only unique values (no duplicates)
-- Null values are allowed
-- One table can have multiple Unique keys
-- 👉 Example: Email ID (no two users should have same email)

-- 🔹 Primary Key
-- Allows only unique values
-- Null is NOT allowed
-- Combination of Unique + Not Null
-- One table can have only ONE Primary Key
-- 👉 Example: Employee ID

-- 🔹 NOT NULL
-- Column cannot have empty (null) values
-- Every row must have a value
-- 👉 Example: Name should never be empty

-- 🔹 CHECK Constraint
-- Used to limit values in a column
-- Defines valid range or condition
-- 👉 Example: Age must be > 18

-- 🔹 Foreign Key
-- Creates relationship between two tables (Parent–Child)
-- Value in child table must exist in parent table
-- Parent column must be Primary Key or Unique Key
-- Child table can have NULL values in foreign key
-- 👉 Example:
-- Department table (Parent) → Employee table (Child)

-- 🔹 DEFAULT
-- Sets a default value if no value is given during insert
-- 👉 Example: If salary not entered → default = 10000


-- What are Aggregate Functions?
-- Used to perform calculations on multiple rows
-- Return a single value as output
-- 👉 Example: total salary, average marks, etc.

-- 🔹 COUNT()
-- Used to count rows
-- COUNT(*) or COUNT(1)
-- → Counts total number of records (including NULLs)
-- COUNT(column_name)
-- → Counts only NOT NULL values
-- 👉 Example: Count number of employees

-- 🔹 SUM()
-- Used to add values
-- Works only on numeric columns
-- 👉 Example: Total salary of all employees

-- 🔹 MAX()
-- Returns maximum (highest) value
-- Works on numbers, text, dates
-- 👉 Example: Highest salary / latest date

-- 🔹 MIN()
-- Returns minimum (lowest) value
-- Works on numbers, text, dates
-- 👉 Example: Lowest salary / earliest date

-- 🔹 AVG()
-- Returns average value
-- Works only on numeric columns
-- 👉 Example: Average salary

-- 🔥 Quick Summary (Easy Trick)
-- COUNT → number of rows
-- SUM → total
-- MAX → highest
-- MIN → lowest
-- AVG → average

-- Count total employees
select count(*) as count_of_emp from employee;

-- Count employees with salary (non-null)
select count(*) as emp_salary from employee where salary is not null;

-- Find total salary of all employees
select sum(salary) from employee;

-- Find average salary.
select avg(salary) from employee;

-- Find highest salary
select max(salary) from employee;

-- Find lowest salary
select min(salary) from employee;

-- Count employees in each department (GROUP BY)
select dept_id,count(*) from employee group by dept_id;

-- Find average salary per department
select dept_id,avg(salary) as avg_salary_dept from employee group by dept_id;

-- Find departments where avg salary > 30000 (HAVING)
select dept_id,avg(salary) from employee group by dept_id having avg(salary) >30000;

-- Find department with maximum employees
select dept_id,count(*) as total from employee group by dept_id order by total desc limit 1;

-- 🔹 What are Joins?
-- Used to combine data from multiple tables
-- Done using a common column (like ID)
-- Helps you get related data in one result

-- 🔹 Cross Join
-- Combines every row of table A with every row of table B
-- Total rows = A rows × B rows
-- No condition required
-- 👉 Example: 3 rows × 4 rows = 12 rows

-- 🔹 Equi Join
-- Join using = (equal condition)
-- Most commonly used join type
-- 👉 Example:
-- emp.dept_id = dept.dept_id

-- 🔹 Inner Join
-- Returns only matching rows from both tables
-- If no match → row is ignored
-- 🔹 Outer Joins
-- Return matching + non-matching rows
-- 🔸 Left Outer Join
-- Returns all rows from LEFT table
-- Matching rows from right table
-- If no match → shows NULL

-- 👉 Simple: Left table full, right if match

-- 🔸 Right Outer Join
-- Returns all rows from RIGHT table
-- Matching rows from left table
-- If no match → shows NULL

-- 👉 Simple: Right table full, left if match

-- 🔸 Full Outer Join
-- Returns all rows from both tables
-- Matches where possible
-- Non-matching → NULL on either side

-- 👉 Simple: Everything from both tables

-- 🔹 Non-Equi Join
-- Join using conditions other than =
-- Uses operators like >, <, BETWEEN

-- 👉 Example:
-- Salary between range table

-- 🔥 Quick Summary (Easy Memory Trick)
-- Inner Join → Only matching
-- Left Join → Left full
-- Right Join → Right full
-- Full Join → Everything
-- Cross Join → All combinations
-- Equi Join → Uses =
-- Non-Equi Join → Uses > < BETWEEN

-- Show employee name and department name
select  e.emp_name as employee_name, d.dept_name as department_name from employee e join department d 
on d.dept_id=e.dept_id;

-- Display only employees who have a department (INNER JOIN)
select * from employee e join department d on e.dept_id=d.dept_id;

-- Show all employees even if no department (LEFT JOIN)
select * from employee e left join department d on e.dept_id=d.dept_id;

-- Show all departments even if no employees (RIGHT JOIN)
select * from department d right join employee e on e.dept_id=d.dept_id;

-- Show all records from both tables (FULL JOIN)
select * from employee e left join department d on e.dept_id=d.dept_id;

-- Show all combinations of employees and departments (CROSS JOIN)
select * from employee cross join department;

-- Find employees working in 'HR' department
select e.emp_id,e.dept_id,e.emp_name,d.dept_name from employee e join department d on d.dept_id=e.dept_id where d.dept_name="HR";

-- Count employees in each department
select dept_id,count(*) as count_of_employee from employee group by dept_id;
select e.dept_id,d.dept_name,count(e.emp_id) as count_of_employee from employee e join department d on d.dept_id=e.dept_id
group by e.dept_id;

-- Find employees who don’t have a department
select count(*) from employee where dept_id is null;
