package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.bean.ViewDayTheoPhongBEAN;

public class ViewDayTheoPhongDAO {
	public ArrayList<ViewDayTheoPhongBEAN> listGheTheoPhong(long idPhong)throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		ArrayList<ViewDayTheoPhongBEAN> temp = new ArrayList<ViewDayTheoPhongBEAN>();
		String sql = "select * from VIEW_DAY_THEO_PHONG where ID_PHONG = ?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, idPhong);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			temp.add(new ViewDayTheoPhongBEAN(rs.getLong(1), rs.getLong(2), rs.getString(3)));
		}
		rs.close();
		cs.dongketnoi();
		return temp;
	}
}
