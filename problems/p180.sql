create table if not exists logs (
  id integer primary key,
  num varchar(10) not null
);

insert into logs (id, num)
values
  (1, '1'),
  (2, '1'),
  (3, '1'),
  (4, '2'),
  (5, '1'),
  (6, '2'),
  (7, '2');

---

with cte_three as (
  select
    num,
    lag(num, 1) over (order by id) as prev1,
    lag(num, 2) over (order by id) as prev2
  from logs
)

select distinct
  num as ConsecutiveNums
from cte_three
where num = prev1 and num = prev2
