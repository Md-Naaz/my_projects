use zomato;
select count(*) from customers;
select count(*) from deliveries;
select count(*) from orders;
select count(*) from delivery_persons;
select count(*) from restaurants;
select * from customers limit 10;
-- total number of orders placed by customer in every restaurant
select c.name,c.total_orders,r.name from customers c join restaurants r on c.customer_id=r.restaurant_id ;
-- name of restaurant groupby r.name
select name,count(name) from restaurants group by name;
-- which customer order food from which retaurant on which date
select c.name as Customer_name,r.`name` as Retaurant_name,o.order_date as Order_date from orders o join customers c on o.customer_id=c.customer_id join restaurants r on o.restaurant_id=r.restaurant_id;
-- name,date they placed their orders ,total order placed by customer on specific date
select c.name as Customer_name,o.order_date,count(o.order_id)as Total_orders from customers c join orders o on c.customer_id=o.customer_id group by c.name,o.order_date order by c.name,o.order_date;
-- customers delivery status
select c.name as Customer_name,o.order_id as `Order_number` ,d.delivery_status as `Status ` from customers c join orders o on c.customer_id=o.customer_id join deliveries d on o.order_id=d.order_id;
-- how many deliveries  by delivery man
select name,total_deliveries from delivery_persons ;
-- total succesfully delivery by delivered man
select dp.name as delivery_man,count(d.delivery_id) as successfull_delivered
from deliveries d join delivery_persons dp on d.delivery_person_id=dp.delivery_person_id 
where d.delivery_status='Delivered'
group by dp.name,dp.delivery_person_id order by successfull_delivered desc;
/* "Find the name of the customer, 
the restaurant they ordered from, 
the name of the delivery person, 
and the final delivery distance for all orders that were placed on a specific date and had a 'Delivered' status." */
select c.name as Customer_name,r.name as Restaurant_name,dp.name as delivery_man,d.distance as Distance,DATE(o.order_date) AS OrderDate from orders o join customers c on o.customer_id=c.customer_id
join restaurants r on o.restaurant_id=r.restaurant_id
join deliveries as d on o.order_id=d.order_id
join delivery_persons dp on d.delivery_person_id=dp.delivery_person_id
where d.delivery_status='Delivered' and date(o.order_date)='2025/07/12';


