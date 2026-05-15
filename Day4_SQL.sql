-- Q1 Get names and salaries with column aliases as EmployeeName and EmployeeSalary
SELECT 
    emp_name AS EmployeeName, salary AS EmployeeSalary
FROM
    employee;

-- Q2 Show employees whose salary is greater than 30000
SELECT 
    *
FROM
    employee
WHERE
    salary > 30000;

-- Q3 Display employees sorted by salary in descending order
SELECT 
    *
FROM
    employee
ORDER BY salary DESC;

-- Q4 Get top 5 highest paid employees
SELECT 
    *
FROM
    employee
ORDER BY salary DESC
LIMIT 5;

-- Q5 Get 2nd highest paid employee using LIMIT and OFFSET
SELECT 
    *
FROM
    employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- Q6 Show employees whose age is less than 30 and salary greater than 25000
SELECT 
    *
FROM
    employee
WHERE
    age < 30 AND salary > 25000;

-- Q7 Show employee name with department name using table aliases
SELECT 
    e.emp_name, d.dept_name
FROM
    department d
        JOIN
    employee e ON e.dept_id = d.dept_id;

-- Q8 Get employees who belong to "HR" department
SELECT 
    e.emp_id, e.emp_name, e.dept_id, d.dept_name
FROM
    department d
        JOIN
    employee e ON e.dept_id = d.dept_id
WHERE
    d.dept_name = 'HR';

-- Q9 Display employee name, salary, and department name sorted by salary (high to low)
SELECT 
    e.emp_name, e.salary, d.dept_name
FROM
    department d
        JOIN
    employee e ON e.dept_id = d.dept_id
ORDER BY e.salary DESC;

-- Q10 Find total salary of each department with alias TotalSalary
SELECT 
    d.dept_id, d.dept_name, SUM(e.salary) AS TotalSalary
FROM
    employee e
        JOIN
    department d ON d.dept_id = e.dept_id
GROUP BY d.dept_id;

-- Q11 Find average salary of each department
SELECT 
    d.dept_name, AVG(e.salary) AS avgsalary
FROM
    employee e
        JOIN
    department d ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- Q12 Count number of employees in each department
SELECT 
    d.dept_name, COUNT(e.emp_id) AS count_of_employee
FROM
    employee e
        JOIN
    department d ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- Q13 Show departments where total salary is greater than 90000
SELECT 
    d.dept_name, SUM(e.salary) AS TotalSalary
FROM
    employee e
        JOIN
    department d ON d.dept_id = e.dept_id
GROUP BY d.dept_name
HAVING TotalSalary > 90000;

-- Q14 Show departments having more than 3 employees
SELECT 
    dept_id, COUNT(emp_id) AS count_of_employee
FROM
    employee
GROUP BY dept_id
HAVING count_of_employee > 3;

-- Q15 Show departments where average salary is greater than 30000
SELECT 
    dept_id, AVG(salary) AS avgsalary
FROM
    employee
GROUP BY dept_id
HAVING avgsalary > 30000;

-- Q16 Find employees whose salary is greater than average salary
SELECT 
    emp_id, emp_name, salary, AVG(salary) AS avgsalary
FROM
    employee
GROUP BY emp_id
HAVING salary > avgsalary;

-- Q17 Find department with highest total salary (use ORDER BY + LIMIT)
SELECT 
    d.dept_id, d.dept_name, SUM(e.salary) AS TotalSalary
FROM
    employee e
        JOIN
    department d ON d.dept_id = e.dept_id
GROUP BY d.dept_id
ORDER BY TotalSalary DESC
LIMIT 1;

-- Q18 Show employees working in departments where total salary is greater than 50000 
SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name,
    SUM(e.salary) AS TotalSalary
FROM
    employee e
        JOIN
    department d ON d.dept_id = e.dept_id
GROUP BY e.emp_id
HAVING TotalSalary > 50000;

-- 19 Find employees whose salary is greater than average salary
select * from employee where salary >(select avg(salary) from employee);

-- 20 Find employees whose salary is less than average salary
select * from employee where salary <(select avg(salary) from employee);

-- 21 Get employees who earn maximum salary
select * from employee where salary =(select max(salary) from employee);

-- 22 Get employees who earn second highest salary
select * from employee where salary=(select max(salary) from employee) limit 1 offset 1;

-- 23 Find departments where total salary is greater than overall average salary of all employees.
select dept_id,sum(salary) as Total_salary from employee group by dept_id having Total_salary >
(select avg(salary) from employee);

-- 24 Get employees who belong to department with highest total salary
select * from employee where dept_id=(select dept_id,sum(salary) as total from employee group by dept_id order by total desc limit 1);

