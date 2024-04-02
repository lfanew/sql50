CREATE TABLE queue (
  person_id int unique not null,
  person_name varchar(255) not null,
  weight int not null,
  turn int not null
);

insert into queue (person_id, person_name, weight, turn)
values
  (5,'Alice',250,1),
  (4,'Bob',175,5),
  (3,'Alex',350,2),
  (6,'John Cena',400,3),
  (1,'Winston',500,6),
  (2,'Marie',200,4);

--- Solution 1 (subquery filter sum instead of window)

with cte_weights as (
    select
      turn,
      person_id,
      person_name,
      weight,
      (
        select
          sum(weight)
        from queue q2
        where q2.turn <= q1.turn
      ) as total_weight
  from queue q1
  order by turn desc
)

select
  person_name
from cte_weights
where total_weight <= 1000
limit 1

--- Solution 2 (using window function)

with cte_weights as (
  select
    person_name,
    sum(weight) over (order by turn) as total_weight
  from queue
)

select
  person_name
from cte_weights
where total_weight <= 1000
order by total_weight desc
limit 1
