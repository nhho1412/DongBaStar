package model.bean;

public class ViewGheDaDatBEAN {
	private long idVeGhe;
	private long idGhe;
	private long idHoaDon;
	private long idSuat;
	private String tenDay;
	private int gheSo;
	public long getIdVeGhe() {
		return idVeGhe;
	}
	public void setIdVeGhe(long idVeGhe) {
		this.idVeGhe = idVeGhe;
	}
	public long getIdGhe() {
		return idGhe;
	}
	public void setIdGhe(long idGhe) {
		this.idGhe = idGhe;
	}
	public long getIdHoaDon() {
		return idHoaDon;
	}
	public void setIdHoaDon(long idHoaDon) {
		this.idHoaDon = idHoaDon;
	}
	public long getIdSuat() {
		return idSuat;
	}
	public void setIdSuat(long idSuat) {
		this.idSuat = idSuat;
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
	public ViewGheDaDatBEAN(long idVeGhe, long idGhe, long idHoaDon, long idSuat, String tenDay) {
		super();
		this.idVeGhe = idVeGhe;
		this.idGhe = idGhe;
		this.idHoaDon = idHoaDon;
		this.idSuat = idSuat;
		this.tenDay = tenDay;
	}
	public ViewGheDaDatBEAN() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
