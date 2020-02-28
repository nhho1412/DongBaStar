package model.bo;

import java.util.ArrayList;

import model.dao.GheChoDAO;

public class GheChoBO {
	GheChoDAO gh = new GheChoDAO();
	public ArrayList<Long> dsIDGheChoUser(long idSuat, long idTaiKhoan)throws Exception{
		return gh.dsIDGheChoUser(idSuat, idTaiKhoan);
	}
	public void xoaChoGhe(long idGhe, long idSuat, long idTaiKhoan)throws Exception{
		gh.xoaChoGhe(idGhe, idSuat, idTaiKhoan);
	}
	public boolean kiemTraGheCho(long idGhe, long idSuat, long idTaiKhoan)throws Exception{
		return gh.kiemTraGheCho(idGhe, idSuat, idTaiKhoan);
	}
	public void themGheCho(long idGhe, long idSuat, long idTaiKhoan)throws Exception{
		gh.themGheCho(idGhe, idSuat, idTaiKhoan);
	}
	public ArrayList<Long> dsIDGheCho(long idSuat, long idTaiKhoan)throws Exception{
		return gh.dsIDGheCho(idSuat, idTaiKhoan);
	}
}
