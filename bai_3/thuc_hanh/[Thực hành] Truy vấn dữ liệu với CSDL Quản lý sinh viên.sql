USE quan_ly_sinh_vien;
-- Hiển thị danh sách tất cả các học viên
SELECT*FROM student;
-- Hiển thị danh sách các học viên đang học
SELECT*FROM student
WHERE `Status` =true;
-- Hiển thị các học viên có thời gian theo học nhỏ hơn 10
SELECT *
FROM Subject
WHERE Credit < 10;
-- Hiển thị danh sách học viên lớp A1
SELECT S.student_id, S.student_name, C.class_name
FROM student S join class C on S.class_id =C.class_id
WHERE C.class_name='A1';
-- Hiển thị tất cả các điểm đang có của học viên
SELECT S.student_id,S.student_name,Sub.sub_name,M.mark
FROM student S join mark M on S.student_id=M.student_id join `subject` Sub on M.sub_id=Sub.sub_id;
-- Sử dụng câu lệnh where để hiển thị điểm môn CF các học viên
SELECT S.student_id, S.student_name, Sub.sub_name, M.mark
FROM student S join mark M  on S.student_id =M.student_id join `subject` Sub on M.sub_id=Sub.sub_id
WHERE Sub.sub_name='CF';