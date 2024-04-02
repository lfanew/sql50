CREATE TABLE IF NOT EXISTS movies (
  movie_id int primary key,
  title varchar(255) not null
);

CREATE TABLE IF NOT EXISTS users (
  user_id int primary key,
  name varchar(255) not null
);

CREATE TABLE IF NOT EXISTS movierating (
  movie_id int not null,
  user_id int not null,
  rating int not null,
  created_at date not null,
  primary key (movie_id, user_id)
);

INSERT INTO movies (
  movie_id,
  title
)
VALUES
  (1,'Avengers'),
  (2,'Frozen'),
  (3,'Joker');

INSERT INTO users (
  user_id,
  name
)
VALUES
  (1,'Daniel'),
  (2,'Monica'),
  (3,'Maria'),
  (4,'James');

INSERT INTO movierating (
  movie_id,
  user_id,
  rating,
  created_at
)
VALUES
  (1,1,3,'2020-01-12'),
  (1,2,4,'2020-02-11'),
  (1,3,2,'2020-02-12'),
  (1,4,1,'2020-01-01'),
  (2,1,5,'2020-02-17'),
  (2,2,2,'2020-02-01'),
  (2,3,2,'2020-03-01'),
  (3,1,3,'2020-02-22'),
  (3,2,4,'2020-02-25');

---

with cte_users as (
  select
    u.name,
    count(*) as ct
  from movierating r
  inner join users u on r.user_id = u.user_id
  group by u.user_id, u.name
  order by ct desc, u.name
  limit 1
), cte_movies as (
  select
    m.title,
    avg(rating) as rt
  from movierating r
  inner join movies m on r.movie_id = m.movie_id
  where
    date_part('year', created_at) = 2020 and
    date_part('month', created_at) = 2
  group by m.movie_id, m.title
  order by rt desc, m.title
  limit 1
)

select
  name as results
from cte_users
union all
select
  title as results
from cte_movies
