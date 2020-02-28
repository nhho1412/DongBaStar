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
import model.bo.SuatBO;

/**
 * Servlet implementation class DBSelectShowtime
 */
@WebServlet("/DBSelectShowtime")
public class DBSelectShowtime extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBSelectShowtime() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		FilmBO fi = new FilmBO();
		SuatBO su = new SuatBO();
		if(request.getParameter("id")!=null) {
			HttpSession session = request.getSession();
			if(session.getAttribute("taiKhoan1")!=null) {
				request.setAttribute("taiKhoan", session.getAttribute("taiKhoan1"));
			}
			try {
				FilmBEAN film = fi.getInfoFilm(Long.parseLong(request.getParameter("id")));
				if(film!=null) {
					request.setAttribute("infoFilm", film);
				}
				if(fi.getInfoFilm(Long.parseLong(request.getParameter("id")))==null) {
					response.sendRedirect("index");
				
				}
				
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			try {
				request.setAttribute("listSuatChieu", su.suatTheoFilm(Long.parseLong(request.getParameter("id"))));
			} catch (NumberFormatException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			try {
				request.setAttribute("listFilmDangChieu", fi.listFilmDangChieu());
				request.setAttribute("listFilmSapChieu", fi.listFilmSapChieu());
				request.setAttribute("listFilmChieuSom", fi.listFilmChieuSom());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("DBSelectShowtime.jsp").forward(request, response);
		}else {
			response.sendRedirect("index");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
