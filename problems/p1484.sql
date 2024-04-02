CREATE TABLE IF NOT EXISTS activities (
  sell_date date not null,
  product varchar(255) not null
);

insert into activities (
  sell_date,
  product
)
values
  ('2020-05-30','Headphone'),
  ('2020-06-01','Pencil'),
  ('2020-06-02','Mask'),
  ('2020-05-30','Basketball'),
  ('2020-06-01','Bible'),
  ('2020-06-02','Mask'),
  ('2020-05-30','T-Shirt');

---

select
  sell_date,
  count(distinct product) as num_sold,
  string_agg(distinct product, ',' order by product asc) as products
from activities
group by sell_date
order by sell_date
