# Solution oone
-- simple case 
SELECT 
COUNT(
CASE 
 WHEN device_type = 'laptop'
 THEN 1
END
) AS laptop_views,
COUNT(
 CASE 
 WHEN device_type IN ('phone','tablet')
 THEN 1 
 END
) AS mobile_views
FROM viewership;
# solution 2 
-- using filer FUNCTION
SELECT 
  COUNT(*) FILTER (WHERE device_type = 'laptop') AS laptop_views,
  COUNT(*) FILTER (WHERE device_type IN ('tablet', 'phone'))  AS mobile_views 
FROM viewership;
-- using SUM 

# solution3 
SELECT 
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views, 
  SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views 
FROM viewership;
