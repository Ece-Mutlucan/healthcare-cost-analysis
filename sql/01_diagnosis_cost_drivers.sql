-- Highest-cost diagnoses and categories
SELECT
  d.diagnosis_name AS diagnosis,
  d.category,
  COUNT(*) AS visit_count,
  ROUND(AVG(c.total_cost)::numeric, 2) AS average_cost,
  ROUND(SUM(c.total_cost)::numeric, 2) AS total_cost
FROM project.visits v
JOIN project.costs c ON v.visit_id = c.visit_id
JOIN project.diagnoses_ref d ON v.icd_code = d.icd_code
WHERE c.total_cost IS NOT NULL
GROUP BY d.icd_code, d.diagnosis_name, d.category
ORDER BY total_cost DESC
LIMIT 10;
