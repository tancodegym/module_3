USE furama_resort;
/* Task 25. Tạo triggers có tên Tr_1 Xóa bản ghi trong bảng HopDong 
thì hiển thị tổng số lượng bản ghi còn lại có trong bảng HopDong ra giao diện console của database */
-- DROP TRIGGER Tr_1;
DELIMITER //
	CREATE TRIGGER Tr_1 AFTER DELETE  ON hop_dong
	FOR EACH ROW
 BEGIN
		SET @a = (SELECT count(id_hop_dong) 
				FROM hop_dong);
END //
DELIMITER ;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM hop_dong
WHERE id_hop_dong=30;
SET SQL_SAFE_UPDATES = 1;
SELECT @a;


/* Task 26.Tạo triggers có tên Tr_2 Khi cập nhật Ngày kết thúc hợp đồng,
 cần kiểm tra xem thời gian cập nhật có phù hợp hay không, với quy tắc sau: 
 Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. 
 Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì 
 in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng 
 ít nhất là 2 ngày” trên console của database */
 
 -- DROP TRIGGER TR_2;
DELIMITER //
CREATE TRIGGER Tr_2 BEFORE UPDATE ON hop_dong FOR EACH ROW
BEGIN
DECLARE allert VARCHAR(100);
SET allert = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày !!';
IF (datediff(new.ngay_ket_thuc, old.ngay_lam_hop_dong)) < 2
THEN 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = allert;
END IF;
END //
DELIMITER ;

UPDATE hop_dong 
SET  ngay_ket_thuc = '2021-01-25'
WHERE  id_hop_dong = 1;

-- SELECT id_hop_dong, ngay_ket_thuc
-- FROM hop_dong
-- WHERE id_hop_dong =1;
/* Task 27a.Tạo user function func_1: Đếm các dịch vụ đã được sử dụng với Tổng tiền là > 2.000.000 VNĐ. */

Create view dem_dich_vu
AS
SELECT H.id_dich_vu,sum(chi_phi_thue) 
FROM dich_vu D join hop_dong H on H.id_dich_vu = D.id_dich_vu
Group by H.id_dich_vu
Having sum(chi_phi_thue)>2000000;
SELECT*FROM dem_dich_vu;

DELIMITER //
CREATE PROCEDURE func_1()
BEGIN
 SELECT count(id_dich_vu) as tong_so_dich_vu
 FROM dem_dich_vu;
END //
DELIMITER ;

Call func_1();
 
/* Task 27b.Tạo user function Func_2: Tính khoảng thời gian dài nhất
 tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng mà 
 Khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng 
 thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ,
 không xét trên toàn bộ các lần làm hợp đồng). Mã của Khách hàng
 được truyền vào như là 1 tham số của function này.*/


CREATE or Replace VIEW so_ngay_thue AS
SELECT id_hop_dong,id_khach_hang,ngay_lam_hop_dong,ngay_ket_thuc,
datediff(ngay_ket_thuc, ngay_lam_hop_dong) AS so_ngay_dat_phong
FROM hop_dong;
SELECT*FROM so_ngay_thue;

DELIMITER //
CREATE PROCEDURE func_2( IN ma_khach_hang INT, OUT so_lan INT)
BEGIN
SELECT*FROM so_ngay_thue
WHERE id_khach_hang = ma_khach_hang;
SET so_lan = (	SELECT max(so_ngay_dat_phong)
				FROM so_ngay_thue
				WHERE id_khach_hang = ma_khach_hang );
END //
DELIMITER ;

SET @id_khach_hang= 1;
CALl func_2(1,@so_lan);
SELECT @so_lan;
/* Task 28. Tạo Store procedure Sp_3 để tìm các dịch vụ 
được thuê bởi khách hàng với loại dịch vụ là “Room” từ đầu năm 2015
 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng DichVu)
 và xóa những HopDong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng HopDong)
 và những bản liên quan khác. */
 
-- TẠO VIEW CHỨA NHỮNG id_hop_dong và id_dich_vu theo yêu cầu của đề để xóa
USE furama_resort;
	CREATE OR REPLACE VIEW  delete_row AS
	SELECT id_hop_dong, D.id_dich_vu
	FROM dich_vu D  JOIN hop_dong H on D.id_dich_vu = H.id_dich_vu
					JOIN loai_dich_vu L on L.id_loai_dich_vu = D.id_loai_dich_vu
	WHERE L.ten_loai_dich_vu = "Room" and year(ngay_lam_hop_dong) between 2015 and 2019;

 DELIMITER //
 CREATE PROCEDURE sp_3()
 BEGIN
 -- TẠO BẢNG COPY DATA TỪ VIEW QUA 
 DROP table if exists delete_by_id;
 Create table if not exists delete_by_id(
 id_hop_dong INT PRIMARY KEY,
 id_dich_vu INT );
 INSERT INTO delete_by_id
 SELECT* FROM delete_row;
 DELETE FROM hop_dong
 WHERE id_hop_dong in ( SELECT id_hop_dong FROM delete_by_id);
 DELETE FROM dich_vu
 WHERE id_dich_vu in ( SELECT id_dich_vu FROM delete_by_id);
 DROP table delete_by_id;
 END //
 DELIMITER ;
 
 SELECT*FROM delete_row;
 Call sp_3();
 SELECT*FROM delete_row;

 
 
