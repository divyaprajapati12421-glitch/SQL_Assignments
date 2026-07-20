#session-17
#1.Write an SQL query using CASE WHEN to classify orders in a 'FoodOrders' table as 'Small', 'Medium', or 'Large' based on the total_amount: 'Small' for less than 300, 'Medium' for 300 to 999, and 'Large' for 1000 and above.
create table foodorders(order_id int,customer_name varchar(50),total_amount int);
insert into foodorders values(1, 'Rahul', 200),(2, 'Amit', 700),(3, 'Neha', 1500),(4, 'Riya', 350);
select order_id,customer_name,total_amount,
case
    when total_amount < 300 then 'Small'
    when total_amount between 300 and 999 then 'Medium'
    else 'Large'
end  as order_size 
from foodorders;
#2.Given a 'Movies' table with a 'rating' column (out of 10), write an SQL query that adds a new column 'popularity' which shows 'Blockbuster' for ratings 8 and above, 'Hit' for 5 to 7.9, and 'Average' for below 5 using CASE WHEN ELSE END.
create table movies_new(movie_id int,movie_name varchar(50),rating decimal(3,1));
insert into movies_new values(1,'Pathaan',8.5),(2,'Jawan',7.2),(3,'Dunki',4.5);
select movie_name,rating,
case
    when rating >= 8 then 'Blockbuster'
    when rating between 5 and 7.9 then 'Hit'
    else 'Average'
end as popularity
from movies_new;
#3.For a 'FlipkartProducts' table with a 'price' column, write an SQL query to create a 'price_category' column that bins prices as 'Budget' (below 500), 'Standard' (500 to 2000), and 'Premium' (above 2000) using CASE WHEN.
create table flipkartproducts(product_id int,product_name varchar(50),price int);
insert into flipkartproducts values (1,'Mouse',300),(2,'Keyboard',1000),(3,'Laptop',50000);
select product_name,price,
case
	when price < 500 then 'Budget'
	when price between 500 and 2000 then 'Standard'
    else 'Premium'
end as price_category
from flipkartproducts;
#4.Write an SQL query for a 'SpotifyTracks' table that uses CASE WHEN to assign a 'duration_label' column: 'Short' for tracks under 180 seconds, 'Medium' for 180-300 seconds, and 'Long' for over 300 seconds.<br><br><em><strong>Hint:</strong> Use multiple WHEN conditions to cover all possible durations.</em>
create table spotifytracks(track_id int,song_name varchar(50),duration_seconds int);
insert into  spotifytracks values(1,'Song A',120),(2,'Song B',250),(3,'Song C',400);
select song_name,duration_seconds,
case
	when duration_seconds < 180  then'Short'
	when duration_seconds between 180 and 300 then 'Medium'
    else 'Long'
end as duration_label
from spotifytracks;

delimiter ;