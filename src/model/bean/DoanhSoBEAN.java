package model.bean;

public class DoanhSoBEAN {
	private long idPhim;
	private String tenPhim;
	private int doanhSo;
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
	public int getDoanhSo() {
		return doanhSo;
	}
	public void setDoanhSo(int doanhSo) {
		this.doanhSo = doanhSo;
	}
	public DoanhSoBEAN(long idPhim, String tenPhim, int doanhSo) {
		super();
		this.idPhim = idPhim;
		this.tenPhim = tenPhim;
		this.doanhSo = doanhSo;
	}
	public DoanhSoBEAN() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
