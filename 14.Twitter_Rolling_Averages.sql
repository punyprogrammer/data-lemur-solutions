-- Question: Calculate the 3-day rolling average of tweet_count for each user.

SELECT
    user_id,
    tweet_date,
    ROUND(
        AVG(tweet_count) OVER (
            PARTITION BY user_id
            ORDER BY tweet_date
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS rolling_avg_3d
FROM tweets;
