drop database if exists furnitureStore;
create database furnitureStore;

use furnitureStore;

create table customerInfo (
customer_id int (10) not null,
first_name varchar (50) not null,
last_name varchar (50) not null,
mailaddress varchar (100) not null,
address varchar (100),
postal_code varchar(20) not null,
city varchar(50) not null,
telephone int (20) not null
);
insert into furnitureStore.customerInfo
values
(012,'David','Johnson','davidj@mail.com','gatan 23','12345','Örebro',0123456789),
(013,'John','Davidson','johnd@mail.com','vägen 8','23456','Stockholm',0125436789);

create table employees(
employee_id int (10) not null,
first_name varchar (50) not null,
last_name varchar (50) not null,
adress varchar (100) not null, 
mail varchar (100) not null,
salary float (24)
);

insert into furnitureStore.employees
values
(1234,'Martin','Charlemaine','Vägen 4','mail@mail.se',20000),
(2345,'Emily','Arnelid','Vägen 5','emilyar@mail.se',20001),
(3456,'Bill','Palmstedt','Gatan 74','f@mail.se',8);

create table orders(
order_id int(10) not null,
order_date date not null,
quantity int (10) not null
);

create table products(
product_id int (10) not null,
product_name varchar (50) not null,
stock_status int (10) not null,
cost int (10) not null
);

insert into furnitureStore.products
values
(123,'Table',30,4000),
(234,'Chair',50,1700),
(345,'Couch',23,12000),
(456,'Bed',2,9000),
(567,'Carpet',10, 1500),
(678,'Armchair',5,900);

create table suppliers(
supplier_id int (10) not null,
supplier_name varchar (50) not null,
telephone int (20) not null,
mail varchar (100) not null
);
insert into furnitureStore.suppliers
values
(11,'Happy beds',0123456789,'hb1@happybeds.com'),
(12,'Sad tables',0135792468,'st1@sadtables.se');

create table transactions(
transaction_id int (10) not null,
transaction_date date 
);
