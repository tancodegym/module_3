DROP DATABASE IF EXISTS student_managerment;
CREATE DATABASE student_managerment;
USE student_managerment;

CREATE TABLE IF NOT EXISTS student(
`id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `class` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `teacher` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) 