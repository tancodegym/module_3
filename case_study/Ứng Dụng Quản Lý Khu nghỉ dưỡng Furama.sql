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
        REFERENCES vi_tri (id_vi_tri) on update cascade on delete cascade,
    FOREIGN KEY (id_trinh_do)
        REFERENCES trinh_do (id_trinh_do) on update cascade on delete cascade,
    FOREIGN KEY (id_bo_phan)
        REFERENCES bo_phan (id_bo_phan) on update cascade on delete cascade
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
        REFERENCES loai_khach (id_loai_khach)on update cascade on delete cascade
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
        REFERENCES kieu_thue (id_kieu_thue) on update cascade on delete cascade,
    FOREIGN KEY (id_loai_dich_vu)
        REFERENCES loai_dich_vu (id_loai_dich_vu) on update cascade on delete cascade
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
        REFERENCES nhan_vien (id_nhan_vien) on update cascade on delete cascade,
    FOREIGN KEY (id_khach_hang)
        REFERENCES khach_hang (id_khach_hang) on update cascade on delete cascade,
    FOREIGN KEY (id_dich_vu)
        REFERENCES dich_vu (id_dich_vu) on update cascade on delete cascade
);

CREATE TABLE hop_dong_chi_tiet (
    id_hop_dong_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
    so_luong INT,
    id_hop_dong INT,
    id_dich_vu_di_kem INT,
    FOREIGN KEY (id_hop_dong)
        REFERENCES hop_dong (id_hop_dong) on update cascade on delete cascade,
    FOREIGN KEY (id_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (id_dich_vu_di_kem) on update cascade on delete cascade
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
        12000000,'0912555444','minh.tran@gmail.com','ho chi minh');
      
   
        INSERT INTO khach_hang(id_loai_khach,
        ho_va_ten,ngay_sinh,so_CMND,so_dien_thoai,email,dia_chi)
        VALUES(1,'Tran Van Hanh','2000-12-31','200101333','0123455552','van.hanh@gmail.com','Quảng Trị'),
        (1,'Tran Van Kien','2000-07-02','211101333','0333455552','kien.tran@gmail.com','Đà Nẵng'),
        (2,'Trinh Dung','1970-5-31','120101333','0123455111','dung.trinh@gmail.com','Đà Nẵng'),
        (3,'Nguyen Van Binh','1980-6-30','150101333','0123225111','binh.nguyen@gmail.com','Hà Nội'),
        (4,'Ha Thu Thuy','1985-7-22','160101333','0123455911','thuy.ha@gmail.com','Sài Gòn');
 INSERT INTO dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai_kha_dung)
 VALUES( 'massage',5000000,1,'Đang sử dụng'),
		( 'karaoke',2000000,1,'Đang sử dụng'),
        ( 'thức ăn',500000,1,'Đang sử dụng'),
        ( 'nước uống',100000,1,'Đang sử dụng'),
        ( 'tham quan',1000000,1,'Đang sử dụng');
	
 INSERT INTO dich_vu(ten_dich_vu,dien_tich,so_tang,so_nguoi_toi_da,chi_phi_thue,id_kieu_thue,id_loai_dich_vu,trang_thai)
 VALUES('thue_villa',500,3,20,5000000,1,1,'dang su dung'),
		('thue_villa',500,3,20,1000000,2,1,'dang su dung'),
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
   VALUES	(1,2,1,'2021-01-24','2021-10-25',5000000,5000000),
			(2,1,3,'2018-02-24','2021-10-25',2000000,5000000),
			(3,3,1,'2019-03-24','2021-10-25',1000000,1000000),
			(2,1,2,'2021-04-24','2021-10-25',2000000,5000000),
			(2,1,1,'2021-05-24','2021-10-25',2000000,5000000);
	

   INSERT INTO hop_dong_chi_tiet(so_luong,id_hop_dong,id_dich_vu_di_kem)
   VALUES (1,1,1),
   (1,2,2),
   (1,3,3),
   (1,1,4),
   (1,2,5);
  
-- TASK 2:	Hiển thị thông tin của tất cả 
-- 			nhân viên có trong hệ thống có tên bắt đầu 
-- 			là một trong các ký tự “H”, “T” hoặc “K” và
--  		có tối đa 15 ký tự.
	USE furama_resort;
	SELECT*FROM nhan_vien
    WHERE  char_length(ho_va_ten)<=15 AND  
    ((SELECT substring_index(ho_va_ten,' ',-1)) REGEXP '^T|K|H')
    ;
-- Task 3.	Hiển thị thông tin của tất cả khách hàng 
-- 			có độ tuổi từ 18 đến 50 tuổi và có địa chỉ
-- 			ở “Đà Nẵng” hoặc “Quảng Trị”.
-- hàm trả về tuổi từ ngày sinh :  (YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))
	USE furama_resort;
	SELECT*FROM khach_hang
    WHERE  (YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))>=18 
    AND (YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))<=50 
    AND ((dia_chi LIKE 'Quảng Trị') OR (dia_chi LIKE 'Đà Nẵng'));

 -- Task 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
--  		Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- 		    Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
USE furama_resort;
SELECT*FROM hop_dong;
SELECT*FROM khach_hang;
SELECT K.ho_va_ten,count(H.id_khach_hang) AS so_lan_dat_phong,L.ten_loai_khach
FROM khach_hang K JOIN hop_dong H ON K.id_khach_hang = H.id_khach_hang
	JOIN loai_khach L ON L.id_loai_khach=K.id_loai_khach
GROUP BY H.id_khach_hang
HAVING L.ten_loai_khach ="Diamond"
ORDER BY so_lan_dat_phong;
/*  Task 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong,
			TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien
 		   (Với TongTien được tính theo công thức như sau:
			ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) 
			cho tất cả các Khách hàng đã từng đặt phỏng.
			(Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra). */
            SELECT*FROM hop_dong;
SELECT K.id_khach_hang,K.ho_va_ten,L.ten_loai_khach,H.id_hop_dong,D.ten_dich_vu,
		H.ngay_lam_hop_dong,H.ngay_ket_thuc,sum(D.chi_phi_thue+(C.so_luong*V.gia)) AS tong_tien
FROM khach_hang K LEFT JOIN hop_dong H ON K.id_khach_hang=H.id_khach_hang
	LEFT JOIN loai_khach L ON K.id_loai_khach= L.id_loai_khach
   LEFT  JOIN dich_vu D ON D.id_dich_vu = H.id_dich_vu
  LEFT  JOIN hop_dong_chi_tiet C ON C.id_hop_dong=H.id_hop_dong
  LEFT  JOIN dich_vu_di_kem V ON V.id_dich_vu_di_kem = C.id_dich_vu_di_kem
    GROUP BY K.id_khach_hang;
 /* Task 6.Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu 
	của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt 
	từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3). */	
SELECT D.id_dich_vu, D.ten_dich_vu, D.dien_tich, D.chi_phi_thue,L.ten_loai_dich_vu,H.ngay_lam_hop_dong
FROM dich_vu D LEFT JOIN loai_dich_vu L ON L.id_loai_dich_vu = D.id_loai_dich_vu
LEFT JOIN hop_dong H ON H.id_dich_vu=D.id_dich_vu
WHERE NOT (month(H.ngay_lam_hop_dong)=1 OR month(H.ngay_lam_hop_dong)=2
 OR month(H.ngay_lam_hop_dong)=3);
/* Task 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, 
ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ đã từng được 
Khách hàng đặt phòng trong năm 2018 nhưng chưa từng 
được Khách hàng đặt phòng  trong năm 2019.
 */
 SELECT D.id_dich_vu, D.ten_dich_vu, D.dien_tich,D.so_nguoi_toi_da,
 D.chi_phi_thue,L.ten_loai_dich_vu,H.ngay_lam_hop_dong
FROM dich_vu D LEFT JOIN loai_dich_vu L ON L.id_loai_dich_vu = D.id_loai_dich_vu
LEFT JOIN hop_dong H ON H.id_dich_vu=D.id_dich_vu
WHERE ( NOT (year(H.ngay_lam_hop_dong)=2019) ) AND year(H.ngay_lam_hop_dong)=2018;
/* 
8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống,
 với yêu cầu HoThenKhachHang không trùng nhau.
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
*/
-- Cách 1:
SELECT*FROM khach_hang;
