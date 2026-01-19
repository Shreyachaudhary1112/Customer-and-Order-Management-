-- INIT database
CREATE TABLE Customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(100),
  registration_date DATE
);

CREATE TABLE Category (
  category_id SERIAL PRIMARY KEY,
  category_name VARCHAR(100)
);

CREATE TABLE Product (
  product_id SERIAL PRIMARY KEY,
  category_id INT REFERENCES Category(category_id),
  product_name VARCHAR(100),
  price INT,
  stock INT
);

CREATE TABLE OrderTable ( -- "Order" is a reserved keyword in SQL
  order_id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES Customer(customer_id),
  order_date DATE
);

CREATE TABLE OrderItem (
  order_item_id SERIAL PRIMARY KEY,
  order_id INT REFERENCES OrderTable(order_id),
  product_id INT REFERENCES Product(product_id),
  quantity INT
);
