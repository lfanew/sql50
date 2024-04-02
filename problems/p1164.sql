create table if not exists products (
  product_id int not null,
  new_price int not null,
  change_date date not null,
  primary key (product_id, change_date)
);

insert into products (product_id, new_price, change_date)
values
  (1,20,'2019-08-14'),
  (2,50,'2019-08-14'),
  (1,30,'2019-08-15'),
  (1,35,'2019-08-16'),
  (2,65,'2019-08-17'),
  (3,20,'2019-08-18');

---

with cte_last_change as (
  select
    product_id,
    max(change_date) as change_date
  from products
  where change_date <= '2019-08-16'
  group by product_id
)

select
  p.product_id,
  coalesce(p.new_price, 10) as price
from products p
right join cte_last_change l on
  l.product_id = p.product_id and
  l.change_date = p.change_date
union
select
  p.product_id,
  10 as price
from products p
left join cte_last_change l on
  l.product_id = p.product_id
where l.product_id is null
