CREATE TABLE IF NOT EXISTS employees (
  employee_id integer primary key,
  name varchar(255) not null,
  manager_id integer,
  salary integer not null
);

INSERT INTO employees (
  employee_id,
  name,
  manager_id,
  salary
)
VALUES
  (3,'Mila',9,60301),
  (12,'Antonella',null,31000),
  (13,'Emery',null,67084),
  (1,'Kalel',11,21241),
  (9,'Mikaela',null,50937),
  (11,'Joziah',6,28485);

---

-- Solution 1: Subquery
select
  employee_id
from employees
where
  salary < 30000 AND
  manager_id not in (select employee_id from employees)
order by employee_id

---

-- Solution 2: Join

select
  e1.employee_id
from employees e1
left join employees e2 on e2.employee_id = e1.manager_id
where
  e1.salary < 30000 and
  e1.manager_id is not null and e2.employee_id is null
order by e1.employee_id
