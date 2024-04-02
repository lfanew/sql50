CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR
);

CREATE TABLE Sales (
    sale_id INT,
    product_id INT,
    year INT,
    quantity INT,
    price INT,
    PRIMARY KEY (sale_id, year),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

---

INSERT INTO Product (product_id, product_name) VALUES
(100, 'Nokia'),
(200, 'Apple'),
(300, 'Samsung');

INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES
(1, 100, 2008, 10, 5000),
(2, 100, 2009, 12, 5000),
(7, 200, 2011, 15, 9000);

---

WITH cte_first_year AS (
  select
    product_id,
    min(year) as year
  from sales
  group by product_id
)

select
  s.product_id,
  s.year AS first_year,
  s.quantity,
  s.price
from sales s
inner join cte_first_year f on
  f.product_id = s.product_id AND
  f.year = s.year
