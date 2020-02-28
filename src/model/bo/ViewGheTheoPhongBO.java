package model.bo;

import java.util.ArrayList;

import model.bean.ViewGheTheoPhongBEAN;
import model.dao.ViewGheTheoPhongDAO;

public class ViewGheTheoPhongBO {
	ViewGheTheoPhongDAO vi = new ViewGheTheoPhongDAO();
	public ArrayList<ViewGheTheoPhongBEAN> listGheTheoPhong(long idPhong)throws Exception{
		return vi.listGheTheoPhong(idPhong);
	}
}
