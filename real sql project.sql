create database oegano;
create table pizza;
select * from pizza_sales;

-- 1.What is the total revenue.
select sum(total_price) as total_revenue from pizza_sales;

-- 2. What is the average order values
select * from pizza_sales;
select sum(total_price)/ count(distinct order_id) as avg_order_value from pizza_sales;

-- 3. What are the total pizzas sold
select * from pizza_sales;
select sum(quantity) as total_pizza_sold from pizza_sales;

-- 4. What are the total order placed
select * from pizza_sales;
select count(Distinct order_id) as total_order from pizza_sales;

-- 5. What are the average pizzas per order
select * from pizza_sales;
select sum(quantity) / count(distinct order_id) from pizza_sales;

-- 6. Daily trend for total orders
select * from pizza_sales;
SELECT DATE(order_date) AS order_day, COUNT(*) AS total_orders FROM pizza_sales                          
GROUP BY DATE(order_date)                
ORDER BY order_day;          

-- 7. Monthly trend for total orders
SELECT MONTHNAME(order_date) AS MonthName, COUNT(distinct order_id) AS total_orders FROM pizza_sales 
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY MONTH(order_date) ;

-- 8. Top 5 sellers by total pizzas sold.
select  pizza_name, sum(quantity) as total_pizzas_sold from pizza_sales
where month(order_date) =8
group by pizza_name
order by sum(quantity) asc

-- 9. Percentage of sales by pizza size.
select pizza_size,sum(total_price) as total_revenue,sum(total_price)*100 / 
(select sum(total_price) from pizza_sales) as PCT
from pizza_sales
group by pizza_size
order by PCT desc

-- 10. top 5 best sellers by revenue, total quantity and total orders
select * from pizza_sales
select pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue limit 5;
select pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity desc limit 5;
select pizza_name, count(distinct order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders limit 5;
