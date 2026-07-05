-- net return per dollar lent, by grade
-- if pricing covered risk this would rise from A to G. it falls instead
select
    grade,
    count(*) as loans,
    avg(int_rate) as avg_rate,
    sum(total_pymnt) / sum(funded_amnt) - 1 as net_return -- dollars in vs out. nets out defaults, early payoffs, recoveries
from lending.public.loans_clean
group by grade
order by grade;