-- Question: Find the 3rd transaction for each user,
-- ordered chronologically.

SELECT
    user_id,
    spend,
    transaction_date
FROM (
    SELECT
        user_id,
        spend,
        transaction_date,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY transaction_date
        ) AS rn
    FROM transactions
) sub
WHERE rn = 3;
