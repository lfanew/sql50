CREATE TABLE IF NOT EXISTS seat (
  id int primary key,
  student varchar(255) not null
);

INSERT INTO seat (
  id,
  student
)
VALUES
  (1,'Abbot'),
  (2,'Doris'),
  (3,'Emerson'),
  (4,'Green'),
  (5,'Jeames');

---

select
  case
    when id % 2 = 0 then lag(id, 1, id) over (order by id)
    else lead(id, 1, id) over (order by id)
  end as id,
  student
from seat
order by id
