create database furnitureStore;

create table if not exists customerInfo (
'customer_id' int (10) not null auto_increment,
'first_name' varchar (50) not null,
'last_name' varchar (50) not null,
'mailaddress' varchar (100) not null,
'address' varchar (100),
'telephone' int (20) not null
)


create table if not exists supplier (
'supplierID' int (10) not null,
'supplier_name' varchar (50) not null,
'telephone' int (20) not null,
'mail' varchar (100) not null,
'address' varchar(100)
)

create table if not exists employees(
'empoyee_id' int (10) not null,
'first_name' varchar (50) not null,
'last_name' varchar (50) not null,
'adress, mail' varchar (100) not null
)

create table if not exists products(
'product_id' int (10) not null,
'name' varchar (50) not null,
'stock_Status' int (10) not null
)

create table if not exists transactions(
'transaction_id' int (10) not null,
'payment_method' varchar (100) not null,
'salaries' float (24)
)


create table if not exists transaction_history()

create table if not exists  orders('order_id')
