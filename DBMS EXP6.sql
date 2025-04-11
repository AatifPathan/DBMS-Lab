-- Create employee table
CREATE TABLE employee (
    empid INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

-- Create manager table
CREATE TABLE manager (
    empid INT,
    management VARCHAR(50),
    FOREIGN KEY (empid) REFERENCES employee(empid)
);

-- Insert data into employee table
INSERT INTO employee VALUES 
(101, 'Alice', 'Sales'),
(102, 'Bob', 'HR'),
(103, 'Charlie', 'IT');

-- Insert data into manager table
INSERT INTO manager VALUES 
(101, 'Regional Manager'),
(103, 'IT Manager');

-- Perform join operation
SELECT name, management 
FROM employee, manager 
WHERE employee.empid = manager.empid;