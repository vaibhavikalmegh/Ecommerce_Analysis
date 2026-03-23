-- Fix column encoding issue
SELECT `ï»¿Customer ID` FROM ecommerce_sales_cleaned;

ALTER TABLE ecommerce_sales_cleaned
CHANGE COLUMN `ï»¿Customer ID` Customer_ID TEXT;

-- Rename columns
ALTER TABLE ecommerce_sales_cleaned CHANGE COLUMN `Product Name` Product_Name TEXT;
ALTER TABLE ecommerce_sales_cleaned CHANGE COLUMN `Unit Price` Unit_Price INT;
ALTER TABLE ecommerce_sales_cleaned CHANGE COLUMN `Total Price` Total_Price INT;
ALTER TABLE ecommerce_sales_cleaned CHANGE COLUMN `Shipping Fee` Shipping_Fee DOUBLE;
ALTER TABLE ecommerce_sales_cleaned CHANGE COLUMN `Shipping Status` Shipping_Status TEXT;
ALTER TABLE ecommerce_sales_cleaned CHANGE COLUMN `Order Date` Order_Date TEXT;
ALTER TABLE ecommerce_sales_cleaned CHANGE COLUMN `Order Month` Order_Month TEXT;
ALTER TABLE ecommerce_sales_cleaned CHANGE COLUMN `Order Month No` Order_Month_No INT;
ALTER TABLE ecommerce_sales_cleaned CHANGE COLUMN `Order Value Segment` Order_Value_Segment TEXT;

-- Preview data
SELECT *
FROM ecommerce_sales_cleaned
LIMIT 10;