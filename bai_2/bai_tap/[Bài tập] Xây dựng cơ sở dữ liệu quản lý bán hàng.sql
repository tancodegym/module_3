DROP DATABASE IF EXISTS quan_ly_ban_hang;
CREATE DATABASE IF NOT EXISTS quan_ly_ban_hang;
USE quan_ly_ban_hang;
CREATE TABLE customer (
    c_id INT NOT NULL PRIMARY KEY,
    c_name VARCHAR(25),
    c_age INT NOT NULL
);
CREATE TABLE `order` (
    o_id INT NOT NULL PRIMARY KEY,
    c_id INT NOT NULL,
    o_date DATETIME,
    o_total_price INT NOT NULL,
    FOREIGN KEY (c_id)
        REFERENCES customer (c_id)
);

CREATE TABLE product (
    p_id INT NOT NULL PRIMARY KEY,
    p_name VARCHAR(25),
    p_price INT NOT NULL
);
CREATE TABLE order_deitail (
    o_id INT NOT NULL,
    p_id INT NOT NULL,
    od_QTY VARCHAR(25),
    PRIMARY KEY (o_id , p_id),
    FOREIGN KEY (o_id)
        REFERENCES `order` (o_id),
    FOREIGN KEY (p_id)
        REFERENCES product (p_id)
);