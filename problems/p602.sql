CREATE TABLE IF NOT EXISTS requestaccepted (
  requester_id int not null,
  accepter_id int not null,
  accept_date date not null,
  primary key (requester_id, accepter_id)
);

INSERT INTO requestaccepted (
  requester_id,
  accepter_id,
  accept_date
)
VALUES 
  (1,2,'2016/06/03'),
  (1,3,'2016/06/08'),
  (2,3,'2016/06/08'),
  (3,4,'2016/06/09');

---

with cte_total as (
  select
    requester_id as id
  from requestaccepted
  union all
  select
    accepter_id as id
  from requestaccepted
)

select
  id,
  count(id) as num
from cte_total
group by id
order by num desc
limit 1
