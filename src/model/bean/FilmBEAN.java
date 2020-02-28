package model.bean;

import java.util.Date;

public class FilmBEAN {
	private long idPhim;
	private String tenPhim;
	private String thoiLuong;
	private String moTaNgan;
	private String daoDien;
	private String dienVien;
	private String hinhAnh1;
	private String hinhAnh2;
	private String hinhAnh3;
	private String hinhAnh4;
	private String video;
	private String theLoai;
	private Date ngayCongChieu;
	private int gioiHanTuoi;
	private String dinhDangPhim;
	public long getIdPhim() {
		return idPhim;
	}
	public void setIdPhim(long idPhim) {
		this.idPhim = idPhim;
	}
	public String getTenPhim() {
		return tenPhim;
	}
	public void setTenPhim(String tenPhim) {
		this.tenPhim = tenPhim;
	}
	public String getThoiLuong() {
		return thoiLuong;
	}
	public void setThoiLuong(String thoiLuong) {
		this.thoiLuong = thoiLuong;
	}
	public String getMoTaNgan() {
		return moTaNgan;
	}
	public void setMoTaNgan(String moTaNgan) {
		this.moTaNgan = moTaNgan;
	}
	public String getDaoDien() {
		return daoDien;
	}
	public void setDaoDien(String daoDien) {
		this.daoDien = daoDien;
	}
	public String getDienVien() {
		return dienVien;
	}
	public void setDienVien(String dienVien) {
		this.dienVien = dienVien;
	}
	public String getHinhAnh1() {
		return hinhAnh1;
	}
	public void setHinhAnh1(String hinhAnh1) {
		this.hinhAnh1 = hinhAnh1;
	}
	public String getHinhAnh2() {
		return hinhAnh2;
	}
	public void setHinhAnh2(String hinhAnh2) {
		this.hinhAnh2 = hinhAnh2;
	}
	public String getHinhAnh3() {
		return hinhAnh3;
	}
	public void setHinhAnh3(String hinhAnh3) {
		this.hinhAnh3 = hinhAnh3;
	}
	public String getHinhAnh4() {
		return hinhAnh4;
	}
	public void setHinhAnh4(String hinhAnh4) {
		this.hinhAnh4 = hinhAnh4;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getTheLoai() {
		return theLoai;
	}
	public void setTheLoai(String theLoai) {
		this.theLoai = theLoai;
	}
	public Date getNgayCongChieu() {
		return ngayCongChieu;
	}
	public void setNgayCongChieu(Date ngayCongChieu) {
		this.ngayCongChieu = ngayCongChieu;
	}
	public int getGioiHanTuoi() {
		return gioiHanTuoi;
	}
	public void setGioiHanTuoi(int gioiHanTuoi) {
		this.gioiHanTuoi = gioiHanTuoi;
	}
	public String getDinhDangPhim() {
		return dinhDangPhim;
	}
	public void setDinhDangPhim(String dinhDangPhim) {
		this.dinhDangPhim = dinhDangPhim;
	}
	public FilmBEAN(long idPhim, String tenPhim, String thoiLuong, String moTaNgan, String daoDien, String dienVien,
			String hinhAnh1, String hinhAnh2, String hinhAnh3, String hinhAnh4, String video, String theLoai,
			Date ngayCongChieu, int gioiHanTuoi, String dinhDangPhim) {
		super();
		this.idPhim = idPhim;
		this.tenPhim = tenPhim;
		this.thoiLuong = thoiLuong;
		this.moTaNgan = moTaNgan;
		this.daoDien = daoDien;
		this.dienVien = dienVien;
		this.hinhAnh1 = hinhAnh1;
		this.hinhAnh2 = hinhAnh2;
		this.hinhAnh3 = hinhAnh3;
		this.hinhAnh4 = hinhAnh4;
		this.video = video;
		this.theLoai = theLoai;
		this.ngayCongChieu = ngayCongChieu;
		this.gioiHanTuoi = gioiHanTuoi;
		this.dinhDangPhim = dinhDangPhim;
	}
	public FilmBEAN() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
