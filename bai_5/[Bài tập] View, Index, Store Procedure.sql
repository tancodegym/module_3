-- Bước 1:
DROP DATABASE IF EXISTS demo;
CREATE DATABASE IF NOT EXISTS demo;
USE demo;
-- Bước 2:
CREATE TABLE Products (
id INT AUTO_INCREMENT PRIMARY KEY,
productCode VARCHAR(45),
productName VARCHAR(45),
productPrice INT,
productAmount INT,
productDescription VARCHAR(45),
product_Status BIT);
INSERT INTO Products (productCode,productName,productPrice,productAmount,productDescription,product_Status)
VALUE ('Alpha', 'Tivi',5,1,'electronic device',1),
('Beta', 'Desktop',10,2,'electronic device',1),
('Gamma', 'Air Condition',7,3,'electronic device',1),
('Delta', 'Fridge',4,1,'electronic device',1),
('Epsilon', 'Washing Machine',9,1,'electronic device',1);

SELECT*FROM Products;
-- Bước 3:
EXPLAIN SELECT * FROM Products WHERE productCode = 'Epsilon'; 
ALTER TABLE Products ADD INDEX idx_product_code(productCode);
EXPLAIN SELECT * FROM Products WHERE productCode = 'Epsilon'; 

EXPLAIN SELECT * FROM Products WHERE productName = 'Desktop' or  productPrice=4; 
ALTER TABLE Products ADD INDEX idx_name_price(productName, productPrice);
EXPLAIN SELECT * FROM Products WHERE productName = 'Desktop' or  productPrice=4; 
 -- Bước 4:
CREATE VIEW product_view AS
SELECT productCode,productName,productPrice,product_Status
FROM Products;
SELECT*FROM product_view;

CREATE OR REPLACE VIEW product_view  AS
SELECT productCode,productName,productPrice,product_Status
FROM Products
WHERE productAmount=1;
SELECT*FROM product_view;

DROP VIEW product_view;


-- Bước 5:
DELIMITER //
CREATE PROCEDURE  find_product()
BEGIN

  SELECT * FROM Products;

END //
DELIMITER ;
CALL find_product();


DELIMITER //
CREATE PROCEDURE  add_product(
IN productCode VARCHAR(45),
IN productName VARCHAR(45),
IN productPrice INT,
IN productAmount INT,
IN productDescription VARCHAR(45),
IN product_Status BIT)
BEGIN
INSERT INTO Products(productCode,productName,productPrice,productAmount,productDescription,product_Status)
VALUE(productCode,productName,productPrice,productAmount,productDescription,product_Status);
SELECT*FROM Products;
END //
DELIMITER ;
CALL add_product('Omega','Laptop',18,2,'electronic device',1);

DELIMITER //
CREATE PROCEDURE  edit_product(
IN in_id INT,
IN in_productCode VARCHAR(45),
IN in_productName VARCHAR(45),
IN in_productPrice INT,
IN in_productAmount INT,
IN in_productDescription VARCHAR(45),
IN in_product_Status BIT
)
BEGIN
UPDATE Products
SET productCode = in_productCode,
productName = in_productName,
productPrice = in_productPrice
,productAmount =in_productAmount,
productDescription = in_productDescription,
product_Status = in_product_Status
WHERE id = in_id;
SELECT*FROM Products;
END //
DELIMITER ;

Set @in_id = 6;
Call edit_product(@in_id,'X','ABC',5,7,'XXXXX',1);

DELIMITER //
CREATE PROCEDURE delete_product(IN in_id INT)
BEGIN
DELETE FROM Products
WHERE id=in_id;
SELECT*FROM Products;
END 
//
DELIMITER ;
CALL delete_product(@in_id);