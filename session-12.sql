create database db;
use db;
create table artists(artist_id int primary key,name varchar(50),followers bigint);
insert into artists values
(1,'Arijit Singh',95000000),
(2,'Taylor Swift',120000000),
(3,'Diljit Dosanjh',45000000),
(4,'AP Dhillon',30000000),
(5,'Ed Sheeran',110000000),
(6,'Divya Prajapati',98500000);
#1.Write an SQL query using the WITH clause to create a temporary result set called TopArtists that selects the top 3 most-followed artists from a table SpotifyArtists (columns: artist_id, name, followers), then select all rows from TopArtists.
with divyaartist as
(select *from artists
order by followers desc
limit 3)
select * from divyaartist;
#2.Using a table named FlipkartOrders (columns: order_id, user_id, order_date, total_amount), write a query with a CTE called MonthlyTotals that calculates the total sales amount for each month in 2023, then select the month with the highest total sales from MonthlyTotals.<br><br><em><strong>Hint:</strong> Use EXTRACT(MONTH FROM order_date) or DATE_FORMAT(order_date, '%m') depending on your SQL dialect.</em>
create table flip_orders(order_id int primary key,user_id int,order_date date,total_amount decimal(10,2));
insert into flip_orders values(1,101,'2023-01-15',2000),
(2,102,'2023-01-20',5000),
(3,103,'2023-02-05',7000),
(4,104,'2023-03-10',9000),
(5,105,'2023-03-18',6000),
(6,106,'2023-04-08',3000);
with month_total as
(select month(order_date)as month_no,sum(total_amount)as total_sale from flip_orders
where year(order_date)=2023
group by month(order_date))
select * from month_total
order by total_sale desc
limit 1;
#3.Create a recursive CTE to generate a list of dates for the next 7 days starting from today in a table called CalendarDays (columns: day_date).<br><br><em><strong>Hint:</strong> Use UNION ALL inside your CTE and limit recursion to 7 levels.</em>
#4.Given a table called ZomatoRestaurants (columns: id, name, city, rating), use a CTE to find the average rating for each city, then select all restaurants in cities where the average rating is above 4.0.
create table zomato_res(id int primary key,name varchar(100),city varchar(50),rating decimal(2,1));
insert into zomato_res values
(1,'Food Villa','Ahmedabad',4.5),
(2,'Spice Hub','Ahmedabad',4.2),
(3,'Pizza Town','Surat',3.9),
(4,'Royal Cafe','Rajkot',4.8),
(5,'Burger King','Rajkot',4.4);
with city_ratings as
(select city,avg(rating)as avg_rating from zomato_res
group by city)
select *from zomato_res z
join city_ratings c
on z.city=c.city
where c.avg_rating>4.0;
#5.Use ChatGPT or Copilot to help you write an SQL query with a CTE that, given a table IPLMatches (columns: match_id, team, runs, match_year), calculates the total runs scored by each team in 2023 and lists only teams with more than 2000 runs.
create table iplmatch(match_id int,team varchar(50),runs int,match_year int);
insert into iplmatch values(1,'CSK',250,2023),
(2,'CSK',300,2023),
(3,'MI',400,2023),
(4,'MI',1800,2023),
(5,'RCB',2100,2023),
(6,'GT',1700,2023);
with teamrun as
(select team,sum(runs) as total_run from iplmatch
where match_year=2023
group by team)
select *from  teamrun
where total_run>2000;
