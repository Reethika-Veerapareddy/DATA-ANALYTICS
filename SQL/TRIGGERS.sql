create database trig;
use trig;

#AFTER INSERT Trigger

CREATE TABLE Student(
    id INT,
    name VARCHAR(20)
);

CREATE TABLE Student_Log(
    message VARCHAR(100)
);
delimiter &&
CREATE TRIGGER student_insert
AFTER INSERT
ON Student
FOR EACH ROW
BEGIN
    INSERT INTO Student_Log
    VALUES('New student added');
END;

INSERT INTO Student
VALUES(101,'Ram');

#BEFORE INSERT Trigger
CREATE TABLE Employee(
    id INT,
    salary INT
);
delimiter &&
CREATE TRIGGER check_salary
BEFORE INSERT
ON Employee
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Salary cannot be negative';
    END IF;
END;
INSERT INTO Employee
VALUES(1,-5000);
select * from Employee;
# UPDATE
CREATE TABLE Salary_Log(
    emp_id INT,
    old_salary INT,
    new_salary INT
);
insert into Employee values(1,20000);
SET SQL_SAFE_UPDATES = 0;
delimiter &&
CREATE TRIGGER salary_update
AFTER UPDATE
ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Salary_Log
    VALUES(
        OLD.id,
        OLD.salary,
        NEW.salary
    );
END;

UPDATE Employee
SET salary=30000
WHERE id=1;
select * from Employee;
# delete 
CREATE TABLE Student1(
    id INT PRIMARY KEY,
    name VARCHAR(30)
);
CREATE TABLE Deleted_Students(
    id INT,
    name VARCHAR(30)
);
delimiter **
CREATE TRIGGER student_delete
AFTER DELETE
ON Student
FOR EACH ROW
BEGIN
    INSERT INTO Deleted_Students
    VALUES(
        OLD.id,
        OLD.name
    );
END;
DELETE FROM Student
WHERE id=101;
#checking 
select * from Deleted_Students;