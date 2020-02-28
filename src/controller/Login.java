package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.AccountBEAN;
import model.bo.AccountBO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
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
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			AccountBO acb = new AccountBO();
			HttpSession session = request.getSession();
			request.setAttribute("noti", "1");
			if (request.getParameter("matKhau") != null && request.getParameter("taiKhoan") != null) {
				String taiKhoan = request.getParameter("taiKhoan");
				String matKhau = request.getParameter("matKhau");

				try {
					if (acb.checkLoginAdmin(taiKhoan, matKhau) != null) {
						AccountBEAN ac = new AccountBEAN();
						ac = acb.checkLoginAdmin(taiKhoan, matKhau);
						session.setAttribute("taiKhoan", ac);
						request.setAttribute("taiKhoan", ac);
						request.setAttribute("noti", "-1");
						response.sendRedirect("Home");
						// dang nhap thanh cong
					} else {
						request.setAttribute("noti", "0");
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
			}

			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} catch (Exception e) {

		}
	}
}
