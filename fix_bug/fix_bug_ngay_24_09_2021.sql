drop database if exists student_management;
create database if not EXISTS student_management;
use student_management;
create table instructor (
	id int primary key AUTO_INCREMENT,
    `name` varchar(50),
    date_of_birth date
);

create table account_james (
	`account` varchar(50) primary key,
    `password` varchar(50)
);

    create table type_of_class (
	id int primary key,
    `name` varchar(10));


create table class (
	id int auto_increment,
    `name` varchar(7),
    type_of_class_id int,
    primary key (id),
    foreign key (type_of_class_id) references type_of_class (id) on update cascade on delete cascade
);

create table student (
	id int primary key auto_increment,
    `name` varchar(50),
    date_of_birth date,
    email varchar(50),
    account_james_account varchar(50),
    class_id int,
    foreign key (account_james_account)
		references account_james (`account`)  on update cascade on delete cascade,
	constraint fk_student_class foreign key (class_id)
		references class (id)  on update cascade on delete cascade
);




create table instructor_teach_class (
	class_id int,
    instructor_id int,
    primary key (class_id, instructor_id),
    foreign key (class_id)
		references class (id)  on update cascade on delete cascade,
	foreign key (instructor_id)
		references instructor (id)  on update cascade on delete cascade
);

insert into type_of_class
values
(1, 'Full time'),
(2, 'Half time');

insert into class (`name`, type_of_class_id)
values 
('C0421G1', 1),
('C0920G1', 1),
('A1020I1', 2),
('A0421I1', 2);

insert into account_james
values
('tien.nguyen', '12345678'),
('nhat.dong', '12345678'),
('trang.ho', '12345678'),
('mai.doan', '12345678'),
('long.duong', '12345678');

insert into student (`name`, date_of_birth, account_james_account, email, class_id)
values
('Tiến', '2000-07-14', 'tien.nguyen', 'tien@gmail.com', 1),
('Nhật', '2002-05-03', 'nhat.dong', 'nhat@gmail.com',  1),
('Trang', '2001-04-03', 'trang.ho', 'trang@gmail.com', 2),
('Mai', '2001-08-04', 'mai.doan', 'mai@gmail.com', 3),
('Nhật', '2002-05-03', 'nhat.dong', 'nhat@gmail.com',  3),
('Trang', '2001-04-03', 'trang.ho', 'trang@gmail.com', 3),
('Mai', '2001-08-04', 'mai.doan', 'mai@gmail.com', 3),
('Long', '2002-01-25', 'long.duong', 'long@gmail.com', null);

insert into instructor
values
(1, 'Tiến', '2000-07-14'),
(2, 'Trung', '2002-05-03'),
(3, 'Hải', '2003-11-03'),
(4, 'Chánh', '1998-07-09');

insert into instructor_teach_class
values
(1, 1),
(1, 2),
(2, 3);
-- cau 1:
DELETE FROM class 
WHERE class.id = 2;

-- cau 2:
-- SET SQL_SAFE_UPDATES=0; 
-- SET foreign_key_checks = 0;
UPDATE  instructor_teach_class SET instructor_id =4
WHERE NOT EXISTS(
SELECT* FROM(
SELECT ins.id
FROM  type_of_class toc 
INNER JOIN class cl on toc.id = cl.id
INNER JOIN instructor_teach_class itc on itc.class_id = cl.id
INNER JOIN instructor ins on itc.instructor_id = ins.id 
WHERE toc.`name` = 'Full time') AS X
);
-- SET SQL_SAFE_UPDATES=1; 
--  SET foreign_key_checks = 1;