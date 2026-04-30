-- 🧠 HAVING Practice Questions (15 Total)

CREATE DATABASE IF NOT EXISTS customer_data;
USE customer_data;

CREATE TABLE customdata (
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

SELECT * FROM customdata;

-- 🟢 Level 1: Basic HAVING (Understand the concept)

-- Q1. Find cities that have more than 2 customers.

SELECT city, COUNT(*) AS tot_customers
FROM customdata
GROUP BY city
HAVING tot_customers > 2;

-- Q2. Find states that have at least 3 customers.

SELECT state, COUNT(*) AS tot_customers
FROM customdata
GROUP BY state
HAVING tot_customers > 3;

-- Q3. Get zip codes where number of customers is greater than 1.

SELECT zip_code, COUNT(*) AS tot_customers
FROM customdata
GROUP BY zip_code
HAVING tot_customers > 1;

-- Q4. Find cities where total number of customers is exactly 1.

SELECT city, COUNT(*) AS tot_customers
FROM customdata
GROUP BY city
HAVING tot_customers = 1; 

-- Q5. Find states where customer count is less than 5.

SELECT state, COUNT(*) AS tot_customers
FROM customdata
GROUP BY state
HAVING tot_customers < 5; 

-- 🟡 Level 2: HAVING with Conditions

-- Q6. Find cities where customers have non-null emails count > 2.

SELECT city, COUNT(email) 
FROM customDATA
GROUP BY city
HAVING COUNT(email) > 2;

-- Q7. Find states where number of customers with phone numbers is at least 2.

SELECT state, COUNT(*) AS tot_customer
FROM customdata
WHERE phone IS NOT NULL
GROUP BY state
HAVING tot_customer >= 2;

               -- or
               
SELECT state, COUNT(phone) AS customers_with_phone
FROM customdata
GROUP BY state
HAVING COUNT(phone) >= 2;

-- Q8. Find cities where customers count > 2 AND state = 'CA' (apply condition + having)

SELECT city, state, COUNT(*) AS tot_customer
FROM customdata
WHERE state = 'CA'
GROUP BY city
HAVING tot_customer > 2;

-- Q9. Find states where average length of first_name is greater than 5 characters.

SELECT state, AVG(LENGTH(first_name))
FROM customdata
GROUP BY state
HAVING AVG(LENGTH(first_name)) > 5;

-- Q10. Find zip codes where more than 1 customer has the same last_name.

SELECT zip_code, last_name, COUNT(*) AS total
FROM customdata 
GROUP BY  zip_code, last_name
HAVING total > 1;

-- 🔵 Level 3: Advanced HAVING

-- Q11. Find cities where more than 1 customer shares the same last name.

SELECT city, last_name, COUNT(*) AS total
FROM customdata
GROUP BY city, last_name
HAVING total > 1;

-- Q12. Find states having more than 2 distinct cities.

SELECT state, COUNT(DISTINCT city) AS unique_city
FROM customdata
GROUP BY state
HAVING unique_city > 2;

-- Q13. Find cities where count of distinct zip codes is greater than 1.

SELECT city, COUNT(DISTINCT zip_code) AS dist_zip
FROM customdata
GROUP BY city
HAVING dist_zip > 1;

-- Q14. Find states where number of customers without phone is more than those with phone.

SELECT state,
       SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) AS no_phone,
       SUM(CASE WHEN phone IS NOT NULL THEN 1 ELSE 0 END) AS has_phone
FROM customdata
GROUP BY state
HAVING SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) >
       SUM(CASE WHEN phone IS NOT NULL THEN 1 ELSE 0 END);

-- Q15. Find cities where: total customers > 2 AND at least 1 customer has NULL phone

SELECT city,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) AS null_phone_count
FROM customdata
GROUP BY city
HAVING COUNT(*) > 2
   AND SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) >= 1;

