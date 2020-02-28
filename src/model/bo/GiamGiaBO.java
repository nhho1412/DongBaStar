package model.bo;

import java.util.ArrayList;

import model.bean.GiamGiaBEAN;
import model.dao.GiamGiaDAO;

public class GiamGiaBO {
	GiamGiaDAO gi = new GiamGiaDAO();
	public GiamGiaBEAN infoGG(String idMaGiamGia)throws Exception{
		return gi.infoGG(idMaGiamGia);
	}
	public ArrayList<GiamGiaBEAN> listKhuyenMai()throws Exception{
		return gi.listKhuyenMai();
	}
}
