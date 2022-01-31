drop database if exists furnitureStore;
create database furnitureStore;
use furnitureStore;

create table customerInfo (
customer_id int (10) not null,
first_name varchar (50) not null,
last_name varchar (50) not null,
mailaddress varchar (100) not null,
address varchar (100),
telephone int (20) not null
);

create table employees(
empoyee_id int (10) not null,
first_name varchar (50) not null,
last_name varchar (50) not null,
adress varchar (100) not null, 
mail varchar (100) not null,
salary float (24)
);

create table orders(
order_id int(10) not null,
order_date date not null,
quantity int (10) not null
);

create table if not exists products(
product_id int (10) not null,
product_name varchar (50) not null,
stock_status int (10) not null,
cost int (10) not null
);

create table suppliers(
supplier_id int (10) not null,
supplier_name varchar (50) not null,
telephone int (20) not null,
mail varchar (100) not null,
address varchar(100)
);

create table transactions(
transaction_id int (10) not null,
payment_method varchar (100) not null,
transaction_date date not null
);
