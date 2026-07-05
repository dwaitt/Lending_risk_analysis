-- Load + clean: build loans_clean from the raw LendingClub csv

-- status distribution: only Fully Paid / Charged Off give the full story

select loan_status, count(*) as n
from lending.public.loans_raw
group by loan_status
order by n desc;

create or replace table lending.public.loans_clean as
select
    id,
    to_date(issue_d, 'MON-YYYY') as issue_date,
    year(to_date(issue_d, 'MON-YYYY')) as issue_year,
    loan_status,
    funded_amnt,
    replace(term, ' months', '')::int as term_months,
    int_rate,
    grade,
    sub_grade,
    purpose,
    annual_inc,
    dti,
    total_pymnt,
    total_rec_prncp,
    recoveries
from lending.public.loans_raw
where loan_status in ('Fully Paid', 'Charged Off') -- completed loans only. Current loans haven't had time to default
  and grade is not null
  and annual_inc is not null;

-- sanity check: ~1.35M rows, rates 5-31%, 2007-2018
select count(*) as loans,
       min(int_rate) as min_rate, max(int_rate) as max_rate,
       min(issue_date) as first_loan, max(issue_date) as last_loan
from lending.public.loans_clean;