package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.ADFilmBEAN;
import model.bean.AccountBEAN;
import model.bo.AccountBO;
import model.bo.FilmBO;
import model.bo.StatisticsBO;

/**
 * Servlet implementation class Home
 */
@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Home() {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		FilmBO film = new FilmBO();
		AccountBO ac = new AccountBO();
		StatisticsBO tk = new StatisticsBO();
		HttpSession session = request.getSession();
		if (session.getAttribute("taiKhoan") != null) {
			AccountBEAN taiKhoan = (AccountBEAN) session.getAttribute("taiKhoan");
			try {
				request.setAttribute("taiKhoan", taiKhoan);
				request.setAttribute("countFilm", film.countFilm());
				request.setAttribute("countAccount", ac.countAccount());
				request.setAttribute("listFilm", film.getFilm());
				request.setAttribute("doanhSo", tk.getDoanhSo());
				request.setAttribute("doanhThu", tk.getDoanhThu());
				request.setAttribute("tongDoanhThu", tk.tongDoanhThu());
				request.setAttribute("hoaDon", tk.demHoaDon());

			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				int startFilm=1;
				if(request.getParameter("startFilm")!=null) {
					startFilm=(Integer.parseInt(request.getParameter("startFilm"))-1)*10+1;
				}
				else {
					startFilm=1;
				}					
				
				int countFilm = film.countFilm();
				ArrayList<ADFilmBEAN> listFilm = film.getFilm(startFilm);
				request.setAttribute("currentSelectThang", -1);
				request.setAttribute("currentSelectNam", -1);
				if (request.getParameter("txt_thang") == null && request.getParameter("txt_nam") == null) {
					request.setAttribute("listFilm", listFilm);
					request.setAttribute("countFilm", countFilm);
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}

				int thang = Integer.parseInt(request.getParameter("txt_thang"));
				int nam = Integer.parseInt(request.getParameter("txt_nam"));
				request.setAttribute("currentSelectThang", thang);
				request.setAttribute("currentSelectNam", nam);
				listFilm = film.search(thang, nam, startFilm);
				countFilm = film.countSearch(thang, nam);
				response.getWriter().append(
						"Thang: " + request.getParameter("txt_thang") + " ; nam: " + request.getParameter("txt_nam"));
				System.out.println(countFilm);
				request.setAttribute("listFilm", listFilm);
				request.setAttribute("countFilm", countFilm);
				
				request.getRequestDispatcher("index.jsp?txt_thang="+thang+"&txt_nam="+nam).forward(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}

		} else {
			response.sendRedirect("Login");
		}
	}

}
