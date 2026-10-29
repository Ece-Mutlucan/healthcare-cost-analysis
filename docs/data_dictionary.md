# Data dictionary

The analysis uses four logical tables described in the hackathon workbook.

## `patients`

| Field | Description |
|---|---|
| `patient_id` | Patient key |
| `age` | Age in years |
| `gender` | Gender category supplied with the source |
| `insurance_type` | Insurance category |
| `smoking_status` | Smoking status |
| `risk_score` | Source-provided patient risk score |

## `visits`

| Field | Description |
|---|---|
| `visit_id` | Visit key |
| `patient_id` | Patient foreign key |
| `icd_code` | Diagnosis-code key |
| `diagnosis` | Source diagnosis label |
| `visit_date` | Visit date |
| `visit_type` | Type of visit |
| `provider` | Provider field |

## `costs`

| Field | Description |
|---|---|
| `visit_id` | Visit key |
| `total_cost` | Total cost recorded for a visit |
| `insurance_paid` | Portion paid by insurance |
| `patient_paid` | Portion paid by the patient |

## `diagnoses_ref`

| Field | Description |
|---|---|
| `icd_code` | Diagnosis-code key |
| `diagnosis_name` | Standardized diagnosis name |
| `category` | Diagnosis category |
| `severity` | Severity classification |
| `chronic` | Chronic-condition indicator |

## Join keys

- `patients.patient_id = visits.patient_id`
- `visits.visit_id = costs.visit_id`
- `visits.icd_code = diagnoses_ref.icd_code`

The SQL examples use the PostgreSQL schema `project`. One supplied query referred to `project.diagnoses`, while the workbook and notebook use `diagnoses_ref`; this repository standardizes the reference table name as `project.diagnoses_ref`.
