CUSTOMER ORDER MANAGEMENT SYSTEM
================================

A PostgreSQL database project that implements a complete customer–order
management workflow using normalized relational schema design and SQL.

The project focuses on database modeling, relational integrity, and SQL
query logic for core business operations.

======================================================================

PROJECT OVERVIEW
----------------
The Customer Order Management System is a database-centric application
built using PostgreSQL. It manages customers, products, and orders while
enforcing data consistency through relational constraints.

This project demonstrates:
• Relational database schema design
• Data normalization and integrity constraints
• SQL queries for real-world business workflows
• Order and transaction tracking using structured tables

======================================================================

FEATURES
--------
• Customer information management
• Product catalog with pricing and inventory details
• Order creation and order-item tracking
• Transaction records linked to orders
• Enforced relational integrity using primary and foreign keys
• SQL queries for reporting and data retrieval

======================================================================

DATABASE DESIGN
---------------
The database consists of the following core tables:

customers
  Stores customer personal and contact details.

products
  Stores product information including price and inventory.

orders
  Stores order headers linked to customers.

order_items
  Stores individual products associated with an order.

transactions
  Stores transaction records associated with orders.

All tables are connected using foreign key relationships to maintain
referential integrity.

======================================================================

SCHEMA DETAILS
--------------

customers
---------
customer_id   (Primary Key)
first_name
last_name
email
phone

products
--------
product_id    (Primary Key)
product_name
price
inventory

orders
------
order_id      (Primary Key)
order_date
customer_id   (Foreign Key → customers)

order_items
-----------
order_item_id (Primary Key)
order_id      (Foreign Key → orders)
product_id    (Foreign Key → products)
quantity
item_price

transactions
------------
transaction_id   (Primary Key)
order_id         (Foreign Key → orders)
transaction_date
total_amount

======================================================================

ER DIAGRAM
----------
An entity–relationship diagram is included in this repository as:

  ERD-diagram.svg

The diagram visually represents the table structures and relationships
between customers, orders, products, order items, and transactions.

======================================================================

SQL FUNCTIONALITY
----------------
The SQL scripts in this project implement:

• Table creation with primary and foreign key constraints
• Normalized schema to reduce data redundancy
• Insert operations for customers, products, and orders
• Join queries to retrieve customer–order relationships
• Aggregate queries to calculate order totals
• Reporting queries for business insights

======================================================================

EXAMPLE QUERIES
---------------
List all customers:
SELECT * FROM customers;

Retrieve all orders placed by a customer:
SELECT o.order_id, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id = 1;

Calculate total value of an order:
SELECT SUM(item_price * quantity) AS total_amount
FROM order_items
WHERE order_id = 2;

======================================================================

PROJECT STRUCTURE
-----------------
customer-order-management-db/
|-- schema.sql
|-- queries.sql
|-- insert_sample_data.sql
|-- ERD-diagram.svg
`-- README.txt

======================================================================

TECHNOLOGIES USED
-----------------
PostgreSQL
SQL
Relational Database Design

======================================================================

LICENSE
-------
This project is released under the MIT License.

======================================================================
