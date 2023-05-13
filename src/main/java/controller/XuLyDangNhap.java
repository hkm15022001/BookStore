package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.KhachHangDAO;
import model.KhachHang;
/**
 * Servlet implementation class XuLyDangNhap
 */
@WebServlet("/xulydangnhap")
public class XuLyDangNhap extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XuLyDangNhap() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tenDangNhap = request.getParameter("tenDangNhap");
		String matKhau = request.getParameter("matKhau");
		String url ="",error="";
		
		
		KhachHang kh =new KhachHang();
		KhachHang khTruyVan =new KhachHang();
		kh.setTenDangNhap(tenDangNhap);
		kh.setMatKhau(matKhau);
		
		KhachHangDAO khdao = new KhachHangDAO();
		khTruyVan = khdao.selectByUsernameAndPassword(kh);
		if(khTruyVan != null) {
			HttpSession session = request.getSession();
			session.setAttribute("khachHang", khTruyVan);
			url = "/HomePage.jsp";
		} else {
			error = "Thông tin tài khoản chưa chính xác!";
			
			url = "/dangnhap.jsp";
		}
		request.setAttribute("error", error);
		
		RequestDispatcher rq = request.getServletContext().getRequestDispatcher(url);
		rq.forward(request, response);
	}
	
}
