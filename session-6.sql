#session-6
/*1.Write an SQL query using the SUM() function to calculate the total amount spent by users on food orders in a table food_orders (columns: order_id, user_id, amount) — imagine it's like Zomato's order history.*/
create table food_orders (
    order_id int primary key,
    user_id int,
    amount decimal(10,2));
insert into food_orders values
(1, 101, 250),
(2, 101, 450),
(3, 102, 300),
(4, 103, 500),
(5, 102, 150);
select user_id, sum(amount) as total_amount_spent from food_orders
group by user_id;
/*2.
Using the COUNT() function, find out how many songs a user has added to their playlist in a table spotify_playlists (columns: playlist_id, user_id, song_id).*/
create table spotify_playlists (playlist_id int,user_id int,song_id int);
insert into spotify_playlists values
(1,101,201),
(1,101,202),
(2,102,203),
(2,102,204),
(2,102,205);
select user_id,count(song_id)as total_songs
from spotify_playlists
group by user_id;
/*3.Write an SQL query to get the average rating given to a movie in a table bookmyshow_reviews (columns: review_id, movie_id, rating), and round the result to 1 decimal place using the ROUND() function.<br><br><em><strong>Hint:</strong> Use AVG() with ROUND() to format the output.</em>*/
create table bookmyshow_reviews (review_id int primary key,movie_id int, rating decimal(2,1));
insert into bookmyshow_reviews values
(1,1,4.5),
(2,1,5.0),
(3,2,4.0),
(4,2,3.5),
(5,3,4.8);
select movie_id,round(avg(rating),1) as average_rating
from bookmyshow_reviews
group by movie_id;
/*4.Find the minimum and maximum transaction values for a user from a table paytm_transactions (columns: txn_id, user_id, amount) — show both the smallest and largest transaction amounts.*/
create table paytm_transactions (txn_id int primary key,user_id int,amount decimal(10,2));
insert into paytm_transactions values
(1,101,500),
(2,101,1200),
(3,102,700),
(4,102,150),
(5,103,900);
select user_id,
       min(amount) as minimum_transaction,
       max(amount) as maximum_transaction
from paytm_transactions
group by user_id;
/*5.Given a table myntra_orders (columns: order_id, user_id, total_price), write an SQL query to display the total number of orders, the average order value (rounded to 2 decimals), and the highest order value for each user_id.<br><br><em><strong>Constraint:</strong> Use GROUP BY to get results per user.</em>*/
create table myntra_orders (order_id int primary key,user_id int,total_price decimal(10,2));
insert into myntra_orders values
(1,101,1200),
(2,101,800),
(3,102,1500),
(4,102,2000),
(5,103,950);
select user_id,
       count(order_id) as total_orders,
       round(avg(total_price),2)as average_order_value,
       max(total_price) as highest_order_value
from myntra_orders
group by user_id;