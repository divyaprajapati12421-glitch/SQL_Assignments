#session-7
/*1.Write an SQL query to display the total number of orders placed by each user in a 'food_orders' table, grouped by user_id.*/
select user_id,count(order_id)as total_orders
from food_orders
group by user_id;
/*2.Using a 'transactions' table with columns (transaction_id, user_id, amount, payment_method), write an SQL query to show the total amount spent by each payment_method.*/
create table transactions(transaction_id int,user_id int,amount decimal(10,2),payment_method varchar(30));
insert into transactions values(1,101,500.00,'UPI'),
(2,102,800.00,'Card'),
(3,101,300.00,'UPI'),
(4,103,1200.00,'Cash'),
(5,102,700.00,'Card'),
(6,104,400.00,'UPI');
select payment_method,sum(amount)as total_amount
from transactions
group by payment_method;
/*3.Given a 'movies' table with columns (movie_id, genre, box_office_collection), write an SQL query to display each genre and its total box_office_collection, but only show genres where the total collection is above 10 crore.<br><br><em><strong>Hint:</strong> Use GROUP BY and HAVING together to filter the aggregated results.</em*/
create table movies(movie_id int primary key,genre varchar(50),box_office_collection decimal(10,2));
insert into movies values(1,'Action',8.50),
(2,'Action',6.00),
(3,'Comedy',4.50),
(4,'Comedy',3.00),
(5,'Drama',12.00),
(6,'Drama',5.50);
select genre,sum(box_office_collection)as total_collection
from movies
group by genre
having sum(box_office_collection) > 10;
/*4.Suppose you have a 'playlist' table with columns (playlist_id, user_id, song_id, duration). Write an SQL query to find users who have created playlists with a combined song duration of more than 2 hours (7200 seconds), showing user_id and total duration.*/
create table playlist(playlist_id int,user_id int,song_id int,duration int);
insert into playlist values(1,101,201,1800),
(1,101,202,2500),
(1,101,203,3200),
(2,102,204,1500),
(2,102,205,2000),
(2,102,206,1800),
(3,103,207,4000),
(3,103,208,3500);
select user_id,sum(duration)as total_duration
from playlist
group by user_id
having sum(duration)>7200;