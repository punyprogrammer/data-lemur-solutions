-- Question: Calculate the cumulative number of song plays
-- for each user and song up to August 4, 2022,
-- combining historical and weekly song plays.

WITH combined AS (

    -- Historical song plays are already aggregated.
    SELECT
        user_id,
        song_id,
        song_plays
    FROM songs_history

    UNION ALL

    -- Count weekly song plays and aggregate them
    -- to the same user_id + song_id level.
    SELECT
        user_id,
        song_id,
        COUNT(*) AS song_plays
    FROM songs_weekly
    WHERE listen_time < '2022-08-05'
    GROUP BY
        user_id,
        song_id
)

-- Combine historical and weekly plays.
SELECT
    user_id,
    song_id,
    SUM(song_plays) AS song_plays
FROM combined
GROUP BY
    user_id,
    song_id
ORDER BY
    song_plays DESC;
