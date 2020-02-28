package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.FilmBEAN;
import model.bo.FilmBO;
import model.bo.VeGheBO;
import model.bo.ViewDayTheoPhongBO;
import model.bo.ViewGheTheoPhongBO;

/**
 * Servlet implementation class DBSelectSeat
 */
@WebServlet("/DBSelectSeat")
public class DBSelectSeat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DBSelectSeat() {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		FilmBO fi = new FilmBO();
		ViewGheTheoPhongBO vig = new ViewGheTheoPhongBO();
		ViewDayTheoPhongBO vid = new ViewDayTheoPhongBO();
		VeGheBO ve = new VeGheBO();
		HttpSession session = request.getSession();
		if (request.getParameter("idF") != null && request.getParameter("idS") != null
				&& request.getParameter("idP") != null) {
			if(session.getAttribute("taiKhoan1")==null) {
				response.sendRedirect("DBLogin?selectseat="+request.getParameter("idF"));
			}else {
				request.setAttribute("taiKhoan", session.getAttribute("taiKhoan1"));
				try {
					FilmBEAN film = fi.getInfoFilm(Long.parseLong(request.getParameter("idF")));
					if (film != null) {
						request.setAttribute("infoFilm", film);
					}
					if (fi.getInfoFilm(Long.parseLong(request.getParameter("idF"))) == null) {
						response.sendRedirect("index");

					}
					request.setAttribute("listGheDaDat", ve.listVeGheTheoSuat(Long.parseLong(request.getParameter("idS"))));
					request.setAttribute("listGheTheoPhong", vig.listGheTheoPhong(Long.parseLong(request.getParameter("idP"))));
					request.setAttribute("listDayTheoPhong", vid.listGheTheoPhong(Long.parseLong(request.getParameter("idP"))));
					request.setAttribute("listFilmDangChieu", fi.listFilmDangChieu());
					request.setAttribute("listFilmSapChieu", fi.listFilmSapChieu());
					request.setAttribute("listFilmChieuSom", fi.listFilmChieuSom());
					request.setAttribute("sukientattab", "true");
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.getRequestDispatcher("DBSelectSeat.jsp").forward(request, response);
			}
		} else {
			response.sendRedirect("index");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
