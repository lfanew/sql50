CREATE TABLE IF NOT EXISTS insurance (
  pid int primary key,
  tiv_2015 float not null,
  tiv_2016 float not null,
  lat float not null,
  lon float not null
);

INSERT INTO insurance (
  pid,
  tiv_2015,
  tiv_2016,
  lat,
  lon
)
VALUES
  (1,10,5,10,10),
  (2,20,20,20,20),
  (3,10,30,20,20),
  (4,10,40,40,40);

---

-- Solution 1

with cte_2015 as (
  select
    pid,
    count(*) over (partition by tiv_2015) as ct
  from insurance
), cte_latlon as (
  select
    pid,
    count(*) over (partition by (lat, lon)) as ct
  from insurance
)

select
  round(sum(i.tiv_2016)::numeric, 2) as tiv_2016
from insurance i
inner join cte_2015 c1 on
  c1.ct > 1 and
  c1.pid = i.pid
inner join cte_latlon c2 on
  c2.ct = 1 and
  c2.pid = i.pid

-- Solution 2 (realizing I wouldn't have to group by with just on cte)

with cte as (
  select
    pid,
    count(*) over (partition by tiv_2015) as ct_2015,
    count(*) over (partition by (lat, lon)) as ct_latlon
  from insurance
)

select
  round(sum(i.tiv_2016)::numeric, 2) as tiv_2016
from insurance i
inner join cte c on
  c.ct_2015 > 1 and
  c.ct_latlon = 1 and
  c.pid = i.pid
