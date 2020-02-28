package model.bean;

import java.util.Date;

public class DoanhThuBEAN {
	private long idPhim;
	private String tenPhim;
	private Date ngayCongChieu;
	private long doanhThu;
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
	public Date getNgayCongChieu() {
		return ngayCongChieu;
	}
	public void setNgayCongChieu(Date ngayCongChieu) {
		this.ngayCongChieu = ngayCongChieu;
	}
	public long getDoanhThu() {
		return doanhThu;
	}
	public void setDoanhThu(long doanhThu) {
		this.doanhThu = doanhThu;
	}
	public DoanhThuBEAN(long idPhim, String tenPhim, Date ngayCongChieu, long doanhThu) {
		super();
		this.idPhim = idPhim;
		this.tenPhim = tenPhim;
		this.ngayCongChieu = ngayCongChieu;
		this.doanhThu = doanhThu;
	}
	public DoanhThuBEAN() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
