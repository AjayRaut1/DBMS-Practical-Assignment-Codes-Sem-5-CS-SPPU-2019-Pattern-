-- Assignment Number 8

-- Trigger

-- Problem Statement:

-- Database Trigger (All Types: Row level and Statement level triggers, Before and After Triggers).
-- Write a database trigger on Library table. The System should keep track of the records that are 
-- being updated or deleted. The old value of updated or deleted records should be added in 
-- Library_Audit table.

--  Table Creation 

CREATE TABLE Library
(
Book_Id NUMBER(5),
Book_Name VARCHAR2(20),
Book_Type VARCHAR2(20),
Issued_By VARCHAR2(20)
);

--  Table Insertion 

INSERT INTO Library VALUES (1234,'DBMS','Reference','Sudarshan');
INSERT INTO Library VALUES (1836,'TOC','Text','Siddham');
INSERT INTO Library VALUES (1996,'SPOS','Reference','Shreyas');
INSERT INTO Library VALUES (1196,'CNS','Text','Sairaj');

--  Table Creation

CREATE TABLE Back_UP
(
Book_Id NUMBER(5),
Book_Name VARCHAR2(20),
Book_Type VARCHAR2(20),
Issued_By VARCHAR2(20)
);

--  Trigger Creation

CREATE TRIGGER Update_Rec
AFTER UPDATE OR DELETE ON Library
FOR EACH ROW
BEGIN
INSERT INTO Back_UP
(Book_Id, Book_Name, Book_Type, Issued_By)
VALUES
(:old.Book_Id, :old.Book_Name, :old.Book_Type, :old.Issued_By);
END;
/
UPDATE LIBRARY
SET Issued_By = 'Sairaj'
WHERE Issued_By = 'Sumit';
SELECT * FROM Back_UP;