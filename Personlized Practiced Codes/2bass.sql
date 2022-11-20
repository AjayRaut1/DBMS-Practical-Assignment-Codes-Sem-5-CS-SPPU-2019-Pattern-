-- Design at least 10 SQL queries for suitable database
-- application using SQL DML statements: Insert, Select,
-- Update, Delete with operators, functions and set 
-- operator

create table student (
    roll_no number primary key,
    first_name varchar(25) not null,
    last_name varchar(25) not null,
    email varchar(250) not null
);

insert into student values (1, 'Ajay', 'Raut', 'ajay@gmail.com');
insert into student values (2, 'Arun', 'Roy', 'roy@gmail.com');
insert into student values (3, 'Vedant', 'Rajput', 'vedant@gmail.com');
insert into student values (4, 'Vijay', 'Ramanujan', 'vijay@gmail.com');
insert into student values (5, 'Sanjay', 'potter', 'sanjay@gmail.com');

update student 
set last_name = 'Patil'
where last_name = 'Roy';

select * from student;

update student 
set first_name = 'Jay'
where first_name = 'Vijay' or roll_no = 5;

select * from student;

update student 
set email = 'jay@gamil.com'
where first_name = 'Jay' and last_name = 'potter';

select * from student;

update student
set last_name = 'Pande'
where roll_no = 3 and last_name = 'Rajput';

select * from student;

select * from student order by roll_no desc;

-- select first_name from student group by roll_no;

select distinct first_name
from student;

select * from student
fetch first 4 rows only;

select * from student
fetch first 50 percent rows only;

select count(first_name),first_name
from student 
group by first_name;

select max(roll_no)
from student;

select min(roll_no)
from student;

select * from student
where first_name in ('Ajay','Jay');

-- for priting last 3 rows (logic)
create view reversedBottmRows as(
    select * from student
    order by roll_no desc
    fetch first 3 rows only
);

select * from reversedBottmRows  
order by roll_no asc;
-----logic ends

delete from student where roll_no=5;

drop table student;