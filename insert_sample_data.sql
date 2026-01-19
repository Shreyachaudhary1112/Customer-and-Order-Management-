INSERT INTO Customer (customer_id, first_name, last_name, email, registration_date) 
VALUES 
(1, 'Ali', 'Yilmaz', 'ali.yilmaz@email.com', '2024-01-10'),
(2, 'Ayse', 'Kaya', 'ayse.kaya@email.com', '2024-02-15'),
(3, 'Mehmet', 'Demir', 'mehmet.demir@email.com', '2024-03-20'),
(4, 'Zeynep', 'Celik', 'zeynep.celik@email.com', '2024-04-25'),
(5, 'Can', 'Ozturk', 'can.ozturk@email.com', '2024-05-01');

INSERT INTO Category (category_id, category_name) 
VALUES 
(1, 'Electronics'),
(2, 'Clothing');

INSERT INTO Product (product_id, category_id, product_name, price, stock) 
VALUES 
(1, 1, 'Phone', 10000, 50),
(2, 1, 'Laptop', 20000, 30),
(3, 2, 'T-shirt', 150, 100),
(4, 2, 'Shoes', 500, 80),
(5, 1, 'Headphones', 300, 200);

INSERT INTO OrderTable (order_id, customer_id, order_date) 
VALUES 
(1, 1, '2024-06-01'),
(2, 2, '2024-06-02'),
(3, 3, '2024-06-03'),
(4, 4, '2024-06-04'),
(5, 5, '2024-06-05');

INSERT INTO OrderItem (order_item_id, order_id, product_id, quantity) 
VALUES 
(1, 1, 1, 1),
(2, 1, 3, 1),
(3, 2, 2, 1),
(4, 3, 4, 2),
(5, 4, 5, 1),
(6, 5, 3, 2),
(7, 5, 4, 1);
