create database subque;
use subque ;
create table sub1(
emp_id int,
salary int
);
insert into sub1 values(1,10000);
insert into sub1 values(2,2000);
insert into sub1 values(3,560000);
select * from sub1;
#avg salary

select avg(salary) from sub;
#salary > avg sal

select * from sub1 where salary>(select avg(salary) from sub1);

# salary > specific person

select *from sub1 where salary>(select salary from sub1 where emp_id= '2');
#max salary
select max(salary) from sub1;
#salary < max salary
select emp_id,salary from sub1 where salary<(select max(salary) from sub1);
select salary from sub1 where emp_id=1;

#2nd highest salary

select max(salary) from sub1 where salary<(select max(salary) from sub1);

