-- Solution 1
with cte_unique_buys as (
  select distinct
    customer_id,
    product_key
  from customer
)

select
  customer_id
from cte_unique_buys
group by customer_id
having count(product_key) = (select count(*) from product)

-- Solution 2
select
  customer_id
from customer
group by customer_id
having count(distinct product_key) = (select count(*) from product)
