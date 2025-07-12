-- Average delivery time per customer state
-- Using a CTE to calculate the average delivery time differences before grouping by customer states
 WITH delivery_times AS (
   SELECT
     o.order_id,
     c.customer_state,
     DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp) AS delivery_days
   FROM orders AS o
   JOIN customers AS c
     ON o.customer_id = c.customer_id
   WHERE
     o.order_status = 'delivered'
     AND o.order_delivered_customer_date IS NOT NULL
     AND o.order_purchase_timestamp IS NOT NULL
)
SELECT
  customer_state,
  ROUND(AVG(delivery_days), 2) AS average_delivery_days,
  COUNT(order_id) AS total_orders
FROM delivery_times
GROUP BY customer_state
ORDER BY average_delivery_days DESC
LIMIT 5;

-- Top 10 categories by total sales revenue
-- Shows the highest-earning categories based on item sales and price
SELECT
  p.product_category_name  AS category,
  COUNT(oi.order_id)                 AS units_sold,
  ROUND(SUM(oi.price), 2)  AS total_revenue
FROM order_items AS oi
JOIN products    AS p
  ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Top 5 customers by total spend
-- Identifies highest-value customers by summing item and shipping costs
SELECT
  c.customer_unique_id,
  ROUND(SUM(oi.price + oi.freight_value), 2) AS total_spent,
  COUNT(DISTINCT o.order_id) AS total_orders
FROM customers AS c
JOIN orders    AS o 
  ON c.customer_id = o.customer_id
JOIN order_items AS oi
  ON o.order_id = oi.order_id
GROUP BY c.customer_unique_id
ORDER BY total_spent DESC
LIMIT 5;

-- Top 10 sellers by total revenue
-- Identifies the most profitable sellers by summing item and shipping revenue
SELECT
  s.seller_id,
  ROUND(SUM(oi.price + oi.freight_value), 2) AS total_revenue,
  COUNT(DISTINCT oi.order_id) AS total_orders
FROM order_items AS oi
JOIN sellers    AS s
  ON oi.seller_id = s.seller_id
GROUP BY s.seller_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Top 5 customer states by orders and delivery speed
-- Combines volume and efficiency to reveal high-demand regions and their logistics performance
SELECT
  c.customer_state,
  COUNT(DISTINCT o.order_id) AS total_orders,
  ROUND(AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)), 1) AS avg_delivery_days
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY total_orders DESC
LIMIT 5;

-- Top 10 product categories by order volume
-- Highlights which product categories are most frequently ordered
SELECT
  p.product_category_name,
  COUNT(oi.order_id) AS total_orders
FROM order_items AS oi
JOIN products AS p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_orders DESC
LIMIT 10;

-- Preferred payment type by customers
-- Reveals how customers prefer to pay for their orders
SELECT 
  payment_type,
  COUNT(order_id)       AS number_of_orders,
  ROUND(100.0 * COUNT(order_id) / (SELECT COUNT(*) FROM payments), 2) AS percentage_of_orders
  FROM payments
  GROUP BY payment_type
  ORDER BY number_of_orders DESC;
