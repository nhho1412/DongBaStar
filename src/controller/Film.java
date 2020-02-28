package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.ADFilmBEAN;
import model.bean.AccountBEAN;
import model.bo.FilmBO;

/**
 * Servlet implementation class Film
 */
@WebServlet("/Film")
public class Film extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Film() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		FilmBO film = new FilmBO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		request.setAttribute("noti", "0");

		if (session.getAttribute("taiKhoan") != null) {
			AccountBEAN taiKhoan = (AccountBEAN) session.getAttribute("taiKhoan");
			try {
				request.setAttribute("taiKhoan", taiKhoan);
				if (request.getParameter("insert") != null && request.getParameter("tenPhim") != null) {
					String tenPhim = request.getParameter("tenPhim");
					String thoiLuong = request.getParameter("thoiLuong");
					String moTaNgan = request.getParameter("moTaNgan");
					String daoDien = request.getParameter("daoDien");
					String dienVien = request.getParameter("dienVien");
					String hinhAnh1 = request.getParameter("hinhAnh1");
					String hinhAnh2 = request.getParameter("hinhAnh2");
					String hinhAnh3 = request.getParameter("hinhAnh3");
					String hinhAnh4 = request.getParameter("hinhAnh4");
					String video = request.getParameter("video");
					String theLoai = request.getParameter("theLoai");
					SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
					Date ngayCongChieu = dd.parse(request.getParameter("ngayCongChieu"));
					int gioiHanTuoi = Integer.parseInt(request.getParameter("gioiHanTuoi"));
					String dinhDangPhim = request.getParameter("dinhDangPhim");
					film.insertFilm(tenPhim, thoiLuong, moTaNgan, daoDien, dienVien, hinhAnh1, hinhAnh2, hinhAnh3,
							hinhAnh4, video, theLoai, ngayCongChieu, gioiHanTuoi, dinhDangPhim);
					request.setAttribute("noti", "3");
				}

				if (request.getParameter("edit") != null && request.getParameter("tenPhim") != null) {
					String tenPhim = request.getParameter("tenPhim");
					String thoiLuong = request.getParameter("thoiLuong");
					String moTaNgan = request.getParameter("moTaNgan");
					String daoDien = request.getParameter("daoDien");
					String dienVien = request.getParameter("dienVien");
					String hinhAnh1 = request.getParameter("hinhAnh1");
					String hinhAnh2 = request.getParameter("hinhAnh2");
					String hinhAnh3 = request.getParameter("hinhAnh3");
					String hinhAnh4 = request.getParameter("hinhAnh4");
					String video = request.getParameter("video");
					String theLoai = request.getParameter("theLoai");
					SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
					Date ngayCongChieu = dd.parse(request.getParameter("ngayCongChieu"));
					int gioiHanTuoi = Integer.parseInt(request.getParameter("gioiHanTuoi"));
					String dinhDangPhim = request.getParameter("dinhDangPhim");
					boolean trangThai = Boolean.parseBoolean(request.getParameter("trangThai"));
					long idPhim = Long.parseLong(request.getParameter("edit"));
					film.updateFilm(idPhim, tenPhim, thoiLuong, moTaNgan, daoDien, dienVien, hinhAnh1, hinhAnh2,
							hinhAnh3, hinhAnh4, video, theLoai, ngayCongChieu, gioiHanTuoi, dinhDangPhim, trangThai);
					request.setAttribute("noti", "2");
				}

				ArrayList<ADFilmBEAN> listFilm = film.getFilm();
				request.setAttribute("currentSelectThang", -1);
				request.setAttribute("currentSelectNam", -1);
				if (request.getParameter("txt_thang") == null && request.getParameter("txt_nam") == null) {
					request.setAttribute("listFilm", listFilm);
					request.getRequestDispatcher("film.jsp").forward(request, response);
				}

				int thang = Integer.parseInt(request.getParameter("txt_thang"));
				int nam = Integer.parseInt(request.getParameter("txt_nam"));
				request.setAttribute("currentSelectThang", thang);
				request.setAttribute("currentSelectNam", nam);
				listFilm = film.searchTN(thang, nam);
				request.setAttribute("listFilm", listFilm);

				response.getWriter().append(
						"Thang: " + request.getParameter("txt_thang") + " ; nam: " + request.getParameter("txt_nam"));
				request.setAttribute("listFilm", listFilm);

				request.getRequestDispatcher("film.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}

		} else {
			response.sendRedirect("Login");
		}
	}

}
