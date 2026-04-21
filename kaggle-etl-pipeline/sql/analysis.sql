-- =========================================
-- BASIC DATA CHECK
-- =========================================

SELECT TOP 10 * FROM orders;


-- =========================================
-- TOTAL SALES BY PRODUCT
-- =========================================

SELECT product,
       SUM(sales) AS total_sales
FROM orders
GROUP BY product
ORDER BY total_sales DESC;


-- =========================================
-- TOTAL SALES BY USER
-- =========================================

SELECT user_id,
       SUM(sales) AS total_sales
FROM orders
GROUP BY user_id
ORDER BY total_sales DESC;


-- =========================================
-- TOP 5 USERS BY SALES (RANKING)
-- =========================================

SELECT user_id,
       SUM(sales) AS total_sales,
       RANK() OVER (ORDER BY SUM(sales) DESC) AS rank
FROM orders
GROUP BY user_id;


-- =========================================
-- DAILY SALES TREND
-- =========================================

SELECT order_date,
       SUM(sales) AS daily_sales
FROM orders
GROUP BY order_date
ORDER BY order_date;


-- =========================================
-- CUMULATIVE SALES
-- =========================================

SELECT order_date,
       SUM(sales) AS daily_sales,
       SUM(SUM(sales)) OVER (ORDER BY order_date) AS cumulative_sales
FROM orders
GROUP BY order_date;


-- =========================================
-- TOP PRODUCTS BY PROFIT
-- =========================================

SELECT product,
       SUM(profit) AS total_profit
FROM orders
GROUP BY product
ORDER BY total_profit DESC;


-- =========================================
-- AVERAGE SALES PER ORDER
-- =========================================

SELECT AVG(sales) AS avg_sales
FROM orders;


-- =========================================
-- SALES CATEGORY USING CASE
-- =========================================

SELECT order_id,
       sales,
       CASE
           WHEN sales > 500 THEN 'High'
           WHEN sales BETWEEN 200 AND 500 THEN 'Medium'
           ELSE 'Low'
       END AS sales_category
FROM orders;


-- =========================================
-- IDENTIFY DUPLICATE USERS (if any)
-- =========================================

SELECT user_id, COUNT(*) AS cnt
FROM orders
GROUP BY user_id
HAVING COUNT(*) > 1;


-- =========================================
-- TOP 3 PRODUCTS PER USER (WINDOW FUNCTION)
-- =========================================

SELECT *
FROM (
    SELECT user_id,
           product,
           sales,
           ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY sales DESC) AS rn
    FROM orders
) t
WHERE rn <= 3;


-- =========================================
-- PERCENTAGE CONTRIBUTION OF EACH PRODUCT
-- =========================================

SELECT product,
       SUM(sales) AS total_sales,
       SUM(sales) * 100.0 / SUM(SUM(sales)) OVER () AS percentage
FROM orders
GROUP BY product;