-- Calculate the Click-Through Rate (CTR) for each app based on
-- impression and click events recorded during the year 2022.
-- The CTE first calculates total impressions and clicks per app.
-- The outer query then uses these aggregated values to calculate CTR.

WITH app_stats AS (
    SELECT
        app_id,

        -- Count the number of impression events for each app
        SUM(
            CASE
                WHEN event_type = 'impression' THEN 1
                ELSE 0
            END
        ) AS impressions,

        -- Count the number of click events for each app
        SUM(
            CASE
                WHEN event_type = 'click' THEN 1
                ELSE 0
            END
        ) AS clicks

    FROM events

    -- Consider only events that occurred in 2022
    WHERE EXTRACT(YEAR FROM timestamp) = 2022

    -- Aggregate impressions and clicks for each app
    GROUP BY app_id
)

-- Calculate CTR using the aggregated clicks and impressions.
-- NULLIF prevents division-by-zero when an app has no impressions.
-- Multiply by 100 to express CTR as a percentage.
-- ROUND(..., 2) limits the result to two decimal places.
SELECT
    app_id,
    ROUND(
        100.0 * clicks / NULLIF(impressions, 0),
        2
    ) AS ctr
FROM app_stats;
