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
import model.bo.EventBO;

/**
 * Servlet implementation class Event
 */
@WebServlet("/Event")
public class Event extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Event() {
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
			EventBO event=new EventBO();
			HttpSession session = request.getSession();
			request.setAttribute("noti", "0");
			if (session.getAttribute("taiKhoan") != null) {
				AccountBEAN taiKhoan = (AccountBEAN) session.getAttribute("taiKhoan");
				request.setAttribute("taiKhoan", taiKhoan);
				if(request.getParameter("edit")!=null&&request.getParameter("tenSuKien")!=null) {
					String tenSuKien=request.getParameter("tenSuKien");
					String moTa=request.getParameter("moTa");
					String anhSuKien=request.getParameter("anhSuKien");
					long idSuKien=Long.parseLong(request.getParameter("edit"));
					event.updateEvent(idSuKien, tenSuKien, moTa, anhSuKien);
					request.setAttribute("noti", "2");
				}
				if(request.getParameter("insert")!=null&&request.getParameter("tenSuKien")!=null) {
					String tenSuKien=request.getParameter("tenSuKien");
					String moTa=request.getParameter("moTa");
					String anhSuKien=request.getParameter("anhSuKien");
					event.insertEvent(tenSuKien, moTa, anhSuKien);
					request.setAttribute("noti", "3");
				}
			
			int startSuKien=1;
			if(request.getParameter("startSuKien")!=null) {
				startSuKien=(Integer.parseInt(request.getParameter("startSuKien"))-1)*8+1;
			}else {
				startSuKien=1;
			}
			
			request.setAttribute("listEvent", event.getEvent(startSuKien));
			request.setAttribute("countSuKien", event.countEvent());
			RequestDispatcher rd = request.getRequestDispatcher("event.jsp");
			rd.forward(request, response);
			}else {
				response.sendRedirect("Login");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
