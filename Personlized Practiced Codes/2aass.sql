create table stud_databasee
(
    roll_no number primary key,
    first_name varchar2(35),
    last_name varchar2(35)
);

insert into stud_databasee values (1,'Ajay','Raut');
insert into stud_databasee values (2,'Harry','Potter');
insert into stud_databasee values (3,'Arun','Raut');
insert into stud_databasee values (4,'Anu','Raut');
insert into stud_databasee values (5,'Vandana','Raut');

-- desc_ribring data types of stud_databasee columuns
desc stud_databasee;


-- Creating view
create view stud_databasee_only_roll_no_vieww as (
    select roll_no,first_name from stud_databasee
);

select * from stud_databasee_only_roll_no_vieww;
drop view stud_databasee_only_roll_no_vieww;

-- Indexing 
create index index_name on stud_databasee(roll_no); 
drop index index_name;

-- Sequencing
create table emp
(
    id_no number primary key,
    emp_first_name varchar2(25) not null,
    emp_last_name varchar2(25)
);

create sequence id_no_seq
    increment by 1
    start with 1
    minValue 1
    maxValue 100
    cycle
    cache 2
    
insert into emp values (id_no_seq.NEXTVAL,'Sahil', 'Bhau');
insert into emp values (id_no_seq.NEXTVAL,'abhi', 'bhau');
insert into emp values (id_no_seq.NEXTVAL,'vanyi', 'Bhauuu');

select * from emp

-- Synonym
create synonym emp_copy for emp

select * from emp_copy

