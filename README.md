# Credit Risk Analytics with dbt and DuckDB

## Overview

A small analytics engineering project demonstrating SQL transformations,
data-quality testing and portfolio risk reporting with dbt and DuckDB.

The project uses synthetic loan records.

## Data pipeline

1. raw_loans.csv: synthetic source loan records.
2. stg_loans: standardizes data types and derives delinquency buckets
   and balance-to-income ratios.
3. mart_credit_risk: aggregates loan counts, outstanding exposure,
   overdue exposure and delinquency rates by risk segment.

## Data quality

dbt tests check loan ID uniqueness, required fields, valid risk
segments and unique risk-segment rows in the reporting model.

## Key metrics

- Loan count
- Total outstanding exposure
- Overdue exposure
- Percentage of loans with any days past due

## Run locally

After installing dbt-duckdb and configuring the dbt profile:

    dbt debug
    dbt seed
    dbt build
    dbt docs generate

## Limitations

All records are synthetic and created for demonstration. Risk segments
are illustrative, not a validated credit-risk model. Results are not
intended for lending decisions or real-world risk assessment.

## Potential extensions

- Add tests for non-negative balances and valid income.
- Add monthly portfolio trends.
- Add exposure-weighted delinquency metrics.
