package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.bean.ViewGheTheoPhongBEAN;

public class ViewGheTheoPhongDAO {
	public ArrayList<ViewGheTheoPhongBEAN> listGheTheoPhong(long idPhong)throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		ArrayList<ViewGheTheoPhongBEAN> temp = new ArrayList<ViewGheTheoPhongBEAN>();
		String sql = "select * from VIEW_GHE_THEO_PHONG where ID_PHONG = ?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, idPhong);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			temp.add(new ViewGheTheoPhongBEAN(rs.getLong(1), rs.getLong(2), rs.getLong(3), rs.getInt(4), rs.getLong(5)));
		}
		rs.close();
		cs.dongketnoi();
		return temp;
	}
}
