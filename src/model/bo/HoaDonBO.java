package model.bo;

import java.util.ArrayList;

import model.bean.ChiTietHoaDonBEAN;
import model.bean.ChiTietThanhToanBEAN;
import model.bean.LichSuDatVeBEAN;
import model.dao.HoaDonDAO;

public class HoaDonBO {
	HoaDonDAO hd = new HoaDonDAO();
	public void insertHoaDon(long idTaiKhoan, long idSuat) throws Exception{
		hd.insertHoaDon(idTaiKhoan, idSuat);
	}
	public void insertVeGhe(long idGhe, long idHoaDon, long idSuat) throws Exception{
		hd.insertVeGhe(idGhe, idHoaDon, idSuat);
	}
	public long maxIDHoaDonTheoTaiKhoan(long idTaiKhoan)throws Exception{
		return hd.maxIDHoaDonTheoTaiKhoan(idTaiKhoan);
	}
	public void thanhToanHoaDonCMGG(long idHoaDon, float thanhtien)throws Exception{
		hd.thanhToanHoaDonCMGG(idHoaDon, thanhtien);
	}
	public void thanhToanHoaDonMGG(long idHoaDon, float thanhtien, String maGiamGia, long giaDuocGiam)throws Exception{
		hd.thanhToanHoaDonMGG(idHoaDon, thanhtien, maGiamGia, giaDuocGiam);
	}
	public ChiTietHoaDonBEAN infoChiTietHoaDon(long idHoaDon, long idTaiKhoan) throws Exception{
		return hd.infoChiTietHoaDon(idHoaDon, idTaiKhoan);
	}
	public ArrayList<ChiTietThanhToanBEAN> infoChiTietThanhToan(long idHoaDon) throws Exception{
		return hd.infoChiTietThanhToan(idHoaDon);
	}
	public ArrayList<LichSuDatVeBEAN> lichSuDatVe(long idTaiKhoan)throws Exception{
		return hd.lichSuDatVe(idTaiKhoan);
	}
}
