package model.bean;

public class EventBEAN {
	private long idSuKien;
	private String tenSuKien;
	private String moTa;
	private String anhSuKien;
	public long getIdSuKien() {
		return idSuKien;
	}
	public void setIdSuKien(long idSuKien) {
		this.idSuKien = idSuKien;
	}
	public String getTenSuKien() {
		return tenSuKien;
	}
	public void setTenSuKien(String tenSuKien) {
		this.tenSuKien = tenSuKien;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public String getAnhSuKien() {
		return anhSuKien;
	}
	public void setAnhSuKien(String anhSuKien) {
		this.anhSuKien = anhSuKien;
	}
	public EventBEAN(long idSuKien, String tenSuKien, String moTa, String anhSuKien) {
		super();
		this.idSuKien = idSuKien;
		this.tenSuKien = tenSuKien;
		this.moTa = moTa;
		this.anhSuKien = anhSuKien;
	}
	public EventBEAN() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
