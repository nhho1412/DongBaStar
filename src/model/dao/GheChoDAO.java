package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GheChoDAO {
	public ArrayList<Long> dsIDGheCho(long idSuat, long idTaiKhoan)throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		ArrayList<Long> temp = new ArrayList<Long>(); // ghe chua co nguoi giu cho
		String sql = "select * from GHECHO where ID_SUAT = ? and ID_TAIKHOAN != ? and TRANGTHAI = '1' and DATEDIFF(minute, THOIGIAN, GETDATE())<=5";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, idSuat);
		cmd.setLong(2, idTaiKhoan);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			temp.add(rs.getLong(3));
		}
		rs.close();
		cs.dongketnoi();
		return temp; 
	}
	public ArrayList<Long> dsIDGheChoUser(long idSuat, long idTaiKhoan)throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		ArrayList<Long> temp = new ArrayList<Long>(); // ghe chua co nguoi giu cho
		String sql = "select * from GHECHO where ID_SUAT = ? and ID_TAIKHOAN = ? and TRANGTHAI = '1' and DATEDIFF(minute, THOIGIAN, GETDATE())<=5";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, idSuat);
		cmd.setLong(2, idTaiKhoan);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			temp.add(rs.getLong(3));
		}
		rs.close();
		cs.dongketnoi();
		return temp; 
	}
	public void xoaChoGhe(long idGhe, long idSuat, long idTaiKhoan)throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		String sql = "update GHECHO set TRANGTHAI = '0' where ID_GHE = ? and ID_SUAT = ? and ID_TAIKHOAN = ?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, idGhe);
		cmd.setLong(2, idSuat);
		cmd.setLong(3, idTaiKhoan);
		cmd.executeUpdate();
		cs.dongketnoi();
	}
	public boolean kiemTraGheCho(long idGhe, long idSuat, long idTaiKhoan)throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		boolean temp = false; // ghe chua co nguoi giu cho
		String sql = "select * from GHECHO where ID_GHE = ? and ID_SUAT = ? and ID_TAIKHOAN != ? and TRANGTHAI = '1' and DATEDIFF(minute, THOIGIAN, GETDATE())<=5";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, idGhe);
		cmd.setLong(2, idSuat);
		cmd.setLong(3, idTaiKhoan);
		ResultSet rs = cmd.executeQuery();
		if(rs.next()) {
			temp = true; // ghe da co nguoi giu cho
		}
		rs.close();
		cs.dongketnoi();
		return temp; 
	}
	public void themGheCho(long idGhe, long idSuat, long idTaiKhoan)throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		String sql = "insert into GHECHO(ID_GHE, ID_SUAT, ID_TAIKHOAN, THOIGIAN)values(?, ?, ?, GETDATE())";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, idGhe);
		cmd.setLong(2, idSuat);
		cmd.setLong(3, idTaiKhoan);
		cmd.executeUpdate();
		cs.dongketnoi();
	}
}
