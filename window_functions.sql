CREATE TABLE orders (
  order_id   INT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  order_amount INT NOT NULL
);

INSERT INTO orders (order_id, customer_id, order_date, order_amount)
VALUES (1, 100, '2023-01-01', 100),
       (2, 100, '2023-01-02', 200),
       (3, 101, '2023-01-03', 300),
       (4, 101, '2023-01-04', 400),
       (5, 102, '2023-01-05', 500),
       (6, 102, '2023-01-06', 600),
       (7, 103, '2023-01-07', 700),
       (8, 103, '2023-01-08', 800),
       (9, 100, '2023-01-09', 900),
       (10, 101, '2023-01-10', 1000);

SELECT * FROM orders;

select RANK() OVER(PARTITION BY customer_id ORDER BY order_amount DESC), order_id, customer_id, order_date, order_amount FROM orders_new;

select RANK() OVER(PARTITION BY customer_id ORDER BY order_amount DESC) AS t, order_id, customer_id, order_date, order_amount FROM orders_new ORDER BY t, customer_id;









CREATE TABLE employeess(
  employee_id INT PRIMARY KEY,
  employee_full_name VARCHAR(255) NOT NULL,
  department VARCHAR(255) NOT NULL,
  salary DECIMAL(10,2) NOT NULL
);

INSERT INTO employeess VALUES
(100, 'Mary Johns', 'SALES', 1000.00),
(101, 'Sean Moldy', 'IT', 1500.00),
(102, 'Peter Dugan', 'SALES', 2000.00),
(103, 'Lilian Penn', 'SALES', 1700.00),
(104, 'Milton Kowarsky', 'IT', 1800.00),
(105, 'Mareen Bisset', 'ACCOUNTS', 1200.00),
(106, 'Airton Graue', 'ACCOUNTS', 1100.00);

SELECT
  employee_id, 
  employee_full_name, 
  department,
  salary,
  ROUND(CAST(salary / MAX(salary) OVER (PARTITION BY department ORDER BY salary DESC)AS DECIMAL(10,2)),2)
    AS salary_metric
FROM employeess
order by 5;
