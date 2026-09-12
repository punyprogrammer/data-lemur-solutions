SELECT
    candidate_id
FROM candidates
GROUP BY candidate_id
HAVING 'Python' = ANY(ARRAY_AGG(skill))
   AND 'Tableau' = ANY(ARRAY_AGG(skill))
   AND 'PostgreSQL' = ANY(ARRAY_AGG(skill))
ORDER BY candidate_id
;
