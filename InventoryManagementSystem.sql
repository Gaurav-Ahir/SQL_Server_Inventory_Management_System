--create database SQL_Practical

--create table salesman(salesman_id int primary key, name varchar(50),
--city varchar(50), commission float) 

--create table customer(customer_id int primary key, 
--customer_name varchar(50), city varchar(50),
--grade int, salesman_id int)

--create table orders(order_no int primary key, purch_amt float, 
--order_date date, customer_id int, salesman_id int)


--alter table customer add foreign key(salesman_id) 
--references salesman(salesman_id)

--alter table orders add foreign key(customer_id)
--references customer(customer_id)

--alter table orders add foreign key(salesman_id)
--references salesman(salesman_id)

--insert into salesman values
--(5007, 'Paul Adam', 'Rome', 0.13),
--(5002, 'Nail Knite', 'Paris', 0.13),
--(5005, 'Pit alex', 'London', 0.11),
--(5006, 'Mc Lyon', 'Paris', 0.14),
--(5003, 'Lauson Hen', null, 0.12)


--insert into customer values
--(3002, 'Nick Rimando', 'New York', 100, 5001),
--(3005, 'Graham Zusi', 'California', 200, 5002),
--(3001, 'Brad Guzan', 'London', null, null),
--(3004, 'Fabian Johns', 'Paris', 300, 5006),
--(3007, 'Brad Davis', 'New York', 200, 5001),
--(3009, 'Geoff Camero', 'Berlin', 100, null),
--(3008, 'Julian Green', 'London', 300, 5002),
--(3003, 'Jozy Altidor', 'Moncow', 200, 5007)

--insert into orders values
--(70001, 150.5, '2016-10-05', 3005, 5002),
--(70009, 270.65, '2016-09-10', 3001, null),
--(70002, 65.26, '2016-10-05', 3002, 5001),
--(70004, 110.5, '2016-08-17', 3009, null),
--(70007, 948.5, '2016-09-10', 3005, 5002),
--(70005, 2400.6, '2016-07-27', 3007, 5001),
--(70008, 5760, '2016-09-10', 3002, 5001),
--(70010, 1983.43, '2016-10-10', 3004, 5006),
--(70003, 2480.4, '2016-10-10', 3009, null),
--(70012, 250.45, '2016-06-27', 3008, 5002),
--(70011, 75.29, '2016-08-17', 3003, 5007)

--1
--select name, commission from salesman

--2
--select distinct salesman_id from orders

--3
--select name, city from salesman where city = 'Paris'

--4
--select * from customer where grade = 200

--5
--select order_no, order_date, purch_amt from orders
--where salesman_id = 5001

--12
--select * from customer
--where city = 'New York' or not grade > 100

--13
--select * from salesman where commission between 0.12 and 0.14

--14
--select * from customer where customer_name like '%n'

--15
--select * from salesman where name like 'N__L%'

--16
--select * from customer where grade is null

--17
--select sum(purch_amt) from orders

--18
--select count(distinct salesman_id) from orders

--19
--select city, max(grade) from customer 
--group by city

--20
--select customer_id, max(purch_amt) from orders
--group by customer_id

--21
--select customer_id, order_date, max(purch_amt) from orders
--group by customer_id, order_date

--22
--select salesman_id, max(purch_amt) from orders where
--order_date = '2012-08-17'
--group by salesman_id

--23
--select customer_id, max(purch_amt) from orders
--group by customer_id
--having max(purch_amt) > 2000

--24
--select count(*) from orders
--where order_date >= '2012-08-17'

--1
--select s.name, c.customer_name, s.city
--from salesman s
--join customer c
--on s.city = c.city

--2
--select c.customer_name, s.name
--from customer c
--join salesman s
--on c.salesman_id = s.salesman_id

--3
--select o.order_no, c.customer_name, o.customer_id,
--o.salesman_id
--from orders o
--join customer c
--on o.customer_id = c.customer_id
--join salesman s
--on o.salesman_id = s.salesman_id
--where s.city <> c.city

--4
--select o.order_no, o.purch_amt, o.order_date,
--o.customer_id, o.salesman_id
--from orders o
--join salesman s
--on o.salesman_id = s.salesman_id
--where s.name = 'paul adam'

--5
--select * from orders
--where purch_amt > (select avg(purch_amt) from orders)
--and order_date = '2012-10-10'

--6
--select o.order_no, o.purch_amt, o.order_date,
--o.customer_id, o.salesman_id
--from orders o
--join salesman s
--on o.salesman_id = s.salesman_id
--where s.city = 'paris'

--7
--select o.order_no, o.purch_amt, o.order_date,
--o.customer_id, o.salesman_id
--from orders o
--join salesman s
--on o.salesman_id = s.salesman_id
--where s.commission = (select max(commission) from salesman)

--8
--select s.salesman_id, s.name from salesman s
--join customer c
--on s.salesman_id = c.salesman_id
--group by s.salesman_id, s.name
--having count(c.salesman_id) > 1

--9
--select s.salesman_id, s.name from salesman s
--join customer c
--on s.salesman_id = c.salesman_id
--group by s.salesman_id, s.name
--having count(c.salesman_id) = 1

--10
--Display all the orders that had amounts that were greater than at
--least one of the orders from September 10th 2016.
select * from orders where purch_amt > (select min(purch_amt) 
from orders where order_date = '2016-09-10')


--11
--display only those customers whose grade are, infact, higher than every customer in New York.

select * from customer where
grade > (select max(grade) from customer where city = 'new york')







