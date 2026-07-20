#session-16
#1.Write an SQL query using CONCAT to combine first_name and last_name columns from a users table into a single full_name column and display the result.
create table users(user_id int primary key,first_name varchar(50),last_name varchar(50));
insert into users values (1, 'Divya', 'Prajapati'),(2, 'Priya', 'Patel'),(3, 'Ankit', 'Verma'),(4,'Ruhul','Sharma');
select concat(first_name, ' ', last_name) as full_name from users;
#2.Given a table called playlists with a column song_title, write a query to display all song titles in uppercase using the UPPER function.
create table playlists(song_id int primary key,song_title varchar(100));
insert into playlists values(1, 'Perfect'),(2, 'Believer'),(3, 'Shape of You');
select * from playlists;
select upper(song_title)as song_title_upper from playlists;
#3.You have a table food_items with a column item_code that sometimes contains extra spaces at the beginning or end. Write an SQL query to select item_code values after removing all leading and trailing spaces using TRIM.
create table food_items(item_id int primary key,item_code varchar(50));
insert into food_items values (1, '  FD101  '),(2, '  SN205'),(3, 'DR300   ');
select trim(item_code)as cleaned_item_code from food_items;
#4.In a table called movies, the column imdb_id contains codes like 'tt1234567'. Write a query to extract just the numeric part (the last 7 characters) using RIGHT and display it as movie_number.<br><br><em><strong>Hint:</strong> Use RIGHT(imdb_id, 7) to get the numeric part.</em>
create table movies(movie_id int primary key,movie_name varchar(100),imdb_id varchar(20));
insert into movies values (1, 'Inception', 'tt1375666'),(2, 'Titanic', 'tt0120338'),(3, 'Avatar', 'tt0499549');
select right(imdb_id, 7)as movie_number from movies;
#5.A products table has a column sku_code where some entries use dashes (e.g. 'MOB-123-XY'). Write an SQL query to replace all dashes '-' with underscores '_' in sku_code using the REPLACE function and display the updated codes.
create table products(product_id int primary key,product_name varchar(100),sku_code varchar(50));
insert into products values(1, 'Mobile', 'MOB-123-XY'),(2, 'Laptop', 'LAP-456-AB'),(3, 'Tablet', 'TAB-789-CD');
select replace(sku_code, '-', '_')as updated_sku_code from products;
