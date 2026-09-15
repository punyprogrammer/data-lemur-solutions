-- Question: Find the top 2 products by total spend
-- for each category in 2022.
-- Include all products tied at the 2nd highest spend.

WITH sub AS (
    -- Step 1: Calculate total spend for each
    -- category-product combination in 2022.
    SELECT
        category,
        product,
        SUM(spend) AS total
    FROM product_spend
    WHERE EXTRACT(YEAR FROM transaction_date) = 2022
    GROUP BY
        category,
        product
)

-- Step 2: Rank products within each category
-- based on total spend, highest first.
SELECT
    category,
    product,
    total
FROM (
    SELECT
        category,
        product,
        total,

        RANK() OVER (
            PARTITION BY category
            ORDER BY total DESC
        ) AS rn

    FROM sub
) agg

-- Step 3: Keep the top 2 ranks for each category.
-- RANK() includes ties, so more than 2 rows
-- can be returned for a category if there is a tie.
WHERE rn <= 2;
