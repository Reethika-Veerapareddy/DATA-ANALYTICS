create database fun;
use fun;
create table players(
player_id int ,
player_name varchar(20),
country varchar(20),
goals int );
insert into players values(1,"ronaldo",'portugal',100);
insert into players values(2,'nessi','argentina',90);
insert into players values(3,'reethu','brazil',87);
insert into players values(4,'moulika','tirupati',90);
insert into players values(5,'akmahi','madanapalle',86);
select * from players;

#Q. RETURN PLAYERS WHOSE GOASLS > 80
delimiter &&
create procedure top_player1()
begin
select player_name,player_id,goals from players where goals>80;
end&&
delimiter ;

call top_player1();

# 2 types of stored proc---> in & out

#Q. CREATE PROCEDURE WHICH RETURNS TOP PLAYERS BAESD ON GOALS .
select * from players order by goals limit 1; #limit num of rows in output

delimiter &&
create procedure top_player_sort_by_goals(in num int)
begin
select * from players order by goals limit num;
end&&
delimiter ;

call top_player_sort_by_goals(3);

#Q. UPDATE PLAYER
set SQL_SAFE_UPDATES=0;
update players set goals=100 where player_name='REETHU' ;

delimiter //
create procedure update_player_footballS(in num int,in player varchar(20))
begin
update players set goals=num where player_name=player ;
end//
delimiter ;
call update_player_footballS(120,"akmahi");
select *from players;

#Q. TOTAL COUNT OF PLAYERS IN AS SPECIFIC COUNTRY
delimiter //
create procedure player_count(in var varchar(20),out total_player int)
begin
select count(*) from players where country=var into total_player;
end//
delimiter ;
call player_count('tirupati',@total_count);
select @total_count as player_count1;
select @total_count;


#window function 
use introd_sql;
show tables;
select * from ecommerce_transactions;

create table ProductCategorycountry1 as
select sum(age), Product_Category from ecommerce_transactions group by Product_Category;

select * from ProductCategorycountry1;

select a.Product_Category,a.*,sum(age)
over (partition by a.Product_Category) as
total_age from ecommerce_transactions a;

select a.age,a.*,sum(Purchase_Amount)
over (partition by a.age) as
total_Purchase_Amount from ecommerce_transactions a;

select row_number() over (order by Purchase_Amount)
as row_num , Product_Category,Purchase_Amount from ecommerce_transactions 
order by Purchase_Amount;

select row_number() over (order by Product_Category)
as row_num,Product_Category from ecommerce_transactions
order by Product_Category;

CREATE table demo (var_a int);
insert into demo values(101),(102),(103),(103),(104),(105),(106),(106);
select * from demo;

select var_a,
rank() over (order by var_a) as tese_ranks
from demo;
#housing dataset not there dont run 
use introd_sql;
show tables;
select * from housing;

select households from housing
where total_rooms = (select max(total_rooms) from housing);

select households from housing order by
total_rooms desc limit 1;

select *,first_value(housing_median_age) over
(order by total_rooms desc) as
highest from housing;