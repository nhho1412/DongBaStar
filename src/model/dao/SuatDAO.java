package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.bean.SuatBEAN;

public class SuatDAO {
	public ArrayList<SuatBEAN> suatTheoFilm(long idPhim)throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		ArrayList<SuatBEAN> temp = new ArrayList<SuatBEAN>();
		String sql = "select * from SUAT where ID_PHIM = ?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, idPhim);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			temp.add(new SuatBEAN(rs.getLong(1), rs.getLong(2), rs.getLong(3), rs.getDate(4), rs.getTime(5)));
		}
		rs.close();
		cs.dongketnoi();
		return temp;
	}
}
