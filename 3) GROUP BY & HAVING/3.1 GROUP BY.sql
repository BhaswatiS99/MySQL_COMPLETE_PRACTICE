CREATE DATABASE IF NOT EXISTS customer_details;
USE customer_details;


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    street VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(10),
    zip_code INT
);

-- *** IMPORTING DATASET *** 

SELECT * FROM customers;

-- 🔹 Foundation (must be perfect)

-- Q1) Count total number of customers.
SELECT COUNT(*) FROM customers;

-- Q2) Find how many customers are there in each state.
SELECT state, COUNT(*) FROM customers
GROUP BY state;

-- Q3) Get all customers from California (CA).
SELECT * FROM customers
WHERE state = 'CA';

-- Q4) Count how many customers are from New York (NY).
SELECT * FROM customers
WHERE state = 'NY';

-- Q5) List all customers sorted by first_name alphabetically.
SELECT * FROM customers
ORDER BY first_name ASC;

-- Q6) Show customers sorted by state (ascending) and within that by city (descending).
SELECT * FROM customers
ORDER BY state ASC, city DESC;


-- 🔹 GROUP BY mastery

-- Q7) Count total customers in each city
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city; 

-- Q8) Find number of customers per state, but only show states having more than 5 customers.
SELECT state, COUNT(*) AS total_customers 
FROM customers
GROUP BY state
HAVING COUNT(*) > 5;

-- Q9) Find the top 2 states with the highest number of customers.
SELECT state, COUNT(*) AS total_customers
FROM customers
GROUP BY state
ORDER BY state DESC 
LIMIT 2;

-- Q10) Count how many customers have NULL phone numbers.
SELECT COUNT(*) FROM customers 
WHERE phone IS NULL;

-- Q11) Count customers grouped by whether phone is NULL or NOT NULL.
SELECT 
    CASE 
        WHEN phone IS NULL THEN 'Null'
        ELSE 'Not null'
    END AS phone_status,
    COUNT(*) AS customer_count
FROM customers
GROUP BY phone_status;
 
-- Q12) Count customers per state, but split into: * customers with phone, * customers without phone
SELECT state,
    CASE 
       WHEN phone IS NULL THEN 'no number'
       ELSE 'has number'
    END AS number_available,  
COUNT(*) AS total_customer    
FROM customers  
GROUP BY state, number_available; 

-- Q13) For each state, find: * total customers * customers with Gmail accounts
SELECT 
    state,
    COUNT(*) AS tot_customers,
    COUNT(CASE WHEN email LIKE '%@gmail.com' THEN 1 END) AS gmail_customers
FROM customers
GROUP BY state;

-- Q14) Count how many customers per city have email ending with .com.
SELECT city,
    COUNT(CASE WHEN email LIKE '%.com' THEN 1 END) AS valid_email
FROM customers 
GROUP BY city;  
 
              -- OR --

SELECT 
    city,
    COUNT(*) AS valid_email
FROM customers
WHERE email LIKE '%.com'
GROUP BY city;

-- Q15) Q2 What is the total number of customers in each city, ordered from highest to lowest?
SELECT COUNT(*) AS total_cust, city
FROM customers
GROUP BY city 
ORDER BY total_cust DESC;

-- Q16) List only those states that have more than 100 customers.
SELECT state, COUNT(*) AS total_customers 
	FROM customers 
GROUP BY state
HAVING total_customers > 100;

-- Q17) How many customers exist for each combination of state and city?
SELECT state, city, COUNT(*) AS tot_customers 
FROM customers
GROUP BY state, city
ORDER BY state, city;

-- Q18) Find the number of customers sharing the same last name within each state.
SELECT state, last_name, COUNT(*) AS name_count
FROM customers
GROUP BY state, last_name
HAVING COUNT(*) > 1
ORDER BY state;

-- Q19) For each state and city pair, find those with more than 10 customers.
SELECT state, city, COUNT(*) AS customer_count
FROM customers 
GROUP BY state, city
HAVING customer_count > 10 
ORDER BY state;

-- Q20) List how many customers per zip code exist in each city, but only for zip codes with more than 5 customers.
SELECT zip_code, city, COUNT(*) AS cust_count
FROM customers
GROUP BY city, zip_code
HAVING cust_count > 5
ORDER BY city;

-- Q21) For each state, count how many customers use Gmail, and how many use other providers.
SELECT state, 
      CASE 
         WHEN email LIKE '%gmail.com' THEN 'gmail'
         ELSE 'others'
         END AS mail_user,
COUNT(*) AS cust_count
FROM customers
GROUP BY state, mail_user;

-- Q22) Classify each state's customer base as 'Large' (>200), 'Medium' (100–200), or 'Small' (<100). Show the count and label.
SELECT state, total_customers,
     CASE 
          WHEN total_customers > 200 THEN 'large'
          WHEN total_customers BETWEEN 100 AND 200 THEN 'medium'
          ELSE 'small'
	 END AS segment
FROM     
   (SELECT state, COUNT(*) AS total_customers
      FROM customers
    GROUP BY state) AS state_counts;





