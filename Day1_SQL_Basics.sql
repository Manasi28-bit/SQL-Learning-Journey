-- ================================
-- Day 1: SQL Basics
-- ================================

-- Creating Database
CREATE DATABASE emp;
USE emp;

-- ================================
-- Creating Tables
-- ================================

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(20)
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(20),
    age INT,
    salary INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- ================================
-- Inserting Data
-- ================================

INSERT INTO department VALUES 
(1,'IT'),
(2,'HR'),
(3,'SALES'),
(4,'FINANCE');

INSERT INTO employee VALUES 
(101,'Manasi',21,35000,1),
(102,'Sanket',24,45000,4),
(103,'Bhavika',22,29000,3),
(104,'Shubham',23,30000,3),
(105,'Kajal',21,32000,2),
(106,'Sweta',22,32000,1),
(107,'Apeksha',23,22000,2),
(108,'Gautami',28,33000,4),
(109,'Rohit',45,40000,3),
(110,'Hruta',27,25000,2),
(111,'Priya',27,35000,3),
(112,'Arjun',29,45000,1),
(113,'Raj',30,26000,2),
(114,'Neha',28,30000,3),
(115,'Amit',31,32000,2);

-- ================================
-- Basic Queries Practice
-- ================================

-- 1. Get all employee details
SELECT * FROM employee;

-- 2. Show employee names and salaries
SELECT emp_name, salary FROM employee;

-- 3. Employees with salary > 38000
SELECT * FROM employee WHERE salary > 38000;

-- 4. Employees whose name starts with 'A'
SELECT * FROM employee WHERE emp_name LIKE 'A%';

-- 5. Employees in department 4
SELECT * FROM employee WHERE dept_id = 4;

-- 6. Sort employees by salary (high to low)
SELECT * FROM employee ORDER BY salary DESC;

-- 7. Salary between 25000 and 40000
SELECT * FROM employee WHERE salary BETWEEN 25000 AND 40000;

-- 8. Name contains 'a'
SELECT * FROM employee WHERE emp_name LIKE '%a%';

-- 9. Unique department IDs
SELECT DISTINCT dept_id FROM employee;

-- 10. Total number of employees
SELECT COUNT(*) AS total_employees FROM employee;