-- main table
CREATE TABLE LibraryT
(
    book_id number(5),
    book_name varchar2(50),
    issued_by varchar2(25)
);

INSERT INTO LibraryT VALUES(1001, 'Rich Dad Poor Dad', 'Ajay');
INSERT INTO LibraryT VALUES(1002, 'The Richest Man in Babylon', 'Vijay');
INSERT INTO LibraryT VALUES(1003, 'Think and Grow Rich', 'Sanjay');
INSERT INTO LibraryT VALUES(1004, 'The Millionaire Mind', 'Jay');

-- backup table
CREATE TABLE Library_Audit
(
    book_id number(5),
    book_name varchar2(50),
    issued_by varchar2(25)
);

-- update trigger
CREATE TRIGGER updateTrigger
AFTER UPDATE
ON LibraryT
FOR EACH ROW
    
BEGIN
    INSERT INTO Library_Audit (book_id, book_name, issued_by)
    VALUES (:old.book_id, :old.book_name, :old.issued_by);
END;
/

-- delete trigger
CREATE TRIGGER deleteTrigger
AFTER DELETE
ON LibraryT
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit (book_id, book_name, issued_by)
    VALUES (:old.book_id, :old.book_name, :old.issued_by);
END;
/

-- triggering an update trigger by updating Library table
UPDATE LibraryT
SET issued_by = 'Arun'
WHERE issued_by = 'Ajay';


SELECT * FROM Library_Audit;
SELECT * FROM LibraryT;

-- triggering an delete trigger by deleting a row
DELETE FROM LibraryT
WHERE book_id = 1001;

SELECT * FROM Library_Audit;
SELECT * FROM LibraryT;