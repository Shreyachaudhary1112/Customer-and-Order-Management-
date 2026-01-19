-- 1: List all customer names and emails
SELECT first_name, last_name, email FROM Customer;

-- 2: Products cheaper than 1000
SELECT product_name, price FROM Product WHERE price < 1000;

-- 3: All electronic product names and prices
SELECT product_name, price 
FROM Product 
WHERE category_id = (
    SELECT category_id FROM Category WHERE category_name = 'Electronics'
);

-- 4: Total order value per customer
SELECT o.customer_id, SUM(p.price * oi.quantity) AS total_amount  
FROM OrderTable AS o
JOIN OrderItem AS oi ON oi.order_id = o.order_id
JOIN Product AS p ON p.product_id = oi.product_id 
GROUP BY o.customer_id
ORDER BY total_amount DESC;

-- 5: Product count per category
SELECT category_id, COUNT(*) AS product_count 
FROM Product 
GROUP BY category_id;

-- 6: Orders placed after a specific date
SELECT order_id, order_date 
FROM OrderTable 
WHERE order_date > '2024-06-03';

-- 7: Orders that amounts higher than 1k
SELECT oi.order_id, oi.product_id, (oi.quantity * p.price) AS amount 
FROM OrderItem AS oi
JOIN Product AS p ON p.product_id = oi.product_id
WHERE (oi.quantity * p.price) > 1000;

-- 8: Orders by customer
SELECT c.first_name, c.last_name, o.order_date 
FROM Customer AS c
JOIN OrderTable AS o ON o.customer_id = c.customer_id;

-- 9: Customers who placed at least one order
SELECT c.first_name, c.email 
FROM Customer AS c
JOIN OrderTable AS o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.email
HAVING COUNT(o.order_id) > 0;

-- 10: Order quantity per product
SELECT product_id, SUM(quantity) AS total_quantity 
FROM OrderItem 
GROUP BY product_id 
ORDER BY total_quantity DESC;

-- 11: Products in stock more than 50
SELECT * FROM Product WHERE stock > 50;

-- 12: All products' name and price in clothing category
SELECT product_name, price 
FROM Product 
WHERE category_id = (
    SELECT category_id FROM Category WHERE category_name = 'Clothing'
);

-- 13: Orders that total value are over than 1000 dollars
SELECT oi.order_id, SUM(oi.quantity * p.price) AS total_amount 
FROM OrderItem AS oi
JOIN Product AS p ON p.product_id = oi.product_id
GROUP BY oi.order_id
HAVING SUM(oi.quantity * p.price) > 1000;

-- 14: Customers name and email ordered by name
SELECT first_name, email 
FROM Customer 
ORDER BY first_name;

-- 15: Order details: which products are in each order?
SELECT o.order_id, p.product_name 
FROM OrderTable AS o
JOIN OrderItem AS oi ON oi.order_id = o.order_id 
JOIN Product AS p ON p.product_id = oi.product_id;

-- 16: Customers registered in 2024
SELECT first_name, registration_date 
FROM Customer 
WHERE registration_date BETWEEN '2024-01-01' AND '2024-12-31';

-- 17: Average price of electronic products
SELECT AVG(price) 
FROM Product
WHERE category_id = (
    SELECT category_id FROM Category WHERE category_name = 'Electronics'
);

-- 18: Most ordered product (single) name and total order amount
SELECT product_name AS most_ordered_product 
FROM Product 
WHERE product_id = (
    SELECT product_id 
    FROM OrderItem 
    GROUP BY product_id 
    ORDER BY SUM(quantity) DESC 
    LIMIT 1
);

-- 19: Customers who never ordered 
SELECT c.first_name, c.email 
FROM Customer AS c
LEFT JOIN OrderTable AS o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.email
HAVING COUNT(o.order_id) < 1;

-- 20: Number of orders per customer
SELECT c.first_name, c.last_name, COUNT(o.order_id) AS total_orders 
FROM Customer AS c
JOIN OrderTable AS o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
