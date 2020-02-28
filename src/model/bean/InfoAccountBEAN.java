package model.bean;

public class InfoAccountBEAN {
	private long idTaiKhoan;
	private long idLoaiTaiKhoan;
	private String taiKhoan;
	private String matKhau;
	private String hoTen;
	private String soDienThoai;
	private String diaChi;
	private String email;
	private int diemTichLuy;
	private String tenLoaiTaiKhoan;
	public long getIdTaiKhoan() {
		return idTaiKhoan;
	}
	public void setIdTaiKhoan(long idTaiKhoan) {
		this.idTaiKhoan = idTaiKhoan;
	}
	public long getIdLoaiTaiKhoan() {
		return idLoaiTaiKhoan;
	}
	public void setIdLoaiTaiKhoan(long idLoaiTaiKhoan) {
		this.idLoaiTaiKhoan = idLoaiTaiKhoan;
	}
	public String getTaiKhoan() {
		return taiKhoan;
	}
	public void setTaiKhoan(String taiKhoan) {
		this.taiKhoan = taiKhoan;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public String getSoDienThoai() {
		return soDienThoai;
	}
	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getDiemTichLuy() {
		return diemTichLuy;
	}
	public void setDiemTichLuy(int diemTichLuy) {
		this.diemTichLuy = diemTichLuy;
	}
	public String getTenLoaiTaiKhoan() {
		return tenLoaiTaiKhoan;
	}
	public void setTenLoaiTaiKhoan(String tenLoaiTaiKhoan) {
		this.tenLoaiTaiKhoan = tenLoaiTaiKhoan;
	}
	public InfoAccountBEAN(long idTaiKhoan, long idLoaiTaiKhoan, String taiKhoan, String matKhau, String hoTen,
			String soDienThoai, String diaChi, String email, int diemTichLuy, String tenLoaiTaiKhoan) {
		super();
		this.idTaiKhoan = idTaiKhoan;
		this.idLoaiTaiKhoan = idLoaiTaiKhoan;
		this.taiKhoan = taiKhoan;
		this.matKhau = matKhau;
		this.hoTen = hoTen;
		this.soDienThoai = soDienThoai;
		this.diaChi = diaChi;
		this.email = email;
		this.diemTichLuy = diemTichLuy;
		this.tenLoaiTaiKhoan = tenLoaiTaiKhoan;
	}
	public InfoAccountBEAN() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
