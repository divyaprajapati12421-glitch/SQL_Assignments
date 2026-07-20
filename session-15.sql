create database datetime;
use datetime;
#session -15
#1.Write an SQL query using the NOW() function to display the current date and time as 'CurrentDateTime' in your result set.
select now()as currentdatetime;
#2.Suppose you have a table called Orders with a column order_date (DATE type). Write a query to display each order's order_date, the year, month, and day as separate columns using YEAR(), MONTH(), and DAY().
create table orders (order_id int primary key,order_date date);
insert into orders values(101, '2026-07-15'),(102, '2026-06-20'),(103, '2025-12-25'),(104, '2024-01-10');
select order_date,year(order_date)as year,month(order_date)as month,day(order_date)as day from orders;
#3.Imagine you are building a feature like Zomato's order delivery estimate. Given a table Deliveries with a column delivery_date, write a query to show delivery_date and a new column expected_pickup_date which is 2 days before delivery_date using DATE_SUB().
create table deliveries (delivery_id int primary key,delivery_date date);
insert into deliveries values(1,'2026-07-20'),(2,'2026-07-25'),(3,'2026-08-10'),(4,'2026-09-05');
select delivery_date,date_sub(delivery_date, interval 2 day)as expected_pickup_date from deliveries;
#4.You have a table called Subscriptions with columns user_id, start_date, and end_date. Write a query to display user_id, start_date, end_date, and the total number of days of each subscription using DATEDIFF().<br><br><em><strong>Hint:</strong> Use DATEDIFF(end_date, start_date) to get the duration.</em>
create table subscriptions(user_id int,start_date date,end_date date);
insert into subscriptions values (101,'2026-07-01','2026-07-15'),(102,'2026-06-10','2026-06-25'),(103,'2026-05-05','2026-05-20'),(104,'2026-01-01','2026-02-01');
select user_id,start_date,end_date,datediff(end_date,start_date)as total_days from subscriptions;
#5.Create an SQL query for a table named AppLogins (columns: user_id, last_login_date) to find all users who haven't logged in for more than 30 days from today. Use NOW() and DATEDIFF() in your query.<br><br><em><strong>Constraint:</strong> Only select user_id and last_login_date for users who meet the criteria.</em>
create table applogins(user_id int,last_login_date date);
insert into applogins values (101,'2026-06-10'),(102,'2026-07-18'),(103,'2026-05-20'),(104,'2026-07-01');
select user_id,last_login_date from applogins 
where datediff(now(), last_login_date) > 30;
