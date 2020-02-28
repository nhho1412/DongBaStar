package model.bo;

import java.util.ArrayList;

import model.bean.AccountBEAN;
import model.bean.InfoAccountBEAN;
import model.dao.AccountDAO;

public class AccountBO {
	AccountDAO ac = new AccountDAO();
	public void updateloaiTaiKhoan(long idTaiKhoan, long idLoaiTaiKhoan)throws Exception{
		ac.updateloaiTaiKhoan(idTaiKhoan, idLoaiTaiKhoan);
	}
	public int getDiemTichLuy(long idTaiKhoan)throws Exception{
		return ac.getDiemTichLuy(idTaiKhoan);
	}
	public void updateDiemTichLuy(long idTaiKhoan, int diemTichLuy)throws Exception {
		ac.updateDiemTichLuy(idTaiKhoan, diemTichLuy);
	}
	public boolean changePass(String taiKhoan, String passOld, String passNew)throws Exception {
		return ac.changePass(taiKhoan, passOld, passNew);
	}
	public int insertUser(String taiKhoan, String matKhau, String hoTen, String soDienThoai, String diaChi, String email) throws Exception{
		for(AccountBEAN temp : getAccount()) {
			if(temp.getTaiKhoan().toLowerCase().equals(taiKhoan.toLowerCase()))
				return 0; // trung tai khoan
			if(temp.getEmail().toLowerCase().equals(email.toLowerCase()))
				return 1; // trung email
			if(temp.getSoDienThoai().toLowerCase().equals(soDienThoai.toLowerCase()))
				return 3; // trung email
		}
		ac.insertUser(taiKhoan, matKhau, hoTen, soDienThoai, diaChi, email);
		return 2;
	}
	public InfoAccountBEAN checkLoginUser(String taiKhoan, String matKhau) throws Exception {
		return ac.checkLoginUser(taiKhoan, matKhau);
	}
	
	// Kiem tra dang nhap admin
	public AccountBEAN checkLoginAdmin(String taiKhoan, String matKhau) throws Exception {
		return ac.checkLoginAdmin(taiKhoan, matKhau);
	}

	// LÃ¡ÂºÂ¥y danh sÃƒÂ¡ch admin
	public ArrayList<AccountBEAN> getAccountAdmin() throws Exception {
		return ac.getAccountAdmin();
	}

	// LÃ¡ÂºÂ¥y danh sÃƒÂ¡ch tÃ¡ÂºÂ¥t cÃ¡ÂºÂ£ thÃƒÂ nh viÃƒÂªn
	public ArrayList<AccountBEAN> getAccount() throws Exception {
		return ac.getAccount();
	}

	// LÃ¡ÂºÂ¥y danh sÃƒÂ¡ch thÃƒÂ nh viÃƒÂªn VÃƒâ‚¬NG
	public ArrayList<AccountBEAN> getAccountVang(int startVang) throws Exception {
		return ac.getAccountVang(startVang);
	}

	// LÃ¡ÂºÂ¥y danh sÃƒÂ¡ch thÃƒÂ nh viÃƒÂªn BÃ¡ÂºÂ C
	public ArrayList<AccountBEAN> getAccountBac(int startBac) throws Exception {
		return ac.getAccountBac(startBac);
	}

	// LÃ¡ÂºÂ¥y danh sÃƒÂ¡ch thÃƒÂ nh viÃƒÂªn Ã„ï¿½Ã¡Â»â€™NG
	public ArrayList<AccountBEAN> getAccountDong(int startDong) throws Exception {
		return ac.getAccountDong(startDong);
	}

	public int updateInfoAdmin(long idTaiKhoan, long idLoaiTaiKhoan, String taiKhoan, String matKhau, String hoTen,
			String soDienThoai, String diaChi, String email, int diemTichLuy) throws Exception {
		return ac.updateInfoAdmin(idTaiKhoan, idLoaiTaiKhoan, taiKhoan, matKhau, hoTen, soDienThoai, diaChi, email,
				diemTichLuy);
	}
	// Sửa thông tin Admin
		public int updateInfoAccount(long idTaiKhoan, long idLoaiTaiKhoan, String taiKhoan, String matKhau, String hoTen,
				String soDienThoai, String diaChi, String email, int diemTichLuy) throws Exception {
			return ac.updateInfoAccount(idTaiKhoan, idLoaiTaiKhoan, taiKhoan, matKhau, hoTen, soDienThoai, diaChi, email,
					diemTichLuy);
		}

		// Xóa thành viên
		public void deleteAccount(long idTaiKhoan) throws Exception {
			ac.deleteAccount(idTaiKhoan);
		}

		public AccountBEAN getInfo(long idTaiKhoan) throws Exception {
			return ac.getInfo(idTaiKhoan);
		}
		
		//Dem so luong thanh vien Dong
		public int countAccountDong() throws Exception{
			return ac.countAccountDong();
		}
		
		// Dem so luong thanh vien Vang
		public int countAccountVang() throws Exception {
			return ac.countAccountVang();
		}
		
		// Dem so luong thanh vien Bac
		public int countAccountBac() throws Exception {
			return ac.countAccountBac();
		}
		//Dem so luong thanh vien
		public int countAccount() throws Exception{
			return ac.countAccount();
		}
		
	/*
	 * public AccountBEAN getInfo(long idTaiKhoan) throws Exception{ return
	 * ac.getInfo(idTaiKhoan); }
	 */
}
