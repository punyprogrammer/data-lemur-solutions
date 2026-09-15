-- Question: Find the top 3 salary levels for each department,
-- including all employees tied at the 3rd salary level.

WITH cte AS (
    SELECT
        d.department_name,
        e.name,
        e.salary,

        -- Rank employees by salary within each department.
        -- DENSE_RANK() does not skip ranks when salaries are tied.
        DENSE_RANK() OVER (
            PARTITION BY d.department_name
            ORDER BY e.salary DESC
        ) AS rn

    FROM employee e
    JOIN department d
        ON e.department_id = d.department_id
)

-- Keep employees belonging to the top 3 salary levels.
SELECT
    department_name,
    name,
    salary
FROM cte
WHERE rn <= 3

-- Sort the final output by department,
-- then salary (highest first), then employee name.
ORDER BY
    department_name,
    salary DESC,
    name;
