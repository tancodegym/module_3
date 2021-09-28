USE furama_resort;
/* Task 25. Tạo triggers có tên Tr_1 Xóa bản ghi trong bảng HopDong 
thì hiển thị tổng số lượng bản ghi còn lại có trong bảng HopDong ra giao diện console của database */

 CREATE TABLE tong_so_ban_ghi(
 total INT );
 
INSERT INTO tong_so_ban_ghi(total)
SELECT count(id_hop_dong) 
FROM hop_dong
;
-- DROP TRIGGER Tr_1;
DELIMITER //
 CREATE TRIGGER Tr_1 
 AFTER DELETE 
 ON hop_dong
 FOR EACH ROW
 BEGIN
UPDATE tong_so_ban_ghi
Set total = (SELECT count(id_hop_dong) 
FROM hop_dong);
END //
DELIMITER ;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM hop_dong
WHERE id_hop_dong=33;
SET SQL_SAFE_UPDATES = 1;

SELECT*FROM tong_so_ban_ghi;

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
DECLARE allert VARCHAR(255);
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

SELECT id_hop_dong, ngay_ket_thuc
FROM hop_dong
WHERE id_hop_dong =1;

/* Task 27a.Tạo user function func_1: Đếm các dịch vụ đã được sử dụng với Tổng tiền là > 2.000.000 VNĐ. */

