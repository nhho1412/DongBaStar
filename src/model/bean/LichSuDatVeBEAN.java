package model.bean;

import java.sql.Time;
import java.util.Date;

public class LichSuDatVeBEAN {
	private long idHoaDon;
	private Time gioDatVe;
	private int soLuong;
	private long idLoaiGhe;
	private long gia;
	private String tenPhim;
	private float tongTien;
	private long idTaiKhoan;
	private long giaDuocGiam;
	private String maGiamGia;
	private Date ngayDatVe;
	
	public Date getNgayDatVe() {
		return ngayDatVe;
	}
	public void setNgayDatVe(Date ngayDatVe) {
		this.ngayDatVe = ngayDatVe;
	}
	public long getIdHoaDon() {
		return idHoaDon;
	}
	public void setIdHoaDon(long idHoaDon) {
		this.idHoaDon = idHoaDon;
	}
	public Time getGioDatVe() {
		return gioDatVe;
	}
	public void setGioDatVe(Time gioDatVe) {
		this.gioDatVe = gioDatVe;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public long getIdLoaiGhe() {
		return idLoaiGhe;
	}
	public void setIdLoaiGhe(long idLoaiGhe) {
		this.idLoaiGhe = idLoaiGhe;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public String getTenPhim() {
		return tenPhim;
	}
	public void setTenPhim(String tenPhim) {
		this.tenPhim = tenPhim;
	}
	public float getTongTien() {
		return tongTien;
	}
	public void setTongTien(float tongTien) {
		this.tongTien = tongTien;
	}
	public long getIdTaiKhoan() {
		return idTaiKhoan;
	}
	public void setIdTaiKhoan(long idTaiKhoan) {
		this.idTaiKhoan = idTaiKhoan;
	}
	public long getGiaDuocGiam() {
		return giaDuocGiam;
	}
	public void setGiaDuocGiam(long giaDuocGiam) {
		this.giaDuocGiam = giaDuocGiam;
	}
	public String getMaGiamGia() {
		return maGiamGia;
	}
	public void setMaGiamGia(String maGiamGia) {
		this.maGiamGia = maGiamGia;
	}
	public LichSuDatVeBEAN(long idHoaDon, Time gioDatVe, int soLuong, long idLoaiGhe, long gia, String tenPhim,
			float tongTien, long idTaiKhoan, long giaDuocGiam, String maGiamGia, Date ngayDatVe) {
		super();
		this.idHoaDon = idHoaDon;
		this.gioDatVe = gioDatVe;
		this.soLuong = soLuong;
		this.idLoaiGhe = idLoaiGhe;
		this.gia = gia;
		this.tenPhim = tenPhim;
		this.tongTien = tongTien;
		this.idTaiKhoan = idTaiKhoan;
		this.giaDuocGiam = giaDuocGiam;
		this.maGiamGia = maGiamGia;
		this.ngayDatVe = ngayDatVe;
	}
	public LichSuDatVeBEAN() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
