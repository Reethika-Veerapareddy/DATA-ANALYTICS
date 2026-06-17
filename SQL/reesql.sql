create database reethu;
use reethu;
create table students1(
Id int,
S_name varchar(20),
Age int,
Gender varchar(1),
Dept varchar(10)
);
DESC students1;
insert into students1 values (1,"reethu",19,"F","CSE");
insert into students1 values (2,"reethu1",18,"F","ECE");
insert into students1 values (3,"reethu2",17,"F","CSE");
insert into students1 values (4,"reethu3",16,"F","MECH");
insert into students1 values (5,"reethu4",15,"F","Civil");
alter table students1 modify Id int not null;
alter table students1 add primary key (Id);

create table department(
s_Id int, 
d_id int primary key,
d_name varchar(20),
foreign key (s_Id) references students1(Id)
);
desc department;
insert into department values (1,101,"cse");
insert into department values (2,102,"cse");
insert into department values (3,103,"civil");
use reethu;
create table emp(
e_id int not null,
manager_name varchar(20),
division int ,
primary key (e_id)
);

create table emp1(
first_name varchar(20),
last_name varchar(10),
title varchar(20),
age int ,
salary int
);
desc emp1;

alter table emp1 modify age int not null; 
alter table emp1 add gender varchar(1);
savepoint se;
alter table emp1 drop column gender;
rollback;
drop table emp1;
create table emp_info
(
e_id int primary key ,
first_name varchar(20),
last_name varchar(10),
age int ,
city varchar(10),
state varchar(20)
);
insert into emp_info values(1,"reethu","veera",20,"mpl","ap");
insert into emp_info values(2,"sanju","budha",22,"kurnool","ap");
insert into emp_info values(3,"seetha","reddy",25,"mpl","ap");
select * from emp_info;
select e_id,first_name from emp_info;

#aggregate functions
use reethu;
select city,count(e_id) from emp_info group by city;
select sum(e_id) from emp_info;
select min(e_id) from emp_info;
select max(e_id) from emp_info;
select round(78.9) from emp_info;


#string functions
use reethu;
select first_name,character_length(first_name) from emp_info;
select concat(first_name,last_name) from epm_info;
select trim(concat(first_name,last_name)) from emp_info;
select substr("SQL TUTORIAL",5,8) as extract_substr1;
select first_name , upper(firts_name) from emp_info;
select mid("Reethu",2,3);



