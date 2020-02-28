package model.bean;

public class ViewDayTheoPhongBEAN {
	private long idPhong;
	private long idDayGhe;
	private String tenDay;
	public long getIdPhong() {
		return idPhong;
	}
	public void setIdPhong(long idPhong) {
		this.idPhong = idPhong;
	}
	public long getIdDayGhe() {
		return idDayGhe;
	}
	public void setIdDayGhe(long idDayGhe) {
		this.idDayGhe = idDayGhe;
	}
	public String getTenDay() {
		return tenDay;
	}
	public void setTenDay(String tenDay) {
		this.tenDay = tenDay;
	}
	public ViewDayTheoPhongBEAN() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ViewDayTheoPhongBEAN(long idPhong, long idDayGhe, String tenDay) {
		super();
		this.idPhong = idPhong;
		this.idDayGhe = idDayGhe;
		this.tenDay = tenDay;
	}
	
}
