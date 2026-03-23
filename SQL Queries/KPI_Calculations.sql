-- Total Revenue
SELECT 
SUM(Total_Price) AS Total_Revenue
FROM ecommerce_sales_cleaned;

-- Total Orders
SELECT 
COUNT(*) AS Total_Orders
FROM ecommerce_sales_cleaned;

-- Total Customers
SELECT 
COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM ecommerce_sales_cleaned;

-- Average Order Value (AOV)
SELECT 
SUM(Total_Price) / COUNT(*) AS Average_Order_Value
FROM ecommerce_sales_cleaned;

-- Return Rate
SELECT 
(COUNT(CASE WHEN Shipping_Status = 'Returned' THEN 1 END) * 100.0 / COUNT(*)) 
AS Return_Rate_Percentage
FROM ecommerce_sales_cleaned;