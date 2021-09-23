DROP DATABASE IF EXISTS quan_ly_sinh_vien;
CREATE DATABASE quan_ly_sinh_vien;
USE quan_ly_sinh_vien;

CREATE TABLE class (
    class_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME NOT NULL,
    Status BIT
);
CREATE TABLE Student (
    student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(20),
    Status BIT,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id)
        REFERENCES class (class_id)
);
CREATE TABLE `subject` (
    sub_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK (Credit >= 1),
    Status BIT DEFAULT 1
);
CREATE TABLE mark (
    mark_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id INT NOT NULL,
    student_id INT NOT NULL,
    mark FLOAT DEFAULT 0 CHECK (Mark BETWEEN 0 AND 100),
    exam_time TINYINT DEFAULT 1,
    UNIQUE (sub_id , student_id),
    FOREIGN KEY (sub_id)
        REFERENCES `subject` (sub_id),
    FOREIGN KEY (student_id)
        REFERENCES student (student_id)
);

INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);
INSERT INTO student (student_name, address, phone, Status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_name, address, Status, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (student_name, address, phone, Status, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);
INSERT INTO `subject`
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       INSERT INTO mark (sub_id, student_id, mark, exam_time)
VALUES (2, 1, 8, 1),
       (1, 2, 10, 2),
       (3, 3, 10, 1);
    
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT 
    *
FROM
    student
WHERE
    student_name REGEXP '^h';
    -- Hiển thị lớp học có thời gian bắt đầu vào tháng 12.
SELECT* FROM class
WHERE start_date REGEXP '12';
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
SELECT*FROM `subject`
WHERE credit>=3 AND credit<=5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
UPDATE student
SET class_id = 2
WHERE student_id=1;
/* Hiển thị các thông tin: StudentName, SubName, Mark. 
Dữ liệu sắp xếp theo điểm thi (mark) giảm dần.
 nếu trùng sắp theo tên tăng dần.*/
SELECT  S.student_name, Sub.sub_name, M.mark
from student S join mark M on S.student_id=M.student_id join `subject` Sub on M.sub_id=Sub.sub_id
ORDER BY mark DESC, student_name;



     
