package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.AccountBEAN;
import model.bo.AccountBO;
import model.bo.EventBO;
import model.bo.FilmBO;

/**
 * Servlet implementation class XuLy
 */
@WebServlet("/XuLy")
public class XuLy extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XuLy() {
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
		AccountBO acb = new AccountBO();
		FilmBO film=new FilmBO();
		EventBO event=new EventBO();
		HttpSession session = request.getSession();
		if (session.getAttribute("taiKhoan") != null) {

			AccountBEAN taiKhoan = (AccountBEAN) session.getAttribute("taiKhoan");
			try {
				request.setAttribute("taiKhoan", acb.getInfo(taiKhoan.getIdTaiKhoan()));
			} catch (Exception e) { // TODO Auto-generated catch block e.printStackTrace();
			}

			if (request.getParameter("deleteAccount") != null) {
				long idTaiKhoan = Long.parseLong(request.getParameter("deleteAccount"));
				try {
					acb.deleteAccount(idTaiKhoan);
					//response.sendRedirect("Account?deleteAccount=" + idTaiKhoan);
					request.setAttribute("noti", "1");
					 response.sendRedirect("Account");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (request.getParameter("deleteFilm") != null) {
				long idPhim = Long.parseLong(request.getParameter("deleteFilm"));
				try {
					film.deleteFilm(idPhim);
					//response.sendRedirect("Account?deleteAccount=" + idTaiKhoan);
					request.setAttribute("noti", "1");
					 response.sendRedirect("Film");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (request.getParameter("deleteEvent") != null) {
				long idSuKien = Long.parseLong(request.getParameter("deleteEvent"));
				try {
					event.deleteEvent(idSuKien);
					//response.sendRedirect("Account?deleteAccount=" + idTaiKhoan);
					request.setAttribute("noti", "1");
					 response.sendRedirect("Event");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (request.getParameter("logout") != null) {
				session.removeAttribute("taiKhoan");
				response.sendRedirect("Login");
			}
		} else {
			response.sendRedirect("Login");
		}
	}

}
