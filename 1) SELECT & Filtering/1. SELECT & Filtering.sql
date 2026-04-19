CREATE DATABASE IF NOT EXISTS customers_order;
USE customers_order;

CREATE TABLE orders (
    order_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    category VARCHAR(50),
    product VARCHAR(50),
    order_date DATE,
    quantity INT,
    price DECIMAL(10,2),
    payment_mode VARCHAR(20)
);

INSERT INTO orders 
VALUES
(1,'Amit Sharma','Delhi','Electronics','Mobile','2024-01-05',1,20000,'UPI'),
(2,'Neha Verma','Mumbai','Clothing','Jeans','2024-01-06',2,2500,'Card'),
(3,'Rahul Singh','Delhi','Electronics','Laptop','2024-01-07',1,55000,'EMI'),
(4,'Priya Das','Kolkata','Groceries','Rice','2024-01-08',5,500,'Cash'),
(5,'Arjun Mehta','Bangalore','Electronics','Headphones','2024-01-09',2,3000,'UPI'),
(6,'Sneha Roy','Delhi','Clothing','Shirt','2024-01-10',NULL,1500,'Card'),
(7,'Vikas Kumar','Mumbai','Electronics','Mobile','2024-01-11',1,22000,NULL),
(8,'Anjali Gupta','Delhi','Groceries','Wheat','2024-01-12',3,900,'UPI'),
(9,'Rohit Jain','Bangalore','Clothing','T-shirt','2024-01-13',4,2000,'Cash'),
(10,'Kavita Singh','Delhi','Electronics','Laptop','2024-01-14',1,60000,'EMI'),

(11,'Manish Yadav','Mumbai','Groceries','Oil','2024-01-15',2,800,'UPI'),
(12,'Pooja Sharma','Kolkata','Clothing','Saree','2024-01-16',1,4000,'Card'),
(13,'Nitin Verma','Delhi','Electronics','Tablet','2024-01-17',1,15000,'UPI'),
(14,'Simran Kaur','Bangalore','Groceries','Sugar','2024-01-18',NULL,600,'Cash'),
(15,'Deepak Singh','Delhi','Clothing','Jeans','2024-01-19',2,3000,'Card'),
(16,'Ritu Sharma','Mumbai','Electronics','Mobile','2024-01-20',1,21000,'UPI'),
(17,'Karan Malhotra','Delhi','Groceries','Rice','2024-01-21',5,550,'Cash'),
(18,'Meena Iyer','Bangalore','Electronics','Laptop','2024-01-22',1,58000,'EMI'),
(19,'Aakash Jain','Kolkata','Clothing','Shirt','2024-01-23',3,1800,NULL),
(20,'Sonal Gupta','Delhi','Groceries','Milk','2024-01-24',2,200,'UPI'),

(21,'Ravi Patel','Mumbai','Electronics','Tablet','2024-01-25',1,14000,'Card'),
(22,'Anita Desai','Bangalore','Clothing','T-shirt','2024-01-26',3,1500,'Cash'),
(23,'Suresh Kumar','Delhi','Electronics','Mobile','2024-01-27',2,19000,'UPI'),
(24,'Kiran Shah','Kolkata','Groceries','Oil','2024-01-28',NULL,750,'Card'),
(25,'Amit Sharma','Delhi','Clothing','Shirt','2024-01-29',1,1200,'UPI'),
(26,'Neha Verma','Mumbai','Electronics','Laptop','2024-01-30',1,57000,'EMI'),
(27,'Rahul Singh','Delhi','Groceries','Wheat','2024-02-01',4,1000,'Cash'),
(28,'Priya Das','Kolkata','Electronics','Mobile','2024-02-02',1,18000,'UPI'),
(29,'Arjun Mehta','Bangalore','Clothing','Jeans','2024-02-03',2,2600,'Card'),
(30,'Sneha Roy','Delhi','Groceries','Sugar','2024-02-04',3,700,NULL),

(31,'Vikas Kumar','Mumbai','Clothing','T-shirt','2024-02-05',2,1600,'Cash'),
(32,'Anjali Gupta','Delhi','Electronics','Tablet','2024-02-06',1,15500,'UPI'),
(33,'Rohit Jain','Bangalore','Groceries','Milk','2024-02-07',2,250,'Cash'),
(34,'Kavita Singh','Delhi','Clothing','Saree','2024-02-08',1,4500,'Card'),
(35,'Manish Yadav','Mumbai','Electronics','Mobile','2024-02-09',1,23000,'UPI'),
(36,'Pooja Sharma','Kolkata','Groceries','Rice','2024-02-10',5,600,'Cash'),
(37,'Nitin Verma','Delhi','Clothing','Jeans','2024-02-11',2,2800,'Card'),
(38,'Simran Kaur','Bangalore','Electronics','Laptop','2024-02-12',1,59000,'EMI'),
(39,'Deepak Singh','Delhi','Groceries','Oil','2024-02-13',2,850,'UPI'),
(40,'Ritu Sharma','Mumbai','Clothing','Shirt','2024-02-14',1,1300,'Card'),

(41,'Karan Malhotra','Delhi','Electronics','Mobile','2024-02-15',1,21000,'UPI'),
(42,'Meena Iyer','Bangalore','Clothing','T-shirt','2024-02-16',3,1700,'Cash'),
(43,'Aakash Jain','Kolkata','Electronics','Tablet','2024-02-17',1,16000,'Card'),
(44,'Sonal Gupta','Delhi','Clothing','Jeans','2024-02-18',2,2900,'UPI'),
(45,'Ravi Patel','Mumbai','Groceries','Milk','2024-02-19',2,300,'Cash'),
(46,'Anita Desai','Bangalore','Electronics','Mobile','2024-02-20',1,20000,'UPI'),
(47,'Suresh Kumar','Delhi','Clothing','Shirt','2024-02-21',1,1400,'Card'),
(48,'Kiran Shah','Kolkata','Electronics','Laptop','2024-02-22',1,61000,'EMI'),
(49,'Amit Sharma','Delhi','Groceries','Rice','2024-02-23',4,650,'Cash'),
(50,'Neha Verma','Mumbai','Clothing','Saree','2024-02-24',1,4800,NULL);

-- Practice Questions (SELECT + Filtering)

-- 🔹 Easy

-- Q1) Show all records
SELECT * FROM orders;

-- Q2) Show only customer_name and city
SELECT customer_name, city
FROM orders;

-- Q3) Find all orders from Delhi
SELECT * FROM orders
  WHERE city IN ("Delhi");
  
-- Q4) Find all Electronics category orders
SELECT * FROM orders
  WHERE CATEGORY IN ("Electronics");
  
-- Q5) Find orders where price > 20000
SELECT * FROM orders 
  WHERE price > 20000;

-- Q6) Get orders where payment method is UPI
SELECT * FROM orders
  WHERE payment_mode = 'UPI';

-- Q7) Show orders where delivery status is Cancelled
SELECT * FROM orders
  WHERE payment_mode IS NULL;
  
-- Q8) Get top 5 most recent orders


-- 🔹 Moderate

-- Q9) Find orders where city is Mumbai and category is Clothing.
SELECT * FROM orders 
WHERE city = 'Mumbai' AND category = 'Clothing';

-- Q10) Find orders where price is in the range 1000 to 5000
SELECT * FROM orders 
WHERE price BETWEEN 1000 AND 5000;

-- Q11) Find orders where products are Mobile & Laptop
SELECT * FROM orders 
WHERE product IN ('Mobile', 'Laptop');

-- Q12) Get orders from Mumbai where amount > 5000
SELECT * FROM orders 
WHERE city = 'Mumbai' AND price > 5000;

-- Q13) Show orders where category is Clothing and quantity >= 4
SELECT * FROM orders 
WHERE category = 'Clothing' AND quantity >= 4;

-- Q14) Get orders where payment_method is Card or UPI
SELECT * FROM orders 
WHERE payment_mode = 'Card' OR payment_mode = 'UPI';

-- Q15) Find orders where city is not Delhi
SELECT * FROM orders 
WHERE city NOT IN ('Delhi');

-- Q16) Show orders between ‘2024-02-01’ and ‘2024-03-01’
SELECT * FROM orders 
WHERE order_date BETWEEN '2024-02-01' and '2024-03-01';

-- Q17) Get customers whose name starts with ‘A’
SELECT * FROM orders 
WHERE customer_name LIKE 'A%';

-- Q18) Get products ending with ‘e’
SELECT * FROM orders 
WHERE customer_name LIKE '%e';

-- Q19) Find orders where amount is between 2000 and 10000
SELECT * FROM orders 
WHERE price BETWEEN 2000 AND 10000;

-- Q20) Get orders where payment method is NULL
SELECT * FROM orders 
WHERE payment_mode IS NULL;

-- Q21) Show orders sorted by order_date descending
SELECT * FROM orders 
ORDER BY order_date DESC;

-- Q22) Get first 10 highest amount orders
SELECT * FROM orders 
ORDER BY quantity DESC
LIMIT 10;

-- Q23) Find orders where product contains ‘top’
SELECT * FROM orders 
WHERE product LIKE '%Top%';

-- Q24) Sort all orders by price descending
SELECT * FROM orders 
ORDER BY price DESC;

-- Q25) Get top 5 most expensive orders  
SELECT * FROM orders 
ORDER BY price DESC
LIMIT 5;

