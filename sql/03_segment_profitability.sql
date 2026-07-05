-- 20 worst segments by net return
with banded as (
    select *,
           -- income quartiles; fixed dollar cutoffs wouldn't be fair across 11 years
           ntile(4) over (order by annual_inc) as income_band 
    from lending.public.loans_clean)
select
    grade,
    purpose,
    income_band,
    count(*) as loans,
    avg(int_rate) as avg_rate,
    sum(total_pymnt) / sum(funded_amnt) - 1 as net_return
from banded
group by grade, purpose, income_band
having count(*) >= 1000 -- dropping tiny segments where the rate is noise
order by net_return
limit 20;