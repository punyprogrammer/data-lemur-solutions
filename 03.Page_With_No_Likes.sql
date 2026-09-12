SELECT
    a.page_id
FROM pages a
LEFT JOIN page_likes b
    ON a.page_id = b.page_id
GROUP BY a.page_id
HAVING COUNT(b.page_id) = 0
ORDER BY a.page_id;
