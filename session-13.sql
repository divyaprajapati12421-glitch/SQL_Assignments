#session-13
#1.Create a table called Orders with columns: order_id, user_id, order_amount, and app_name (e.g., 'Zomato', 'Swiggy', 'Flipkart'). Insert at least 10 sample records with different users and apps. Write an SQL query using the OVER() function to display each order's amount along with the total order amount for all orders.
create table orders (order_id int primary key,user_id int,order_amount decimal(10,2),app_name varchar(50));
insert into orders values
(1,101,250,'Zomato'),
(2,101,450,'Swiggy'),
(3,102,800,'Flipkart'),
(4,103,300,'Zomato'),
(5,102,500,'Amazon'),
(6,104,650,'Swiggy'),
(7,103,200,'Flipkart'),
(8,101,150,'Amazon'),
(9,104,700,'Zomato'),
(10,105,900,'Swiggy');
select  order_id,user_id,app_name,order_amount,sum(order_amount) over() as total_order_amount from orders;
#2.Using the Orders table, write an SQL query to show each user's order_id, order_amount, and the average order_amount for that user using the OVER(PARTITION BY user_id) clause.<br><br><em><strong>Hint:</strong> Use AVG(order_amount) OVER(PARTITION BY user_id) to get the per-user average.</em>
select order_id,user_id,order_amount,avg(order_amount) over(partition by user_id) as avg_order_amount from orders;
#3.Suppose you have a table called Playlist with columns: song_id, user_id, and duration_sec. Write an SQL query to display each song's duration, and the total duration of songs added by each user using SUM(duration_sec) OVER(PARTITION BY user_id).
create table playlist(song_id int primary key,user_id int,duration_sec int);
insert into playlist values
(1,101,180),
(2,101,220),
(3,102,200),
(4,103,250),
(5,102,300),
(6,101,210),
(7,103,240),
(8,104,190);
select song_id,user_id,duration_sec,sum(duration_sec) over(partition by user_id) as total_duration from playlist;
#4.Given a table named MovieRatings with columns: rating_id, user_id, movie_name, and rating (1-5), write an SQL query to show each rating, the average rating per movie, and the difference between the user's rating and the movie's average rating using window functions.<br><br><em><strong>Hint:</strong> Use AVG(rating) OVER(PARTITION BY movie_name) and subtract it from the user's rating.</em>
create table movieratings(rating_id int primary key,user_id int,movie_name varchar(100),rating int);
insert into movieratings values
(1,101,'Pushpa',5),
(2,102,'Pushpa',4),
(3,103,'Kalki',5),
(4,104,'Pushpa',3),
(5,101,'Kalki',4),
(6,102,'Kalki',5),
(7,103,'Leo',4),
(8,104,'Leo',5);
select rating_id,user_id,movie_name,rating,avg(rating)
 over(partition by movie_name) as avg_movie_rating,rating - AVG(rating) 
 over(partition by movie_name) as rating_difference from movieratings;