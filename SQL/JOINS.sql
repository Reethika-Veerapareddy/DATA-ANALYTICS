create database join_sql;

use join_sql;

create table customers
(
customername varchar(20),
customerid varchar(20),
address varchar(30),
city varchar(20),
postalcode varchar(20),
country varchar(20),
primary key(customerid)
);

create table order_info
(
orderid int,
customerid int,
employeeid int,
orderdate datetime,
shipperid int,
primary key(orderid)
);

insert into customers values('bhagya',1,'vempalli','kadapa','516329','India');
insert into customers values('sree',2,'vempalli','kadapa','516329','usa');
insert into customers values('hemu',3,'vempalli','kadapa','516329','usa');
insert into customers values('raja',4,'vempalli','kadapa','516329','Indai');
insert into customers values('suma',5,'vempalli','kadapa','516329','India');
insert into customers values('laxmi',6,'vempalli','kadapa','516329','India');
insert into customers values('nagi',7,'vempalli','kadapa','516329','usa');
insert into customers values('harshi',8,'vempalli','kadapa','516329','India');
insert into customers values('raghava',9,'vempalli','kadapa','516329','usa');
insert into customers values('reddy',10,'vempalli','kadapa','516329','India');

select * from customers;

select * from order_info;


insert into order_info values (901,1,1,sysdate(),92801);
insert into order_info values (902,1,1,sysdate(),92801);
insert into order_info values (903,3,3,sysdate(),92801);
insert into order_info values (904,2,2,sysdate(),92801);
insert into order_info values (905,4,4,sysdate(),92801);
insert into order_info values (906,5,5,sysdate(),92801);

select c.customerid,c.customername,c.country,o.orderid,o.orderdate
from customers c LEFT JOIN  order_Info o 
on c.customerid=o.customerid;

select c.customerid,c.customername,c.country,o.orderid,o.orderdate
from customers c RIGHT JOIN  order_Info o 
on c.customerid=o.customerid;

select o.customerid,c.customername,c.country,o.orderid,o.orderdate
from customers c , order_Info  o where
c.customerid=o.customerid;

SELECT c.customerid, c.customername, c.country, o.orderid,o.orderdate
FROM customers c
INNER JOIN order_info o
ON c.customerid = o.customerid;

select c.customerid,c.customername,c.country,o.orderid,o.orderdate
from customers c LEFT OUTER JOIN  order_Info o 
on c.customerid=o.customerid
UNION
select c.customerid,c.customername,c.country,o.orderid,o.orderdate
from customers c RIGHT OUTER JOIN  order_Info o 
on c.customerid=o.customerid;

select c.customerid,c.customername,c.country,o.orderid,o.orderdate
from customers c LEFT OUTER JOIN  order_Info o 
on c.customerid=o.customerid;

select c.customerid,c.customername,c.country,o.orderid,o.orderdate
from customers c RIGHT OUTER JOIN  order_Info o 
on c.customerid=o.customerid;