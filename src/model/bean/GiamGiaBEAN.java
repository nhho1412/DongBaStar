package model.bean;

import java.util.Date;

public class GiamGiaBEAN {
	private String idKhuyenMai;
	private long idLoaiKhuyenMai;
	private String moTaNgan;
	private String tenGianGia;
	private float chietKhau;
	private Date ngayBatDau;
	private Date ngayKetThuc;
	public String getIdKhuyenMai() {
		return idKhuyenMai;
	}
	public void setIdKhuyenMai(String idKhuyenMai) {
		this.idKhuyenMai = idKhuyenMai;
	}
	public long getIdLoaiKhuyenMai() {
		return idLoaiKhuyenMai;
	}
	public void setIdLoaiKhuyenMai(long idLoaiKhuyenMai) {
		this.idLoaiKhuyenMai = idLoaiKhuyenMai;
	}
	public String getMoTaNgan() {
		return moTaNgan;
	}
	public void setMoTaNgan(String moTaNgan) {
		this.moTaNgan = moTaNgan;
	}
	public String getTenGianGia() {
		return tenGianGia;
	}
	public void setTenGianGia(String tenGianGia) {
		this.tenGianGia = tenGianGia;
	}
	public float getChietKhau() {
		return chietKhau;
	}
	public void setChietKhau(float chietKhau) {
		this.chietKhau = chietKhau;
	}
	public Date getNgayBatDau() {
		return ngayBatDau;
	}
	public void setNgayBatDau(Date ngayBatDau) {
		this.ngayBatDau = ngayBatDau;
	}
	public Date getNgayKetThuc() {
		return ngayKetThuc;
	}
	public void setNgayKetThuc(Date ngayKetThuc) {
		this.ngayKetThuc = ngayKetThuc;
	}
	public GiamGiaBEAN(String idKhuyenMai, long idLoaiKhuyenMai, String moTaNgan, String tenGianGia, float chietKhau,
			Date ngayBatDau, Date ngayKetThuc) {
		super();
		this.idKhuyenMai = idKhuyenMai;
		this.idLoaiKhuyenMai = idLoaiKhuyenMai;
		this.moTaNgan = moTaNgan;
		this.tenGianGia = tenGianGia;
		this.chietKhau = chietKhau;
		this.ngayBatDau = ngayBatDau;
		this.ngayKetThuc = ngayKetThuc;
	}
	public GiamGiaBEAN() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}

//select * from KHUYENMAI where GETDATE()>=NGAYBATDAU AND GETDATE()<=NGAYKETTHUC AND ID_KHUYENMAI = 'HAPPY2'