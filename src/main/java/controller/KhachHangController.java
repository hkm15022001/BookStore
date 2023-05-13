package controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.KhachHangDAO;
import model.KhachHang;
import util.Email;
import util.MaHoa;
import util.RandomNumber;

/**
 * Servlet implementation class KhachHangController
 */
@WebServlet("/khach-hang-controller")
public class KhachHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public KhachHangController() {
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
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		String hanhDong = request.getParameter("hanhDong");

		if (hanhDong.equals("dang-nhap")) {
			dangNhap(request, response);
		} else if (hanhDong.equals("dang-xuat")) {
			dangXuat(request, response);
		} else if (hanhDong.equals("dang-ky")) {
			dangKy(request, response);
		} else if (hanhDong.equals("doi-mat-khau")) {
			doiMatKhau(request, response);
		} else if (hanhDong.equals("thay-doi-thong-tin")) {
			thayDoiThongTin(request, response);
		} else if (hanhDong.equals("xac-thuc")) {
			xacThuc(request, response);
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

	private void xacThuc(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String maXacThuc = request.getParameter("maXacThuc") + "";
			String tenDangNhap = request.getParameter("tenDangNhap") + "";
			System.out.println(maXacThuc);

			String msg = "";

//			KhachHang kh =new KhachHang();
//			kh.setTenDangNhap(tenDangNhap);
			KhachHangDAO khachHangDAO = new KhachHangDAO();
			KhachHang kh1 = khachHangDAO.selectByUsername(tenDangNhap);
			//System.out.println(kh1.getMaXacThuc());
			 
			long now = System.currentTimeMillis();
			Timestamp checkTime = new Timestamp(now);
			if (kh1 != null) {
				if(checkTime.compareTo(kh1.getThoiGianXacThuc()) >= 0) {
					msg = "Đã quá thời gian xác thực, vui lòng thử lại!";
				} else {
					if (maXacThuc.equals(kh1.getMaXacThuc())) {
						kh1.setTrangThaiXacThuc(true);
						khachHangDAO.update(kh1);
						msg = "Xác thực tài khoản thành công, mời bạn đăng nhập!";
					} else {
						msg = "Mã xác thực chưa chính xác!";
					}
				}				
			} else {
				msg = "Khách hàng cần xác thực không tồn tại";
			}

			request.setAttribute("msg", msg);
			RequestDispatcher rq = getServletContext().getRequestDispatcher("/khachhang/xacthuc.jsp");
			rq.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void dangKy(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			String tenDangNhap = request.getParameter("tenDangNhap");
			String matKhau = request.getParameter("matKhau");
			// String nhapLaiMatKhau = request.getParameter("nhapLaiMatKhau");
			String hoVaTen = request.getParameter("hoVaTen");
			String gioiTinh = request.getParameter("gioiTinh");
			// System.out.println(gioiTinh);
			String ngaySinh = request.getParameter("ngaySinh");
			System.out.println(ngaySinh);
			String diaChiKhachHang = request.getParameter("diaChiKhachHang");
			String diaChiMuaHang = request.getParameter("diaChiMuaHang");
			String diaChiNhanHang = request.getParameter("diaChiNhanHang");
			String sdt = request.getParameter("sdt");
			String email = request.getParameter("email");
			String nhanBanTin = request.getParameter("nhanBanTin");
			request.setAttribute("tenDangNhap", tenDangNhap);
			request.setAttribute("hoVaTen", hoVaTen);
			request.setAttribute("gioiTinh", gioiTinh);
			request.setAttribute("ngaySinh", ngaySinh);
			request.setAttribute("diaChiKhachHang", diaChiKhachHang);
			request.setAttribute("diaChiMuaHang", diaChiMuaHang);
			request.setAttribute("diaChiNhanHang", diaChiNhanHang);
			request.setAttribute("dienThoai", sdt);
			request.setAttribute("dongYNhanMail", nhanBanTin);

			String url = "";
			Boolean flag = false;
			KhachHangDAO khachHangDAO = new KhachHangDAO();
//		ArrayList<KhachHang> arr=khachHangDAO.selectByUsername("a");
//		for(KhachHang a:arr) {
//			request.setAttribute("test", a.toString());
//		}
			if (tenDangNhap == null || tenDangNhap.trim().isEmpty()) {

				request.setAttribute("error_tendangnhap", "Ban chua nhap ten dang nhap");
				flag = true;
			}
			if (ngaySinh == null) {
				request.setAttribute("error_ngaySinh", "Cần điền thông tin ngày sinh");
				flag = true;
			}
			Pattern sdtPattern = Pattern.compile("\\d{10}");
			Matcher sdtMatcher = sdtPattern.matcher(sdt);
			if (!sdtMatcher.matches()) {
				request.setAttribute("error_sdt", "SDT phai gom 10 so");
				flag = true;
			}
			Pattern emailPattern = Pattern.compile("\\w+@\\w+(\\.\\w+)+(\\.\\w+)*");
			Matcher emailMatcher = emailPattern.matcher(email);
			if (!emailMatcher.matches()) {
				request.setAttribute("error_email", "Không đúng định dạng email");
				flag = true;
			}
			if (flag) {
				url = "/khachhang/dangky.jsp";
//			Random rd = new Random();
//			String maKhachHang = System.currentTimeMillis() + rd.nextInt(1000) +"";
//			KhachHang kh = new KhachHang(maKhachHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, diaChiKhachHang, diaChiNhanHang, diaChiMuaHang, Date.valueOf(ngaySinh), sdt, email, nhanBanTin!=null);
//			request.setAttribute("khachhang", kh.toString());
			} else {
				if (khachHangDAO.selectByUsername(tenDangNhap) != null) {
					//System.out.println(khachHangDAO.selectByUsername(tenDangNhap).toString());
					request.setAttribute("error_tendangnhap", "Tên đăng nhập đã tồn tại");
					url = "/khachhang/dangky.jsp";
				} else {
					//System.out.println("vao");
					
					// create id
					Random rd = new Random();
					String maKhachHang = System.currentTimeMillis() + rd.nextInt(1000) + "";
					
					// create auth code
					String code = RandomNumber.getSoNgauNhien();
					
					// create valid time
					Date now = new Date(new java.util.Date().getTime());
					long timestamp = now.getTime();
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(now);
					calendar.add(Calendar.MINUTE, 5);
					timestamp = calendar.getTime().getTime();
					// Tạo một đối tượng Timestamp từ thời gian đã tính
					Timestamp ts = new Timestamp(timestamp);
					
					KhachHang kh = new KhachHang(maKhachHang, tenDangNhap, MaHoa.toSha1(matKhau), hoVaTen, gioiTinh,
							diaChiKhachHang, diaChiNhanHang, diaChiMuaHang, Date.valueOf(ngaySinh), sdt, email,
							nhanBanTin != null);
					kh.setMaXacThuc(code);
					kh.setTrangThaiXacThuc(false);
					kh.setThoiGianXacThuc(ts);

					if (khachHangDAO.insert(kh) > 0) {
						url = "/khachhang/xacthuc.jsp";
						Email.sendEmail(email, "Xác thực tài khoản", getNoiDung(kh));
					}
				}
			}
			RequestDispatcher rq = getServletContext().getRequestDispatcher(url);
			rq.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void dangXuat(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession();
			if (session.getAttribute("khachHang") != null) {
				session.removeAttribute("khachHang");
				session.invalidate();
			}
			String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath();

			response.sendRedirect(url + "/HomePage.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void dangNhap(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			String tenDangNhap = request.getParameter("tenDangNhap");
			String matKhau = request.getParameter("matKhau");
			request.setAttribute("tenDangNhap", tenDangNhap);
			String url = "", error = "";

			KhachHang kh = new KhachHang();
			KhachHang khTruyVan = new KhachHang();
			kh.setTenDangNhap(tenDangNhap);
			kh.setMatKhau(MaHoa.toSha1(matKhau));

			KhachHangDAO khdao = new KhachHangDAO();
			khTruyVan = khdao.selectByUsernameAndPassword(kh);
			if (khTruyVan != null && khTruyVan.isTrangThaiXacThuc()) {
				HttpSession session = request.getSession();
				session.setAttribute("khachHang", khTruyVan);
				url = "/HomePage.jsp";
			} else {
				error = "Thông tin tài khoản chưa chính xác!";
				url = "/khachhang/dangnhap.jsp";
			}
			request.setAttribute("fail-matkhau", error);
			// System.out.println(error);
			RequestDispatcher rq = request.getServletContext().getRequestDispatcher(url);
			rq.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void doiMatKhau(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			String matKhauHienTai = request.getParameter("matKhauHienTai");
			String matKhauMoi = request.getParameter("matKhauMoi");
			String matKhauNhapLai = request.getParameter("matKhauNhapLai");
			System.out.println(matKhauHienTai);
			HttpSession session = request.getSession();
			KhachHang kh = (KhachHang) session.getAttribute("khachHang");
			System.out.println(kh);
			if (!MaHoa.toSha1(matKhauHienTai).equals(kh.getMatKhau())) {
				request.setAttribute("error_matkhau", "Mật khẩu hiện tại không đúng!");
				System.out.println("abccs");
			} else {
				if (!matKhauMoi.equals(matKhauNhapLai)) {
					request.setAttribute("error", "Mật khẩu không khớp với mật khẩu vừa nhập");
				} else {
					kh.setMatKhau(MaHoa.toSha1(matKhauMoi));
					KhachHangDAO khdao = new KhachHangDAO();
					khdao.update(kh);
					request.setAttribute("success", "Đổi mật khẩu thành công");
				}
			}
			RequestDispatcher rq = request.getServletContext().getRequestDispatcher("/khachhang/doimatkhau.jsp");
			rq.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void thayDoiThongTin(HttpServletRequest request, HttpServletResponse response) {
		try {
			String hoVaTen = request.getParameter("hoVaTen");
			String gioiTinh = request.getParameter("gioiTinh");
			String ngaySinh = request.getParameter("ngaySinh");
			String diaChiKhachHang = request.getParameter("diaChiKhachHang");
			String diaChiMuaHang = request.getParameter("diaChiMuaHang");
			String diaChiNhanHang = request.getParameter("diaChiNhanHang");
			String dienThoai = request.getParameter("dienThoai");
			String email = request.getParameter("email");
			String dongYNhanMail = request.getParameter("dongYNhanMail");
			request.setAttribute("hoVaTen", hoVaTen);
			request.setAttribute("gioiTinh", gioiTinh);
			request.setAttribute("ngaySinh", ngaySinh);
			request.setAttribute("diaChiKhachHang", diaChiKhachHang);
			request.setAttribute("diaChiMuaHang", diaChiMuaHang);
			request.setAttribute("diaChiNhanHang", diaChiNhanHang);
			request.setAttribute("dienThoai", dienThoai);
			request.setAttribute("dongYNhanMail", dongYNhanMail);

			String url = "";
			String baoLoi = "";
			KhachHangDAO khachHangDAO = new KhachHangDAO();

			Pattern sdtPattern = Pattern.compile("\\d{10}");
			Matcher sdtMatcher = sdtPattern.matcher(dienThoai);
			if (!sdtMatcher.matches()) {
				baoLoi = "Số điện thoại phải gồm 10 số";
			}

			Pattern emailPattern = Pattern.compile("\\w+@\\w+(\\.\\w+)+(\\.\\w+)*");
			Matcher emailMatcher = emailPattern.matcher(email);
			if (!emailMatcher.matches()) {
				baoLoi = "Không đúng định dạng email";
			}

			if (baoLoi.length() > 0) {
				url = "/khachhang/thaydoithongtin.jsp";
				request.setAttribute("error", baoLoi);
			} else {
				Object obj = request.getSession().getAttribute("khachHang");
				KhachHang khachHang = null;
				if (obj != null) {
					khachHang = (KhachHang) obj;
					System.out.println("session ko luu khachhang");
				}
				if (khachHang != null) {
					// String maKhachHang = khachHang.getMaKhacHang();
					KhachHang kh = new KhachHang(khachHang.getMaKhacHang(), khachHang.getTenDangNhap(),
							khachHang.getMatKhau(), hoVaTen, gioiTinh, diaChiKhachHang, diaChiNhanHang, diaChiMuaHang,
							Date.valueOf(ngaySinh), dienThoai, email, dongYNhanMail != null);
					khachHangDAO.update(kh);
					KhachHang kh2 = khachHangDAO.selectById(kh);
					// request.getSession().setAttribute("khachHang", kh2);
					url = "/khachhang/thanhcong.jsp";
				}

			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static String getNoiDung(KhachHang kh) {
		String link = "http://localhost:8080/BookStrore/khach-hang-controller?hanhDong=xac-thuc&tenDangNhap="
				+ kh.getTenDangNhap() + "&maXacThuc=" + kh.getMaXacThuc();
		String noiDung = "<p>Minh xin ch&agrave;o bạn <strong>" + kh.getHoVaTen() + "</strong>,</p>\r\n"
				+ "<p>Vui l&ograve;ng x&aacute;c thực t&agrave;i khoản của bạn bằng c&aacute;ch nhập m&atilde; <strong>"
				+ kh.getMaXacThuc() + "</strong>, hoặc click trực tiếp v&agrave;o đường link sau đ&acirc;y:</p>\r\n"
				+ "<p><a href=\"" + link + "\">" + link + "</a></p>\r\n"
				+ "<p>Đ&acirc;y l&agrave; email tự động, vui l&ograve;ng kh&ocirc;ng phản hồi email n&agrave;y.</p>\r\n"
				+ "<p>Tr&acirc;n trọng cảm ơn.</p>";
		return noiDung;
	}

}
