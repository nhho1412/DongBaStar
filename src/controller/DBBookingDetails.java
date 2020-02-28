package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.InfoAccountBEAN;
import model.bo.FilmBO;
import model.bo.HoaDonBO;

/**
 * Servlet implementation class DBBookingDetails
 */
@WebServlet("/DBBookingDetails")
public class DBBookingDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBBookingDetails() {
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
		HoaDonBO hd = new HoaDonBO();
		HttpSession session = request.getSession();
		if(session.getAttribute("taiKhoan1")!=null) {
			InfoAccountBEAN taiKhoan = (InfoAccountBEAN)session.getAttribute("taiKhoan1");
			request.setAttribute("taiKhoan", session.getAttribute("taiKhoan1"));
			try {
				request.setAttribute("listFilmDangChieu", fi.listFilmDangChieu());
				request.setAttribute("listFilmSapChieu", fi.listFilmSapChieu());
				request.setAttribute("listFilmChieuSom", fi.listFilmChieuSom());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(request.getParameter("idHD")==null) {
				response.sendRedirect("index");
			}
			long idCurrentHoaDon = Long.parseLong(request.getParameter("idHD"));
			try {
				request.setAttribute("chiTietHoaDon", hd.infoChiTietHoaDon(idCurrentHoaDon, taiKhoan.getIdTaiKhoan()));
				request.setAttribute("chiTietThanhToan", hd.infoChiTietThanhToan(idCurrentHoaDon));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("DBBookingDetails.jsp").forward(request, response);
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
