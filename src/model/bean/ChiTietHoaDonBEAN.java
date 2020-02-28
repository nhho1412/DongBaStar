package model.bean;

import java.sql.Time;
import java.util.Date;

public class ChiTietHoaDonBEAN {
	private long idHoaDon;
	private String tenPhim;
	private long idSuat;
	private Date ngayChieu;
	private Time gioChieu;
	private float tongTien;
	private String tenPhong;
	private String maGiamGia;
	
	public String getMaGiamGia() {
		return maGiamGia;
	}
	public void setMaGiamGia(String maGiamGia) {
		this.maGiamGia = maGiamGia;
	}
	public long getIdHoaDon() {
		return idHoaDon;
	}
	public void setIdHoaDon(long idHoaDon) {
		this.idHoaDon = idHoaDon;
	}
	public String getTenPhim() {
		return tenPhim;
	}
	public void setTenPhim(String tenPhim) {
		this.tenPhim = tenPhim;
	}
	public long getIdSuat() {
		return idSuat;
	}
	public void setIdSuat(long idSuat) {
		this.idSuat = idSuat;
	}
	public Date getNgayChieu() {
		return ngayChieu;
	}
	public void setNgayChieu(Date ngayChieu) {
		this.ngayChieu = ngayChieu;
	}
	public Time getGioChieu() {
		return gioChieu;
	}
	public void setGioChieu(Time gioChieu) {
		this.gioChieu = gioChieu;
	}
	public float getTongTien() {
		return tongTien;
	}
	public void setTongTien(float tongTien) {
		this.tongTien = tongTien;
	}
	public String getTenPhong() {
		return tenPhong;
	}
	public void setTenPhong(String tenPhong) {
		this.tenPhong = tenPhong;
	}
	public ChiTietHoaDonBEAN(long idHoaDon, String tenPhim, long idSuat, Date ngayChieu, Time gioChieu, float tongTien,
			String tenPhong, String maGiamGia) {
		super();
		this.idHoaDon = idHoaDon;
		this.tenPhim = tenPhim;
		this.idSuat = idSuat;
		this.ngayChieu = ngayChieu;
		this.gioChieu = gioChieu;
		this.tongTien = tongTien;
		this.tenPhong = tenPhong;
		this.maGiamGia = maGiamGia;
	}
	public ChiTietHoaDonBEAN() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
