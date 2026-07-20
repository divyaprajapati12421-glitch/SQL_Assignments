#session-18
#1.Create a SQL view named TopRatedRestaurants that selects the restaurant name, average rating, and total number of reviews from a table of Zomato-style restaurant reviews, showing only restaurants with an average rating above 4.0.
create table restaurants(restaurant_id int primary key,restaurant_name varchar(100),city varchar(50));
insert into restaurants values(1,'Spice Hub','Ahmedabad'),(2,'Food Palace','Mumbai'),(3,'Pizza Corner','Delhi'),(4,'Royal Dine','Pune');
create table reviews(review_id int primary key,restaurant_id int,rating decimal(2,1),
    foreign key(restaurant_id) references restaurants(restaurant_id));
    insert into reviews values (101,1,4.5),(102,1,4.2),(103,2,3.8),(104,2,4.0),(105,3,4.7),(106,3,4.9),(107,4,3.5);
create view topratedrestaurants as
select r.restaurant_name,avg(rv.rating)as average_rating,count(rv.review_id)as total_reviews
from restaurants r
inner join reviews rv
on r.restaurant_id = rv.restaurant_id
group by r.restaurant_name
having avg(rv.rating) > 4.0;
#2.Update the TopRatedRestaurants view to also include the city column from the original restaurants table by joining the relevant tables.<br><br><em><strong>Hint:</strong> Use an INNER JOIN to combine data from both tables in your view definition.</em>
create view topratedrestaurants as
select r.restaurant_name,r.city, avg(rv.rating)as average_rating,count(rv.review_id)as total_reviews
from restaurants r
inner join reviews rv
on r.restaurant_id = rv.restaurant_id
group by r.restaurant_name,r.city
having avg(rv.rating) > 4.0;
select * from topratedrestaurants;
#3.Try to update the average rating column directly through the TopRatedRestaurants view and observe what error or limitation occurs. Write down the exact error message and explain why this happens based on SQL view limitations.
/*create view topratedrestaurants as
select restaurantid, restaurantname, avg(rating) as averagerating
from reviews
group by restaurantid, restaurantname;
desc reviews;*/
#4.Create a view called DailyOrderSummary that shows, for each date, the total number of food orders and the total revenue from a Swiggy-style orders table. Ensure the view only includes dates from the last 30 days.<br><br><em><strong>Constraint:</strong> Use WHERE and GROUP BY clauses in your view definition.</em>
create table swiggy_orders(order_id int primary key,order_date date,customer_name varchar(50),amount decimal(10,2));
insert into swiggy_orders values(1,'2026-07-01','Divya',500),(2,'2026-07-01','Ankit',300),(3,'2026-07-05','Neha',700),
(4,'2026-07-10','Raj',450),(5,'2026-06-01','Kiran',200),(6,'2026-07-01','Rahul',500);
create view dailyordersummary as
select order_date,count(order_id)as total_orders,sum(amount)as total_revenue
from swiggy_orders
where order_date >= current_date - interval 30 day
group by order_date;

select *from dailyordersummary;
#5.List 3 good practices you should follow when creating SQL views for analytics dashboards, and for each, give a one-line example related to a Flipkart sales reporting scenario.
create table sales(product_id int primary key,product_name varchar(100),sales_amount decimal(10,2));
insert into sales values(1,'Laptop',50000),(2,'Mobile',25000),(3,'Headphones',3000),(4,'Keyboard',1500);
create view flipkartsales as
select product_name, sales_amount from sales;
select * from flipkartsales;