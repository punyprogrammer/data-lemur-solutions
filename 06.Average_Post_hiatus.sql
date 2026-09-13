SELECT
    user_id,
    FLOOR(
        EXTRACT(EPOCH FROM (MAX(post_date) - MIN(post_date))) / 86400
    ) AS days_between
FROM posts
WHERE post_date >= '2021-01-01'
  AND post_date <  '2022-01-01'
GROUP BY user_id
HAVING COUNT(post_date) >= 2;
