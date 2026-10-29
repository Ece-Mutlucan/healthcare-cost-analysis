# Healthcare Cost Analysis

**End-to-end healthcare cost analysis using Python, PostgreSQL, and Tableau Public**

[![Tableau Public](https://img.shields.io/badge/Tableau-Public%20Dashboard-E97627?logo=tableau&logoColor=white)](https://public.tableau.com/app/profile/ece.mutlucan/viz/HealthcareCostOverview/Dashboard1?publish=yes)
[![Python](https://img.shields.io/badge/Python-pandas%20%7C%20Matplotlib-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![SQL](https://img.shields.io/badge/SQL-PostgreSQL-4169E1?logo=postgresql&logoColor=white)](https://www.postgresql.org/)

## Project overview

Healthcare leaders need to understand which patient and clinical factors are associated with higher healthcare costs, how costs vary by diagnosis and visit type, and how financial responsibility is distributed between insurers and patients.

This portfolio project combines exploratory data analysis in Python, reusable SQL queries, and an interactive Tableau Public dashboard.

**Business question:** Which patient and clinical factors are associated with higher healthcare costs, and where should the organization focus further investigation?

## Live dashboard

**[Open Healthcare Cost Overview on Tableau Public](https://public.tableau.com/app/profile/ece.mutlucan/viz/HealthcareCostOverview/Dashboard1?publish=yes)**

## Tools and methods

- **Python:** pandas for data loading, joins, validation, aggregation, patient-level profiling, and data export; Matplotlib for exploratory charts.
- **SQL (PostgreSQL):** diagnosis cost drivers, visit-type comparison, insurer versus patient burden, high-cost patients, and data-quality checks.
- **Tableau Public:** published interactive healthcare cost overview.
- **Data quality:** row counts, nulls, duplicate keys, and unmatched joins.
- **Feature engineering:** age bands, visit counts, diagnosis counts, chronic-condition counts, and a high-cost cohort flag.

## Data model

```text
patients (patient_id)
        │
        └── visits (patient_id)
                ├── costs (visit_id)
                └── diagnoses_ref (icd_code)
```

| Table | Key | Example fields |
|---|---|---|
| `patients` | `patient_id` | age, gender, insurance type, smoking status, risk score |
| `visits` | `visit_id` | patient, ICD code, date, visit type, provider |
| `costs` | `visit_id` | total cost, insurance paid, patient paid |
| `diagnoses_ref` | `icd_code` | diagnosis, category, severity, chronic flag |

## Repository structure

```text
.
├── data/                 # Data usage notes; add authorized source workbook locally
├── docs/                 # Data dictionary, methodology, and limitations
├── notebooks/            # Reproducible Python analysis notebook
├── sql/                  # Data quality checks and business analysis queries
├── tableau/              # Published dashboard link and notes
├── requirements.txt
├── .gitignore
└── LICENSE
```

## Reproduce the analysis

1. Install Python 3.10+ and dependencies: `pip install -r requirements.txt`.
2. Place the authorized hackathon workbook at `data/healthcare_dataset.xlsx`. See [data/README.md](data/README.md).
3. Open `notebooks/healthcare_cost_analysis.ipynb` in Jupyter and run cells from top to bottom.
4. The notebook writes a Tableau-ready extract to `data/processed/tableau_data.csv`.
5. Run the SQL files in a PostgreSQL database containing the source tables. Examples assume schema `project`; update names as necessary.
6. Open the live dashboard using the Tableau link above.

## Data coverage and limitations

The supplied workbook reports 3,000 patients, 16,029 visits, and 16,029 cost records in the full dataset, but the embedded visit and cost sheets are preview extracts (up to 5,000 rows each). The visit and cost preview tabs do not contain fully overlapping `visit_id` values: the provided analysis found 1,576 cost-linked visits from 5,000 preview visits. As a result, preview-derived totals must not be interpreted as complete organizational healthcare spending or population-level findings.

The workbook was not committed to this public repository because its redistribution permission is not established here. Add only the source workbook approved for public sharing by the hackathon organizers. The local downloadable project bundle contains the supplied workbook for personal reproducibility.

The source materials do not specify the currency/unit of the cost columns. Analyses describe associations, not causality. The Tableau workbook file (`.twb`/`.twbx`) was not included among uploaded materials; the live published dashboard is linked above.

## SQL files

- [Data quality checks](sql/00_data_quality_checks.sql)
- [Diagnosis cost drivers](sql/01_diagnosis_cost_drivers.sql)
- [Visit type costs](sql/02_visit_type_costs.sql)
- [Insurance and patient burden](sql/03_insurance_patient_burden.sql)
- [High-cost patients](sql/04_high_cost_patients.sql)

## Author

**Ece Mutlucan** — Data Analytics Portfolio Project
