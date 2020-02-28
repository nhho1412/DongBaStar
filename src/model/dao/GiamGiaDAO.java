package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.bean.GiamGiaBEAN;

public class GiamGiaDAO {
	public GiamGiaBEAN infoGG(String idMaGiamGia)throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		GiamGiaBEAN gi = new GiamGiaBEAN();
		String sql = "select * from KHUYENMAI where GETDATE()>=NGAYBATDAU AND GETDATE()<=NGAYKETTHUC AND ID_KHUYENMAI = ?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setString(1, idMaGiamGia);
		ResultSet rs = cmd.executeQuery();
		if(rs.next()) {
			gi = new GiamGiaBEAN(rs.getString(1), rs.getLong(2), rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getDate(6), rs.getDate(7));
		}
		rs.close();
		cs.dongketnoi();
		return gi;
	}
	public ArrayList<GiamGiaBEAN> listKhuyenMai()throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		ArrayList<GiamGiaBEAN> gi = new ArrayList<GiamGiaBEAN>();
		String sql = "select * from KHUYENMAI order by ID_KHUYENMAI desc";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			gi.add(new GiamGiaBEAN(rs.getString(1), rs.getLong(2), rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getDate(6), rs.getDate(7)));
		}
		rs.close();
		cs.dongketnoi();
		return gi;
	}
}
