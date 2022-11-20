CREATE TABLE stud_marks
(
    name varchar2(25),
    total_marks NUMBER
);

CREATE TABLE results
(
    roll int ,
    name varchar2(25),
    grade varchar2(50)
);

CREATE PROCEDURE proc
(roll IN NUMBER, namee IN varchar2, total_marks IN NUMBER)
AS
BEGIN
    DECLARE grade varchar2(50);
    BEGIN
    IF(total_marks <= 1500 and total_marks >= 990) THEN
        grade := 'Distinction';
    ElSIF(total_marks <= 989 and total_marks >= 900) THEN
        grade := 'First Class';
    ELSIF(total_marks <= 899 and total_marks >= 825) THEN
        grade := 'Higher Second Class';
    ELSE
        grade := 'FAIL';
    END IF;
    INSERT INTO results VALUES(roll, namee, grade);
    END;
END proc;
/

BEGIN
proc(1, 'Ajay', 1000);
proc(2, 'Arun', 950);
proc(3, 'Anu' , 850);
proc(4, 'Vijay', 800);
END;
/

SELECT * FROM results