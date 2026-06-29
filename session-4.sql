#session-4
/*1.Write an SQL query to find all restaurants in a table called Restaurants whose names end with 'Cafe' using the LIKE operator.*/
insert into Restaurants values(6, 'Green Cafe', 'Ahmedabad', 'Fast Food', 4.3, 'Low');
select *from Restaurants
where name like '%Cafe';
/*2.In a Flipkart-style Product table, use the BETWEEN operator to select all products with a price between 500 and 1500 rupees.*/
select *from Product
where price between 500 and 1500;
/*3.Write an SQL query to display all users from a Users table whose city is either 'Ahmedabad', 'Surat', or 'Vadodara' using the IN operator.*/
select *from Users
where city in ('Ahmedabad', 'Surat', 'Vadodara');
/*4.Given a table called Songs with columns song_name and artist_name, find all songs where the artist_name contains the letter sequence 'ar' anywhere in the name using the LIKE operator.<br><br><em><strong>Hint:</strong> Use wildcards on both sides of the pattern.</em>*/
create table songs (
    song_id int primary key,
    song_name varchar(100),
    artist_name varchar(100));
insert into songs values
(1, 'Tum Hi Ho', 'Arijit Singh'),
(2, 'Raabta', 'Arijit Singh'),
(3, 'Believer', 'Imagine Dragons'),
(4, 'Kar Har Maidaan', 'Sukhwinder Singh');
select *from Songs
where artist_name like '%ar%';