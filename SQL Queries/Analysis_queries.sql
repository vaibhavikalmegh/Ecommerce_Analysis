-- Revenue by Region
SELECT 
Region,
SUM(Total_Price) AS Revenue
FROM ecommerce_sales_cleaned
GROUP BY Region
ORDER BY Revenue DESC;

-- Top Products by Revenue
SELECT 
Product_Name,
SUM(Total_Price) AS Revenue
FROM ecommerce_sales_cleaned
GROUP BY Product_Name
ORDER BY Revenue DESC
LIMIT 10;

-- Customer Spending
SELECT 
Customer_ID,
SUM(Total_Price) AS Customer_Spending
FROM ecommerce_sales_cleaned
GROUP BY Customer_ID
ORDER BY Customer_Spending DESC;

-- Customer Segmentation
SELECT 
Customer_ID,
SUM(Total_Price) AS Customer_Spending,
CASE
    WHEN SUM(Total_Price) >= 10000 THEN 'High Value'
    WHEN SUM(Total_Price) >= 5000 THEN 'Medium Value'
    ELSE 'Low Value'
END AS Customer_Segment
FROM ecommerce_sales_cleaned
GROUP BY Customer_ID
ORDER BY Customer_Spending DESC;

-- Customer Segment Distribution
SELECT 
Customer_Segment,
COUNT(*) AS Number_of_Customers
FROM
(
    SELECT 
    Customer_ID,
    SUM(Total_Price) AS Customer_Spending,
    CASE
        WHEN SUM(Total_Price) >= 10000 THEN 'High Value'
        WHEN SUM(Total_Price) >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Segment
    FROM ecommerce_sales_cleaned
    GROUP BY Customer_ID
) AS Customer_Segments
GROUP BY Customer_Segment;

-- Orders by Shipping Status
SELECT 
Shipping_Status,
COUNT(*) AS Orders
FROM ecommerce_sales_cleaned
GROUP BY Shipping_Status;

-- Orders by Region
SELECT 
Region,
COUNT(*) AS Total_Orders
FROM ecommerce_sales_cleaned
GROUP BY Region
ORDER BY Total_Orders DESC;

-- Average Order Value by Region
SELECT 
Region,
AVG(Total_Price) AS Avg_Order_Value
FROM ecommerce_sales_cleaned
GROUP BY Region
ORDER BY Avg_Order_Value DESC;

-- Monthly Revenue Trend
SELECT 
    `Order Year`,
    Order_Month,
    Order_Month_No,
    SUM(Total_Price) AS Revenue
FROM ecommerce_sales_cleaned
GROUP BY `Order Year`, Order_Month, Order_Month_No
ORDER BY `Order Year`, Order_Month_No;

-- Region + Product Analysis
SELECT 
Region,
Product_Name,
SUM(Total_Price) AS Revenue
FROM ecommerce_sales_cleaned
GROUP BY Region, Product_Name
ORDER BY Region, Revenue DESC;

-- Customer Lifetime Value
SELECT 
Customer_ID,
COUNT(*) AS Orders,
SUM(Total_Price) AS Lifetime_Value
FROM ecommerce_sales_cleaned
GROUP BY Customer_ID
ORDER BY Lifetime_Value DESC;

-- Product Return Analysis
SELECT 
    Product_Name,
    COUNT(*) AS Total_Orders,
    COUNT(CASE WHEN Shipping_Status = 'Returned' THEN 1 END) AS Returns,
    COUNT(CASE WHEN Shipping_Status = 'Returned' THEN 1 END) * 100.0 / COUNT(*) AS Return_Rate
FROM ecommerce_sales_cleaned
GROUP BY Product_Name
ORDER BY Return_Rate DESC;

-- Product Contribution to Revenue
SELECT 
Product_Name,
SUM(Total_Price) AS Revenue,
SUM(Total_Price)*100/
(SELECT SUM(Total_Price) FROM ecommerce_sales_cleaned) AS Contribution_Percentage
FROM ecommerce_sales_cleaned
GROUP BY Product_Name;

-- Top 20 Customers
SELECT 
Customer_ID,
SUM(Total_Price) AS Revenue
FROM ecommerce_sales_cleaned
GROUP BY Customer_ID
ORDER BY Revenue DESC
LIMIT 20;

-- Return Rate by Region
SELECT 
Region,
COUNT(CASE WHEN Shipping_Status='Returned' THEN 1 END) *100.0 / COUNT(*) AS Return_Rate
FROM ecommerce_sales_cleaned
GROUP BY Region;