package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.bean.EventBEAN;

public class EventDAO {
	//Lay danh sach event
	public ArrayList<EventBEAN> getEvent() throws Exception{
		ArrayList<EventBEAN> event=new ArrayList<EventBEAN>();
		NguoiDungDAO cs=new NguoiDungDAO();
		cs.KetNoi();
		String sql="select * from SUKIEN";
		PreparedStatement cmd=cs.cn.prepareStatement(sql);
		ResultSet rs=cmd.executeQuery();
		while(rs.next()) {
			event.add(new EventBEAN(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4)));
		}
		rs.close();
		cs.dongketnoi();
		return event;
	}
	
	//Them event
	public int insertEvent(String tenSuKien, String moTa, String anhSuKien) throws Exception{
		NguoiDungDAO cs=new NguoiDungDAO();
		cs.KetNoi();
		String sql="insert into SUKIEN(TENSUKIEN, MOTA, ANHSUKIEN) values(?,?,?)";
		PreparedStatement cmd=cs.cn.prepareStatement(sql);
		cmd.setString(1, tenSuKien);
		cmd.setString(2, moTa);
		cmd.setString(3, anhSuKien);
		int i=cmd.executeUpdate();
		cs.dongketnoi();
		return i;
	}
	
	//Sua event
	public int updateEvent(long idSuKien, String tenSuKien, String moTa, String anhSuKien) throws Exception{
		NguoiDungDAO cs=new NguoiDungDAO();
		cs.KetNoi();
		String sql="update SUKIEN set TENSUKIEN=?, MOTA=?,ANHSUKIEN=? where ID_SUKIEN=?";
		PreparedStatement cmd=cs.cn.prepareStatement(sql);
		cmd.setString(1, tenSuKien);
		cmd.setString(2, moTa);
		cmd.setString(3, anhSuKien);
		cmd.setLong(4, idSuKien);
		int i=cmd.executeUpdate();
		cs.dongketnoi();
		return i;
	}
	
	//Xoa event
	public void deleteEvent(long idSuKien) throws Exception{
		NguoiDungDAO cs=new NguoiDungDAO();
		cs.KetNoi();
		String sql="delete from SUKIEN where ID_SUKIEN=?";
		PreparedStatement cmd=cs.cn.prepareStatement(sql);
		cmd.setLong(1, idSuKien);
		cmd.executeUpdate();
		cs.dongketnoi();
	}
	
	// Dem so luong event
		public int countEvent() throws Exception {
			int i = 0;
			NguoiDungDAO cs = new NguoiDungDAO();
			cs.KetNoi();
			String sql = "select COUNT(ID_SUKIEN) from SUKIEN";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			if (rs.next()) {
				i = rs.getInt(1);
			}
			rs.close();
			cs.dongketnoi();
			return i;
		}
		
		// Lấy danh sách su kien THEO START
		public ArrayList<EventBEAN> getEvent(int startSuKien) throws Exception {
			ArrayList<EventBEAN> event = new ArrayList<EventBEAN>();
			NguoiDungDAO cs = new NguoiDungDAO();
			cs.KetNoi();
			String sql = "select * from (select ROW_NUMBER() over (order by ID_SUKIEN desc) as rn, * from SUKIEN) as x where rn between ? and ? + 7";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setInt(1, startSuKien);
			cmd.setInt(2, startSuKien);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				event.add(new EventBEAN(rs.getLong("ID_SUKIEN"), rs.getString("TENSUKIEN"), rs.getString("MOTA"), rs.getString("ANHSUKIEN")));
			}
			rs.close();
			cs.dongketnoi();
			return event;
		}	
}
