DROP DATABASE IF EXISTS furama_resort;
CREATE DATABASE IF NOT EXISTS furama_resort;
USE furama_resort;

CREATE TABLE vi_tri (
    id_vi_tri INT PRIMARY KEY AUTO_INCREMENT,
    ten_vi_tri VARCHAR(45)
);
CREATE TABLE trinh_do (
    id_trinh_do INT PRIMARY KEY AUTO_INCREMENT,
    ten_trinh_do VARCHAR(45)
);
CREATE TABLE bo_phan (
    id_bo_phan INT PRIMARY KEY AUTO_INCREMENT,
    ten_bo_phan VARCHAR(45)
);
CREATE TABLE loai_khach (
    id_loai_khach INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_khach VARCHAR(45)
);
CREATE TABLE kieu_thue (
    id_kieu_thue INT PRIMARY KEY AUTO_INCREMENT,
    ten_kieu_thue VARCHAR(45),
    gia INT
);
CREATE TABLE loai_dich_vu (
    id_loai_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_dich_vu VARCHAR(45)
);
CREATE TABLE dich_vu_di_kem (
    id_dich_vu_di_kem INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu_di_kem VARCHAR(45),
    gia INT,
    don_vi INT,
    trang_thai_kha_dung VARCHAR(45)
);
CREATE TABLE nhan_vien (
    id_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
    ho_va_ten VARCHAR(45),
    id_vi_tri INT,
    id_trinh_do INT,
    id_bo_phan INT,
    ngay_sinh DATE,
    so_cmnd VARCHAR(45),
    luong INT,
    so_dien_thoai VARCHAR(10),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    FOREIGN KEY (id_vi_tri)
        REFERENCES vi_tri (id_vi_tri)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_trinh_do)
        REFERENCES trinh_do (id_trinh_do)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_bo_phan)
        REFERENCES bo_phan (id_bo_phan)
        ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE khach_hang (
    id_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
    id_loai_khach INT,
    ho_va_ten VARCHAR(45),
    ngay_sinh DATE,
    so_CMND VARCHAR(45),
    so_dien_thoai VARCHAR(10),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    FOREIGN KEY (id_loai_khach)
        REFERENCES loai_khach (id_loai_khach)
        ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE dich_vu (
    id_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu VARCHAR(45),
    dien_tich INT,
    so_tang INT,
    so_nguoi_toi_da INT,
    chi_phi_thue INT,
    id_kieu_thue INT,
    id_loai_dich_vu INT,
    trang_thai VARCHAR(45),
    FOREIGN KEY (id_kieu_thue)
        REFERENCES kieu_thue (id_kieu_thue)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_loai_dich_vu)
        REFERENCES loai_dich_vu (id_loai_dich_vu)
        ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE hop_dong (
    id_hop_dong INT PRIMARY KEY AUTO_INCREMENT,
    id_nhan_vien INT,
    id_khach_hang INT,
    id_dich_vu INT,
    ngay_lam_hop_dong DATE,
    ngay_ket_thuc DATE,
    tien_dat_coc INT,
    tong_tien INT,
    FOREIGN KEY (id_nhan_vien)
        REFERENCES nhan_vien (id_nhan_vien)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_khach_hang)
        REFERENCES khach_hang (id_khach_hang)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_dich_vu)
        REFERENCES dich_vu (id_dich_vu)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE hop_dong_chi_tiet (
    id_hop_dong_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
    so_luong INT,
    id_hop_dong INT,
    id_dich_vu_di_kem INT,
    FOREIGN KEY (id_hop_dong)
        REFERENCES hop_dong (id_hop_dong)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (id_dich_vu_di_kem)
        ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO bo_phan( ten_bo_phan)
VALUES	('sale_marketing'),
		('hanh_chinh'),
		('phuc_vu'),
        ('quan_ly');
INSERT INTO trinh_do(ten_trinh_do)
VALUES 	('trung cap'),
		('cao dang'),
		('dai hoc'),
		('sau dai hoc');
INSERT INTO vi_tri(ten_vi_tri)
VALUES 	('le tan'),
		('phuc vu'),
		('chuyen vien'),
		('giam sat'),
		('quan ly'),
		('giam doc');
INSERT INTO loai_khach(ten_loai_khach)
VALUES 	('Diamond'),
		('Platinium'),
		('Gold'),
		('Silver'),
		('Member');
INSERT INTO kieu_thue(ten_kieu_thue,gia)
VALUES 	('Nam',300),
		('Thang',20),
		('Ngay',5),
		('Gio',1);
INSERT INTO loai_dich_vu(ten_loai_dich_vu)
VALUES 	('Villa'),
		('House'),
		('Room');
    SET FOREIGN_KEY_CHECKS=0;
INSERT INTO nhan_vien(ho_va_ten,id_vi_tri,id_trinh_do,id_bo_phan,
						ngay_sinh,so_cmnd,luong,so_dien_thoai,email
                        ,dia_chi)
		VALUES ('Tran Van Thanh',1,1,1,'1990-3-23','201605555',
        1500000,'0912111111','van.anh@gmail.com','ha noi'),
        ('Nguyen Huong',2,2,2,'1995-11-2','201601111',
        5000000,'0912222222','ngochuong@gmail.com','da nang'),
        ('La Van Khanh',3,3,3,'1998-2-11','101801111',
        10000000,'0912333333','khanh.dang@gmail.com','ho chi minh'),
         ('Tran Thi Ngoc Tinh',1,2,3,'1992-12-15','131801111',
        12000000,'0912444444','tinh.tran@gmail.com','Quang Tri'),
        ('Tran Thi Ngoc Minh',1,2,3,'1952-12-15','191801111',
        12000000,'0912555444','minh.tran@gmail.com','ho chi minh'),
        ('Tran Van Tien',1,2,1,'1995-01-12','201505555',
        1500000,'0751123321','tien.tran@gmail.com','H???i Ch??u'),
        ('Nguyen Thi Thu Ha',1,1,3,'1999-01-22','202605555',
        1500000,'0333154451','ha.nguyen@gmail.com','H???i Ch??u'),
        ('Tran Van Hai',1,2,1,'1965-01-12','121515555',
        1500000,'0725123321','haihai@gmail.com','H???i Ch??u'),
        ('Nguyen Thi Thu Suong',1,1,3,'1979-01-22','162605555',
        1500000,'0332254451','suongnguyen@gmail.com','H???i Ch??u');
      
  
   
	INSERT INTO khach_hang(id_loai_khach,
	ho_va_ten,ngay_sinh,so_CMND,so_dien_thoai,email,dia_chi)
VALUES
(1,'Tran Van Hanh','2000-12-31','200101333','0123455552','van.hanh@gmail.com','Qu???ng Tr???'),
(1,'Tran Van Kien','2000-07-02','211101333','0333455552','kien.tran@gmail.com','???? N???ng'),
(2,'Trinh Dung','1970-05-31','120101333','0123455111','dung.trinh@gmail.com','???? N???ng'),
(3,'Nguyen Van Binh','1980-06-30','150101333','0123225111','binh.nguyen@gmail.com','H?? N???i'),
(4,'Ha Thu Thuy','1985-07-22','160101333','0123455911','thuy.ha@gmail.com','S??i G??n'),
(1,'Tran Van Kien','1981-06-21','160101433','0123457911','kienkien@gmail.com','S??i G??n'),
(1,'Tran Van Kien','1995-02-22','160105313','0123458901','kien.tran@gmail.com','Qu???ng Ng??i'),
(1,'Nguyen Van Minh','1995-01-23','160105303','0123458921','minhvan@gmail.com','Vinh'),
(2,'Tran Thi Diem','2005-08-24','160105383','0123458991','thidiem@gmail.com','Qu???ng Ng??i'),
(3,'Tran Thi Dao','2001-02-02','260605383','0123118991','dao.tran@gmail.com','Qu???ng Ng??i'),
(4,'Tran Thi Vy','2002-05-23','261155383','0124589910','vy.thi@gmail.com','Vinh');
 INSERT INTO dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai_kha_dung)
 VALUES( 'massage',5000000,1,'??ang s??? d???ng'),
		( 'karaoke',2000000,1,'??ang s??? d???ng'),
        ( 'th???c ??n',500000,1,'??ang s??? d???ng'),
        ( 'n?????c u???ng',100000,1,'??ang s??? d???ng'),
        ( 'tham quan',1000000,1,'??ang s??? d???ng'),
        ('gym',500000,1,'??ang s??? d???ng');
	
 INSERT INTO dich_vu(ten_dich_vu,dien_tich,so_tang,so_nguoi_toi_da,chi_phi_thue,id_kieu_thue,id_loai_dich_vu,trang_thai)
 VALUES('thue_villa',500,3,20,5000000,1,1,'dang su dung'),
		('thue_villa',500,3,20,1000000,2,1,'dang su dung'),
        ('thue_villa',400,3,20,5000000,1,1,'dang su dung'),
        ('thue_villa',400,3,20,5000000,1,1,'dang su dung'),
        ('thue_villa',400,3,20,5000000,1,1,'dang su dung'),
        ('thue_villa',500,3,20,2000000,3,1,'dang su dung'),
        ('thue_villa',500,3,20,100000,4,1,'dang su dung'),
        ('thue_house',200,2,10,2000000,1,2,'dang su dung'),
        ('thue_house',200,2,10,200000,2,2,'dang su dung'),
        ('thue_house',200,2,10,100000,3,2,'dang su dung'),
        ('thue_house',200,2,10,50000,4,2,'dang su dung'),
        ('thue_room',100,1,5,1000000,1,3,'dang su dung'),
        ('thue_room',100,1,5,100000,2,3,'dang su dung'),
        ('thue_room',100,1,5,50000,3,3,'dang su dung'),
        ('thue_room',100,1,5,20000,4,3,'dang su dung');
     
INSERT INTO hop_dong(id_nhan_vien,id_khach_hang,id_dich_vu,
   ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,tong_tien)
   VALUES	(1,2,12,'2021-01-24','2021-10-25',5000000,5000000),
			(2,1,9,'2018-02-24','2021-10-25',2000000,5000000),
			(3,3,8,'2019-03-19','2021-10-25',1000000,1000000),
            (3,3,7,'2019-04-23','2021-10-25',1000000,1000000),
			(1,3,7,'2019-04-23','2021-10-25',1000000,1000000),
			(2,3,7,'2019-04-23','2021-10-25',1000000,1000000),
			(6,3,7,'2019-12-12','2021-10-25',1000000,1000000),
			(7,3,7,'2019-12-12','2021-10-25',1000000,1000000),
			(8,3,7,'2019-04-23','2021-10-25',1000000,1000000),
			(9,3,7,'2019-04-23','2021-10-25',1000000,1000000),
            (3,9,6,'2019-05-27','2021-10-25',1000000,1000000),
            (3,4,5,'2019-06-26','2021-10-25',1000000,1000000),
            (3,3,4,'2019-02-02','2021-10-25',1000000,1000000),
            (3,2,3,'2019-08-05','2021-10-25',1000000,1000000),
            (3,1,2,'2019-09-06','2021-10-25',1000000,1000000),
            (3,6,1,'2019-09-08','2021-10-25',1000000,1000000),
            (3,7,10,'2019-09-17','2021-10-25',1000000,1000000),
            (3,5,11,'2019-011-14','2021-10-25',1000000,1000000),
            (3,3,13,'2019-09-15','2021-10-25',1000000,1000000),
            (3,3,1,'2019-10-22','2021-10-25',1000000,1000000),
			(3,3,1,'2019-06-23','2021-10-25',1000000,1000000),
			(3,1,1,'2019-12-23','2021-10-25',1000000,1000000),
            (3,3,1,'2019-07-30','2021-10-25',1000000,1000000),
            (3,8,1,'2019-12-31','2021-10-25',1000000,1000000),
            (3,7,1,'2019-01-29','2021-10-25',1000000,1000000),
			(2,8,2,'2021-04-22','2021-10-25',2000000,5000000),
			(2,9,1,'2021-05-21','2021-10-25',2000000,5000000),
            (5,10,1,'2015-05-21','2015-10-25',2000000,5000000),
            (6,11,1,'2014-05-21','2014-10-25',2000000,5000000),
            (8,11,1,'2019-12-12','2021-12-25',2000000,5000000),
            (9,11,1,'2019-12-12','2021-12-25',2000000,5000000),
             (6,12,12,'2015-05-21','2017-10-25',2000000,5000000),
            (8,15,13,'2015-12-12','2021-12-25',2000000,5000000),
             (8,13,14,'2019-12-12','2021-12-25',2000000,5000000),
            (9,14,15,'2019-12-12','2021-12-25',2000000,5000000);
	
   INSERT INTO hop_dong_chi_tiet(so_luong,id_hop_dong,id_dich_vu_di_kem)
   VALUES 	(1,1,6),(1,5,1),(1,5,2),(1,5,3),(1,5,4),
			(1,7,1),(1,7,2),(1,7,3),(1,7,4),
			(1,19,2),(1,2,2),(1,3,2),(1,4,2),
			(1,20,3),(1,3,2),(1,4,2),(1,5,2),
			(1,21,4),(1,8,2),(1,5,2),(1,6,2),
			(1,2,5),(1,12,5),(1,11,5),(1,13,5),(1,14,5)
            ,(1,15,5),(1,2,5),(1,18,5),(1,17,5),(1,16,5),
            (1,2,5),(1,19,5),(1,11,5),(1,12,5),(1,6,5);


  SET FOREIGN_KEY_CHECKS=1; 
-- TASK 2:	Hi???n th??? th??ng tin c???a t???t c??? 
-- 			nh??n vi??n c?? trong h??? th???ng c?? t??n b???t ?????u 
-- 			l?? m???t trong c??c k?? t??? ???H???, ???T??? ho???c ???K??? v??
--  		c?? t???i ??a 15 k?? t???.
	USE furama_resort;
	SELECT*FROM nhan_vien
    WHERE  char_length(ho_va_ten)<=15 AND  
    ((SELECT substring_index(ho_va_ten,' ',-1)) REGEXP '^T|K|H')
    ;
-- Task 3.	Hi???n th??? th??ng tin c???a t???t c??? kh??ch h??ng 
-- 			c?? ????? tu???i t??? 18 ?????n 50 tu???i v?? c?? ?????a ch???
-- 			??? ??????? N???ng??? ho???c ???Qu???ng Tr??????.
-- h??m tr??? v??? tu???i t??? ng??y sinh :  (YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))
	USE furama_resort;
	SELECT*FROM khach_hang
    WHERE  (YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))>=18 
    AND (YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))<=50 
    AND ((dia_chi LIKE 'Qu???ng Tr???') OR (dia_chi LIKE '???? N???ng'));

 -- Task 4.	?????m xem t????ng ???ng v???i m???i kh??ch h??ng ???? t???ng ?????t ph??ng bao nhi??u l???n.
--  		K???t qu??? hi???n th??? ???????c s???p x???p t??ng d???n theo s??? l???n ?????t ph??ng c???a kh??ch h??ng.
-- 		    Ch??? ?????m nh???ng kh??ch h??ng n??o c?? T??n lo???i kh??ch h??ng l?? ???Diamond???.
USE furama_resort;
SELECT*FROM hop_dong;
SELECT*FROM khach_hang;
SELECT K.ho_va_ten,count(H.id_khach_hang) AS so_lan_dat_phong,L.ten_loai_khach
FROM khach_hang K JOIN hop_dong H ON K.id_khach_hang = H.id_khach_hang
	JOIN loai_khach L ON L.id_loai_khach=K.id_loai_khach
GROUP BY H.id_khach_hang
HAVING L.ten_loai_khach ="Diamond"
ORDER BY so_lan_dat_phong;
/*  Task 5.	Hi???n th??? IDKhachHang, HoTen, TenLoaiKhach, IDHopDong,
			TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien
 		   (V???i TongTien ???????c t??nh theo c??ng th???c nh?? sau:
			ChiPhiThue + SoLuong*Gia, v???i SoLuong v?? Gi?? l?? t??? b???ng DichVuDiKem) 
			cho t???t c??? c??c Kh??ch h??ng ???? t???ng ?????t ph???ng.
			(Nh???ng Kh??ch h??ng n??o ch??a t???ng ?????t ph??ng c??ng ph???i hi???n th??? ra). */
            SELECT*FROM hop_dong;
SELECT K.id_khach_hang,K.ho_va_ten,L.ten_loai_khach,H.id_hop_dong,D.ten_dich_vu,
		H.ngay_lam_hop_dong,H.ngay_ket_thuc,sum(D.chi_phi_thue+(C.so_luong*V.gia)) AS tong_tien
FROM khach_hang K LEFT JOIN hop_dong H ON K.id_khach_hang=H.id_khach_hang
	LEFT JOIN loai_khach L ON K.id_loai_khach= L.id_loai_khach
   LEFT  JOIN dich_vu D ON D.id_dich_vu = H.id_dich_vu
  LEFT  JOIN hop_dong_chi_tiet C ON C.id_hop_dong=H.id_hop_dong
  LEFT  JOIN dich_vu_di_kem V ON V.id_dich_vu_di_kem = C.id_dich_vu_di_kem
    GROUP BY K.id_khach_hang;
 /* Task 6.Hi???n th??? IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu 
	c???a t???t c??? c??c lo???i D???ch v??? ch??a t???ng ???????c Kh??ch h??ng th???c hi???n ?????t 
	t??? qu?? 1 c???a n??m 2019 (Qu?? 1 l?? th??ng 1, 2, 3). */	
SELECT D.id_dich_vu, D.ten_dich_vu, D.dien_tich, D.chi_phi_thue,L.ten_loai_dich_vu,H.ngay_lam_hop_dong
FROM dich_vu D LEFT JOIN loai_dich_vu L ON L.id_loai_dich_vu = D.id_loai_dich_vu
LEFT JOIN hop_dong H ON H.id_dich_vu=D.id_dich_vu
WHERE NOT (month(H.ngay_lam_hop_dong)=1 OR month(H.ngay_lam_hop_dong)=2
 OR month(H.ngay_lam_hop_dong)=3);
/* Task 7.	Hi???n th??? th??ng tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, 
ChiPhiThue, TenLoaiDichVu c???a t???t c??? c??c lo???i d???ch v??? ???? t???ng ???????c 
Kh??ch h??ng ?????t ph??ng trong n??m 2018 nh??ng ch??a t???ng 
???????c Kh??ch h??ng ?????t ph??ng  trong n??m 2019.
 */
 SELECT D.id_dich_vu, D.ten_dich_vu, D.dien_tich,D.so_nguoi_toi_da,
 D.chi_phi_thue,L.ten_loai_dich_vu,H.ngay_lam_hop_dong
FROM dich_vu D LEFT JOIN loai_dich_vu L ON L.id_loai_dich_vu = D.id_loai_dich_vu
LEFT JOIN hop_dong H ON H.id_dich_vu=D.id_dich_vu
WHERE ( NOT (year(H.ngay_lam_hop_dong)=2019) ) AND year(H.ngay_lam_hop_dong)=2018;
/* 
8.	Hi???n th??? th??ng tin HoTenKhachHang c?? trong h??? th???ng,
 v???i y??u c???u HoThenKhachHang kh??ng tr??ng nhau.
H???c vi??n s??? d???ng theo 3 c??ch kh??c nhau ????? th???c hi???n y??u c???u tr??n
*/
-- C??ch 1:
SELECT ho_va_ten 
FROM khach_hang
GROUP BY ho_va_ten;
-- C??ch 2:
SELECT ho_va_ten
FROM khach_hang
UNION
SELECT ho_va_ten
FROM khach_hang;
-- C??ch 3:
SELECT DISTINCT ho_va_ten
FROM khach_hang;

/* Task 9:	Th???c hi???n th???ng k?? doanh thu theo th??ng, 
ngh??a l?? t????ng ???ng v???i m???i th??ng trong n??m 2019 
th?? s??? c?? bao nhi??u kh??ch h??ng th???c hi???n ?????t ph??ng. */
CREATE TEMPORARY TABLE thang(
thang int primary key AUTO_INCREMENT
);
INSERT into thang()
Values(),(),(),(),(),(),(),(),(),(),(),();
SELECT*FROM thang;
SELECT DISTINCT*FROM (
SELECT count(H.id_hop_dong) AS doanh_thu 
,month(ngay_lam_hop_dong) AS thang
FROM hop_dong H
WHERE year(ngay_lam_hop_dong)=2019
GROUP BY month(ngay_lam_hop_dong)
UNION 
SELECT null, thang FROM thang) AS a ;


/*Task 10:Hi???n th??? th??ng tin t????ng ???ng v???i t???ng 
H???p ?????ng th?? ???? s??? d???ng bao nhi??u D???ch v??? ??i k??m. 
K???t qu??? hi???n th??? bao g???m IDHopDong, NgayLamHopDong,
 NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem 
 (???????c t??nh d???a tr??n vi???c count c??c IDHopDongChiTiet). */
 Use furama_resort;
 SELECT H.id_hop_dong,H.ngay_lam_hop_dong,
 H.ngay_ket_thuc,H.tien_dat_coc,count(T.id_dich_vu_di_kem) AS so_luong_dich_vu_di_kem
 FROM hop_dong H JOIN hop_dong_chi_tiet T on H.id_hop_dong=T.id_hop_dong
GROUP BY T.id_hop_dong;
/*Task 11.	Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???? ???????c
 s??? d???ng b???i nh???ng Kh??ch h??ng c?? TenLoaiKhachHang l?? ???Diamond??? 
 v?? c?? ?????a ch??? l?? ???Vinh??? ho???c ???Qu???ng Ng??i???. */
SELECT 
    K.id_dich_vu_di_kem,
    K.ten_dich_vu_di_kem,
    K.gia,
    K.don_vi,
    K.trang_thai_kha_dung,
    G.ho_va_ten,
    G.dia_chi,
    L.ten_loai_khach
FROM dich_vu_di_kem K
        JOIN hop_dong_chi_tiet T ON K.id_dich_vu_di_kem = T.id_dich_vu_di_kem
        JOIN hop_dong H ON H.id_hop_dong = T.id_hop_dong
        JOIN khach_hang G ON H.id_khach_hang = G.id_khach_hang
        JOIN loai_khach L ON L.id_loai_khach = G.id_loai_khach
WHERE L.ten_loai_khach= "Diamond" AND (G.dia_chi = "Vinh" OR G.dia_chi="Qu???ng Ng??i");
/* Task 12.	Hi???n th??? th??ng tin IDHopDong, TenNhanVien, TenKhachHang, 
SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem 
(???????c t??nh d???a tr??n t???ng H???p ?????ng chi ti???t),
 TienDatCoc c???a t???t c??? c??c d???ch v??? ???? t???ng ???????c
 kh??ch h??ng ?????t v??o 3 th??ng cu???i n??m 2019 nh??ng 
 ch??a t???ng ???????c kh??ch h??ng ?????t v??o 6 th??ng ?????u n??m 2019. */

SELECT  H.id_hop_dong,N.ho_va_ten AS ten_nhan_vien,
 K.ho_va_ten AS ten_khach_hang,K.so_dien_thoai,
 D.ten_dich_vu, count(T.id_dich_vu_di_kem )AS 'So luong dich vu di kem',
 H.tien_dat_coc,H.ngay_lam_hop_dong
FROM dich_vu D 
Join hop_dong H  on D.id_dich_vu = H.id_dich_vu
 JOIN  nhan_vien N on H.id_nhan_vien =N.id_nhan_vien
 JOIN khach_hang K on K.id_khach_hang=H.id_khach_hang 
 JOIN hop_dong_chi_tiet T on T.id_hop_dong = H.id_hop_dong
JOIN dich_vu_di_kem V on V.id_dich_vu_di_kem = T.id_dich_vu_di_kem
WHERE year(ngay_lam_hop_dong)=2019 AND quarter(ngay_lam_hop_dong)=4 
AND D.id_dich_vu NOT IN (SELECT  D.id_dich_vu
						FROM  dich_vu D  JOIN  hop_dong H ON D.id_dich_vu = H.id_dich_vu
						WHERE (QUARTER(H.ngay_lam_hop_dong) = 1
							OR QUARTER(H.ngay_lam_hop_dong) = 2)
							AND (YEAR(H.ngay_lam_hop_dong) = 2019))
GROUP BY T.id_hop_dong;

/* Task 13. Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???????c s??? d???ng nhi???u nh???t
 b???i c??c Kh??ch h??ng ???? ?????t ph??ng. (L??u ?? l?? c?? th??? c?? nhi???u d???ch v??? c?? 
 s??? l???n s??? d???ng nhi???u nh?? nhau).
 */
 
 SELECT T.id_dich_vu_di_kem,count(T.id_dich_vu_di_kem) AS so_lan ,K.gia,K.ten_dich_vu_di_kem
 FROM hop_dong_chi_tiet T JOIN dich_vu_di_kem K on K.id_dich_vu_di_kem=T.id_dich_vu_di_kem
 GROUP by T.id_dich_vu_di_kem
  HAVING count(T.id_dich_vu_di_kem)>= ALL ( 
  SELECT count(id_dich_vu_di_kem) FROM hop_dong_chi_tiet
 GROUP by id_dich_vu_di_kem);
 
 /* Task 14.	Hi???n th??? th??ng tin t???t c??? c??c D???ch v??? ??i k??m 
 ch??? m???i ???????c s??? d???ng m???t l???n duy nh???t. Th??ng tin hi???n th???
 bao g???m IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung. */
 SELECT T.id_hop_dong, ten_loai_dich_vu,K.ten_dich_vu_di_kem,count(T.id_dich_vu_di_kem)AS so_lan_su_dung
 FROM hop_dong H
 JOIN dich_vu D on D.id_dich_vu = H.id_dich_vu
 JOIN loai_dich_vu L on L.id_loai_dich_vu = D.id_loai_dich_vu
 JOIN hop_dong_chi_tiet T on T.id_hop_dong = H.id_hop_dong
 JOIN dich_vu_di_kem K on K.id_dich_vu_di_kem = T.id_dich_vu_di_kem
 GROUP BY K.id_dich_vu_di_kem
 Having count(K.id_dich_vu_di_kem)=1;
/* Task 15.	Hi???n thi th??ng tin c???a t???t c??? nh??n vi??n bao g???m 
IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi m???i
 ch??? l???p ???????c t???i ??a 3 h???p ?????ng t??? n??m 2018 ?????n 2019. */
 SELECT N.id_nhan_vien,N.ho_va_ten, T.ten_trinh_do,B.ten_bo_phan,
 N.so_dien_thoai,N.dia_chi,count(H.id_hop_dong) AS so_lan_lam_hop_dong
 FROM nhan_vien N
 JOIN hop_dong H on H.id_nhan_vien = N.id_nhan_vien
 JOIN trinh_do T on T.id_trinh_do = N.id_trinh_do
 JOIN bo_phan B on B.id_bo_phan = N.id_bo_phan
 WHERE year(H.ngay_lam_hop_dong) BETWEEN 2018 AND 2019
 GROUP BY N.id_nhan_vien
 HAVING count(H.id_hop_dong)<=3;
 /* Task 16.X??a nh???ng Nh??n vi??n ch??a t???ng l???p ???????c
 h???p ?????ng n??o t??? n??m 2017 ?????n n??m 2019.
 */
 SET SQL_SAFE_UPDATES=0;
 DELETE FROM nhan_vien
 WHERE id_nhan_vien IN 
 ( SELECT id_nhan_vien 
	FROM (SELECT* FROM nhan_vien) AS A
	WHERE id_nhan_vien NOT IN
    (	SELECT N.id_nhan_vien
		FROM  (SELECT* FROM nhan_vien ) AS N JOIN hop_dong H on N.id_nhan_vien=H.id_nhan_vien
		WHERE  YEAR(H.ngay_lam_hop_dong) BETWEEN 2017 AND 2019
		GROUP BY N.id_nhan_vien
		HAVING COUNT(H.id_hop_dong) >0));
SET SQL_SAFE_UPDATES=1;
/* Task 17.	C???p nh???t th??ng tin nh???ng kh??ch h??ng c?? 
TenLoaiKhachHang t???  Platinium l??n Diamond, 
ch??? c???p nh???t nh???ng kh??ch h??ng ???? t???ng ?????t ph??ng
 v???i t???ng Ti???n thanh to??n trong n??m 2019 l?? l???n h??n 10.000.000 VN??.
 */  
 CREATE TEMPORARY table tgg (SELECT *FROM thang);
SET SQL_SAFE_UPDATES = 0;
UPDATE khach_hang
SET id_loai_khach=1
WHERE id_khach_hang IN (SELECT id_khach_hang FROM
	  (SELECT K.id_khach_hang
            FROM khach_hang K
            JOIN loai_khach L ON K.id_loai_khach = L.id_loai_khach
            JOIN hop_dong H ON K.id_khach_hang = H.id_khach_hang
            JOIN dich_vu D ON H.id_dich_vu = D.id_dich_vu
            JOIN hop_dong_chi_tiet T ON T.id_hop_dong = H.id_hop_dong
            JOIN dich_vu_di_kem V ON V.id_dich_vu_di_kem = T.id_dich_vu_di_kem
            WHERE  (L.ten_loai_khach = 'Platinium')
					AND (YEAR(H.ngay_lam_hop_dong) = 2019)
            GROUP BY H.id_khach_hang
            HAVING SUM(D.chi_phi_thue + V.gia * V.don_vi) > 10000000) AS id_khach_hang_cap_2);
SET SQL_SAFE_UPDATES = 1;
SELECT*FROM khach_hang;

/* Task 18. X??a nh???ng kh??ch h??ng c?? h???p ?????ng tr?????c n??m 2016 
(ch?? ?? r??ngbu???c gi???a c??c b???ng).
 */
 SELECT* FROM khach_hang;
 SET SQL_SAFE_UPDATES = 0;
DELETE 
FROM khach_hang
WHERE id_khach_hang IN ( 
	SELECT id_khach_hang FROM (
		SELECT  K.id_khach_hang
		FROM khach_hang K  JOIN
        hop_dong H ON H.id_khach_hang = K.id_khach_hang 
		WHERE
        YEAR(H.ngay_lam_hop_dong) < 2016) AS X);
 SELECT* FROM khach_hang;
 SET SQL_SAFE_UPDATES = 1;
/* Task 19:	C???p nh???t gi?? cho c??c D???ch v??? ??i k??m ???????c s??? d???ng tr??n 10 l???n trong n??m 2019 l??n g???p ????i.*/
-- SELECT D.id_dich_vu_di_kem,D.ten_dich_vu_di_kem,gia,count(H.id_dich_vu_di_kem) AS so_lan
-- FROM hop_dong_chi_tiet H JOIN dich_vu_di_kem D on H.id_dich_vu_di_kem= D.id_dich_vu_di_kem
-- GROUP BY id_dich_vu_di_kem;

SET SQL_SAFE_UPDATES = 0;
UPDATE dich_vu_di_kem
SET gia=gia*2
WHERE id_dich_vu_di_kem IN 
(SELECT id_dich_vu_di_kem FROM (
			SELECT D.id_dich_vu_di_kem 
			FROM dich_vu_di_kem D JOIN hop_dong_chi_tiet H on H.id_dich_vu_di_kem = D.id_dich_vu_di_kem
			JOIN  hop_dong  on H.id_hop_dong = hop_dong.id_hop_dong
			Where year(hop_dong.ngay_lam_hop_dong)=2019
			GROUP BY D.id_dich_vu_di_kem
			Having count(D.id_dich_vu_di_kem)>10)AS  X );
            
/* Task 20.	Hi???n th??? th??ng tin c???a t???t c??? c??c Nh??n vi??n v?? 
Kh??ch h??ng c?? trong h??? th???ng, th??ng tin hi???n th??? bao g???m ID 
(IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi. */
-- c??ch 1:
CREATE VIEW person_view AS
SELECT id_nhan_vien,ho_va_ten,email,so_dien_thoai,ngay_sinh,dia_chi
FROM nhan_vien
UNION 
SELECT id_khach_hang,ho_va_ten,email,so_dien_thoai,ngay_sinh,dia_chi
FROM khach_hang;
SELECT*FROM person_view;
-- c??ch 2:
SELECT id_nhan_vien,ho_va_ten,email,so_dien_thoai,ngay_sinh,dia_chi
FROM nhan_vien
UNION ALL
SELECT id_khach_hang,ho_va_ten,email,so_dien_thoai,ngay_sinh,dia_chi
FROM khach_hang;

/* Task  21. T???o khung nh??n c?? t??n l?? V_NHANVIEN
 ????? l???y ???????c th??ng tin c???a t???t c??? c??c nh??n vi??n 
 c?? ?????a ch??? l?? ???H???i Ch??u??? v?? ???? t???ng l???p h???p ?????ng cho 1 
 ho???c nhi???u Kh??ch h??ng b???t k???  v???i ng??y l???p h???p ?????ng l?? ???12/12/2019??? */
DROP VIEW IF EXISTS V_NHANVIEN;
CREATE VIEW V_NHANVIEN AS
SELECT V.id_nhan_vien,V.ho_va_ten,V.email,V.so_dien_thoai,V.ngay_sinh,V.dia_chi
FROM nhan_vien V JOIN hop_dong H ON V.id_nhan_vien= H.id_nhan_vien
WHERE V.dia_chi = "H???i Ch??u" AND H.ngay_lam_hop_dong = '2019-12-12'
;
SELECT*FROM V_NHANVIEN;
/* Task 22.	Th??ng qua khung nh??n V_NHANVIEN th???c hi???n c???p nh???t
 ?????a ch??? th??nh ???Li??n Chi???u??? ?????i v???i t???t c??? c??c Nh??n vi??n ???????c
 nh??n th???y b???i khung nh??n n??y.  */
 
 SET SQL_SAFE_UPDATES = 0;
UPDATE V_NHANVIEN 
SET V_NHANVIEN.dia_chi="Li??n Chi???u"
;
 SET SQL_SAFE_UPDATES = 1;

 /* Task 23:	T???o Store procedure Sp_1 D??ng ????? x??a th??ng tin 
 c???a m???t Kh??ch h??ng n??o ???? v???i Id Kh??ch h??ng ???????c truy???n 
 v??o nh?? l?? 1 tham s??? c???a Sp_1 */
 USE furama_resort;
 DROP PROCEDURE IF EXISTS Sp_1;
 DELIMITER $$
 CREATE PROCEDURE  Sp_1(
 IN in_id INT
 )
 BEGIN
 DELETE FROM khach_hang
 WHERE khach_hang.id_khach_hang=in_id;
 SELECT*FROM khach_hang;
 END $$
 DELIMITER ; 
 SELECT*FROM khach_hang;
 CALL Sp_1(5);

/* Task 24:	T???o Store procedure Sp_2 D??ng ????? th??m m???i 
v??o b???ng HopDong v???i y??u c???u Sp_2 ph???i th???c hi???n ki???m tra 
t??nh h???p l??? c???a d??? li???u b??? sung, v???i nguy??n t???c kh??ng ???????c
 tr??ng kh??a ch??nh v?? ?????m b???o to??n v???n tham chi???u ?????n c??c b???ng li??n quan.*/	
USE furama_resort;
 DROP PROCEDURE IF EXISTS Sp_2;
 
 DELIMITER $$
 CREATE PROCEDURE  Sp_2(
 IN id_nhan_vien INT ,
 IN id_khach_hang INT,
 IN id_dich_vu INT,
 IN ngay_lam_hop_dong DATE,
 IN ngay_ket_thuc DATE,
 IN tien_dat_coc INT,
 IN tong_tien INT
 )
 BEGIN
INSERT INTO  hop_dong(id_nhan_vien,id_khach_hang,id_dich_vu,
   ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,tong_tien)
   VALUES	(id_nhan_vien,id_khach_hang,id_dich_vu,
			ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,tong_tien);
 END $$
 DELIMITER ;
 CALL Sp_2 ( 9,5,7,'2021-09-27','2021-09-30',5000000,15000000);


 