package model.bo;

import java.util.ArrayList;
import java.util.Date;

import model.bean.ADFilmBEAN;
import model.bean.FilmBEAN;
import model.dao.FilmDAO;

public class FilmBO {
	FilmDAO film = new FilmDAO();
	public ArrayList<FilmBEAN> listFilmSilde() throws Exception{
		return film.listFilmSilde();
	}
	public ArrayList<FilmBEAN> listFilmDangChieu() throws Exception{
		return film.listFilmDangChieu();
	}
	public ArrayList<FilmBEAN> listFilmSapChieu() throws Exception{
		return film.listFilmSapChieu();
	}
	public FilmBEAN getInfoFilm(Long idPhim)throws Exception{
		return film.getInfoFilm(idPhim);
	}
	public ArrayList<FilmBEAN> listFilmChieuSom() throws Exception{
		return film.listFilmChieuSom();
	}
	public ArrayList<ADFilmBEAN> getFilm() throws Exception{
		return film.getFilm();
	}
	//lay count search
	public int countSearch(int thang, int nam) throws Exception{
		return film.countSearch(thang, nam);
	}
	//Lay danh sach phim theo ma
	public ArrayList<ADFilmBEAN> getFilm(int startFilm) throws Exception{
		return film.getFilm(startFilm);
	}
	
	//Search list film theo thang nam
	public ArrayList<ADFilmBEAN> searchTN(int thang, int nam) throws Exception{
		return film.searchTN(thang, nam);
	}
	
	//Dem so luong phim
	public int countFilm() throws Exception{
		return film.countFilm();
	}
	//Search list film theo thang nam
	public ArrayList<ADFilmBEAN> search(int thang, int nam, int start) throws Exception{
		return film.search(thang, nam, start);
	}
	
	//Sua thong tin phim
	public int updateFilm(long idPhim, String tenPhim, String thoiLuong, String moTaNgan, String daoDien, String dienVien,
			String hinhAnh1, String hinhAnh2, String hinhAnh3, String hinhAnh4, String video, String theLoai,
			Date ngayCongChieu, int gioiHanTuoi, String dinhDangPhim, boolean trangThai) throws Exception{
		return film.updateFilm(idPhim, tenPhim, thoiLuong, moTaNgan, daoDien, dienVien, hinhAnh1, hinhAnh2, hinhAnh3, hinhAnh4, video, theLoai, ngayCongChieu, gioiHanTuoi, dinhDangPhim,trangThai);
	}
	
	//Xoa phim
	public void deleteFilm(long idPhim) throws Exception{
		film.deleteFilm(idPhim);
	}
	
	//Them phim
	public int insertFilm(String tenPhim, String thoiLuong, String moTaNgan, String daoDien, String dienVien,
			String hinhAnh1, String hinhAnh2, String hinhAnh3, String hinhAnh4, String video, String theLoai,
			Date ngayCongChieu, int gioiHanTuoi, String dinhDangPhim) throws Exception{
		return film.insertFilm(tenPhim, thoiLuong, moTaNgan, daoDien, dienVien, hinhAnh1, hinhAnh2, hinhAnh3, hinhAnh4, video, theLoai, ngayCongChieu, gioiHanTuoi, dinhDangPhim);
	}
}
