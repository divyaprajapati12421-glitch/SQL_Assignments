 #session-14
 #1.Given a table Orders with columns (order_id, user_id, order_date, total_amount), write an SQL query using ROW_NUMBER() to assign a unique sequential number to each order per user, ordered by order_date descending.
 select order_id,user_id,order_date,total_amount,row_number()over(partition by user_id 
 order by order_date desc)as row_num from orders;
desc orders;
alter table orders add order_date date;
update orders set order_date='2024-01-10' where order_id=1;
update orders set order_date='2024-01-12' where order_id=2;
update orders set order_date='2024-01-15' where order_id=3;
update orders set order_date='2024-01-18' where order_id=4;
update orders set order_date='2024-01-20' where order_id=5;
update orders set order_date='2024-01-22' where order_id=6;
update orders set order_date='2024-01-25' where order_id=7;
update orders set order_date='2024-01-28' where order_id=8;
update orders set order_date='2024-01-30' where order_id=9;
update orders set order_date='2024-02-02' where order_id=10;
alter table orders change order_amount total_amount decimal(10,2);
#2.Suppose you have a table called Songs with columns (song_id, artist, streams). Write an SQL query using RANK() to list each song along with its rank based on streams within each artist.
create table songs(song_id int primary key,artist varchar(50),streams bigint);
insert into songs values(1,'Arijit Singh',5000000),
(2,'Arijit Singh',3000000),
(3,'Arijit Singh',3000000),
(4,'Taylor Swift',8000000),
(5,'Taylor Swift',6000000),
(6,'Taylor Swift',4000000),
(7,'AP Dhillon',7000000),
(8,'AP Dhillon',5000000);
select song_id,artist,streams,rank()over(partition by artist order by streams desc)as song_rank from songs;
#3.For a table named Movies with columns (movie_id, genre, rating), write an SQL query using DENSE_RANK() to assign a rank to each movie within its genre based on rating, with the highest rating getting rank 1.
select movie_id,genre,rating,dense_rank()over(partition by genre order by rating desc)as movie_rank from movies;
create table movies(movie_id int primary key,genre varchar(50),rating decimal(2,1));
insert into movies values(1,'Action',4.8),(2,'Action',4.5),(3,'Action',4.5),(4,'Comedy',4.2),(5,'Comedy',3.8),(6,'Drama',5.0),(7,'Drama',4.7);
#4.Imagine a table named Influencers with columns (id, platform, followers). Write an SQL query to display the top 3 influencers per platform using ROW_NUMBER(), showing id, platform, followers, and their row number.<br><br><em><strong>Hint:</strong> Use a subquery or CTE to filter for row numbers less than or equal to 3.</em>
create table influencers(id int primary key,platform varchar(50),followers bigint);
insert into influencers values(1,'Instagram',5000000),(2,'Instagram',4000000),(3,'Instagram',3000000),(4,'Instagram',2000000),
(5,'YouTube',8000000),(6,'YouTube',6000000),(7,'YouTube',5000000),(8,'YouTube',3000000);
select *from(
    select id,platform,followers,row_number()over(partition by platform order by followers desc)as row_num
    from influencers)as influencer_rank where row_num <= 3;