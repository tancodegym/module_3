Drop DATABASE if exists furama;
Create DATABASE furama;
use furama;
CREATE table position (
position_id INT AUTO_INCREMENT PRIMARY KEY,
position_name INT
);
CREATE table education_degree (
education_degree_id INT AUTO_INCREMENT PRIMARY KEY,
education_degree_name INT
);
CREATE table division (
division_id INT AUTO_INCREMENT PRIMARY KEY,
division_name INT
);
Create table customer_type(
customer_type_id INT AUTO_INCREMENT PRIMARY KEY,
customer_type_name INT
);
Create table service_type(
service_type_id INT AUTO_INCREMENT PRIMARY KEY,
service_type_name INT
);
Create table rent_type(
rent_type_id INT AUTO_INCREMENT PRIMARY KEY,
rent_type_name INT,
rent_type_cost DOUBLE
);
Create table attach_service(
attach_service_id INT AUTO_INCREMENT PRIMARY KEY,
attach_service_name INT,
attach_service_cost DOUBLE,
attach_service_unit INT,
attach_service_status VARCHAR(45)
);
Create table `role` (
role_id INT AUTO_INCREMENT PRIMARY KEY,
role_name VARCHAR(255)
);
Create table customer (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
customer_type_id INT ,
customer_name VARCHAR(45),
customer_birthday DATE,
customer_gender INT,
customer_id_card VARCHAR(45),
customer_phone VARCHAR(45),
customer_email VARCHAR(45),
customer_address VARCHAR(45),
FOREIGN KEY (customer_type_id) REFERENCES customer_type(customer_type_id)  ON UPDATE CASCADE ON DELETE CASCADE
) ;
Create table `user` ( 
username VARCHAR(255) PRIMARY KEY,
`password` VARCHAR(255)
);
CREATE table employee (
employee_id INT AUTO_INCREMENT PRIMARY KEY,
employee_name VARCHAR(45),
employee_birthday DATE,
employee_id_card VARCHAR(45),
employee_salary DOUBLE,
employee_phone VARCHAR(45),
employee_email VARCHAR(45),
employee_address VARCHAR(45),
position_id INT,
education_degree_id INT,
division_id INT,
username VARCHAR(255),
FOREIGN KEY (position_id) REFERENCES position (position_id)  ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (education_degree_id) REFERENCES education_degree (education_degree_id)  ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (division_id) REFERENCES division (division_id)  ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (username) REFERENCES `user` (username)  ON UPDATE CASCADE ON DELETE CASCADE
) ;

Create table user_role (
role_id INT,
username VARCHAR(255),
FOREIGN KEY (role_id) REFERENCES `role` (role_id)  ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (username) REFERENCES `user` (username)  ON UPDATE CASCADE ON DELETE CASCADE
);
create table service (
service_id INT AUTO_INCREMENT PRIMARY KEY,
service_name VARCHAR(45),
service_area INT,
service_cost DOUBLE,
service_max_people INT,
rent_type_id INT,
service_type_id INT,
standard_room VARCHAR (45),
description_other_convenience VARCHAR(45),
pool_area DOUBLE,
number_of_floors INT,
FOREIGN KEY (rent_type_id) REFERENCES rent_type (rent_type_id)  ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (service_type_id) REFERENCES service_type (service_type_id)  ON UPDATE CASCADE ON DELETE CASCADE
);

create table contract (
contract_id INT AUTO_INCREMENT PRIMARY KEY,
contract_start_date DATETIME,
contract_end_date DATETIME,
contract_deposit DOUBLE,
employee_id INT,
customer_id INT,
service_id INT,
FOREIGN KEY (employee_id) REFERENCES employee (employee_id)  ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (customer_id) REFERENCES customer (customer_id)  ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (service_id) REFERENCES service (service_id)  ON UPDATE CASCADE ON DELETE CASCADE
);
create table contract_detail ( 
contract_detail_id INT AUTO_INCREMENT PRIMARY KEY,
contract_id INT,
attach_service_id INT,
quantity INT,
FOREIGN KEY (contract_id) REFERENCES contract (contract_id)  ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (attach_service_id) REFERENCES attach_service (attach_service_id)  ON UPDATE CASCADE ON DELETE CASCADE
);
use furama;
SELECT*FROM customer;
customer_id INT AUTO_INCREMENT PRIMARY KEY,
customer_type_id INT ,
customer_name VARCHAR(45),
customer_birthday DATE,
customer_gender INT,
customer_id_card VARCHAR(45),
customer_phone VARCHAR(45),
customer_email VARCHAR(45),
customer_address VARCHAR(45),
INSERT INTO customer (customer_id,customer_type_id,customer_name,
customer_birthday,customer_gender,customer_id_card,customer_phone,
customer_email,customer_address)
VALUE { }