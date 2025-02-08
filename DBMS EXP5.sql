CREATE TABLE student_details (
    roll_no INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    branch VARCHAR(50),
    marks1 INT,
    marks2 INT,
    marks3 INT
);

INSERT INTO student_details (roll_no, name, branch, marks1, marks2, marks3) VALUES
(101, 'Aatif', 'Computer Science', 85, 78, 90),
(102, 'Paul', 'Mechanical', 65, 72, 80),
(103, 'Sara', 'Electronics', 70, 75, 85),
(104, 'Shawn', 'Computer Science', 88, 92, 86),
(105, 'John', 'Electrical', 55, 60, 58);

SELECT * FROM student_details WHERE branch = 'Computer Science' AND marks1 > 80;
SELECT * FROM student_details WHERE branch = 'Mechanical' OR branch = 'Electrical';
SELECT * FROM student_details WHERE marks2 BETWEEN 70 AND 90;
SELECT * FROM student_details WHERE marks3 IS NULL;
SELECT * FROM student_details WHERE marks3 IS NOT NULL;
SELECT SUM(marks1) AS total_marks1 FROM student_details;
SELECT AVG(marks2) AS average_marks2 FROM student_details;
SELECT COUNT(*) AS total_students FROM student_details;
SELECT DISTINCT branch FROM student_details;
SELECT ROUND(AVG(marks3), 2) AS rounded_avg_marks3 FROM student_details;
SELECT MAX(marks1) AS highest_marks1 FROM student_details;
SELECT MIN(marks2) AS lowest_marks2 FROM student_details;