package model.bean;

import java.sql.Time;
import java.util.Date;

public class SuatBEAN {
	private long idSuat;
	private long idPhim;
	private long idPhong;
	private Date ngayChieu;
	private Time gioChieu;
	public long getIdSuat() {
		return idSuat;
	}
	public void setIdSuat(long idSuat) {
		this.idSuat = idSuat;
	}
	public long getIdPhim() {
		return idPhim;
	}
	public void setIdPhim(long idPhim) {
		this.idPhim = idPhim;
	}
	public long getIdPhong() {
		return idPhong;
	}
	public void setIdPhong(long idPhong) {
		this.idPhong = idPhong;
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
	public SuatBEAN(long idSuat, long idPhim, long idPhong, Date ngayChieu, Time gioChieu) {
		super();
		this.idSuat = idSuat;
		this.idPhim = idPhim;
		this.idPhong = idPhong;
		this.ngayChieu = ngayChieu;
		this.gioChieu = gioChieu;
	}
	public SuatBEAN() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
