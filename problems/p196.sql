CREATE TABLE IF NOT EXISTS person (
  id int primary key,
  email varchar(255) not null
);

INSERT INTO person (
  id,
  email
)
VALUES
  (1,'john@example.com'),
  (2,'bob@example.com'),
  (3,'john@example.com');

---

delete from person
where
  id not in (select min(id) from person group by email)
