package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.EventBO;
import model.bo.FilmBO;
import model.bo.GiamGiaBO;

/**
 * Servlet implementation class DBPromotion
 */
@WebServlet("/DBPromotion")
public class DBPromotion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBPromotion() {
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
		EventBO event=new EventBO();
		GiamGiaBO gg=new GiamGiaBO();
		HttpSession session = request.getSession();
		if(session.getAttribute("taiKhoan1")!=null) {
			request.setAttribute("taiKhoan", session.getAttribute("taiKhoan1"));
		}
		try {
			request.setAttribute("listFilmDangChieu", fi.listFilmDangChieu());
			request.setAttribute("listFilmSapChieu", fi.listFilmSapChieu());
			request.setAttribute("listFilmChieuSom", fi.listFilmChieuSom());
			request.setAttribute("listEvent", event.getEvent());
			request.setAttribute("listGiamGia", gg.listKhuyenMai());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("DBPromotion.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
