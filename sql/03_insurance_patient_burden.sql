-- Financial burden by insurance type
SELECT
  p.insurance_type,
  ROUND(SUM(c.total_cost)::numeric, 2) AS total_cost,
  ROUND(SUM(c.insurance_paid)::numeric, 2) AS insurance_paid,
  ROUND(SUM(c.patient_paid)::numeric, 2) AS patient_paid,
  ROUND((100.0 * SUM(c.patient_paid) / NULLIF(SUM(c.total_cost), 0))::numeric, 1) AS patient_share_pct,
  ROUND((100.0 * SUM(c.insurance_paid) / NULLIF(SUM(c.total_cost), 0))::numeric, 1) AS insurance_share_pct
FROM project.patients p
JOIN project.visits v ON p.patient_id = v.patient_id
JOIN project.costs c ON v.visit_id = c.visit_id
WHERE c.total_cost IS NOT NULL
GROUP BY p.insurance_type
ORDER BY patient_share_pct DESC NULLS LAST;
