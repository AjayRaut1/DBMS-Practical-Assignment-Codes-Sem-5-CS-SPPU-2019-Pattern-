-- Assignment Number 4

-- PL/SQL

-- Problem Statement:
-- Unnamed PL/SQL code block: Use of Control structure and Exception handling is mandatory.
-- Schema : 
-- 1. Borrower(Roll_no, Name, DateofIssue, NameofBook, Status) 
-- 2. Fine(Roll_no,Date,Amt) Accept roll_no & name of book from user. 
-- Check the number of days (from date of issue), if days are between 15 to 30 then fine amount will 
-- beRs 5per day. 
-- If no. of days>30, per day fine will be Rs 50 per day & for days less than 30, Rs. 5 per day. 
-- After submitting the book, status will change from I to R. 
-- If condition of fine is true, then details will be stored into fine table.

-- Step 1) Create Table by selecting only the create tables commands (one by one ) 
--         and execute PL/sql block separately

CREATE TABLE BORROWER
(
roll_no NUMBER, 
name VARCHAR2(25), 
dateofissue DATE,
name_of_book VARCHAR2(25), 
status VARCHAR2(20)
);

CREATE TABLE FINE
(
roll_no NUMBER,
date_of_return DATE,
amt NUMBER
);

INSERT INTO borrower VALUES(54,'SUDARSHAN',TO_DATE('01-10-2022','DD-MM-YYYY'),'HARRY POTTER','I');
INSERT INTO borrower VALUES(56,'SUMIT',TO_DATE('15-10-2022','DD-MM-YYYY'),'DARK MATTER','I');
INSERT INTO borrower VALUES(68,'MANDAR',TO_DATE('24-09-2022','DD-MM-YYYY'),'SILENT HILL','I');
INSERT INTO borrower VALUES(66,'SIDDHAM',TO_DATE('26-08-2022','DD-MM-YYYY'),'GOD OF WAR','I');
INSERT INTO borrower VALUES(50,'SHREYAS',TO_DATE('09-09-2022','DD-MM-YYYY'),'SPIDER-MAN','I');

-- Step 2) Run below commands all at once

DECLARE 
i_roll_no NUMBER := 54;
name_of_book VARCHAR2(25);
no_of_days NUMBER;
return_date DATE := TO_DATE(SYSDATE,'DD-MM-YYYY');
temp NUMBER;
doi DATE;
fine NUMBER;

BEGIN
i_roll_no := i_roll_no;
name_of_book := '&nameofbook';
--dbms_output.put_line(return_date);
SELECT to_date(borrower.dateofissue,'DD-MM-YYYY') INTO doi FROM borrower
WHERE borrower.roll_no = i_roll_no AND borrower.name_of_book = name_of_book;
no_of_days := return_date-doi;
dbms_output.put_line(no_of_days);
IF (no_of_days >15 AND no_of_days <=30) THEN
fine := 5*no_of_days;
ELSIF (no_of_days>30 ) THEN
temp := no_of_days-30;
fine := 150 + temp*50;
END IF;
dbms_output.put_line(fine);
INSERT INTO fine VALUES(i_roll_no,return_date,fine);
UPDATE borrower SET status = 'R' WHERE borrower.roll_no = i_roll_no;
END;
/

-- Step 3) To display the tables use select commands

SELECT * FROM FINE
SELECT * FROM BORROWER