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
 * Servlet implementation class Account
 */
@WebServlet("/Account")
public class Account extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Account() {
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
			HttpSession session = request.getSession();
			AccountBO acb = new AccountBO();
			request.setAttribute("noti", "0");
			if (session.getAttribute("taiKhoan") != null) {
				AccountBEAN taiKhoan = (AccountBEAN) session.getAttribute("taiKhoan");
				request.setAttribute("taiKhoan", taiKhoan);
				if (request.getParameter("edit") != null && request.getParameter("hoTen") != null) {
					String hoTen = request.getParameter("hoTen");
					String matKhau = request.getParameter("matKhau");
					String taiKhoann = request.getParameter("taiKhoann");
					String soDienThoai = request.getParameter("soDienThoai");
					String diaChi = request.getParameter("diaChi");
					String email = request.getParameter("email");
					int diemTichLuy = Integer.parseInt(request.getParameter("diemTichLuy"));
					long idLoaiTaiKhoan = Long.parseLong(request.getParameter("idLoaiTaiKhoan"));
					long idTaiKhoan = Long.parseLong(request.getParameter("edit"));
					acb.updateInfoAccount(idTaiKhoan, idLoaiTaiKhoan, taiKhoann, matKhau, hoTen, soDienThoai, diaChi,
							email, diemTichLuy);
					request.setAttribute("noti", "2");
					response.sendRedirect("Account");
					request.setAttribute("taiKhoan", acb.checkLoginAdmin(taiKhoann, matKhau));
					session.setAttribute("taiKhoan", acb.checkLoginAdmin(taiKhoann, matKhau));
				}
				if (request.getParameter("edit1") != null && request.getParameter("hoTen") != null) {
					String hoTen = request.getParameter("hoTen");
					String matKhau = request.getParameter("matKhau");
					String taiKhoann = request.getParameter("taiKhoann");
					String soDienThoai = request.getParameter("soDienThoai");
					String diaChi = request.getParameter("diaChi");
					String email = request.getParameter("email");
					int diemTichLuy = Integer.parseInt(request.getParameter("diemTichLuy"));
					long idLoaiTaiKhoan = Long.parseLong(request.getParameter("idLoaiTaiKhoan"));
					long idTaiKhoan = Long.parseLong(request.getParameter("edit1"));
					acb.updateInfoAccount(idTaiKhoan, idLoaiTaiKhoan, taiKhoann, matKhau, hoTen, soDienThoai, diaChi,
							email, diemTichLuy);
					request.setAttribute("noti", "2");
				}

				try {
					request.setAttribute("listAccount", acb.getAccount());
					int startVang =1;
					int startBac=1;
					int startDong=1;
					if(request.getParameter("startVang")!=null) {
						startVang=(Integer.parseInt(request.getParameter("startVang"))-1)*8+1;
					}
					else {
						startVang=1;
					}					
					request.setAttribute("listAccountVang", acb.getAccountVang(startVang));
					
					if(request.getParameter("startBac")!=null) {
						startBac=(Integer.parseInt(request.getParameter("startBac"))-1)*8+1;
					}
					else {
						startBac=1;
					}
					request.setAttribute("listAccountBac", acb.getAccountBac(startBac));
					
					if(request.getParameter("startDong")!=null) {
						startDong=(Integer.parseInt(request.getParameter("startDong"))-1)*8+1;
					}
					else {
						startDong=1;
					}
					request.setAttribute("listAccountDong", acb.getAccountDong(startDong));
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println("Loi o day");
				}
				request.setAttribute("countVang", acb.countAccountVang());
				request.setAttribute("countBac", acb.countAccountBac());
				request.setAttribute("countDong", acb.countAccountDong());
				
				RequestDispatcher rd = request.getRequestDispatcher("account.jsp");
				rd.forward(request, response);

			} else {
				response.sendRedirect("Login");
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
