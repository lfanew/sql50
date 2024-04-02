CREATE TABLE accounts (
  account_id integer primary key,
  income integer not null
);

INSERT INTO accounts (account_id, income)
VALUES
  (3,108939),
  (2,12747),
  (8,87709),
  (6,91796);

---

-- GOOD!
with cte_category as (
  select
    'Low Salary' as category
  UNION ALL
  select
    'Average Salary' as category
  UNION ALL
  select
    'High Salary' as category
), cte_ranges as (
  select
    case 
      when income < 20000 then 'Low Salary'
      when income <= 50000 then 'Average Salary'
      else 'High Salary'
    end as category,
    count(*) ct
  from accounts a
  group by category
)

select
  c.category,
  coalesce(r.ct, 0) as accounts_count
from cte_category c
left join cte_ranges r on r.category = c.category

---

-- TOO SLOW
select
  'Low Salary' as category,
  count(account_id) filter (where income < 20000) as accounts_count
from accounts
UNION ALL
select
  'Average Salary' as category,
  count(account_id) filter (where income between 20000 and 50000) as accounts_count
from accounts
UNION ALL
select
  'High Salary' as category,
  count(account_id) filter (where income > 50000) as accounts_count
from accounts

