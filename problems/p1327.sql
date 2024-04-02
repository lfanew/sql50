CREATE TABLE IF NOT EXISTS products (
  product_id int primary key,
  product_name varchar(255) not null,
  product_category varchar(255) not null
);

CREATE TABLE IF NOT EXISTS orders (
  product_id int not null references products (product_id),
  order_date date not null,
  unit int not null
);

INSERT INTO products (
  product_id,
  product_name,
  product_category
)
VALUES
  (1,'Leetcode Solutions','Book'),
  (2,'Jewels of Stringology','Book'),
  (3,'HP','Laptop'),
  (4,'Lenovo','Laptop'),
  (5,'Leetcode Kit','T-shirt');

INSERT INTO orders (
  product_id,
  order_date,
  unit
)
VALUES
  (1,'2020-02-05',60),
  (1,'2020-02-10',70),
  (2,'2020-01-18',30),
  (2,'2020-02-11',80),
  (3,'2020-02-17',2),
  (3,'2020-02-24',3),
  (4,'2020-03-01',20),
  (4,'2020-03-04',30),
  (4,'2020-03-04',60),
  (5,'2020-02-25',50),
  (5,'2020-02-27',50),
  (5,'2020-03-01',50);

---

select
  p.product_name,
  sum(o.unit) as unit
from orders o
inner join products p on p.product_id = o.product_id
where
  date_part('month', o.order_date) = 2 AND
  date_part('year', o.order_date) = 2020
group by p.product_name
having sum(o.unit) >= 100
