package model.bean;

public class ChiTietThanhToanBEAN {
	private long idHoaDon;
	private String tenDay;
	private int gheSo;
	private long idLoaiGhe;
	private String tenLoaiGhe;
	private long gia;
	public long getIdHoaDon() {
		return idHoaDon;
	}
	public void setIdHoaDon(long idHoaDon) {
		this.idHoaDon = idHoaDon;
	}
	public String getTenDay() {
		return tenDay;
	}
	public void setTenDay(String tenDay) {
		this.tenDay = tenDay;
	}
	public int getGheSo() {
		return gheSo;
	}
	public void setGheSo(int gheSo) {
		this.gheSo = gheSo;
	}
	public long getIdLoaiGhe() {
		return idLoaiGhe;
	}
	public void setIdLoaiGhe(long idLoaiGhe) {
		this.idLoaiGhe = idLoaiGhe;
	}
	public String getTenLoaiGhe() {
		return tenLoaiGhe;
	}
	public void setTenLoaiGhe(String tenLoaiGhe) {
		this.tenLoaiGhe = tenLoaiGhe;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public ChiTietThanhToanBEAN(long idHoaDon, String tenDay, int gheSo, long idLoaiGhe, String tenLoaiGhe, long gia) {
		super();
		this.idHoaDon = idHoaDon;
		this.tenDay = tenDay;
		this.gheSo = gheSo;
		this.idLoaiGhe = idLoaiGhe;
		this.tenLoaiGhe = tenLoaiGhe;
		this.gia = gia;
	}
	public ChiTietThanhToanBEAN() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
