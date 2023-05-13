<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%
		String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>

<link rel="stylesheet" href="<%=url%>/css/dangky.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Book Store</title>
<link rel="icon" type="image/x-icon" href="../img/1200px-Closed_Book_Icon.svg.png">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<body>
	<%
	String error_tendangnhap = request.getAttribute("error_tendangnhap")+"";
	error_tendangnhap = error_tendangnhap.equals("null") ? "" : error_tendangnhap;
	String error_sdt = request.getAttribute("error_sdt")+"";
	error_sdt = error_sdt.equals("null") ? "" : error_sdt;
	String error_ngaySinh = request.getAttribute("error_ngaySinh")+"";
	error_ngaySinh = error_ngaySinh.equals("null") ? "" : error_ngaySinh;
	String error_email = request.getAttribute("error_email")+"";
	error_email = error_email.equals("null") ? "" : error_email;
	
	//String test = request.getAttribute("khachhang")+"";
	
	String tenDangNhap = request.getParameter("tenDangNhap")+"";
	String matKhau = request.getParameter("matKhau")+"";
	String nhapLaiMatKhau = request.getParameter("nhapLaiMatKhau")+"";
	String hoVaTen = request.getParameter("hoVaTen")+"";
	String gioiTinh = request.getParameter("gioiTinh")+"";
	String ngaySinh = request.getParameter("ngaySinh")+"";
	String diaChiKhachHang = request.getParameter("diaChiKhachHang")+"";
	String diaChiMuaHang = request.getParameter("diaChiMuaHang")+"";
	String diaChiNhanHang = request.getParameter("diaChiNhanHang")+"";
	String sdt = request.getParameter("sdt")+"";
	String email = request.getParameter("email")+"";
	String nhanBanTin = request.getParameter("nhanBanTin")+"";
	

	tenDangNhap = (tenDangNhap.equals("null") || tenDangNhap.trim().length()==0) ? "" : tenDangNhap;
	matKhau = (matKhau.equals("null") ) ? "" : matKhau;
	nhapLaiMatKhau = (nhapLaiMatKhau.equals("null")) ? "" : nhapLaiMatKhau;
	hoVaTen = (hoVaTen.equals("null") || hoVaTen.trim().length()==0) ? "" : hoVaTen;
	gioiTinh = (gioiTinh.equals("null")) ? "" : gioiTinh;
	ngaySinh = (ngaySinh.equals("null")) ? "" : ngaySinh;
	diaChiKhachHang = (diaChiKhachHang.equals("null") || diaChiKhachHang.trim().length()==0) ? "" : diaChiKhachHang;
	diaChiMuaHang = (diaChiMuaHang.equals("null") || diaChiMuaHang.trim().length()==0) ? "" : diaChiMuaHang;
	diaChiNhanHang = (diaChiNhanHang.equals("null") || diaChiNhanHang.trim().length()==0) ? "" : diaChiNhanHang;
	sdt = (sdt.equals("null") || sdt.trim().length()==0) ? "" : sdt;
	email = (email.equals("null") || email.trim().length()==0) ? "" : email;
	nhanBanTin = (nhanBanTin.equals("null")) ? "" : nhanBanTin;
	%>
	<%-- <jsp:include page="../header.jsp"/> --%>
	<main>
	
		<div class="container">
			<h1 class="text-center">Đăng Ký Tài Khoản</h1>
			<form id="register-form" action="<%=url%>/khach-hang-controller" method="post" >
			<input name="hanhDong" type="hidden" value="dang-ky">
				<div class="row">
					<div class="col-md-6">
					  <div class="form-group">
					  	<h3>Thông Tin Tài Khoản</h3>
					    <label for="tenDangNhap">Tên Đăng Nhập<span class="rq"> *</span></label>
					    <input type="text" class="form-control" id="tenDangNhap"  placeholder="Tên đăng nhập" name="tenDangNhap" value="<%=tenDangNhap %>" required>
					  	<div class="rq" id="error"><%=error_tendangnhap %></div>
					  </div>
					  <div class="form-group">
					    <label for="matKhau">Mật khẩu<span class="rq"> *</span></label>
					    <input type="password" class="form-control" id="matKhau" placeholder="Mật khẩu" name="matKhau" value="<%=matKhau %>"required>
					  </div>
					  <div class="form-group">
					    <label for="nhapLaiMatKhau">Nhập Lại Mật khẩu</label>
					    <input type="password" class="form-control" id="nhapLaiMatKhau" placeholder="Nhập Lại Mật khẩu" name="nhapLaiMatKhau" onkeyup="checkPassword()"  value="<%=nhapLaiMatKhau %>" required>
					  	<div class="rq" id="error_matkhau"></div>
					  </div>
					 <div class="form-group">
					  	<h3>Thông Tin Khách Hàng</h3>
					    <label for="hoVaTen">Họ và Tên<span class="rq"> *</span></label>
					    <input type="text" class="form-control" id="hoVaTen"  placeholder="Nhập tên của bạn" name="hoVaTen"  value="<%=hoVaTen %>" required>
					  </div>
					  <div class="form-group">
					  	  <label for="gioiTinh">Giới tính</label>
						  <select class="ml-2" name ="gioiTinh"  >				
						  	<option value="Nam" <%=gioiTinh.equals("Nam")?"selected":"" %>>Nam</option>
						  	<option value="Nu" <%=gioiTinh.equals("Nu")?"selected":"" %>>Nữ</option>
						 	<option value="Khac" <%=gioiTinh.equals("Khac")?"selected":"" %>">Khác</option>
						  </select>
						</div>
					  <div class="form-group">
					    <label for="ngaySinh">Ngày Sinh</label>
					    <input type="date" class="form-control" id="ngaySinh" name="ngaySinh"  value="<%=ngaySinh%>">
					  </div>
					  <div class="rq" id="error"><%=error_ngaySinh %></div>
					</div>
					<div class="col-md-6">
						<h3>Địa chỉ</h3>
						<div class="form-group">
						    <label for="diaChiKhachHang">Địa chỉ khách hàng</label>
						    <input type="text" class="form-control" id="diaChiKhachHang"  name="diaChiKhachHang"  value="<%=diaChiKhachHang %>">
						 </div>
						 <div class="form-group">
						    <label for="diaChiMuaHang">Địa chỉ mua hàng</label>
						    <input type="text" class="form-control" id="diaChiMuaHang"  name="diaChiMuaHang"  value="<%=diaChiMuaHang %>">
						 </div>
						 <div class="form-group">
						    <label for="diaChiNhanHang">Địa chỉ nhận hàng</label>
						    <input type="text" class="form-control" id="diaChiNhanHang" name="diaChiNhanHang"  value="<%=diaChiNhanHang %>">
						 </div>
						 <div class="form-group">
						    <label for="sdt">Số điện thoại <span class="rq"> *</span></label>
						    <input type="tel" class="form-control" id="sdt" name="sdt"  value="<%=sdt %>" required>
						    <div class="rq" id="error"><%=error_sdt %></div>
						 </div>
						 <div class="form-group">
						    <label for="email">Email<span class="rq"> *</span></label>
						    <input type="email" class="form-control" id="email" name="email"  value="<%=email%>" required>
						    <div class="rq" id="error"><%=error_email %></div>
						 </div>
						 <div class="form-check">
						    <input type="checkbox" class="form-check-input" id="dongYDieuKhoan" >
						    <label class="form-check-label" for="dongYDieuKhoan" >Đồng ý với điều khoản của cửa hàng</label>
						    <div class="rq">
						    	<small class="msg"></small>
						    </div>
						 </div>
						 <div class="form-check">
						    <input type="checkbox" class="form-check-input" name="nhanBanTin" <%=nhanBanTin.equalsIgnoreCase("on")?"checked":""%> >
						    <label class="form-check-label" for="nhanBanTin">Đồng ý nhận email thông tin mới nhất</label>
						   
						 </div>
						 <div class="form-group">
						    <input type="button" id="nutDangKy" class="btn btn-primary" value="Đăng Ký" onclick="checkSubmit()" >
						 </div>
					</div>
				</div>
			</form>
				
			</div>
	</main>
	<%-- <%@ include file = "../footer.jsp" %> --%>
	<script>
	function checkPassword() {
		var error = document.getElementById("error_matkhau");
		let matKhau = document.getElementById("matKhau").value;
		let nhapLaiMatkhau = document.getElementById("nhapLaiMatKhau").value;
		//console.log(nhapLaiMatkhau);
		if(matKhau != nhapLaiMatkhau){
			error.innerHTML = "Mật khẩu không khớp";
			return false;
		} else {
			//console.log(error);
			error.innerHTML = "";
			return true;
		}
	}
	
	function checkSubmit() {
		//console.log("nhapLaiMatkhau");
		let register_form = document.getElementById("register-form");
		let check = document.getElementById("dongYDieuKhoan");
		let msg = document.querySelector(".msg");
		//console.log(check);
		if(!check.checked){
			msg.innerHTML = "Hãy đồng ý với hợp đồng của chúng tôi trước khi đăng ký";
			return;
		} else {
			msg.innerHTML = "";
			if(checkPassword()){
				register_form.submit();
			}
		}
		return ;
	}
	
</script>
</body>
</html>