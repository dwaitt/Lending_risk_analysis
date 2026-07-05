-- 36-month loans through 2015 only. later vintages hadn't finished by the 2018 data cutoff
select
    issue_year,
    count(*) as loans,
    avg(case when loan_status = 'Charged Off' then 1 else 0 end) as default_rate,
    sum(total_pymnt) / sum(funded_amnt) - 1 as net_return
from lending.public.loans_clean
where grade in ('E', 'F', 'G') -- the unprofitable grades from 02
  and term_months = 36
  and issue_year <= 2015
group by issue_year
order by issue_year;