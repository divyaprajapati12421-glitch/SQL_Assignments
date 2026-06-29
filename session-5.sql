#session-5
/*1.Write an SQL query using the DISTINCT keyword to find all unique payment methods used in the orders table of a food delivery app database.*/
create table orders (
    order_id int primary key,
    payment_method varchar(50));
insert into orders values
(1, 'Cash'),
(2, 'UPI'),
(3, 'Card'),
(4, 'UPI'),
(5, 'Cash'),
(6, 'Net Banking');
select distinct payment_method from orders;
/*2.Query the users table to list all cities where users have registered, but display each city only once and sort the result in alphabetical order (A-Z).*/
select distinct city from users order by city asc;
/*3.
Write an SQL query to select the top 5 most recent movie bookings from the bookings table, ordered by booking_date in descending order.*/
create table bookings (
    booking_id int primary key,
    movie_name varchar(100),
    booking_date date);
insert into bookings values
(1, 'Dangal', '2026-06-01'),
(2, 'Pathaan', '2026-06-10'),
(3, '3 Idiots', '2026-06-15'),
(4, 'Sholay', '2026-06-18'),
(5, 'PK', '2026-06-20'),
(6, 'Jawan', '2026-06-22');
select *from bookings
order by booking_date desc
limit 5;
/*4.
From a products table containing Flipkart-style product data (id, name, category, sold_count), write an SQL query to retrieve the 10 products with the highest sold_count, displaying only product name and sold_count, sorted from highest to lowest.<br><br><em><strong>Hint:</strong> Use ORDER BY and LIMIT together to achieve this.</em>*/
create table products (
    id int primary key,
    name varchar(100),
    category varchar(50),
    sold_count int);
insert into products values
(1, 'Laptop', 'Electronics', 120),
(2, 'Mobile', 'Electronics', 300),
(3, 'Shoes', 'Fashion', 180),
(4, 'Watch', 'Fashion', 90),
(5, 'Headphones', 'Electronics', 250),
(6, 'Bag', 'Fashion', 70);
select name, sold_count from products
order by sold_count desc
limit 10;