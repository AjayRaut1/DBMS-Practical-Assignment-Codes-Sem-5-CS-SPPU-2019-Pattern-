-- Assignment Number 7

-- Cursors

-- Problem Statement:

-- Cursors: (All types: Implicit, Explicit, Cursor FOR Loop, Parameterized Cursor) 
-- Write a PL/SQL block of code using parameterized Cursor, that will merge the data available in 
-- the newly created table Cust_New with the data available in the table Cust_Old. If the data in the 
-- first table already exist in the second table then that data should be skipped.

CREATE TABLE Cust_New
(
Name VARCHAR2(15)
);
INSERT INTO Cust_New VALUES ('ABC');

CREATE TABLE Cust_Old
(
Name VARCHAR2(15)
);

INSERT INTO Cust_Old VALUES ('ABC');
INSERT INTO Cust_Old VALUES ('PQR');
INSERT INTO Cust_Old VALUES ('XYZ');


DECLARE
CURSOR cur1 IS
SELECT Name from Cust_Old;
CURSOR cur2 IS
SELECT Name from Cust_New;
R VARCHAR(15);
C_Name VARCHAR(15);
BEGIN
OPEN cur1;
OPEN cur2;
LOOP
Fetch cur1 into C_Name;
Fetch cur2 into R;
EXIT WHEN cur1%FOUND = FALSE;
IF R <> C_Name THEN
INSERT INTO Cust_New VALUES (C_Name);
END IF;
END LOOP;
CLOSE cur1;
END;
/


SELECT * FROM Cust_New;
