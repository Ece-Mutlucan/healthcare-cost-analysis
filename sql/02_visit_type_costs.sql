-- Cost and utilization by visit type
SELECT
  v.visit_type,
  COUNT(*) AS visit_count,
  ROUND(AVG(c.total_cost)::numeric, 2) AS average_cost,
  ROUND(SUM(c.total_cost)::numeric, 2) AS total_cost
FROM project.visits v
JOIN project.costs c ON v.visit_id = c.visit_id
WHERE c.total_cost IS NOT NULL
GROUP BY v.visit_type
ORDER BY total_cost DESC;
