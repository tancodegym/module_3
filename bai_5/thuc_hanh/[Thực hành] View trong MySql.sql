USE classicmodels;
CREATE VIEW customer_views AS 
SELECT customerNumber,customerName,phone
FROM customers;
select * from customer_views;

CREATE OR REPLACE VIEW customer_view AS 
SELECT customerNumber, customerName,contactFirstName,contactLastName,phone
FROM customers
WHERE city = 'Nantes';
select * from customer_view;

DROP VIEW customer_view;
