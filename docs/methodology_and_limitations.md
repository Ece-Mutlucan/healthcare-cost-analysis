# Methodology and limitations

## Workflow

1. Load the workbook extracts and inspect row counts, nulls, duplicate rows, and key uniqueness.
2. Use `visits` as the base table at visit grain.
3. Join patient attributes on `patient_id`, diagnosis reference attributes on `icd_code`, and costs on `visit_id`.
4. Validate join cardinality and report unmatched keys.
5. Restrict cost summaries to visits with matched, non-null costs.
6. Summarize diagnosis categories, visit types, monthly costs, and patient-level cost concentration.
7. Export the matched visit-grain analysis table for Tableau.

## Recorded preview data checks

The supplied workbook contains 3,000 patient rows, 5,000 visit rows, 5,000 cost rows, and 40 diagnosis-reference rows in its preview sheets. The notebook's join check found no unmatched patient or diagnosis keys, but 3,424 visit IDs had no matching cost record; 1,576 preview visits had non-null costs.

This reflects incomplete/non-aligned preview extracts and should not be described as a quality issue in the full source data.

## High-cost cohort

The notebook flags patients at or above the 80th percentile of patient-level total cost within the matched preview cohort. This exploratory segmentation is not a predictive clinical model.

## Limitations

- The workbook contains preview extracts, not all 16,029 visits and cost records described in the workshop guide.
- Preview joins cover only matched visit IDs and may be biased if missing costs are not random.
- The source materials do not specify the currency or unit for the cost fields.
- Associations are descriptive and do not establish causality.
- No local Tableau `.twb`/`.twbx` file was provided; only the published dashboard URL is available.
- Full source CSVs are needed to calculate complete totals. Confirm redistribution permissions before publishing any source data.
