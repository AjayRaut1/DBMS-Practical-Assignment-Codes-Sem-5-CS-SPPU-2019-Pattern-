-- Assignment Number 5

-- PL/SQL

-- Problem Statement:

-- 1. Write a PL/SQL code block to calculate the area of a circle for a value of radius varying 
-- from 5 to 9. Store the radius and the corresponding values of calculated area in an empty 
-- table named areas, consisting of two columns, radius and area.
-- Lab Exercise:
-- 1. Write a PL/SQL code block to calculate the area of a circle for a value of radius varying 
-- from 6 to 10. Store the radius and the corresponding values of calculated area in an empty 
-- table named areas, consisting of two columns, radius and area.
-- 2. Write a PL/SQL code block to calculate the area of a circle for a value of radius varying 
-- from 10 to 15. Store the radius and the corresponding values of calculated area in an empty 
-- table named areas, consisting of two columns, radius and area.
-- 3. Write a PL/SQL code block to calculate the area of a circle for a value of radius varying 
-- from 4 to 9. Store the radius and the corresponding values of calculated area in an empty 
-- table named areas, consisting of two columns, radius and area.

------------------------------------------------------------------------------------------------


-- 1. Write a PL/SQL code block to calculate the area of a circle for a value of radius varying 
-- from 5 to 9. Store the radius and the corresponding values of calculated area in an empty 
-- table named areas, consisting of two columns, radius and area.

-- Answer:

CREATE TABLE AREAS
(
RADIUS NUMBER(5),
AREA NUMBER(14,2)
);

DECLARE
pi constant number(4,2):=3.14;
radius number(5);
area number(14,2);
BEGIN
radius :=5;
while radius <=9
loop
area := pi*power(radius,2);
insert into areas values(radius,area);
radius := radius+1;
end loop;
end;
/

------------------------------------------------------------------------------------------------

-- Lab Exercise:
-- 1. Write a PL/SQL code block to calculate the area of a circle for a value of radius varying 
-- from 6 to 10. Store the radius and the corresponding values of calculated area in an empty 
-- table named areas, consisting of two columns, radius and area.

CREATE TABLE AREAS
(
RADIUS NUMBER(5),
AREA NUMBER(14,2));
DECLARE
pi constant number(4,2):=3.14;
radius number(5);
area number(14,2);
BEGIN
radius :=6;
while radius <=10
loop
area := pi*power(radius,2);
insert into areas values(radius,area);
radius := radius+1;
end loop;
end;
/
SELECT * FROM AREAS;

------------------------------------------------------------------------------------------------

-- Lab Exercise:
-- 2. Write a PL/SQL code block to calculate the area of a circle for a value of radius varying 
-- from 10 to 15. Store the radius and the corresponding values of calculated area in an empty 
-- table named areas, consisting of two columns, radius and area.

CREATE TABLE AREAS
(
RADIUS NUMBER(5),
AREA NUMBER(14,2));
DECLARE
pi constant number(4,2):=3.14;
radius number(5);
area number(14,2);
BEGIN
radius :=10;
while radius <=15
loop
area := pi*power(radius,2);
insert into areas values(radius,area);
radius := radius+1;
end loop;
end;
/
SELECT * FROM AREAS;

------------------------------------------------------------------------------------------------

-- Lab Exercise:
-- 3. Write a PL/SQL code block to calculate the area of a circle for a value of radius varying 
-- from 4 to 9. Store the radius and the corresponding values of calculated area in an empty 
-- table named areas, consisting of two columns, radius and area.

CREATE TABLE AREAS
(
RADIUS NUMBER(5),
AREA NUMBER(14,2));
DECLARE
pi constant number(4,2):=3.14;
radius number(5);
area number(14,2);
BEGIN
radius :=4;
while radius <=9
loop
area := pi*power(radius,2);
insert into areas values(radius,area);
radius := radius+1;
end loop;
end;
/
SELECT * FROM AREAS;