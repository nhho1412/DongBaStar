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
import model.bo.HoaDonBO;

/**
 * Servlet implementation class DBXuLy
 */
@WebServlet("/DBXuLy")
public class DBXuLy extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DBXuLy() {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HoaDonBO hd = new HoaDonBO();
		AccountBO ac = new AccountBO();
		HttpSession session = request.getSession();
		InfoAccountBEAN taiKhoan = (InfoAccountBEAN) session.getAttribute("taiKhoan1");
		try {
			if (request.getParameter("idHD") != null && request.getParameter("totalPrice") != null) {
				long idHoaDon = Long.parseLong(request.getParameter("idHD"));
				float tongTien = Float.parseFloat(request.getParameter("totalPrice"));
				if (request.getParameter("MGG") != null && request.getParameter("GDG") != null) {
					String maGiamGia = request.getParameter("MGG");
					long giaDuocGiam = Long.parseLong(request.getParameter("GDG"));
					hd.thanhToanHoaDonMGG(idHoaDon, tongTien, maGiamGia, giaDuocGiam);
				} else {
					hd.thanhToanHoaDonCMGG(idHoaDon, tongTien);
				}
				
				int diemTichLuy = (int) (tongTien/10000);
				System.out.println(diemTichLuy);
				ac.updateDiemTichLuy(taiKhoan.getIdTaiKhoan(), diemTichLuy);
				int dtl = ac.getDiemTichLuy(taiKhoan.getIdTaiKhoan());
				if(dtl<=200) {
					ac.updateloaiTaiKhoan(taiKhoan.getIdTaiKhoan(), 4);
				}
				if(dtl>200 && dtl<=500) {
					ac.updateloaiTaiKhoan(taiKhoan.getIdTaiKhoan(), 3);
				}
				if(dtl>500) {
					ac.updateloaiTaiKhoan(taiKhoan.getIdTaiKhoan(), 2);
				}
				session.setAttribute("taiKhoan1", ac.checkLoginUser(taiKhoan.getTaiKhoan(), taiKhoan.getMatKhau()));
				response.sendRedirect("DBBookingDetails?idHD=" + idHoaDon);
			}
			if (request.getParameter("quantily") != null || request.getParameter("idS") != null) {
				long idSuat = Long.parseLong(request.getParameter("idS"));
				// add hoa don
				long idCurrentHoaDon = 0;
				try {
					hd.insertHoaDon(taiKhoan.getIdTaiKhoan(), idSuat);
					idCurrentHoaDon = hd.maxIDHoaDonTheoTaiKhoan(taiKhoan.getIdTaiKhoan());
					int quantity = Integer.parseInt(request.getParameter("quantily"));
					for (int i = 0; i < quantity; i++) {
						System.out.println("seat"+i);
						long idGhe = Long.parseLong(request.getParameter("seat" + i));
						hd.insertVeGhe(idGhe, idCurrentHoaDon, idSuat);
					}
					response.sendRedirect("DBCheckOut?id="+idCurrentHoaDon);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				// add chi tiet hoa don
			}
		} catch (Exception e) {
			// TODO: handle exception
			response.sendRedirect("index");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
