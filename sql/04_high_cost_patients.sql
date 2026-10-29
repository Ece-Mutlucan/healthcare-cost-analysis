-- Patient-level cost concentration
SELECT
  v.patient_id,
  COUNT(*) AS visit_count,
  COUNT(DISTINCT v.icd_code) AS distinct_diagnosis_count,
  ROUND(AVG(c.total_cost)::numeric, 2) AS average_cost,
  ROUND(SUM(c.total_cost)::numeric, 2) AS total_cost
FROM project.visits v
JOIN project.costs c ON v.visit_id = c.visit_id
WHERE c.total_cost IS NOT NULL
GROUP BY v.patient_id
ORDER BY total_cost DESC
LIMIT 20;
