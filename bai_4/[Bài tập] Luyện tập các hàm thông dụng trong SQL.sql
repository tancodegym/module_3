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
CREATE TABLE mark
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
INSERT INTO class
VALUE(1, 'A1', '2008-12-20',1);
INSERT INTO class
VALUE(2, 'A2', '2008-12-22',1);
INSERT INTO class
VALUE(3, 'B3', current_date(),0);
INSERT INTO student(student_name,address,phone,`Status`,class_id)
VALUE ('Hung','Ha Noi','0912113113',1,1);
INSERT INTO student(student_name,address,`Status`,class_id)
VALUE('Hoa','Hai Phong',1,1);
INSERT INTO student(student_name, address,phone,`Status`,class_id)
VALUE('Manh','HCM','0123123123',0,1);
INSERT INTO subject
VALUES(1,'CF',5,1),
		(2,'C',6,1),
	(3,'HDJ',5,1),
	(4,'RDBMS',10,1);
    INSERT INTO mark(sub_id,student_id,mark,exam_time)
    VALUES(1,1,8,1),
    (2,1,10,2),
    (3,1,12,1);
       INSERT INTO mark(sub_id,student_id,mark,exam_time)
    VALUES(1,2,8,1),
    (2,2,10,2),
    (3,2,12,1);
       INSERT INTO mark(sub_id,student_id,mark,exam_time)
    VALUES(1,3,6,1),
    (2,3,7,2),
    (3,3,11,1);
    -- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.

    SELECT S.sub_id,S.sub_name,S.credit,S.`Status`
    FROM `Subject` S
    HAVING credit >= ALL ( SELECT credit FROM `Subject` Sub GROUP BY Sub.sub_id);
    
    -- Hiển thị các thông tin môn học có điểm thi lớn nhất.
    SELECT Sub.sub_id,Sub.sub_name,Sub.credit,Sub.`Status`,M.mark
    FROM `Subject` Sub Join mark M on Sub.sub_id = M.sub_id
    HAVING M.mark >= ALL ( SELECT mark FROM mark M GROUP BY M.mark_id);
    
    -- Hiển thị các thông tin sinh viên và điểm trung bình 
    -- của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
    SELECT S.student_id,S.student_name, AVG(M.mark)
    FROM student S JOIN mark M on S.student_id = M.student_id
    GROUP BY S.student_id
    ORDER BY AVG(M.mark) DESC, S.student_name 
    