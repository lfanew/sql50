CREATE TABLE Employees (
    employee_id int PRIMARY KEY,
    name varchar(255),
    reports_to int,
    age int,
    FOREIGN KEY (reports_to) REFERENCES Employees(employee_id)
);

INSERT INTO Employees (employee_id, name, reports_to, age) VALUES
(9, 'Hercy', NULL, 43),
(6, 'Alice', 9, 41),
(4, 'Bob', 9, 36),
(2, 'Winston', NULL, 37);

---

select
  m.employee_id,
  m.name,
  count(r.employee_id) as reports_count,
  ROUND(avg(r.age), 0) as average_age
from employees m
inner join employees r on r.reports_to = m.employee_id
group by m.employee_id, m.name
order by m.employee_id
