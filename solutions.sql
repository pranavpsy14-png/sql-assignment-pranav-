
CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  name VARCHAR(50),
  dept_id INT,
  salary DECIMAL(8,2),
  hire_date DATE
);

CREATE TABLE departments (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(50),
  location VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'Engineering', 'Chennai'),
(2, 'Marketing', 'Mumbai'),
(3, 'HR', 'Delhi'),
(4, 'Finance', 'Bangalore');

INSERT INTO employees VALUES
(101, 'Arjun',   1, 75000, '2020-03-15'),
(102, 'Priya',   2, 55000, '2019-07-01'),
(103, 'Ravi',    1, 82000, '2021-01-10'),
(104, 'Sneha',   3, 48000, '2022-06-20'),
(105, 'Karthik', 2, 61000, '2020-11-05'),
(106, 'Divya',   1, 90000, '2018-09-30'),
(107, 'Mohan',   4, 70000, '2023-02-14'),
(108, 'Lakshmi', 3, 52000, '2021-08-08');


-- Task 1: Department Salary Report

-- Show each department's name, number of employees, and average salary
-- Only include departments with more than 1 employee
-- Sort by average salary descending

SELECT d.dept_name,
       COUNT(e.emp_id) AS total_employees,
       AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING COUNT(e.emp_id) > 1
ORDER BY avg_salary DESC;


-- Task 2: High Earners with Department Info

-- List employees who earn more than the overall company average salary
-- Show name, salary, and department name
-- Sort by salary descending

SELECT e.name,
       e.salary,
       d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE e.salary > (SELECT AVG(salary) FROM employees)
ORDER BY e.salary DESC;


