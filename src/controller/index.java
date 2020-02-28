package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.InfoAccountBEAN;
import model.bo.EventBO;
import model.bo.FilmBO;
import model.bo.GiamGiaBO;

/**
 * Servlet implementation class index
 */
@WebServlet("/index")
public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public index() {
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
		EventBO ev = new EventBO();
		GiamGiaBO gg = new GiamGiaBO();
		HttpSession session = request.getSession();
		
		try {
			request.setAttribute("listFilmDangChieu", fi.listFilmDangChieu());
			request.setAttribute("listFilmSapChieu", fi.listFilmSapChieu());
			request.setAttribute("listFilmChieuSom", fi.listFilmChieuSom());
			request.setAttribute("listSuKien", ev.getEvent());
			request.setAttribute("listKhuyenMai", gg.listKhuyenMai());
			request.setAttribute("listSildeFilm", fi.listFilmSilde());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(session.getAttribute("taiKhoan1")!=null) {
			InfoAccountBEAN taiKhoan=(InfoAccountBEAN)session.getAttribute("taiKhoan1");
			request.setAttribute("taiKhoan",taiKhoan);
		}
		request.getRequestDispatcher("DBindex.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
