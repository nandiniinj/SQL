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