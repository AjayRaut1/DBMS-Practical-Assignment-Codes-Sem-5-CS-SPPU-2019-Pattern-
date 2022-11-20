-- SQL Queries – all types of Join, Sub-Query and
-- View:
-- Design at least 10 SQL queries for suitable database
-- application using SQL DML statements: all types of
-- Join,
-- Sub-Query and View.

create table customer(
    customerID number,
    customer_name varchar(30),
    customer_email varchar(30)
);

insert into customer values(1,'Ajay','ajay@gmail.com');
insert into customer values(2,'Sahil','sahil@gmail.com');
insert into customer values(3,'Vyanki','vyanki@gmail.com');
insert into customer values(4,'Abhi','abhi@gmail.com');

create table orders(
    orderID number,
    customerID number,
    order_item_name varchar2(30),
    order_amount number
);

insert into orders values(1001, 2 , 'Samosa', 30);
insert into orders values(1002, 4 , 'Samosa', 30);
insert into orders values(1003, 1 , 'Kachori', 20);
insert into orders values(1005, 1 , 'Idli', 40);
insert into orders values(1011, 9 , 'Pohe', 25);

-- inner join (returns only both table matching recors(intersection))
select customer.customerID, customer.customer_name , order_item_name , orders.order_amount
from orders
inner join customer 
on orders.customerid = customer.customerID;

-- left join (returns all left table recors + matching right recors)
select customer.customerID , customer.customer_name, orders.order_amount,order_item_name
from orders
left join customer
on orders.customerID = customer.customerID;

-- right join (returns all right table records + matching left table recors)
select * from 
orders
right join customer
on orders.customerID = customer.customerID;

-- full outer join (returns all records if matched in left or right table)
select *
from orders
full outer join customer
on orders.customerID = customer.customerID;