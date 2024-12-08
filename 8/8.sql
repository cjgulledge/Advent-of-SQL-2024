WITH RECURSIVE staff_hierarchy AS (
  -- Base case: top-level employees (no manager)
  SELECT 
    s.staff_id,
    s.staff_name,
    1 AS level,
    CAST(s.staff_id AS TEXT) AS path
  FROM staff s
  WHERE s.manager_id IS NULL

  UNION ALL

  -- Recursive case: find direct reports of previously found employees
  SELECT
    c.staff_id,
    c.staff_name,
    p.level + 1 AS level,
    p.path || ',' || c.staff_id AS path
  FROM staff c
  JOIN staff_hierarchy p ON c.manager_id = p.staff_id
)
SELECT staff_id, staff_name, level, path
FROM staff_hierarchy
ORDER BY level DESC, staff_id;
