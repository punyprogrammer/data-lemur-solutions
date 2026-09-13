-- Get employees whose salary is greater than their manager's salary.
-- The correlated subquery uses the employee's manager_id
-- to retrieve the corresponding manager's salary.

SELECT
    employee_id,
    name AS employee_name
FROM employee e
WHERE e.salary > (
    SELECT m.salary
    FROM employee m
    WHERE m.employee_id = e.manager_id
)
AND e.manager_id IS NOT NULL;
