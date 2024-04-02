create table if not exists triangle (
  x int not null,
  y int not null,
  z int not null,
  primary key (x, y, z)
);

insert into triangle (x, y, z)
values
  (13, 15, 30),
  (10, 20, 15);

---

select
  x,
  y,
  z,
  case when
    x + y > z AND
    y + z > x AND
    z + x > y THEN 'Yes' ELSE 'No'
  end as triangle
from triangle
