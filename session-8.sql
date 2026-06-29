#session-8
/*1.Create two tables in your SQL database: Users (user_id, username, city) and Orders (order_id, user_id, product, amount). Insert at least 3 users and 5 orders, making sure some users have no orders.*/
create table user(user_id int primary key,username varchar(50),city varchar(50));
insert into user values(101,'Divya','Ahmedabad'),
(102,'Priya','Surat'),
(103,'Amit','Vadodara'),
(104,'Neha','Rajkot');     /*User 104 (Neha) has no order*/
create table orderss(order_id int primary key,user_id int,product varchar(50),amount decimal(10,2));
insert into orderss values(1,101,'Pizza',450.00),
(2,101,'Burger',250.00),
(3,102,'Pasta',350.00),
(4,103,'Sandwich',200.00),
(5,105,'Cold Coffee',180.00);        /* user_id = 105  not exist in the user table- right join.*/

/*2.Write an SQL query using INNER JOIN to list all usernames and their ordered products, showing only users who have placed at least one order.*/
select u.username ,o.product
from user u
inner join  orderss o
on u.user_id=o.user_id;
/*3.Write an SQL query using LEFT JOIN to display all usernames along with their ordered products. For users who haven't placed any orders, show NULL for the product.*/
select u.username ,o.product
from user u
left join  orderss o
on u.user_id=o.user_id;
/*4.
Write an SQL query using RIGHT JOIN to show all orders and the corresponding username for each order. If an order has a user_id that doesn't exist in the Users table, display NULL for the username.<br><br><em><strong>Hint:</strong> Try deleting one user and keeping their order to test this case.</em>*/
select u.username ,o.order_id,o.product,o.amount
from user u
right join  orderss o
on u.user_id=o.user_id;
/*5.Suppose you want to analyze food delivery data like Zomato. Create a CustomerSegments table (segment_id, segment_name), and link it to Users with a foreign key. Write an SQL query to show each username, their segment name, and total order amount (use JOINs as needed).*/
create table CustomerSegments (segment_id int primary key,segment_name varchar(50));
insert into CustomerSegments values(1,'Silver'),(2,'Gold'),(3,'Platinum');
#Add segment_id to users
alter table user
add segment_id int;
# add foreign key
alter table user
add  constraint fk_segment
foreign key (segment_id)
references CustomerSegments(segment_id);
#update users
update user set segment_id = 1 where user_id = 101;
update user set segment_id = 2 where user_id = 102;
update user set segment_id = 3 where user_id = 103;
update user set segment_id = 1 where user_id = 104;

select u.username,cs.segment_name
from users u
left join CustomerSegments cs
on u.segment_id=cs.segment_id
left join orderss o
on u.user_id=o.user_id
group by u.user_id,u.username,cs.segment_name;
select * from CustomerSegments;