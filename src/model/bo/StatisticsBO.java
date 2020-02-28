package model.bo;

import java.util.ArrayList;

import model.bean.DoanhSoBEAN;
import model.bean.DoanhThuBEAN;
import model.dao.StatisticsDAO;

public class StatisticsBO {
	StatisticsDAO tk=new StatisticsDAO();
	//Thong ke doanh so ( ve da dat )
	public ArrayList<DoanhSoBEAN> getDoanhSo() throws Exception{
		return tk.getDoanhSo();
	}
	
	//Thong ke doanh thu ( tong tien )
	public ArrayList<DoanhThuBEAN> getDoanhThu() throws Exception{
		return tk.getDoanhThu();
	}
	
	//Tong doanh thu
	public long tongDoanhThu() throws Exception{
		return tk.tongDoanhThu();
	}
	
	// Dem so hoa don
	public int demHoaDon() throws Exception {
		return tk.demHoaDon();
	}
}
