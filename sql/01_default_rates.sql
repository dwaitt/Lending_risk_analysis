-- default and loss rates by grade
select
    grade,
    count(*) as loans,
    avg(int_rate) as avg_rate,
    avg(case when loan_status = 'Charged Off' then 1 else 0 end) as default_rate,
    sum(case when loan_status = 'Charged Off'
        then funded_amnt - total_rec_prncp - recoveries else 0 end) /
        sum(funded_amnt) as loss_rate -- principal lost net of recoveries as a share of dollars lent
from lending.public.loans_clean
group by grade
order by grade;
