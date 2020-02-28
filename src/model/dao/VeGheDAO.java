package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.bean.VeGheBEAN;

public class VeGheDAO {
	public ArrayList<VeGheBEAN> listVeGheTheoSuat(long idSuat)throws Exception{
		ArrayList<VeGheBEAN> temp = new ArrayList<VeGheBEAN>();
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		String sql = "select * from View_GHE_DA_DAT where ID_SUAT =  ?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, idSuat);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			temp.add(new VeGheBEAN(rs.getLong(1), rs.getLong(2), rs.getLong(3), rs.getLong(4), rs.getString(5), rs.getInt(6)));
		}
		rs.close();
		cs.dongketnoi();
		return temp;
	}
}
