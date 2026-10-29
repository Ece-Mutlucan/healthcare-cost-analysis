-- Run before cost analysis. PostgreSQL syntax.
-- Adjust schema/table names if your database differs.

SELECT 'patients' AS table_name, COUNT(*) AS row_count FROM project.patients
UNION ALL SELECT 'visits', COUNT(*) FROM project.visits
UNION ALL SELECT 'costs', COUNT(*) FROM project.costs
UNION ALL SELECT 'diagnoses_ref', COUNT(*) FROM project.diagnoses_ref;

-- Each query should return zero rows if the key is unique.
SELECT patient_id, COUNT(*) AS row_count
FROM project.patients GROUP BY patient_id HAVING COUNT(*) > 1;

SELECT visit_id, COUNT(*) AS row_count
FROM project.visits GROUP BY visit_id HAVING COUNT(*) > 1;

SELECT visit_id, COUNT(*) AS row_count
FROM project.costs GROUP BY visit_id HAVING COUNT(*) > 1;

SELECT icd_code, COUNT(*) AS row_count
FROM project.diagnoses_ref GROUP BY icd_code HAVING COUNT(*) > 1;

-- Join coverage
SELECT
  COUNT(*) AS total_visits,
  COUNT(p.patient_id) AS matched_patients,
  COUNT(d.icd_code) AS matched_diagnoses,
  COUNT(c.visit_id) AS matched_cost_records,
  COUNT(*) FILTER (WHERE c.total_cost IS NOT NULL) AS visits_with_non_null_cost
FROM project.visits v
LEFT JOIN project.patients p ON p.patient_id = v.patient_id
LEFT JOIN project.diagnoses_ref d ON d.icd_code = v.icd_code
LEFT JOIN project.costs c ON c.visit_id = v.visit_id;
