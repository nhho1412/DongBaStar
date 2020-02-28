package model.bo;

import java.util.ArrayList;

import model.bean.VeGheBEAN;
import model.dao.VeGheDAO;

public class VeGheBO {
	VeGheDAO ve = new VeGheDAO();
	public ArrayList<VeGheBEAN> listVeGheTheoSuat(long idSuat)throws Exception{
		return ve.listVeGheTheoSuat(idSuat);
	}
}
