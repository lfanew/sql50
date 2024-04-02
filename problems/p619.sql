create table if not exists mynumbers (
  num integer not null
);

insert into mynumbers (num)
values
  (8),
  (8),
  (3),
  (3),
  (1),
  (4),
  (5),
  (6),
  (6);

---

select
  max(num) as num
from (
  select
    num
  from mynumbers
  group by num
  having count(*) = 1
)
