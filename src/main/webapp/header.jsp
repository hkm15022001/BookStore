<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.KhachHang" %>

<%
	String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
	+ request.getContextPath();
	KhachHang khachHang = (KhachHang)session.getAttribute("khachHang");

%>
 <!-- Start navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#"> <img
				src="<%=url%>/img/antiFlash-icons-book.svg" width="30" height="30"
				class="d-inline-block align-top" alt="Book-Icon"> BookStrore's Minh
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="<%=url%>/HomePage.jsp">Trang
							chủ <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Giảm giá</a></li>
					<li  class="nav-item dropdown"><a style="width: fit-content"
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Thể loại </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Sách Giáo Khoa</a> <a
								class="dropdown-item" href="#">Sách khoa học</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Truyện</a>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link disabled" href="#">Hết
							hàng</a>
					</li>
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Tìm sách" aria-label="Search">					
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm</button>
				<%
					if(khachHang != null){ %>
						<div class=" my-2 my-lg-0">						
							<!-- Dropdown menu links -->
							<div class="btn-group dropdown ml-2">
								<button type="button" class="btn btn-secondary dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									Tài khoản</button>
								<div class="dropdown-menu">
									<!-- Dropdown menu links -->
									<ul>
										
										<li><div class="welcome text-primary text-center ml-2"><b><i><%=khachHang.getHoVaTen() %></i></b></div></li>
										<li><a href="#!">Thông báo</a></li>
										<li><a href="<%=url%>/khachhang/thaydoithongtin.jsp">Thông tin tài khoản</a></li>
										<li><a href="<%=url%>/khachhang/doimatkhau.jsp">Đổi mật khẩu</a></li>
										<li><a href="#!">Cài đặt</a></li>
										<li><a href="khach-hang-controller?hanhDong=dang-xuat">Đăng xuất</a></li>
									</ul>		
								</div>
							</div>
						</div>
					<%  } else{ %>
					<a href="<%=url%>/khachhang/dangnhap.jsp" class="btn btn-primary ml-2">Đăng Nhập</a>
						
					<%	} %>
				</form>
			</div>
		</nav>
		<!-- End navigation -->