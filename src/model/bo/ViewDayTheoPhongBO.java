package model.bo;

import java.util.ArrayList;

import model.bean.ViewDayTheoPhongBEAN;
import model.dao.ViewDayTheoPhongDAO;

public class ViewDayTheoPhongBO {
	ViewDayTheoPhongDAO vi = new ViewDayTheoPhongDAO();
	public ArrayList<ViewDayTheoPhongBEAN> listGheTheoPhong(long idPhong)throws Exception{
		return vi.listGheTheoPhong(idPhong);
	}

}
