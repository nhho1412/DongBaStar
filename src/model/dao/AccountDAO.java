package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.bean.AccountBEAN;
import model.bean.InfoAccountBEAN;

public class AccountDAO {

	// update diemtichluy
	public void updateDiemTichLuy(long idTaiKhoan, int diemTichLuy) throws Exception {
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		String sql = "update TAIKHOAN set DIEMTICHLUY = DIEMTICHLUY + ? where ID_TAIKHOAN = ?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setInt(1, diemTichLuy);
		cmd.setLong(2, idTaiKhoan);
		cmd.executeUpdate();
		cs.dongketnoi();

	}
	public void updateloaiTaiKhoan(long idTaiKhoan, long idLoaiTaiKhoan)throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		String sql = "update TAIKHOAN set ID_LOAITAIKHOAN = ? where ID_TAIKHOAN = ?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, idLoaiTaiKhoan);
		cmd.setLong(2, idTaiKhoan);
		cmd.executeUpdate();
		cs.dongketnoi();
	}
	//getdiemtichluy
	public int getDiemTichLuy(long idTaiKhoan)throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		int temp = 0;
		String sql = "select DIEMTICHLUY from TAIKHOAN where ID_TAIKHOAN = ?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, idTaiKhoan);
		ResultSet rs = cmd.executeQuery();
		if(rs.next()) {
			temp = rs.getInt(1);
		}
		rs.close();
		cs.dongketnoi();
		return temp;
	}
	// doi pass
	public boolean changePass(String taiKhoan, String passOld, String passNew) throws Exception {
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		String sql = "update TAIKHOAN set MATKHAU = ? where MATKHAU = ? and TAIKHOAN = ?";
		try {
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, passNew);
			cmd.setString(2, passNew);
			cmd.setString(3, taiKhoan);
			cmd.executeUpdate();
			cs.dongketnoi();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}

	}

	// DB dang ky user
	public void insertUser(String taiKhoan, String matKhau, String hoTen, String soDienThoai, String diaChi,
			String email) throws Exception {
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		String sql = "insert into TAIKHOAN(ID_LOAITAIKHOAN, TAIKHOAN, MATKHAU, HOTEN, SODIENTHOAI,DIACHI, EMAIL, DIEMTICHLUY) values(4, ?, ?, ?, ?, ?, ?, 0 )";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setString(1, taiKhoan);
		cmd.setString(2, matKhau);
		cmd.setString(3, hoTen);
		cmd.setString(4, soDienThoai);
		cmd.setString(5, diaChi);
		cmd.setString(6, email);
		cmd.executeUpdate();
	}

	// DB Kiem tra dang nhap user
	public InfoAccountBEAN checkLoginUser(String taiKhoan, String matKhau) throws Exception {
		InfoAccountBEAN ac = new InfoAccountBEAN();
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		String sql = "select * from View_ThongTinTaiKhoan where TAIKHOAN=? and MATKHAU=? and ID_LOAITAIKHOAN!=1";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setString(1, taiKhoan);
		cmd.setString(2, matKhau);
		ResultSet rs = cmd.executeQuery();
		if (rs.next()) {
			ac.setIdTaiKhoan(rs.getLong(1));
			ac.setIdLoaiTaiKhoan(rs.getLong(2));
			ac.setTaiKhoan(rs.getString(3));
			ac.setMatKhau(rs.getString(4));
			ac.setHoTen(rs.getString(5));
			ac.setDiaChi(rs.getString(7));
			ac.setSoDienThoai(rs.getString(6));
			ac.setEmail(rs.getString(8));
			ac.setDiemTichLuy(rs.getInt(9));
			ac.setTenLoaiTaiKhoan(rs.getString(10));
		} else {
			ac = null;
		}
		rs.close();
		cs.dongketnoi();
		return ac;
	}

	// Kiem tra dang nhap admin
		public AccountBEAN checkLoginAdmin(String taiKhoan, String matKhau) throws Exception {
			AccountBEAN ac = new AccountBEAN();
			NguoiDungDAO cs = new NguoiDungDAO();
			cs.KetNoi();
			String sql = "select * from TAIKHOAN where TAIKHOAN=? and MATKHAU=? and ID_LOAITAIKHOAN=1";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, taiKhoan);
			cmd.setString(2, matKhau);
			ResultSet rs = cmd.executeQuery();
			if (rs.next()) {
				ac.setIdTaiKhoan(rs.getLong(1));
				ac.setIdLoaiTaiKhoan(rs.getLong(2));
				ac.setTaiKhoan(rs.getString(3));
				ac.setMatKhau(rs.getString(4));
				ac.setHoTen(rs.getString(5));
				ac.setDiaChi(rs.getString(6));
				ac.setSoDienThoai(rs.getString(7));
				ac.setEmail(rs.getString(8));
				ac.setDiemTichLuy(rs.getInt(9));
			} else {
				ac = null;
			}
			rs.close();
			cs.dongketnoi();
			return ac;
		}

		// Dem so luong thanh vien
		public int countAccount() throws Exception {
			int i = 0;
			NguoiDungDAO cs = new NguoiDungDAO();
			cs.KetNoi();
			String sql = "select COUNT(ID_TAIKHOAN) from TAIKHOAN where ID_LOAITAIKHOAN=2 or ID_LOAITAIKHOAN=3 or ID_LOAITAIKHOAN=4";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			if (rs.next()) {
				i = rs.getInt(1);
			}
			rs.close();
			cs.dongketnoi();
			return i;
		}

		// Dem so luong thanh vien Dong
		public int countAccountDong() throws Exception {
			int i = 0;
			NguoiDungDAO cs = new NguoiDungDAO();
			cs.KetNoi();
			String sql = "select COUNT(ID_TAIKHOAN) from TAIKHOAN where ID_LOAITAIKHOAN=4";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			if (rs.next()) {
				i = rs.getInt(1);
			}
			rs.close();
			cs.dongketnoi();
			return i;
		}

		// Dem so luong thanh vien Vang
		public int countAccountVang() throws Exception {
			int i = 0;
			NguoiDungDAO cs = new NguoiDungDAO();
			cs.KetNoi();
			String sql = "select COUNT(ID_TAIKHOAN) from TAIKHOAN where ID_LOAITAIKHOAN=2";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			if (rs.next()) {
				i = rs.getInt(1);
			}
			rs.close();
			cs.dongketnoi();
			return i;
		}

		// Dem so luong thanh vien Bac
		public int countAccountBac() throws Exception {
			int i = 0;
			NguoiDungDAO cs = new NguoiDungDAO();
			cs.KetNoi();
			String sql = "select COUNT(ID_TAIKHOAN) from TAIKHOAN where ID_LOAITAIKHOAN=3";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			if (rs.next()) {
				i = rs.getInt(1);
			}
			rs.close();
			cs.dongketnoi();
			return i;
		}

		// Lấy danh sách admin
		public ArrayList<AccountBEAN> getAccountAdmin() throws Exception {
			ArrayList<AccountBEAN> ac = new ArrayList<AccountBEAN>();
			NguoiDungDAO cs = new NguoiDungDAO();
			cs.KetNoi();
			String sql = "select * from TAIKHOAN where ID_LOAITAIKHOAN=1";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				ac.add(new AccountBEAN(rs.getLong(1), rs.getLong(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9)));
			}
			rs.close();
			cs.dongketnoi();
			return ac;
		}

		// Lấy danh sách tất cả thành viên
		public ArrayList<AccountBEAN> getAccount() throws Exception {
			ArrayList<AccountBEAN> ac = new ArrayList<AccountBEAN>();
			NguoiDungDAO cs = new NguoiDungDAO();
			cs.KetNoi();
			String sql = "select * from TAIKHOAN";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				ac.add(new AccountBEAN(rs.getLong(1), rs.getLong(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9)));
			}
			rs.close();
			cs.dongketnoi();
			return ac;
		}

		// Lấy danh sách thành viên VÀNG
		public ArrayList<AccountBEAN> getAccountVang(int startVang) throws Exception {
			ArrayList<AccountBEAN> ac = new ArrayList<AccountBEAN>();
			NguoiDungDAO cs = new NguoiDungDAO();
			cs.KetNoi();
			String sql = "select * from (select ROW_NUMBER() over (order by ID_TAIKHOAN desc) as rn, * from TAIKHOAN where ID_LOAITAIKHOAN=2) as x where rn between ? and ? + 7";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setInt(1, startVang);
			cmd.setInt(2, startVang);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				ac.add(new AccountBEAN(rs.getLong("ID_TAIKHOAN"), rs.getLong("ID_LOAITAIKHOAN"), rs.getString("TAIKHOAN"),
						rs.getString("MATKHAU"), rs.getString("HOTEN"), rs.getString("SODIENTHOAI"), rs.getString("DIACHI"),
						rs.getString("EMAIL"), rs.getInt("DIEMTICHLUY")));
			}
			rs.close();
			cs.dongketnoi();
			return ac;
		}

		// Lấy danh sách thành viên BẠC
		public ArrayList<AccountBEAN> getAccountBac(int startBac) throws Exception {
			ArrayList<AccountBEAN> ac = new ArrayList<AccountBEAN>();
			NguoiDungDAO cs = new NguoiDungDAO();
			cs.KetNoi();
			String sql = "select * from (select ROW_NUMBER() over (order by ID_TAIKHOAN desc) as rn, * from TAIKHOAN where ID_LOAITAIKHOAN=3) as x where rn between ? and ? + 7";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setInt(1, startBac);
			cmd.setInt(2, startBac);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				ac.add(new AccountBEAN(rs.getLong("ID_TAIKHOAN"), rs.getLong("ID_LOAITAIKHOAN"), rs.getString("TAIKHOAN"),
						rs.getString("MATKHAU"), rs.getString("HOTEN"), rs.getString("SODIENTHOAI"), rs.getString("DIACHI"),
						rs.getString("EMAIL"), rs.getInt("DIEMTICHLUY")));
			}
			rs.close();
			cs.dongketnoi();
			return ac;
		}

		// Lấy danh sách thành viên ĐỒNG
		public ArrayList<AccountBEAN> getAccountDong(int startDong) throws Exception {
			ArrayList<AccountBEAN> ac = new ArrayList<AccountBEAN>();
			NguoiDungDAO cs = new NguoiDungDAO();
			cs.KetNoi();
			String sql = "select * from (select ROW_NUMBER() over (order by ID_TAIKHOAN desc) as rn, * from TAIKHOAN where ID_LOAITAIKHOAN=4) as x where rn between ? and ? + 7";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setInt(1, startDong);
			cmd.setInt(2, startDong);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				ac.add(new AccountBEAN(rs.getLong("ID_TAIKHOAN"), rs.getLong("ID_LOAITAIKHOAN"), rs.getString("TAIKHOAN"),
						rs.getString("MATKHAU"), rs.getString("HOTEN"), rs.getString("SODIENTHOAI"), rs.getString("DIACHI"),
						rs.getString("EMAIL"), rs.getInt("DIEMTICHLUY")));
			}
			rs.close();
			cs.dongketnoi();
			return ac;
		}

		// Sửa thông tin Admin
		public int updateInfoAdmin(long idTaiKhoan, long idLoaiTaiKhoan, String taiKhoan, String matKhau, String hoTen,
				String soDienThoai, String diaChi, String email, int diemTichLuy) throws Exception {
			NguoiDungDAO cs = new NguoiDungDAO();
			cs.KetNoi();
			int i = 0;
			try {
				String sql = "update TAIKHOAN set ID_LOAITAIKHOAN=1, TAIKHOAN=?, MATKHAU=?, HOTEN=?, SODIENTHOAI=?, DIACHI=?, EMAIL=?, DIEMTICHLUY=0 where ID_TAIKHOAN=?";
				PreparedStatement cmd = cs.cn.prepareStatement(sql);
				cmd.setString(1, taiKhoan);
				cmd.setString(2, matKhau);
				cmd.setString(3, hoTen);
				cmd.setString(4, soDienThoai);
				cmd.setString(5, diaChi);
				cmd.setString(6, email);
				cmd.setLong(7, idTaiKhoan);
				i = cmd.executeUpdate();
				cs.dongketnoi();

			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("lỗi ở đây");
			}
			return i;
		}

		// Sửa thông tin thành viên
		public int updateInfoAccount(long idTaiKhoan, long idLoaiTaiKhoan, String taiKhoan, String matKhau, String hoTen,
				String soDienThoai, String diaChi, String email, int diemTichLuy) throws Exception {
			NguoiDungDAO cs = new NguoiDungDAO();
			cs.KetNoi();
			int i = 0;
			try {
				String sql = "update TAIKHOAN set ID_LOAITAIKHOAN=?, TAIKHOAN=?, MATKHAU=?, HOTEN=?, SODIENTHOAI=?, DIACHI=?, EMAIL=?, DIEMTICHLUY=? where ID_TAIKHOAN=?";
				PreparedStatement cmd = cs.cn.prepareStatement(sql);
				cmd.setLong(1, idLoaiTaiKhoan);
				cmd.setString(2, taiKhoan);
				cmd.setString(3, matKhau);
				cmd.setString(4, hoTen);
				cmd.setString(5, soDienThoai);
				cmd.setString(6, diaChi);
				cmd.setString(7, email);
				cmd.setInt(8, diemTichLuy);
				cmd.setLong(9, idTaiKhoan);
				i = cmd.executeUpdate();
				cs.dongketnoi();

			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("lỗi ở đây");
			}
			return i;
		}

		// Xóa thành viên
		public void deleteAccount(long idTaiKhoan) throws Exception {
			NguoiDungDAO cs = new NguoiDungDAO();
			cs.KetNoi();
			String sql = "delete from TAIKHOAN where ID_TAIKHOAN=?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, idTaiKhoan);
			cmd.executeUpdate();
			cs.dongketnoi();
		}

		public AccountBEAN getInfo(long idTaiKhoan) throws Exception {
			AccountBEAN ac = new AccountBEAN();
			NguoiDungDAO cs = new NguoiDungDAO();
			cs.KetNoi();
			String sql = "select * from TAIKHOAN where ID_TAIKHOAN=?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, idTaiKhoan);
			ResultSet rs = cmd.executeQuery();
			if (rs.next()) {
				ac.setIdTaiKhoan(rs.getLong(1));
				ac.setIdLoaiTaiKhoan(rs.getLong(2));
				ac.setTaiKhoan(rs.getString(3));
				ac.setMatKhau(rs.getString(4));
				ac.setHoTen(rs.getString(5));
				ac.setDiaChi(rs.getString(6));
				ac.setSoDienThoai(rs.getString(7));
				ac.setEmail(rs.getString(8));
				ac.setDiemTichLuy(rs.getInt(9));
			} else {
				ac = null;
			}
			rs.close();
			cs.dongketnoi();
			return ac;
		}
}
