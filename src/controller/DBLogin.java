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
/**
 * Servlet implementation class DongBaLogin
 */
@WebServlet("/DBLogin")
public class DBLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBLogin() {
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
		AccountBO acb = new AccountBO();
		HttpSession session = request.getSession();
		try {
		if(session.getAttribute("taiKhoan1")==null) {
			if (request.getParameter("matKhau") != null && request.getParameter("taiKhoan") != null) {
				String taiKhoan = request.getParameter("taiKhoan");
				String matKhau = request.getParameter("matKhau");
				if (acb.checkLoginUser(taiKhoan, matKhau) != null) {
					InfoAccountBEAN ac = new InfoAccountBEAN();
					ac = acb.checkLoginUser(taiKhoan, matKhau);
					session.setAttribute("taiKhoan1", ac);
					request.setAttribute("taiKhoan", ac);
					if(request.getParameter("id")!=null) {
						response.sendRedirect("DBSelectShowtime?id="+request.getParameter("id")+"#book");
					}
					response.sendRedirect("index");
					// dang nhap thanh cong
				} else {
					request.setAttribute("noti", "0");
				}
			}
			FilmBO fi = new FilmBO();
			try {
				request.setAttribute("listFilmDangChieu", fi.listFilmDangChieu());
				request.setAttribute("listFilmSapChieu", fi.listFilmSapChieu());
				request.setAttribute("listFilmChieuSom", fi.listFilmChieuSom());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("DBLogin.jsp?").forward(request, response);
		}
		if(request.getParameter("logOut")!= null && request.getParameter("logOut").equals("true")) {
			session.removeAttribute("taiKhoan1");
			response.sendRedirect("DBLogin");
		}
		response.sendRedirect("index");
		
		} catch (Exception e) {
			// TODO: handle exception
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
