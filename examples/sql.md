## SQL Code Example

```sql
-- This is a comprehensive SQL demo file showcasing various features
-- Comments can be written with double dashes

/*
Multi-line comments
can be written this way
*/

-- Database Creation
CREATE DATABASE demo_database;
USE demo_database;

-- Table Creation with Various Data Types and Constraints
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE DEFAULT CURRENT_DATE,
    salary DECIMAL(10,2) CHECK (salary >= 0),
    department_id INT,
    status ENUM('active', 'inactive', 'on_leave'),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    budget DECIMAL(15,2),
    CONSTRAINT positive_budget CHECK (budget > 0)
);

-- Adding Foreign Key Constraint
ALTER TABLE employees
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id) REFERENCES departments(department_id)
ON DELETE SET NULL
ON UPDATE CASCADE;

-- Creating an Index
CREATE INDEX idx_employee_name 
ON employees(last_name, first_name);

-- Inserting Data with Different Methods
INSERT INTO departments VALUES 
(1, 'Engineering', 1000000.00),
(2, 'Marketing', 500000.00),
(3, 'Sales', 750000.00);

INSERT INTO employees 
(first_name, last_name, email, salary, department_id, status)
VALUES 
('John', 'Doe', 'john.doe@example.com', 75000.00, 1, 'active'),
('Jane', 'Smith', 'jane.smith@example.com', 82000.00, 2, 'active');

-- Updating Data
UPDATE employees 
SET salary = salary * 1.1
WHERE department_id = 1 
AND YEAR(hire_date) < YEAR(CURRENT_DATE);

-- Complex SELECT Queries
-- Subquery and JOIN example
SELECT 
    e.first_name,
    e.last_name,
    d.name AS department,
    e.salary,
    (SELECT AVG(salary) FROM employees) AS company_avg_salary
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT AVG(salary) 
    FROM employees 
    WHERE department_id = e.department_id
)
ORDER BY e.salary DESC;

-- Common Table Expression (CTE)
WITH dept_stats AS (
    SELECT 
        department_id,
        COUNT(*) as emp_count,
        AVG(salary) as avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT 
    d.name,
    ds.emp_count,
    ds.avg_salary
FROM dept_stats ds
JOIN departments d ON ds.department_id = d.department_id;

-- Window Functions
SELECT 
    first_name,
    last_name,
    salary,
    department_id,
    RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) as salary_rank,
    AVG(salary) OVER (PARTITION BY department_id) as dept_avg_salary
FROM employees;

-- Creating a View
CREATE VIEW employee_summary AS
SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) as full_name,
    d.name as department,
    e.salary
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

-- Creating a Stored Procedure
DELIMITER //
CREATE PROCEDURE give_raise(
    IN emp_id INT,
    IN raise_percentage DECIMAL(5,2)
)
BEGIN
    UPDATE employees
    SET salary = salary * (1 + raise_percentage/100)
    WHERE employee_id = emp_id;
END //
DELIMITER ;

-- Creating a Trigger
CREATE TRIGGER before_employee_update
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary < OLD.salary THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be decreased';
    END IF;
END;

-- Example of CASE statement in SELECT
SELECT 
    first_name,
    last_name,
    salary,
    CASE 
        WHEN salary < 50000 THEN 'Entry Level'
        WHEN salary BETWEEN 50000 AND 100000 THEN 'Mid Level'
        ELSE 'Senior Level'
    END as salary_bracket
FROM employees;

-- Cleanup (if needed)
-- DROP VIEW employee_summary;
-- DROP PROCEDURE give_raise;
-- DROP TRIGGER before_employee_update;
-- DROP TABLE employees;
-- DROP TABLE departments;
-- DROP DATABASE demo_database;
```