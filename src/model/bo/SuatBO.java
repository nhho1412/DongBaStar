package model.bo;

import java.util.ArrayList;

import model.bean.SuatBEAN;
import model.dao.SuatDAO;

public class SuatBO {
	SuatDAO su = new SuatDAO();
	public ArrayList<SuatBEAN> suatTheoFilm(long idPhim)throws Exception{
		return su.suatTheoFilm(idPhim);	
	}
}
