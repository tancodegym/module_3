DROP DATABASE IF EXISTS quan_ly_ban_hang;
CREATE DATABASE IF NOT EXISTS quan_ly_ban_hang;
USE quan_ly_ban_hang;

CREATE TABLE customer (
    c_id INT NOT NULL  PRIMARY KEY,
    c_name VARCHAR(25),
    c_age TINYINT NOT NULL
);
CREATE TABLE `order` (
    o_id INT PRIMARY KEY,
    c_id INT ,
    o_date DATETIME,
    o_total_price INT ,
    FOREIGN KEY (c_id)
        REFERENCES customer (c_id)
);

CREATE TABLE product (
    p_id INT NOT NULL  PRIMARY KEY,
    p_name VARCHAR(25),
    p_price INT 
);
CREATE TABLE order_deitail (
    o_id INT NOT NULL ,
    p_id INT NOT NULL ,
    od_QTY INT,
    PRIMARY KEY (o_id , p_id),
    FOREIGN KEY (o_id)
        REFERENCES `order` (o_id),
    FOREIGN KEY (p_id)
        REFERENCES product (p_id)
);
	INSERT INTO customer (c_id,c_name,c_age)
	VALUES	(1,'Minh Quan',10),
			(2,'Ngoc Oanh',20),
			(3,'Hong Ha',50);
    
    INSERT INTO `order`(o_id,c_id,o_date,o_total_price)
    VALUES	(1,1,'2006-3-21 00:00:00',Null),
			(2,2,'2006-3-23 00:00:00',Null),
			(3,1,'2006-3-16 00:00:00',Null);
    
    INSERT INTO product(p_id,p_name,p_price)
    VALUES	(1,'May Giat',3),
			(2,'Tu Lanh',5),
			(3,'Dieu Hoa',7),
			(4,'Quat',1),
			(5,'Bep Dien',2);
    
    INSERT INTO order_deitail(o_id,p_id,od_QTY)
    VALUES	(1,1,3),
			(1,3,7),
			(1,4,2),
			(2,1,1),
            (3,1,8),
            (2,5,4),
            (2,3,3);
    
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT o_id, o_date, o_total_price
FROM `order`;
 -- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
 SELECT C.c_name, P.p_name
 FROM customer C join `order` O on C.c_id = O.c_id join order_deitail D on O.o_id=D.o_id join product P on P.p_id=D.p_id;
 -- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
 SELECT C.c_name
 FROM customer C 
 WHERE C.c_id NOT IN ( SELECT C.c_id
 FROM customer C  JOIN `order` O on C.c_id = O.c_id);
 -- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
 
 SELECT O.o_id,
		O.o_date,SUM(P.p_price*D.od_QTY) AS o_total_price
FROM `order` O
		JOIN
	order_deitail D ON O.o_id=D.o_id
    JOIN 
    product P ON P.p_id=D.p_id
GROUP BY D.o_id ;


 
