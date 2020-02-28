package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.AccountBO;
import model.bo.FilmBO;

/**
 * Servlet implementation class DongBaRegister
 */
@WebServlet("/DBRegister")
public class DBRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			AccountBO acb = new AccountBO();
			HttpSession session = request.getSession();
			if(session.getAttribute("taiKhoan1")==null) {
				if(request.getParameter("register")!=null && request.getParameter("taikhoan")!=null) {
					String taiKhoan=request.getParameter("taikhoan");
					String hoTen=request.getParameter("hoten");
					String diaChi=request.getParameter("diaChi");
					String email=request.getParameter("email");
					String sdt=request.getParameter("sdt");
					String matKhau=request.getParameter("password");
					int insert = acb.insertUser(taiKhoan, matKhau, hoTen, sdt, diaChi, email);
					if(insert==0) {
						request.setAttribute("noti", "0"); // trung tai khoan
					}
					if(insert==1) {
						request.setAttribute("noti", "1"); // trung email
					}
					if(insert==3) {
						request.setAttribute("noti", "3"); // trung email
					}
					if(insert==2) {
						request.setAttribute("noti", "2"); // them thanh cong
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
				request.getRequestDispatcher("DBRegister.jsp").forward(request, response);
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
