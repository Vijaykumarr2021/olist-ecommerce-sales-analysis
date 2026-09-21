SELECT
    orders_per_customer,
    COUNT(*) AS customers
FROM (
    SELECT c.customer_unique_id, COUNT(DISTINCT o.order_id) AS orders_per_customer
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
)
GROUP BY orders_per_customer
ORDER BY orders_per_customer;