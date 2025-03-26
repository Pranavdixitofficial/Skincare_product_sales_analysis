
-- Find the percentage of orders that were pending (i.e., Delivery_Status ≠ "Delivered on Time").

select 
(count(case when Delivery_Status = 'Processing' then 1 end) * 100 / Count(*)) as Pending_Delivery_Percentage
from Orders
;

-- Find the percentage of orders that were payment pending.
SELECT 
    (COUNT(CASE WHEN Payment_Status = 'Pending' THEN 1 END) * 100.0 / COUNT(*)) AS Pending_Order_Percentage
FROM Orders;

-- Identify the customers who spent the most money overall.
select Customer_Name ,Sum(Total_Price) as Amount_spent
from Orders
group by Customer_Name
order by Amount_Spent desc
limit 1;



-- Find out which brand has the highest total sales revenue. #Correct
select P.Brand , Sum(O.Total_Price) as Total_Revenue from Orders O
Join Products P on P.Product_ID = O.Product_ID
Group By P.Brand
order by Total_Revenue desc
limit 1;



-- Get the average order value (total revenue / total number of orders).
select sum(Total_Price)/count(Order_ID) as AOV
from Orders;


-- Find the month with the highest number of orders.
select DATE_FORMAT(Order_Date,'%M-%Y') as order_Month , Count(Order_ID) as Total_Orders
from Orders
Group by Order_Month 
order by Total_orders desc
limit 1;

-- Find the Date with the highest number of orders.
select DATE_FORMAT(Order_Date,'%D-%M-%Y') as order_Date , Count(Order_ID) as Total_Orders
from Orders
Group by Order_Date
order by Total_orders desc
limit 1;


-- all the customer order more than 3 times -- Correct
Select Customer_Name, Count(Order_ID) as Total_Order 
from Orders
group by Customer_Name
Having Count(Order_ID) >  3
order by Total_Order DESC;

-- retrieve all orders where Payment_Status is "Pending." 
select * from orders
where Payment_Status = "Pending";



-- Find the top 3 best-selling products by order quantity.
Select P.Product_Name , SUM(O.Quantity) as Order_Quantity
from Orders O
join Products P on P.Product_ID = O.Product_ID
group by P.Product_Name
Order by Order_Quantity DESC
Limit 3 ;


-- Get the most popular product (the one ordered the most times).
SELECT p.Product_ID, p.Product_Name, SUM(o.Quantity) AS Total_Ordered
FROM Orders o
JOIN Products p ON o.Product_ID = p.Product_ID
GROUP BY p.Product_ID, p.Product_Name
ORDER BY Total_Ordered DESC
LIMIT 1;


-- Retrieve the total revenue generated from all orders.
select sum(Total_Price) as Total_Revenue
from Orders;


-- all orders placed by aarav sharma
select * from Orders 
join Products on Products.Product_ID = Orders.Order_ID
where customer_name = "Aarav Sharma";

-- total number of order placed
select Count(distinct Order_ID) as total_number_of_order_placed
from Orders;

-- Find all products that have a stock count of less than 50.
select distinct (P.Product_Name)
from Products P
join Orders O on P.Product_ID = O.Product_ID
where Stock < 50







