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

/**
 * Servlet implementation class Info
 */
@WebServlet("/Info")
public class Info extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Info() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			AccountBO acb=new AccountBO();
			request.setAttribute("noti", "0");
			if(session.getAttribute("taiKhoan")!=null) {
				AccountBEAN taiKhoan=(AccountBEAN)session.getAttribute("taiKhoan");
				request.setAttribute("taiKhoan",taiKhoan);
				if(request.getParameter("edit")!=null&&request.getParameter("hoTen")!=null) {
					String hoTen=request.getParameter("hoTen");
					String matKhau=request.getParameter("matKhau");
					String taiKhoann=request.getParameter("taiKhoann");
					String soDienThoai=request.getParameter("soDienThoai");
					String diaChi=request.getParameter("diaChi");
					String email=request.getParameter("email");
					int diemTichLuy=taiKhoan.getDiemTichLuy();
					long idLoaiTaiKhoan=taiKhoan.getIdLoaiTaiKhoan();
					long idTaiKhoan=taiKhoan.getIdTaiKhoan();
					acb.updateInfoAdmin(idTaiKhoan, idLoaiTaiKhoan, taiKhoann, matKhau, hoTen, soDienThoai, diaChi, email, diemTichLuy);
					request.setAttribute("noti", "1");
					request.setAttribute("taiKhoan", acb.checkLoginAdmin(taiKhoann, matKhau));
					session.setAttribute("taiKhoan", acb.checkLoginAdmin(taiKhoann, matKhau));
				}
				request.getRequestDispatcher("info.jsp").forward(request, response);

			}else {
				response.sendRedirect("Login");
			}
			
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("lỗi");
		}
	}

}
