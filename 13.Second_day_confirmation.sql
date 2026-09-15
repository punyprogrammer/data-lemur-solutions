-- Question:
-- Find the user_ids of users who received a text exactly
-- 1 day after signing up.
--
-- Approach:
-- 1. Join the emails table with the texts table using email_id.
-- 2. Compare the signup date with the text action date.
-- 3. Return users where the difference is exactly 1 day.

SELECT
    e.user_id
FROM emails AS e
JOIN texts AS t
    ON e.email_id = t.email_id
WHERE t.action_date::date - e.signup_date::date = 1;
