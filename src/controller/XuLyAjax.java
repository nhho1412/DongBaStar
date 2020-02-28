package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.GiamGiaBEAN;
import model.bean.InfoAccountBEAN;
import model.bo.GheChoBO;
import model.bo.GiamGiaBO;

/**
 * Servlet implementation class XuLyAjax
 */
@WebServlet("/XuLyAjax")
public class XuLyAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XuLyAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
//		DecimalFormat formatter = new DecimalFormat("###,###,###");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		GiamGiaBO gi = new GiamGiaBO();
		GheChoBO gh = new GheChoBO();
		HttpSession session = request.getSession();
		if(session.getAttribute("taiKhoan1")!=null) {
			InfoAccountBEAN tk = (InfoAccountBEAN) session.getAttribute("taiKhoan1");
			try {
				if( request.getParameter("loadDSGheDat")!=null && request.getParameter("idSuat")!=null) {
					long idSuat = Long.parseLong(request.getParameter("idSuat"));
					System.out.println(idSuat);
					String listGheCho = new String();
					for(Long ghe : gh.dsIDGheCho(idSuat, tk.getIdTaiKhoan())) {
						listGheCho = listGheCho + ";" + ghe.longValue();
						
					}
					out.print(listGheCho);
				}
				
				if( request.getParameter("loadDSGheDatUser")!=null && request.getParameter("idSuat")!=null) {
					long idSuat = Long.parseLong(request.getParameter("idSuat"));
					System.out.println(idSuat);
					String listGheChoUser = new String();
					for(Long ghe : gh.dsIDGheChoUser(idSuat, tk.getIdTaiKhoan())) {
						listGheChoUser = listGheChoUser + ";" + ghe.longValue();
					}
					out.print(listGheChoUser);
				}
				
				if( request.getParameter("select_seat")!=null && request.getParameter("idSuat")!=null) {
					long idGhe  = Long.parseLong(request.getParameter("select_seat"));
					long idSuat = Long.parseLong(request.getParameter("idSuat"));
					String listGheCho = "";
					if(gh.kiemTraGheCho(idGhe, idSuat, tk.getIdTaiKhoan())==false) {
						gh.themGheCho(idGhe, idSuat, tk.getIdTaiKhoan());
						listGheCho ="true";
					}else {
						listGheCho ="false";
					}
					
					for(Long ghe : gh.dsIDGheCho(idSuat, tk.getIdTaiKhoan())) {
						listGheCho = listGheCho + ";" + ghe.longValue();
						
					}
					out.print(listGheCho);
				}
				if( request.getParameter("select_seat_down")!=null && request.getParameter("idSuat_down")!=null) {
					long idGhe  = Long.parseLong(request.getParameter("select_seat_down"));
					long idSuat = Long.parseLong(request.getParameter("idSuat_down"));
					gh.xoaChoGhe(idGhe, idSuat, tk.getIdTaiKhoan());
					//System.out.println("da xoa");
					String listGheCho = "";
					for(Long ghe : gh.dsIDGheCho(idSuat, tk.getIdTaiKhoan())) {
						listGheCho = listGheCho + ";" + ghe.longValue();
						
					}
					out.print(listGheCho);
				}
				GiamGiaBEAN ggb = new GiamGiaBEAN();
				if(request.getParameter("MGG")!=null) {
					String maGiamGia = request.getParameter("MGG");
					try {
						ggb = gi.infoGG(maGiamGia);
						if(ggb == null) {
							out.print("error");
						}else {
							out.print(ggb.getIdKhuyenMai()+";"+ggb.getIdLoaiKhuyenMai()+";"+ggb.getChietKhau());
						}
						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						out.print("error");
						
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
				
				//e.getStackTrace();
				//System.out.println("loi o day XuLyAjax");
				//e.printStackTrace();
			}
			
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
