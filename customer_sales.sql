-- 1. Create Database
CREATE DATABASE IF NOT EXISTS sales_analysis;

USE sales_analysis;


-- 2. Create Customer Sales Table
CREATE TABLE IF NOT EXISTS customer_sales (
    Customer_ID VARCHAR(10),
    Customer_Name VARCHAR(50),
    City VARCHAR(50),
    Product VARCHAR(50),
    Category VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    Order_Date DATE
);


-- 3. View All Sales Data
SELECT *
FROM customer_sales;


-- 4. Basic Customer and Product Information
SELECT Customer_Name, City
FROM customer_sales;

SELECT Product, Price
FROM customer_sales;

SELECT Product, Price
FROM customer_sales
ORDER BY Price DESC;


-- 5. Filter Data Using WHERE
SELECT *
FROM customer_sales
WHERE City = 'Hyderabad';

SELECT *
FROM customer_sales
WHERE Category = 'Electronics';

SELECT Product, Price
FROM customer_sales
WHERE Price > 10000;


-- 6. Sales by Product
SELECT
    Product,
    SUM(Quantity * Price) AS Total_Sales
FROM customer_sales
GROUP BY Product
ORDER BY Total_Sales DESC;


-- 7. Sales by City
SELECT
    City,
    SUM(Quantity * Price) AS Total_Sales
FROM customer_sales
GROUP BY City
ORDER BY Total_Sales DESC;


-- 8. Sales by Category
SELECT
    Category,
    SUM(Quantity * Price) AS Total_Sales
FROM customer_sales
GROUP BY Category
ORDER BY Total_Sales DESC;


-- 9. Sales by Customer
SELECT
    Customer_Name,
    SUM(Quantity * Price) AS Total_Sales
FROM customer_sales
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;


-- 10. Total Orders
SELECT
    COUNT(*) AS Total_Orders
FROM customer_sales;


-- 11. Average Product Price
SELECT
    AVG(Price) AS Average_Price
FROM customer_sales;


-- 12. Minimum and Maximum Price
SELECT
    MIN(Price) AS Minimum_Price,
    MAX(Price) AS Maximum_Price
FROM customer_sales;


-- 13. Category Sales Above 50,000
SELECT
    Category,
    SUM(Quantity * Price) AS Total_Sales
FROM customer_sales
GROUP BY Category
HAVING SUM(Quantity * Price) > 50000;


-- 14. Products With Quantity Greater Than 2
SELECT
    Product,
    SUM(Quantity) AS Total_Quantity
FROM customer_sales
GROUP BY Product
HAVING SUM(Quantity) > 2;


-- 15. Cities With More Than 3 Orders
SELECT
    City,
    COUNT(*) AS Total_Orders
FROM customer_sales
GROUP BY City
HAVING COUNT(*) > 3;


-- 16. Customer Details Table
CREATE TABLE IF NOT EXISTS customer_details (
    Customer_ID VARCHAR(10),
    Customer_Email VARCHAR(100),
    Age INT
);


-- 17. INNER JOIN - Customer and Sales Details
SELECT
    customer_sales.Customer_ID,
    customer_sales.Customer_Name,
    customer_sales.Product,
    customer_details.Customer_Email,
    customer_details.Age
FROM customer_sales
INNER JOIN customer_details
ON customer_sales.Customer_ID = customer_details.Customer_ID;


-- 18. Customer Sales With Details
SELECT
    cs.Customer_ID,
    cs.Customer_Name,
    cd.Customer_Email,
    cd.Age,
    SUM(cs.Quantity * cs.Price) AS Total_Sales
FROM customer_sales cs
INNER JOIN customer_details cd
    ON cs.Customer_ID = cd.Customer_ID
GROUP BY
    cs.Customer_ID,
    cs.Customer_Name,
    cd.Customer_Email,
    cd.Age
ORDER BY Total_Sales DESC;


-- 19. High-Value Customers
SELECT
    cs.Customer_Name,
    cd.Customer_Email,
    SUM(cs.Quantity * cs.Price) AS Total_Sales
FROM customer_sales cs
INNER JOIN customer_details cd
    ON cs.Customer_ID = cd.Customer_ID
GROUP BY
    cs.Customer_Name,
    cd.Customer_Email
HAVING SUM(cs.Quantity * cs.Price) > 50000
ORDER BY Total_Sales DESC;


-- 20. Monthly Sales Analysis
SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS Sales_Month,
    SUM(Quantity * Price) AS Total_Sales
FROM customer_sales
GROUP BY Sales_Month
ORDER BY Sales_Month;


-- 21. Top-Selling Product
SELECT
    Product,
    SUM(Quantity * Price) AS Total_Sales
FROM customer_sales
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 1;


-- 22. Top 5 Customers
SELECT
    Customer_Name,
    SUM(Quantity * Price) AS Total_Sales
FROM customer_sales
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 5;


-- 23. Total Revenue
SELECT
    SUM(Quantity * Price) AS Total_Revenue
FROM customer_sales;


-- 24. Final Sales by Category
SELECT
    Category,
    SUM(Quantity * Price) AS Total_Sales
FROM customer_sales
GROUP BY Category
ORDER BY Total_Sales DESC;


-- 25. Final Sales by City
SELECT
    City,
    SUM(Quantity * Price) AS Total_Sales
FROM customer_sales
GROUP BY City
ORDER BY Total_Sales DESC;