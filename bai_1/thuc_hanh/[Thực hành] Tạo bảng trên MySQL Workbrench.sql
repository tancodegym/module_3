DROP DATABASE IF EXISTS student_managerment;
CREATE DATABASE student_managerment;
USE student_managerment;
CREATE TABLE student (
`id` INT NOT NULL,
`name` VARCHAR (45) NUll,
`age` INT NULL,
`country` VARCHAR(45) NUll,
PRIMARY KEY(`id`));