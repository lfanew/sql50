CREATE TABLE IF NOT EXISTS employee (
  id int primary key,
  name varchar(255) not null,
  salary int not null,
  departmentId int not null
);

CREATE TABLE IF NOT EXISTS department (
  id int primary key,
  name varchar(255) not null
);

insert into employee (
  id,
  name,
  salary,
  departmentId
)
values
  (1,'Joe',85000,1),
  (2,'Henry',80000,2),
  (3,'Sam',60000,2),
  (4,'Max',90000,1),
  (5,'Janet',69000,1),
  (6,'Randy',85000,1),
  (7,'Will',70000,1);

insert into department (
  id,
  name
)
values
  (1, 'IT'),
  (2, 'Sales');

---

with cte_salary_ranks as (
  select
    departmentId,
    salary,
    rank() over (partition by departmentId order by salary desc) as rank
  from employee
  group by departmentId, salary
)

select
  d.name as Department,
  e.name as Employee,
  c.salary as Salary
from employee e
inner join cte_salary_ranks c on
  c.rank <= 3 and
  c.salary = e.salary and
  c.departmentId = e.departmentId
inner join department d on d.id = e.departmentId
