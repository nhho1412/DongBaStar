package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.bean.DoanhSoBEAN;
import model.bean.DoanhThuBEAN;

public class StatisticsDAO {
	// Thong ke doanh so ( ve da dat )
	public ArrayList<DoanhSoBEAN> getDoanhSo() throws Exception {
		ArrayList<DoanhSoBEAN> doanhSo = new ArrayList<DoanhSoBEAN>();
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		String sql = "select * from View_DOANHSO";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			doanhSo.add(new DoanhSoBEAN(rs.getLong("ID_PHIM"), rs.getString("TENPHIM"), rs.getInt("DOANHSO")));
		}
		rs.close();
		cs.dongketnoi();
		return doanhSo;
	}

	// Thong ke doanh thu ( tong tien )
	public ArrayList<DoanhThuBEAN> getDoanhThu() throws Exception {
		ArrayList<DoanhThuBEAN> doanhThu = new ArrayList<DoanhThuBEAN>();
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		String sql = "select * from View_DOANHTHU";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			doanhThu.add(new DoanhThuBEAN(rs.getLong("ID_PHIM"), rs.getString("TENPHIM"), rs.getDate("NGAYCONGCHIEU"),
					rs.getLong("DOANHTHU")));
		}
		rs.close();
		cs.dongketnoi();
		return doanhThu;
	}

	// Tong doanh thu
	public long tongDoanhThu() throws Exception {
		int i = 0;
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		String sql = "select SUM(DOANHTHU) from View_DOANHTHU";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		if (rs.next()) {
			i = rs.getInt(1);
		}
		rs.close();
		cs.dongketnoi();
		return i;
	}

	// Dem so hoa don
	public int demHoaDon() throws Exception {
		int i = 0;
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		String sql = "select COUNT(ID_HOADON) from HOADON";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		if (rs.next()) {
			i = rs.getInt(1);
		}
		rs.close();
		cs.dongketnoi();
		return i;
	}
}
