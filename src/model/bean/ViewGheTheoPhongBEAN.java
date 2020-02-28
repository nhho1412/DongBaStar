package model.bean;

public class ViewGheTheoPhongBEAN {
	private long idPhong;
	private long idDayGhe;
	private long idGhe;
	private int gheSo;
	private long idLoaiGhe;
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
	public long getIdGhe() {
		return idGhe;
	}
	public void setIdGhe(long idGhe) {
		this.idGhe = idGhe;
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
	public ViewGheTheoPhongBEAN(long idPhong, long idDayGhe, long idGhe, int gheSo, long idLoaiGhe) {
		super();
		this.idPhong = idPhong;
		this.idDayGhe = idDayGhe;
		this.idGhe = idGhe;
		this.gheSo = gheSo;
		this.idLoaiGhe = idLoaiGhe;
	}
	public ViewGheTheoPhongBEAN() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
