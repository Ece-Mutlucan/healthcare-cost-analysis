# Dataset instructions

Place the hackathon workbook at `data/healthcare_dataset.xlsx` to run the notebook locally. The workbook supplied in the chat bundle contains the workshop guide, a diagnosis reference table, summary tables, SQL reference material, and preview extracts for patients, visits, and costs.

## Coverage warning

The workbook describes the full dataset as 3,000 patients, 16,029 visits, and 16,029 cost records. Its embedded sheets contain only preview extracts (up to 5,000 visit and cost rows). The preview IDs do not fully overlap, so joined cost totals only cover the matched subset. These results are not complete population-level estimates.

## Publishing

The workbook is excluded from Git by `.gitignore` until redistribution permission is confirmed with the hackathon organizers. Do not publish identifiable, confidential, or restricted patient data. Only place a source workbook in this folder if it is approved for local use and public redistribution.
