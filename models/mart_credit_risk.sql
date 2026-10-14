-- Aggregate loan exposure and delinquency by risk segment.

select
    risk_segment,
    count(*) as loan_count,
    sum(outstanding_balance) as total_exposure,

    sum(
        case
            when days_past_due > 0
            then outstanding_balance
            else 0
        end
    ) as overdue_exposure,

    round(
        100.0 * sum(
            case
                when days_past_due > 0 then 1
                else 0
            end
        ) / nullif(count(*), 0),
        2
    ) as delinquent_loan_pct

from {{ ref('stg_loans') }}
group by risk_segment
