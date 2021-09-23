DROP DATABASE IF EXISTS quan_ly_vat_tu;
CREATE DATABASE IF NOT EXISTS quan_ly_vat_tu;
USE quan_ly_vat_tu;
CREATE TABLE nha_cung_cap (
    ma_nha_cung_cap INT NOT NULL PRIMARY KEY,
    ten_nha_cung_cap VARCHAR(50) NOT NULL,
    dia_chi VARCHAR(50),
    so_dien_thoai VARCHAR(10)
);
CREATE TABLE don_dat_hang (
    so_don_hang INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ngay_don_hang DATETIME,
    ma_nha_cung_cap INT NOT NULL,
    FOREIGN KEY (ma_nha_cung_cap) REFERENCES nha_cung_cap(ma_nha_cung_cap)
);
CREATE TABLE vat_tu (
    ma_vat_tu INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ten_vat_tu VARCHAR(25)
);
CREATE TABLE chi_tiet_don_dat_hang (
    so_don_hang INT NOT NULL,
    ma_vat_tu INT NOT NULL,
    PRIMARY KEY(so_don_hang,ma_vat_tu),
    FOREIGN KEY (so_don_hang)
        REFERENCES don_dat_hang (so_don_hang),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);
CREATE TABLE phieu_xuat (
    so_phieu_xuat INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ngay_xuat DATETIME
);
CREATE TABLE chi_tiet_phieu_xuat (
    don_gia_xuat INT,
    so_luong_xuat INT,
    so_phieu_xuat  INT NOT NULL,
    ma_vat_tu INT NOT NULL,
    PRIMARY KEY(so_phieu_xuat,ma_vat_tu),
    FOREIGN KEY (so_phieu_xuat)
        REFERENCES phieu_xuat (so_phieu_xuat),
      FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
		
);
CREATE TABLE phieu_nhap (
    so_phieu_nhap INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ngay_nhap DATETIME
   
);
CREATE TABLE chi_tiet_phieu_nhap(
 don_gia_nhap INT,
    so_luong_nhap INT,
    ma_vat_tu INT NOT NULL,
    so_phieu_nhap INT NOT NULL,
    PRIMARY KEY (ma_vat_tu,so_phieu_nhap),
    FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu(ma_vat_tu),
    FOREIGN KEY (so_phieu_nhap) REFERENCES phieu_nhap(so_phieu_nhap)
);
 
 
 

