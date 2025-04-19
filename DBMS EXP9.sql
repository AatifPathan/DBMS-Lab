-- Step 1: Create the Student table
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    department VARCHAR(50)
);

-- Step 2: Create the Student_Log table
CREATE TABLE Student_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    name VARCHAR(100),
    action_type VARCHAR(10),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 3: Create the INSERT Trigger
CREATE TRIGGER after_student_insert
AFTER INSERT ON Student
FOR EACH ROW
BEGIN
    INSERT INTO Student_Log (student_id, name, action_type)
    VALUES (NEW.student_id, NEW.name, 'INSERT');
END;

-- Step 4: Create the UPDATE Trigger
CREATE TRIGGER after_student_update
AFTER UPDATE ON Student
FOR EACH ROW
BEGIN
    INSERT INTO Student_Log (student_id, name, action_type)
    VALUES (NEW.student_id, NEW.name, 'UPDATE');
END;

-- Step 5: Create the DELETE Trigger
CREATE TRIGGER after_student_delete
AFTER DELETE ON Student
FOR EACH ROW
BEGIN
    INSERT INTO Student_Log (student_id, name, action_type)
    VALUES (OLD.student_id, OLD.name, 'DELETE');
END;

-- Step 6: Insert sample student data
INSERT INTO Student (student_id, name, age, department) VALUES
(1, 'Alice Johnson', 20, 'Computer Science'),
(2, 'Bob Smith', 22, 'Mechanical Engineering'),
(3, 'Clara Lee', 19, 'Electrical Engineering');

-- Step 7: Update a student's data to see the trigger in action
UPDATE Student SET age = 21 WHERE student_id = 1;

-- Step 8: Delete a student to see the trigger in action
DELETE FROM Student WHERE student_id = 3;

-- Step 9: View the logs for all actions (INSERT, UPDATE, DELETE)
SELECT * FROM Student_Log;
