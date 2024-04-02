-- Create an ENUM type for primary_flag
CREATE TYPE primary_flag_type AS ENUM ('Y', 'N');

-- Create the table
CREATE TABLE employees (
    employee_id INT NOT NULL,
    department_id INT NOT NULL,
    primary_flag primary_flag_type NOT NULL,
    PRIMARY KEY (employee_id, department_id)
);

INSERT INTO employees (employee_id, department_id, primary_flag) VALUES
(1, 1, 'N'),
(2, 1, 'Y'),
(2, 2, 'N'),
(3, 3, 'N'),
(4, 2, 'N'),
(4, 3, 'Y'),
(4, 4, 'N');

---

with cte_counts as (
  select
    employee_id,
    count(department_id) as ct
  from employee
  group by employee_id
)

select
  e.employee_id,
  e.department_id
from employee e
inner join cte_counts on cte_counts.employee_id = e.employee_id
where e.primary_flag = 'Y' or cte_counts.ct = 1
