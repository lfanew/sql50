CREATE TABLE IF NOT EXISTS users (
  user_id int primary key,
  name varchar(255) not null,
  mail varchar(255) not null
);

INSERT INTO users (
  user_id,
  name,
  mail
)
VALUES
  (1,'Winston','winston@leetcode.com'),
  (2,'Jonathan','jonathanisgreat'),
  (3,'Annabelle','bella-@leetcode.com'),
  (4,'Sally','sally.come@leetcode.com'),
  (5,'Marwan','quarz#2020@leetcode.com'),
  (6,'David','david69@gmail.com'),
  (7,'Shapiro','.shapo@leetcode.com');

---

select
  *
from users
where mail ~ '^[a-zA-Z][\w\d_\.-]*@leetcode\.com$'
