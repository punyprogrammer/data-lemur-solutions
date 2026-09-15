-- Question: Calculate the percentage of time spent on
-- open and send activities for each age bucket.

WITH activity_time AS (
    SELECT
        b.age_bucket,

        SUM(
            CASE
                WHEN a.activity_type = 'open'
                THEN a.time_spent
                ELSE 0
            END
        ) AS open_time,

        SUM(
            CASE
                WHEN a.activity_type = 'send'
                THEN a.time_spent
                ELSE 0
            END
        ) AS send_time

    FROM activities a
    JOIN age_breakdown b
        ON a.user_id = b.user_id

    GROUP BY b.age_bucket
)

SELECT
    age_bucket,

    ROUND(
        send_time * 100.0
        / NULLIF(send_time + open_time, 0),
        2
    ) AS send_perc,

    ROUND(
        open_time * 100.0
        / NULLIF(send_time + open_time, 0),
        2
    ) AS open_perc

FROM activity_time;
