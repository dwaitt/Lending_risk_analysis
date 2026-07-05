-- sizing the losing segments: share of volume, dollars burned,
-- and what portfolio return would have been without them
with banded as (
    select *, ntile(4) over (order by annual_inc) as income_band
    from lending.public.loans_clean
),
segments as (
    select grade, purpose, income_band,
           sum(funded_amnt) as funded,
           sum(total_pymnt - funded_amnt) as net_dollars
    from banded
    group by grade, purpose, income_band
    having count(*) >= 1000)
select
    sum(funded) as total_funded,
    sum(net_dollars) / sum(funded) as portfolio_return,
    sum(case when net_dollars < 0 then funded end) / sum(funded) as pct_volume_in_losing_segments,
    sum(case when net_dollars < 0 then net_dollars end) as total_lost_in_losing_segments,
    sum(case when net_dollars >= 0 then net_dollars end)
      / sum(case when net_dollars >= 0 then funded end) as return_without_losing_segments
from segments;