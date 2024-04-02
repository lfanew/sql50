CREATE TABLE IF NOT EXISTS employee (
  id int primary key,
  salary int not null
);

INSERT INTO employee(
  id,
  salary
)
VALUES 
  (1,100),
  (2,200),
  (3,300);

---

-- Solution 1: Subquery returns null if no result


select
    (select
      salary
    from employee
    group by salary
    order by salary desc
    offset 1
    limit 1
  ) as SecondHighestSalary
 
-- Solution 2: Union

with cte_salary as (
  select
    salary
  from employee
  group by salary
  order by salary desc
  offset 1
  limit 1
), cte_result as (
	select salary from cte_salary
	union
	select null as salary
)

select
  salary as SecondHighestSalary
from cte_result
limit 1
