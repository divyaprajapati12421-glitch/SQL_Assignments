# session-10
#1.Create two tables: AppOrders (for orders placed via a food delivery app like Zomato) and InStoreOrders (for direct restaurant orders), each with columns: order_id, customer_name, amount, and order_date. Insert at least 3 sample records into each table.
create table apporders (order_id int primary key,customer_name varchar(100),amount decimal(10,2),order_date date);
create table instoreorders (order_id int primary key,customer_name varchar(100),amount decimal(10,2), order_date date);

insert into apporders (order_id, customer_name, amount, order_date)
values
(1, 'Rahul Sharma', 450.00, '2026-07-01'),
(2, 'Priya Patel', 320.50, '2026-07-02'),
(3, 'Amit Mehta', 600.00, '2026-07-03');

insert into instoreorders (order_id, customer_name, amount, order_date)
values
(101, 'Neha Shah', 550.00, '2026-07-01'),
(102, 'Karan Joshi', 275.00, '2026-07-02'),
(103, 'Sneha Desai', 720.00, '2026-07-03');

#2.Write a SQL query using UNION to combine all unique customer names from both AppOrders and InStoreOrders tables into a single list.
select customer_name from apporders
union
select customer_name from instoreorders;
#3.Write a SQL query using UNION ALL to display every order (including duplicates if any) from both AppOrders and InStoreOrders, showing order_id, customer_name, amount, and order_date.
select order_id, customer_name, amount, order_date from apporders
union all
select order_id, customer_name, amount, order_date
from instoreorders;
#4.Demonstrate the difference between UNION and UNION ALL by adding a duplicate customer_name in both tables, then running both queries and noting the difference in the result count.<br><br><em><strong>Hint:</strong> UNION removes duplicates, UNION ALL does not.</em>
-- Add a duplicate customer_name in both tables
insert into apporders (order_id, customer_name, amount, order_date)values(4, 'Rahul Sharma', 500.00, '2026-07-04');

insert into instoreorders (order_id, customer_name, amount, order_date)values(104, 'Rahul Sharma', 450.00, '2026-07-04');

select customer_name 
from apporders
union
select customer_name
from instoreorders;
select customer_name
from apporders
union all
select customer_name
from instoreorders;