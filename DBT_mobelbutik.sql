drop database if exists furnitureStore;
create database furnitureStore;

use furnitureStore;

create table customerInfo (
customer_id int (10) not null primary key auto_increment,
first_name varbinary (1255) not null,
last_name varbinary (1255) not null,
mailaddress varchar (100) not null,
address varchar (100),
postal_code varchar(20) not null,
city varchar(50) not null,
telephone int (20) not null
);
alter table customerInfo
add salt varchar (50); 
insert into customerInfo
values
(012, AES_ENCRYPT (concat ('David','salt'),'key'), AES_ENCRYPT (concat ('Johnson','salt'), 'key'),'davidj@mail.com','gatan 23','12345','Örebro',0123456789,'salt'),
(013, AES_ENCRYPT (concat ('John','salt'), 'key'), AES_ENCRYPT (concat ('Davidson','salt'),'key'),'johnd@mail.com','vägen 8','23456','Stockholm',0125436789,'salt');


create table employees(
employee_id int (10) not null primary key auto_increment,
first_name varbinary (1255) not null,
last_name varbinary (1255) not null,
adress varchar (100) not null, 
mail varchar (100) not null,
salary binary (65)
);
alter table  employees
add salt varchar (50);

insert into furnitureStore.employees
values
(1234, AES_ENCRYPT (concat ('Martin','salt'),'key'), AES_ENCRYPT (concat ('Charlemaine','salt'),'key'),'Vägen 4','mail@mail.se',20000,'salt'),
(1235, AES_ENCRYPT (concat ('Emily','salt'),'key'), AES_ENCRYPT (concat ('Arnelid','salt'),'key'),'Vägen 5','emilyar@mail.se',20001,'salt'),
(1236, AES_ENCRYPT (concat ('Bill','salt'),'key'), AES_ENCRYPT (concat ('Palmstedt','salt'),'key'),'Gatan 74','f@mail.se',8,'salt');

SELECT cast(AES_DECRYPT (first_name,'key') AS char (50)), cast(aes_decrypt (last_name,'key') AS char (50)) FROM employees;

create table orders(
order_id int(10) not null primary key auto_increment,
order_date date not null
);

create table orderitems(
quantity int (10) not null,
totalSum decimal (10) not null
);


create table products(
product_id int (10) not null primary key auto_increment,
product_name varchar (50) not null,
stock_status int (10) not null,
cost int (10) not null
);

insert into furnitureStore.products
values
(112,'Table',30,4000),
(113,'Chair',50,1700),
(114,'Couch',23,12000),
(115,'Bed',2,9000),
(116,'Carpet',10, 1500),
(117,'Armchair',5,900);

create table suppliers(
supplier_id int (10) not null primary key auto_increment, 
supplier_name varchar (50) not null,
telephone int (20) not null,
mail varchar (100) not null
);
insert into furnitureStore.suppliers
values
(11,'Happy beds',0123456789,'hb1@happybeds.com'),
(12,'Sad tables',0135792468,'st1@sadtables.se');

create table transactions(
transaction_id int (10) not null primary key,
transaction_date date 
);