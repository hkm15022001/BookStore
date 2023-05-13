<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Book Store</title>
<%
		String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=url %>/css/homepage.css">
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
<style>	
.container {
		display: flex;
		align-items: center;
		justify-content: center;
		height: 100vh; /* set chiều cao bằng 100% viewport height */
	}
form {
	margin-top: 0px;
	width: 50%;
}

h1 {
	color : blue;
	margin-top : 25px;
}
</style>
	
</head>


<body>
	<%
		String error_matkhau = request.getAttribute("error_matkhau")+"";
		error_matkhau = error_matkhau.equals("null") ? "" : error_matkhau;
		String success = request.getAttribute("success")+ "";
		success = success.equals("null") ? "" : success;
		
		
		if(session.getAttribute("khachHang") != null){ 
	%>
			<jsp:include page="../header.jsp"/>
			<h1 class="text-center" >Đổi mật khẩu </h1>
			<h3 class="text-success text-center "><%=success %></h3>
			<div class="container">
				<form action="<%=url%>/khach-hang-controller" method="POST">
					<div class="form-group" >
					<input type="hidden" name="hanhDong" value ="doi-mat-khau">
						<label for="matKhauHienTai">Mật khẩu hiện tại</label> 
						<input
							type="password" class="form-control"
							placeholder="Nhập mật khẩu hiện tại" name="matKhauHienTai" required>
					</div>
					<div class="form-group">
						<label for="matKhauMoi">Mật khẩu mới</label> 
						<input
							type="password" class="form-control" placeholder="Nhập mật khẩu mới"
							name="matKhauMoi" required>
					</div>
					<div class="form-group">
						<label for="matKhauNhapLai">Nhập lại mật khẩu mới</label> 
						<input
							type="password" class="form-control" placeholder="Nhập lại mật khẩu mới"
							name="matKhauNhapLai" required>
					</div>
					<div class="warning"><%=error_matkhau%></div>	
					<button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
				</form>
			</div>
			<%@ include file = "../footer.jsp" %>
	<% } else { %>
		<jsp:forward page="dangnhap.jsp"></jsp:forward>
	<% }
	%>
	
</body>
</html>