-- GROUP BY
-- 👉 Meaning:
-- Group similar data together and then perform calculations (sum, avg, count, etc.)
-- 💡 Real-life example:
-- In a company:
-- You want to know total salary of each department
-- So you group employees by department

-- HAVING
-- 👉 Meaning:
-- Filter grouped data (used after GROUP BY)
-- 💡 Real-life example:
-- You grouped departments
-- Now you want:
-- 👉 "Show only departments where total salary > 1 lakh"

-- 🔥 WHERE vs HAVING (Quick Reminder)

-- Feature	     WHERE	     HAVING
-- Works on	 Rows	     Groups
-- Used before
-- GROUP BY 	  ✅ Yes	❌ No
-- Used after
-- GROUP BY	❌ No	✅ Yes
-- Can use aggregate
-- (SUM, AVG)	❌ No	✅ Yes

-- GROUP BY + HAVING (Practice Questions)

-- 🟢 Basic to Medium
-- Find total salary of each department
select dept_id,sum(salary) as total_salary from employee group by dept_id;

-- Find average salary of each department
select dept_id,avg(salary) as avg_salary from employee group by dept_id;

-- Count number of employees in each department.
select dept_id,count(emp_id) as count_of_emp from employee group by dept_id;

-- Find maximum salary in each department
select dept_id,max(salary) as max_salary from employee group by dept_id;

-- Find minimum salary in each department
select dept_id,min(salary) as min_salary from employee group by dept_id;

-- 🟡 Medium
-- Show departments having more than 2 employees.
select dept_id,count(emp_id) as count_of_emp from employee group by dept_id having count_of_emp>2;

-- Show departments where total salary > 100000.
select dept_id,sum(salary) as total_salary from employee group by dept_id having total_salary>100000;

-- Show departments where avg salary > 35000.
select dept_id,avg(salary) as avg_salary from employee group by dept_id having avg_salary>35000;

-- Find departments where max salary > 40000.
select dept_id,max(salary) as max_salary from employee group by dept_id having max_salary>40000;

-- Find departments where min salary < 30000.
select dept_id,min(salary) as min_salary from employee group by dept_id having min_salary<30000;

-- 🔴 Advanced
-- Show departments with avg salary between 30k and 50k.
select dept_id,avg(salary) as avg_salary from employee group by dept_id having avg_salary between 30000 and 50000;

-- Count employees only for departments where avg salary > 35000.
select dept_id,count(emp_id) as count_ofemp,avg(salary) as avg_salary from employee group by dept_id 
having avg_salary>35000;

-- Show dept_id and total salary sorted in descending order.
select dept_id,sum(salary) as total_salary from employee group by dept_id order by total_salary desc;

-- Show departments having exactly 3 employees.
select dept_id,count(*) as count_of_emp from employee group by dept_id having count_of_emp=3;

-- 🔹 SUBQUERY (Nested Query)
-- 👉 Meaning:
-- A query inside another query
-- 💡 Real-life example:
-- 👉 "Find employees whose salary is greater than average salary"
-- Steps:
-- Find average salary
-- Compare each employee with that value
select * from employee where salary > (select avg(salary) from employee);

-- SUBQUERY (Practice Questions)

-- 🟢 Basic
-- Find employees earning more than average salary.
select * from employee where salary >(select avg(salary) from employee);

-- Find employees earning less than average salary.
select * from employee where salary<(select avg(salary) from employee);

-- Find employee with highest salary.
select * from employee where salary =(select max(salary) from employee);

-- Find employee with lowest salary.
select * from employee where salary =(select min(salary) from employee);

-- Find employees working in 'HR' department.
select * from employee where dept_id =(select dept_id from department where dept_name="HR");

-- 🟡 Medium
-- Find employees working in same department as 'Hruta'.
select * from employee where dept_id=(select dept_id from employee where emp_name="Hruta");

-- Find employees whose salary is above overall avg but below max salary.
select * from employee where salary > (select avg(salary) from employee) 
and salary < (select max(salary) from employee);

-- Find second highest salary.
select max(salary) from employee where salary < 
(select max(salary) from employee);
select emp_id,emp_name,max(salary) from employee group by emp_id  order by max(salary) desc limit 1 offset 1;

-- Find employees not working in 'IT' department.
select * from employee where dept_id !=(select dept_id from department where dept_name ="IT");

