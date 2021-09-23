USE quan_ly_sinh_vien;
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

