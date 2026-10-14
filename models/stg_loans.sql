-- Standardize synthetic loan data and derive risk indicators.

select
    cast(loan_id as varchar) as loan_id,
    cast(borrower_id as varchar) as borrower_id,
    cast(loan_amount as double) as loan_amount,
    cast(outstanding_balance as double) as outstanding_balance,
    cast(annual_income as double) as annual_income,
    cast(days_past_due as integer) as days_past_due,
    cast(risk_segment as varchar) as risk_segment,

    outstanding_balance / nullif(annual_income, 0)
        as balance_to_income_ratio,

    case
        when days_past_due = 0 then 'Current'
        when days_past_due between 1 and 30 then '1-30 days'
        when days_past_due between 31 and 60 then '31-60 days'
        else '61+ days'
    end as delinquency_bucket

from {{ ref('raw_loans') }}
