package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.bean.ChiTietHoaDonBEAN;
import model.bean.ChiTietThanhToanBEAN;
import model.bean.LichSuDatVeBEAN;

public class HoaDonDAO {
	public ArrayList<LichSuDatVeBEAN> lichSuDatVe(long idTaiKhoan)throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		ArrayList<LichSuDatVeBEAN> temp = new ArrayList<LichSuDatVeBEAN>();
		cs.KetNoi();
		String sql = "SELECT * FROM View_LichSuDatVe1 where ID_TAIKHOAN = ? ORDER BY NGAYDATVE DESC, GIODATVE DESC";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, idTaiKhoan);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			temp.add(new LichSuDatVeBEAN(rs.getLong(1), rs.getTime(2), rs.getInt(3), rs.getLong(4), rs.getLong(5), rs.getString(6), rs.getFloat(7), rs.getLong(8), rs.getLong(9), rs.getString(10), rs.getDate(11)));
		}
		rs.close();
		cs.dongketnoi();
		return temp;
	}
	public ChiTietHoaDonBEAN infoChiTietHoaDon(long idHoaDon, long idTaiKhoan) throws Exception{
		ChiTietHoaDonBEAN temp = new ChiTietHoaDonBEAN();
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		String sql = "select * from View_ChiTietHoaDon where ID_HOADON = ? and ID_TAIKHOAN = ?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, idHoaDon);
		cmd.setLong(2, idTaiKhoan);
		ResultSet rs = cmd.executeQuery();
		if(rs.next()) {
			temp = new ChiTietHoaDonBEAN(rs.getLong(1), rs.getString(2), rs.getLong(3), rs.getDate(4), rs.getTime(5), rs.getFloat(6), rs.getString(7), rs.getString(9));
		}else {
			temp = null;
		}
		rs.close();
		cs.dongketnoi();
		return temp;
	}
	public ArrayList<ChiTietThanhToanBEAN> infoChiTietThanhToan(long idHoaDon) throws Exception{
		ArrayList<ChiTietThanhToanBEAN> temp = new ArrayList<ChiTietThanhToanBEAN>();
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		String sql = "select * from View_ChiTietThanhToan where ID_HOADON = ?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, idHoaDon);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			temp.add(new ChiTietThanhToanBEAN(rs.getLong(1), rs.getString(2), rs.getInt(3), rs.getLong(4), rs.getString(5), rs.getLong(6)));
		}
		rs.close();
		cs.dongketnoi();
		return temp;
	}
	public void thanhToanHoaDonCMGG(long idHoaDon, float thanhtien)throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		String sql = "update HOADON set TONGTIEN = ?, THANHTOAN = '1' where ID_HOADON = ?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setFloat(1, thanhtien);
		cmd.setLong(2, idHoaDon);
		cmd.executeUpdate();
		cs.dongketnoi();
	}
	public void thanhToanHoaDonMGG(long idHoaDon, float thanhtien, String maGiamGia, long giaDuocGiam)throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		String sql = "update HOADON set TONGTIEN = ?, GIADUOCGIAM = ?, ID_KHUYENMAI = ? ,THANHTOAN = '1' where ID_HOADON = ?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setFloat(1, thanhtien);
		cmd.setLong(2, giaDuocGiam);
		cmd.setString(3, maGiamGia);
		cmd.setLong(4, idHoaDon);
		cmd.executeUpdate();
		cs.dongketnoi();
	}
	public void insertHoaDon(long idTaiKhoan, long idSuat) throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		String sql = "insert into HOADON(ID_TAIKHOAN, ID_SUAT, NGAYDATVE, GIODATVE) values (?, ?, GETDATE(), GETDATE())";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, idTaiKhoan);
		cmd.setLong(2, idSuat);
		cmd.executeUpdate();
		System.out.println("them hoa don thanh cong");
		cs.dongketnoi();
	}
	public void insertVeGhe(long idGhe, long idHoaDon, long idSuat) throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		String sql = "insert into VE_GHE(ID_GHE, ID_HOADON, ID_SUAT) values (?, ?, ?)";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, idGhe);
		cmd.setLong(2, idHoaDon);
		cmd.setLong(3, idSuat);
		cmd.executeUpdate();
		System.out.println("them ve_ghe"+idGhe+" thanh cong");
		cs.dongketnoi();
	}
	public long maxIDHoaDonTheoTaiKhoan(long idTaiKhoan)throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		long temp = 0;
		String sql = "SELECT MAX(ID_HOADON) FROM HOADON WHERE ID_TAIKHOAN = ?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, idTaiKhoan);
		ResultSet rs = cmd.executeQuery();
		if(rs.next()) {
			temp = rs.getLong(1);
		}else {
			temp = 0;
		}
		rs.close();
		cs.dongketnoi();
		System.out.println("max=" + temp);
		return temp;
	}
}
