DROP DATABASE IF EXISTS quan_ly_sinh_vien;
CREATE DATABASE IF NOT EXISTS quan_ly_sinh_vien;
USE quan_ly_sinh_vien;
CREATE TABLE class
(
class_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
class_name VARCHAR(60) NOT NULL,
start_date DATETIME NOT NULL,
`status` BIT
);
CREATE TABLE student
(
    student_id   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address     VARCHAR(50),
    phone       VARCHAR(20),
    `Status`      BIT,
    class_id     INT       NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Class (class_id)
);
CREATE TABLE `Subject`
(
    sub_id   INT   NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    `Status`  BIT                  DEFAULT 1
);
CREATE TABLE Mark
(
    mark_id    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id     INT NOT NULL,
    student_id INT NOT NULL,
    mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    exam_time TINYINT DEFAULT 1,
    UNIQUE (sub_id, student_id),
    FOREIGN KEY (sub_id) REFERENCES Subject (sub_id),
    FOREIGN KEY (student_id) REFERENCES Student (student_id)
);
