CREATE TABLE IF NOT EXISTS users (
  user_id int primary key,
  name varchar(255) not null
);

INSERT INTO users (
  user_id,
  name
)
VALUES
  (1,'aLice'),
  (2,'bOB');

---

select
  user_id,
  upper(substring(name, 1, 1)) || lower(substring(name, 2)) as name
from users
order by user_id
