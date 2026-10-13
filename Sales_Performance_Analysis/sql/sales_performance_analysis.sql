-- Sales Performance Analysis (table: sales_data)
-- Core KPIs
SELECT SUM(Sales) AS total_sales, SUM(Profit) AS total_profit, SUM(Quantity) AS units_sold,
 COUNT(DISTINCT Order_ID) AS distinct_orders,
 SUM(Profit)/NULLIF(SUM(Sales),0)*100 AS profit_margin_pct
FROM sales_data WHERE Quantity>0;

-- Monthly sales and profit (PostgreSQL syntax)
SELECT DATE_TRUNC('month', CAST(Order_Date AS DATE)) AS sales_month,
 SUM(Sales) AS total_sales, SUM(Profit) AS total_profit
FROM sales_data GROUP BY DATE_TRUNC('month', CAST(Order_Date AS DATE)) ORDER BY sales_month;

-- Region performance
SELECT Region, SUM(Sales) AS total_sales, SUM(Profit) AS total_profit
FROM sales_data GROUP BY Region ORDER BY total_sales DESC;

-- Category and product performance
SELECT Category, SUM(Sales) AS total_sales, SUM(Profit) AS total_profit,
 SUM(Profit)/NULLIF(SUM(Sales),0)*100 AS margin_pct
FROM sales_data GROUP BY Category ORDER BY total_sales DESC;

SELECT Product, SUM(Sales) AS total_sales, SUM(Profit) AS total_profit, SUM(Quantity) AS units_sold
FROM sales_data GROUP BY Product ORDER BY total_profit DESC;

-- Data quality checks
SELECT SUM(CASE WHEN Region IS NULL OR TRIM(Region)='' THEN 1 ELSE 0 END) AS missing_region,
 SUM(CASE WHEN Quantity<=0 THEN 1 ELSE 0 END) AS invalid_quantity_rows
FROM sales_data;
