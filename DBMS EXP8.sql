-- Create the employee table with UNIQUE and CHECK constraints
CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    email VARCHAR(100) UNIQUE,         -- ✅ UNIQUE constraint
    age INT CHECK (age >= 18),         -- ✅ CHECK constraint
    salary INT CHECK (salary > 0)      -- ✅ Optional: salary must be positive
);

-- Insert valid data
INSERT INTO employee VALUES
(1, 'Alice', 'HR', 'alice@example.com', 30, 12000),
(2, 'Bob', 'HR', 'bob@example.com', 28, 9500),
(3, 'Charlie', 'IT', 'charlie@example.com', 35, 15000),
(4, 'David', 'IT', 'david@example.com', 26, 11000),
(5, 'Eve', 'Sales', 'eve@example.com', 29, 8000);

-- a) ORDER BY clause: sort employees by salary (high to low)
SELECT * FROM employee
ORDER BY salary DESC;

-- b) HAVING clause: show departments with average salary > 10000
SELECT department, AVG(salary) AS avg_salary
FROM employee
GROUP BY department
HAVING AVG(salary) > 10000;

-- 🚫 Uncomment to test constraint violations:

-- Violates UNIQUE constraint (duplicate email)
-- INSERT INTO employee VALUES (6, 'Frank', 'Finance', 'alice@example.com', 32, 13000);

-- Violates CHECK constraint (age < 18)
-- INSERT INTO employee VALUES (7, 'Grace', 'Sales', 'grace@example.com', 16, 7000);
