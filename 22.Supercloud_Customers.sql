-- Question: Find customers who have contracted products
-- from every product category available in the products table.

SELECT
    c.customer_id
FROM customer_contracts c

JOIN products p
    ON c.product_id = p.product_id

GROUP BY
    c.customer_id

-- The number of distinct categories purchased by the customer
-- must equal the total number of distinct categories available.
HAVING COUNT(DISTINCT p.product_category) = (
    SELECT COUNT(DISTINCT product_category)
    FROM products
);
