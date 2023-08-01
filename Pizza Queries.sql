select * from pizza_sales;

select SUM(total_price) AS Total_Revenue from pizza_sales;

select SUM(total_price) / count (Distinct order_id) AS Avg_Order_Value from pizza_sales;

select SUM(quantity) AS Total_pizza_Sold from pizza_sales;

select count (Distinct order_id) AS Total_orders from pizza_sales;

select cast(cast(SUM(quantity) AS decimal(10,2)) / cast(count (Distinct order_id) AS decimal(10,2)) AS decimal(10,2))
as Avg_Pizzas_Per_Order from pizza_sales;

select DATENAME(DW, order_date) as order_day , count (Distinct order_id) as total_orders from pizza_sales
group by DATENAME(DW, order_date);


select DATENAME(MONTH, order_date) as order_Month , count (Distinct order_id) as total_orders from pizza_sales
group by DATENAME(MONTH, order_date);

select pizza_category, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / 
(select SUM(total_price) from pizza_sales where MONTH(order_date) = 1) as PCT_Total_Sales
from pizza_sales
where MONTH(order_date) = 1
group by pizza_category


select pizza_size, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / 
(select SUM(total_price) from pizza_sales where DATEPART(quarter, order_date) = 1) as PCT_Total_Sales
from pizza_sales
where DATEPART(quarter, order_date) = 1
group by pizza_size


select top 5 pizza_name , SUM(total_price) as Total_Revenue from pizza_sales
group by pizza_name
order by SUM(total_price) Desc


select top 5 pizza_name , SUM(quantity) as Total_quantity from pizza_sales
group by pizza_name
order by SUM(quantity) Desc


select top 5 pizza_name , count (Distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by count (Distinct order_id)  Desc

select top 5 pizza_name , SUM(total_price) as Total_Revenue from pizza_sales
group by pizza_name
order by SUM(total_price) ASC


select top 5 pizza_name , SUM(quantity) as Total_quantity from pizza_sales
group by pizza_name
order by SUM(quantity) ASC


select top 5 pizza_name , count (Distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by count (Distinct order_id)  ASC








