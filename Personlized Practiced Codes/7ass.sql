CREATE TABLE cust_new
(
    new_name varchar2(25)
);

INSERT INTO cust_new VALUES ('ABC');

CREATE TABLE cust_old
(
    old_name varchar2(25)
);

INSERT INTO cust_old VALUES ('ABC');
INSERT INTO cust_old VALUES ('PQR');
INSERT INTO cust_old VALUES ('XYZ');

-- PL/SQL block for declaring, then opening , then fetching and finally closing cursor 

DECLARE
    CURSOR cur1 IS
        SELECT new_name FROM cust_new;
    CURSOR cur2 IS
        SELECT old_name FROM cust_old;
    temp_new_name varchar2(25);
    temp_old_name varchar2(25);
    
BEGIN
    OPEN cur1;
    OPEN cur2;
    
    LOOP
    
        FETCH cur1 INTO temp_new_name;
        FETCH cur2 INTO temp_old_name;
        
        EXIT WHEN cur2%FOUND = FALSE;
        
        IF temp_new_name <> temp_old_name THEN
            INSERT INTO cust_new VALUES (temp_old_name);
        END IF;
    
    END lOOP;
    
    CLOSE cur1;
    CLOSE cur2;
END;
/

-- displaying newly inserted values 
SELECT * FROM cust_new;