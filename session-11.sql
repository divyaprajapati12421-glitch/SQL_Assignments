#session-11
#1.Write a SQL query to display the names and ratings of restaurants (from a table named Restaurants) where the rating is higher than the average rating of all restaurants in the table.<br><br><em><strong>Hint:</strong> Use a subquery in the WHERE clause to calculate the average rating.</em>
create table restaurants (id int primary key auto_increment,name varchar(100),rating decimal(3,1));
insert into restaurants (name,rating)values
('Pizza Hut', 4.5),
('Dominos', 4.2),
('McDonalds', 3.9),
('KFC', 4.7),
('Subway', 4.1);
select name, rating from restaurants
where rating > (select avg(rating)from restaurants);
#2.In a Flipkart-style Products table (columns: product_id, name, price, category), write a SQL query to list each product name along with the average price of its category as an additional column using a scalar subquery in the SELECT statement.
alter table products add price decimal(10,2);
update products set price = 35000 where id = 1;
update products set price = 25000 where id = 2;
update products set price = 45000 where id = 3;
update products set price = 1200 where id = 4;
update products set price = 900 where id = 5;
select p.name,p.price,p.category,(select avg(price)from products
        where category = p.category) as avg_category_price from products p;
#3.Given a Playlists table (playlist_id, user_id, playlist_name) and a Users table (user_id, username), write a SQL query using a subquery in the FROM clause to show each username and the number of playlists they have created, displaying only users who have created more playlists than the average number of playlists per user.<br><br><em><strong>Hint:</strong> Use a derived table (subquery in FROM) to count playlists per user, then filter with a subquery in WHERE.</em>
create table playlists_new (playlist_id int primary key,user_id int,playlist_name varchar(100));
insert into playlists_new values
(101,1,'Workout'),
(102,1,'Travel'),
(103,1,'Party'),
(104,2,'Study'),
(105,2,'Romantic'),
(106,3,'Old Songs');
create table users_new (user_id int primary key,username varchar(100));
insert into users_new values (1,'Rahul'),(2,'Priya'),(3,'Amit'),(4,'Neha');
select u.username, pc.playlist_count
from users_new u
join(select user_id, count(*) as playlist_count
from playlists_new
group by user_id) pc
on u.user_id = pc.user_id
where pc.playlist_count > ( select avg(playlist_count)from (select count(*) AS playlist_count
from playlists_new
group by user_id) as avg_table);
#4.Suppose you have an Orders table (order_id, user_id, total_amount) for a food delivery app. Write a query to find all user_ids who have placed at least one order with a total_amount greater than the average order amount, using a subquery in the WHERE clause.
create table orders_new (order_id int primary key,user_id int,total_amount decimal(10,2));
insert into orders_new values
(1, 101, 500),
(2, 102, 800),
(3, 103, 1200),
(4, 101, 1500),
(5, 104, 300),
(6, 102, 2000);
select distinct user_id from orders_new
where total_amount >(select avg(total_amount)from orders_new);