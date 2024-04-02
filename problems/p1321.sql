CREATE TABLE IF NOT EXISTS customer (
  customer_id int not null,
  name varchar(255) not null,
  visited_on date not null,
  amount int,
  primary key (customer_id, visited_on)
);

INSERT INTO customer (
  customer_id,
  name,
  visited_on,
  amount
)
VALUES
  (1,'Jhon','2019-01-01',100),
  (2,'Daniel','2019-01-02',110),
  (3,'Jade','2019-01-03',120),
  (4,'Khaled','2019-01-04',130),
  (5,'Winston','2019-01-05',110),
  (6,'Elvis','2019-01-06',140),
  (7,'Anna','2019-01-07',150),
  (8,'Maria','2019-01-08',80),
  (9,'Jaze','2019-01-09',110),
  (1,'Jhon','2019-01-10',130),
  (3,'Jade','2019-01-10',150);

---

with cte_daily as (
  select
    visited_on,
    sum(amount) as total
  from customer
  group by visited_on
  order by visited_on
)

select
  d.visited_on,
  (select sum(total) from cte_daily e where e.visited_on between d.visited_on - interval '6 day' and d.visited_on) as amount,
  (select round(avg(total), 2) from cte_daily e where e.visited_on between d.visited_on - interval '6 day' and d.visited_on) as average_amount
from cte_daily d
where
  d.visited_on >= (select visited_on +  interval '6 day' from cte_daily limit 1)
