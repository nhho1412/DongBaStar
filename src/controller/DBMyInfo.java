package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.InfoAccountBEAN;
import model.bo.AccountBO;
import model.bo.FilmBO;
import model.bo.HoaDonBO;

/**
 * Servlet implementation class DBMyInfo
 */
@WebServlet("/DBMyInfo")
public class DBMyInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBMyInfo() {
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
		AccountBO ac = new AccountBO();
		HttpSession session = request.getSession();
		if(session.getAttribute("taiKhoan1")!=null) {
			InfoAccountBEAN taiKhoan = (InfoAccountBEAN) session.getAttribute("taiKhoan1");
			request.setAttribute("taiKhoan", taiKhoan);
			try {
				request.setAttribute("listFilmDangChieu", fi.listFilmDangChieu());
				request.setAttribute("listFilmSapChieu", fi.listFilmSapChieu());
				request.setAttribute("listFilmChieuSom", fi.listFilmChieuSom());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(request.getParameter("change")!=null&&request.getParameter("passOld")!=null){
				String passOld = request.getParameter("passOld");
				String passNew = request.getParameter("passNew");
				try {
					ac.changePass(taiKhoan.getTaiKhoan(), passOld, passNew);
					request.setAttribute("info", 1);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					request.setAttribute("info", 2);
				}
			}
			try {
				request.setAttribute("lichsudatve", hd.lichSuDatVe(taiKhoan.getIdTaiKhoan()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("DBMyInfo.jsp").forward(request, response);
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
