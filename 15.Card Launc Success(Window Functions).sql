-- Question: Get the issued amount for the first month
-- for each card, returning only one row per card.


    SELECT DISTINCT
        card_name,
        FIRST_VALUE(issued_amount) OVER (
            PARTITION BY card_name
            ORDER BY  issue_year,issue_month
        ) AS issued_amount
       
    FROM monthly_cards_issued
    ORDER BY card_name DESC
