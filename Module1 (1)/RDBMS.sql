create database dataX;
use dataX;
create table customers(
customer_id int auto_increment primary key,
name varchar(100) not null,
email varchar(100) unique,
city varchar(50) default 'Unknown',
join_date date not null
);

insert into customers(name, email, city, join_date) 
values 
('Anurag', 'anurag@gmail.com', 'Delhi', '2023-01-10'),
('Ravi', 'ravi@gmail.com', 'Banglore', '2023-02-15'),
('Anu', 'anu@gmail.com', 'Banglore', '2023-02-15'),
('Akshya', 'akshya@gmail.com', 'Banglore', '2023-02-15'),
('Naina', 'naina@gmail.com', 'Banglore', '2023-02-15'),
('Saksham', 'saksham@gmail.com', 'Banglore', '2023-02-15'),
('Ram', 'ram@gmail.com', 'Banglore', '2023-02-15'),
('Priya', 'priya@gmail.com', NULL, '2023-03-22');

select * from customers;

DROP TABLE IF EXISTS orders;

create table orders(
order_id int auto_increment primary key,
customer_id int,
product_name varchar(100),
order_amount decimal(10,2),
order_date date,
foreign key (customer_id) references customers(customer_id)
);

insert into orders (customer_id, product_name, order_amount, order_date)
values
(1, 'iphone 14', 75000.00, '2023-03-01'),
(2, 'Airpods Pro', 20000.00, '2023-04-01'),
(3, 'iphone 14', 75000.00, '2023-03-01'),
(4, 'Airpods Pro', 75000.00, '2023-03-01'),
(5, 'Ipad Pro', 75000.00, '2023-03-01'),
(6, 'Mac Pro', 25000.00, '2023-03-01'),
(7, 'MackBook', 75000.00, '2023-03-01');

# we can use group by to find duplicated also like if more than 1 person is living in same city count>1 means duplicate
select city, count(*) from customers group by city;