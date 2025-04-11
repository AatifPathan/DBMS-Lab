-- Create employee table
CREATE TABLE employee (
    empid INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Create accounts table with salary
CREATE TABLE accounts (
    empid INT,
    salary INT,
    account_number VARCHAR(20),
    FOREIGN KEY (empid) REFERENCES employee(empid)
);

-- Insert data into employee
INSERT INTO employee VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

-- Insert data into accounts (salary included)
INSERT INTO accounts VALUES
(1, 12000, 'ACC123'),
(2, 9000, 'ACC456'),
(3, 15000, 'ACC789');

-- Query in your format
SELECT name, salary
FROM employee, accounts
WHERE employee.empid = accounts.empid AND salary > 10000;
