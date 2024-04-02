with cte_first_orders as (
  select
    customer_id,
    min(order_date) as order_date
  from delivery
  group by customer_id
), cte_immediate_orders as (
  select
    customer_id,
    order_date
  from delivery
  where order_date = customer_pref_delivery_date
)

select
  ROUND(
    (
      COUNT(*)::numeric / (select COUNT(*) from cte_first_orders)::numeric
    ) * 100,
    2
  ) as immediate_percentage
from cte_first_orders f
inner join cte_immediate_orders i ON 
  i.customer_id = f.customer_id AND
  i.order_date = f.order_date
