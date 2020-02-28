package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import model.bean.ADFilmBEAN;
import model.bean.FilmBEAN;

public class FilmDAO {
	public ArrayList<FilmBEAN> listFilmChieuSom() throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		ArrayList<FilmBEAN> temp = new ArrayList<FilmBEAN>();
		String sql = "select * from View_PhimChieuSom";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			temp.add(new FilmBEAN(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getDate(13), rs.getInt(14), rs.getString(15)));
		}
		rs.close();
		cs.dongketnoi();
		return temp;
	}
	public ArrayList<FilmBEAN> listFilmSilde() throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		ArrayList<FilmBEAN> temp = new ArrayList<FilmBEAN>();
		String sql = "select * from View_SlidePhim";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			temp.add(new FilmBEAN(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getDate(13), rs.getInt(14), rs.getString(15)));
		}
		rs.close();
		cs.dongketnoi();
		return temp;
	}
	public ArrayList<FilmBEAN> listFilmDangChieu() throws Exception{
			NguoiDungDAO cs = new NguoiDungDAO();
			cs.KetNoi();
			ArrayList<FilmBEAN> temp = new ArrayList<FilmBEAN>();
			String sql = "select * from View_PhimDangChieu";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while(rs.next()) {
				temp.add(new FilmBEAN(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getDate(13), rs.getInt(14), rs.getString(15)));
			}
			rs.close();
			cs.dongketnoi();
			return temp;
	}
	public ArrayList<FilmBEAN> listFilmSapChieu() throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		ArrayList<FilmBEAN> temp = new ArrayList<FilmBEAN>();
		String sql = "SELECT * FROM View_PhimSapChieu WHERE ID_PHIM NOT IN (SELECT ID_PHIM FROM View_PhimChieuSom)";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			temp.add(new FilmBEAN(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getDate(13), rs.getInt(14), rs.getString(15)));
		}
		rs.close();
		cs.dongketnoi();
		return temp;
	}
	public FilmBEAN getInfoFilm(Long idPhim)throws Exception{
		NguoiDungDAO cs = new NguoiDungDAO();
		cs.KetNoi();
		FilmBEAN temp = new FilmBEAN();
		String sql = "select * from PHIM where ID_PHIM = ?";
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setLong(1, idPhim);
		ResultSet rs = cmd.executeQuery();
		if(rs.next()) {
			temp = new FilmBEAN(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getDate(13), rs.getInt(14), rs.getString(15));
		}else {
			temp = null;
		}
		rs.close();
		cs.dongketnoi();
		return temp;
	}
	
	//Lay danh sach phim
		public ArrayList<ADFilmBEAN> getFilm() throws Exception{
			ArrayList<ADFilmBEAN> film=new ArrayList<ADFilmBEAN>();
			NguoiDungDAO cs=new NguoiDungDAO();
			cs.KetNoi();
			String sql="select * from PHIM";
			
			PreparedStatement cmd=cs.cn.prepareStatement(sql);
			ResultSet rs=cmd.executeQuery();
			while(rs.next()) {
				film.add(new ADFilmBEAN(rs.getLong("ID_PHIM"), rs.getString("TENPHIM"), rs.getString("THOILUONG"), rs.getString("MOTANGAN"), rs.getString("DAODIEN"), rs.getString("DIENVIEN"), rs.getString("HINHANH1"), rs.getString("HINHANH2"), rs.getString("HINHANH3"), rs.getString("HINHANH4"), rs.getString("VIDEO"), rs.getString("THELOAI"), rs.getDate("NGAYCONGCHIEU"), rs.getInt("GIOIHANTUOI"), rs.getString("DINHDANGPHIM"),rs.getBoolean("TRANGTHAI")));
			}
			rs.close();
			cs.dongketnoi();
			return film;
		}
		
		//Lay danh sach phim theo ma
			public ArrayList<ADFilmBEAN> getFilm(int startFilm) throws Exception{
				ArrayList<ADFilmBEAN> film=new ArrayList<ADFilmBEAN>();
				NguoiDungDAO cs=new NguoiDungDAO();
				cs.KetNoi();
				String sql="select * from (select ROW_NUMBER() over (order by ID_PHIM desc) as rn, * from PHIM) as x where rn between ? and ? + 9";			
				PreparedStatement cmd=cs.cn.prepareStatement(sql);
				cmd.setInt(1, startFilm);
				cmd.setInt(2, startFilm);
				ResultSet rs=cmd.executeQuery();
				while(rs.next()) {
					film.add(new ADFilmBEAN(rs.getLong("ID_PHIM"), rs.getString("TENPHIM"), rs.getString("THOILUONG"), rs.getString("MOTANGAN"), rs.getString("DAODIEN"), rs.getString("DIENVIEN"), rs.getString("HINHANH1"), rs.getString("HINHANH2"), rs.getString("HINHANH3"), rs.getString("HINHANH4"), rs.getString("VIDEO"), rs.getString("THELOAI"), rs.getDate("NGAYCONGCHIEU"), rs.getInt("GIOIHANTUOI"), rs.getString("DINHDANGPHIM"),rs.getBoolean("TRANGTHAI")));
				}
				rs.close();
				cs.dongketnoi();
				return film;
			}
		
		//Dem so luong phim
		public int countFilm() throws Exception{
			int i=0;
			NguoiDungDAO cs=new NguoiDungDAO();
			cs.KetNoi();
			String sql="select COUNT(ID_PHIM) from PHIM";
			PreparedStatement cmd=cs.cn.prepareStatement(sql);
			ResultSet rs=cmd.executeQuery();
			if(rs.next()) {
				i=rs.getInt(1);
			}
			rs.close();
			cs.dongketnoi();
			return i;
		}
		
		//Search list film theo thang nam start
		public ArrayList<ADFilmBEAN> search(int thang, int nam, int start) throws Exception{
			ArrayList<ADFilmBEAN> list=new ArrayList<ADFilmBEAN>();
			NguoiDungDAO cs=new NguoiDungDAO();
			cs.KetNoi();
			//String sql="select * from PHIM where (MONTH(NGAYCONGCHIEU)=? or ?=-1) and (YEAR(NGAYCONGCHIEU)=? or ?=-1)";
			String sql = "select * from (select ROW_NUMBER() over (order by ID_PHIM desc) as rn, * from PHIM where (MONTH(NGAYCONGCHIEU)=? or ?=-1) and (YEAR(NGAYCONGCHIEU)=? or ?=-1)) as x where rn between ? and ? + 9";
			PreparedStatement cmd=cs.cn.prepareStatement(sql);
			cmd.setInt(1, thang);
			cmd.setInt(2, thang);
			cmd.setInt(3, nam);
			cmd.setInt(4, nam);
			cmd.setInt(5, start);
			cmd.setInt(6, start);
			
			ResultSet rs=cmd.executeQuery();
			ADFilmBEAN fi=null;
			while(rs.next()) {
				fi=new ADFilmBEAN(rs.getLong("ID_PHIM"), rs.getString("TENPHIM"), rs.getString("THOILUONG"), rs.getString("MOTANGAN"), rs.getString("DAODIEN"), rs.getString("DIENVIEN"), rs.getString("HINHANH1"), rs.getString("HINHANH2"), rs.getString("HINHANH3"), rs.getString("HINHANH4"), rs.getString("VIDEO"), rs.getString("THELOAI"), rs.getDate("NGAYCONGCHIEU"), rs.getInt("GIOIHANTUOI"), rs.getString("DINHDANGPHIM"),rs.getBoolean("TRANGTHAI"));
				list.add(fi);
			}
			rs.close();
			cs.dongketnoi();
			return list;
		}
		
		//Search list film theo thang nam
		public ArrayList<ADFilmBEAN> searchTN(int thang, int nam) throws Exception{
			ArrayList<ADFilmBEAN> list=new ArrayList<ADFilmBEAN>();
			NguoiDungDAO cs=new NguoiDungDAO();
			cs.KetNoi();
			String sql="select * from PHIM where (MONTH(NGAYCONGCHIEU)=? or ?=-1) and (YEAR(NGAYCONGCHIEU)=? or ?=-1)";		
			PreparedStatement cmd=cs.cn.prepareStatement(sql);
			cmd.setInt(1, thang);
			cmd.setInt(2, thang);
			cmd.setInt(3, nam);
			cmd.setInt(4, nam);		
			ResultSet rs=cmd.executeQuery();
			ADFilmBEAN fi=null;
			while(rs.next()) {
				fi=new ADFilmBEAN(rs.getLong("ID_PHIM"), rs.getString("TENPHIM"), rs.getString("THOILUONG"), rs.getString("MOTANGAN"), rs.getString("DAODIEN"), rs.getString("DIENVIEN"), rs.getString("HINHANH1"), rs.getString("HINHANH2"), rs.getString("HINHANH3"), rs.getString("HINHANH4"), rs.getString("VIDEO"), rs.getString("THELOAI"), rs.getDate("NGAYCONGCHIEU"), rs.getInt("GIOIHANTUOI"), rs.getString("DINHDANGPHIM"),rs.getBoolean("TRANGTHAI"));
				list.add(fi);
			}
			rs.close();
			cs.dongketnoi();
			return list;
		}
		
		public int countSearch(int thang, int nam) throws Exception{
			NguoiDungDAO cs=new NguoiDungDAO();
			cs.KetNoi();
			String sql="select * from PHIM where (MONTH(NGAYCONGCHIEU)=? or ?=-1) and (YEAR(NGAYCONGCHIEU)=? or ?=-1)";
			PreparedStatement cmd=cs.cn.prepareStatement(sql);
			cmd.setInt(1, thang);
			cmd.setInt(2, thang);
			cmd.setInt(3, nam);
			cmd.setInt(4, nam);
			ResultSet rs=cmd.executeQuery();
			int temp = 0;
			while(rs.next()) {
				temp++;
			}
			rs.close();
			cs.dongketnoi();
			return temp;
		}
		//Sua thong tin phim
		public int updateFilm(long idPhim, String tenPhim, String thoiLuong, String moTaNgan, String daoDien, String dienVien,
				String hinhAnh1, String hinhAnh2, String hinhAnh3, String hinhAnh4, String video, String theLoai,
				Date ngayCongChieu, int gioiHanTuoi, String dinhDangPhim, boolean trangThai) throws Exception{
			NguoiDungDAO cs=new NguoiDungDAO();
			cs.KetNoi();
			int i=0;
			try {
				String sql="update PHIM set TENPHIM=?,THOILUONG=?,MOTANGAN=?, DAODIEN=?, DIENVIEN=?, HINHANH1=?, HINHANH2=?, HINHANH3=?, HINHANH4=?, VIDEO=?, THELOAI=?,NGAYCONGCHIEU=?, GIOIHANTUOI=?, DINHDANGPHIM=?, TRANGTHAI=? where ID_PHIM=?";
				PreparedStatement cmd=cs.cn.prepareStatement(sql);
				cmd.setString(1, tenPhim);
				cmd.setString(2, thoiLuong);
				cmd.setString(3, moTaNgan);
				cmd.setString(4, daoDien);
				cmd.setString(5, dienVien);
				cmd.setString(6, hinhAnh1);
				cmd.setString(7, hinhAnh2);
				cmd.setString(8, hinhAnh3);
				cmd.setString(9, hinhAnh4);
				cmd.setString(10, video);
				cmd.setString(11, theLoai);
				cmd.setDate(12, new java.sql.Date(ngayCongChieu.getTime()));
				cmd.setInt(13, gioiHanTuoi);
				cmd.setString(14, dinhDangPhim);
				cmd.setBoolean(15, trangThai);
				cmd.setLong(16, idPhim);
				i=cmd.executeUpdate();
				cs.dongketnoi();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("abc");
			}return i;
		}
		
		//Xoa phim
		public void deleteFilm(long idPhim) throws Exception{
			NguoiDungDAO cs=new NguoiDungDAO();
			cs.KetNoi();
			String sql="delete from PHIM where ID_PHIM=?";
			PreparedStatement cmd=cs.cn.prepareStatement(sql);
			cmd.setLong(1, idPhim);
			cmd.executeUpdate();
			cs.dongketnoi();
		}
		
		//Them phim
		public int insertFilm(String tenPhim, String thoiLuong, String moTaNgan, String daoDien, String dienVien,
				String hinhAnh1, String hinhAnh2, String hinhAnh3, String hinhAnh4, String video, String theLoai,
				Date ngayCongChieu, int gioiHanTuoi, String dinhDangPhim){
			NguoiDungDAO cs=new NguoiDungDAO();
			int i = 0;
			try {
				cs.KetNoi();
				String sql="insert into PHIM(TENPHIM, THOILUONG,MOTANGAN,DAODIEN,DIENVIEN,HINHANH1,HINHANH2,HINHANH3,HINHANH4,VIDEO,THELOAI,NGAYCONGCHIEU,GIOIHANTUOI,DINHDANGPHIM,TRANGTHAI) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,'1')";
				PreparedStatement cmd=cs.cn.prepareStatement(sql);
				cmd.setString(1, tenPhim);
				cmd.setString(2, thoiLuong);
				cmd.setString(3, moTaNgan);
				cmd.setString(4, daoDien);
				cmd.setString(5, dienVien);
				cmd.setString(6, hinhAnh1);
				cmd.setString(7, hinhAnh2);
				cmd.setString(8, hinhAnh3);
				cmd.setString(9, hinhAnh4);
				cmd.setString(10, video);
				cmd.setString(11, theLoai);
				cmd.setDate(12, new java.sql.Date(ngayCongChieu.getTime()));
				cmd.setInt(13, gioiHanTuoi);
				cmd.setString(14, dinhDangPhim);
				i=cmd.executeUpdate();
				cs.dongketnoi();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return i;
		}
		
}
