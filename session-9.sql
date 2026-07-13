#session-9
/*1.Create two tables, influencers and brands, with at least 3 sample rows each. Use a FULL OUTER JOIN to list all influencers and brands, showing influencer_name and brand_name, matching on city. If there is no match, display NULL for the missing side.<br><br><em><strong>Hint:</strong> Use LEFT JOIN, RIGHT JOIN, and UNION if your SQL dialect does not support FULL OUTER JOIN directly.</em>*/
create table influencers (id int,inf_name varchar(50),city varchar(50));
insert into influencers values(1,'Divya','Mehsana'),
(2,'Rahul','Ahmedabad'),
(3,'Priya','Surat'),
(4,'Amit','Rajkot');
create table brands(id int,brand_name varchar(50),city varchar(50));
insert into brands values(101,'Nike','Mehsana'),(102,'Nike','Ahmedabad'),
(103,'Puma','Mumbai'),
(104,'Adidas','Rajkot');
select inf_name,brand_name
from influencers i
left join brands b
on i.city= b.city
union
select inf_name,brand_name
from influencers i
right join brands b
on i.city= b.city ;

#2.Given a table called playlists with columns (id, playlist_name, parent_playlist_id), write a SELF JOIN query to display each playlist alongside its parent playlist's name, similar to how Spotify might nest playlists.
create table playlists (id int primary key,playlist_name varchar(100),parent_playlist_id int);
insert into playlists (id, playlist_name, parent_playlist_id)values
(1, 'Workout Mix', NULL),
(2, 'Cardio Hits', 1),
(3, 'Chill Vibes', NULL),
(4, 'Evening Chill', 3),
(5, 'Morning Energy', 1);
select p.id, p.playlist_name,parent.playlist_name 
from playlists as p
left join playlists as parent
on p.parent_playlist_id = parent.id;
#3.Create two tables: users and offers. Write a CROSS JOIN query to generate all possible combinations of users and offers, displaying user_name and offer_title. Explain in a comment how this could be used for a Flipkart-style personalized offer campaign.
create table userss (user_id int primary key,user_name varchar(100));
create table offers (offer_id int primary key, offer_title varchar(100));
insert into userss (user_id, user_name)values(1, 'Amit'),(2, 'Priya'),(3, 'Rahul');
insert into offers (offer_id, offer_title)values(101, '10% Off Electronics'),(102, 'Buy 1 Get 1 Free'),(103, 'Free Shipping');
select u.user_name,o.offer_title from userss as u
cross join offers as o;
#4.You have an employees table with columns (id, name, manager_id). Write a SELF JOIN to display each employee's name along with their manager's name. Then, modify your query to only show employees who do not have a manager (i.e., top-level managers).
create table employees(emp_id int primary key,emp_name varchar(20),manager_id int);
insert into employees values(1, 'Raj', NULL),
(2, 'Priya', 1),
(3, 'Amit', 1),
(4, 'Neha', 2),
(5, 'Karan', 2);
select e.emp_name,m.emp_name
from employees e
join employees m
on e.manager_id = m.emp_id;
select emp_id,emp_name
from employees
where manager_id is null;
describe employees;
#5.Use ChatGPT or Copilot to help you write a SQL query that finds all pairs of users from a users table who live in the same city (excluding pairs where the user is compared with themselves). Paste the query and briefly describe how the AI helped you improve or debug it.
select  u1.user_id, u1.name as user1,
    u2.user_id, u2.name as user2,
    u1.city
from users u1
join users u2
on u1.city = u2.city
and u1.user_id <u2.user_id;
describe users