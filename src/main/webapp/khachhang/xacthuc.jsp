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
<link rel="icon" type="image/x-icon" href="./img/1200px-Closed_Book_Icon.svg.png">
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
	.container{
		width : 50%;
	}
	h1{	
		width: max-content;
	}
	
</style>
</head>
<body>
<%
	String msg = request.getAttribute("msg")+"";
	String tenDangNhap = request.getAttribute("tenDangNhap")+"";
%>
<jsp:include page="../header.jsp"/>
	<div class="container">
		<h1>Nhập mã code đã gửi về email</h1>
		<div class="form-outline mb-4 mt-4">
			<form class="form-inline" action="<%=url %>/khach-hang-controller" method="post">
				<input type="hidden" value="xac-thuc" name= "hanhDong" />
				<input type="hidden" value="<%=tenDangNhap %>" name= "tenDangNhap" />
				<label class="form-label mr-3" for="maXacThuc">Mã code</label> 
				<input type="text" id="maXacThuc" class="form-control form-control-lg"
					name="maXacThuc" required/>
				<button class="btn btn-primary text-center ml-4" type="submit" >Xác nhận</button>			
			</form>
			<p><strong><%=msg %></strong></p>
		</div>	
	</div>
	<%@ include file = "../footer.jsp" %>
	<style>
		body {
			height: 100vh;
		}
	</style>
<!-- <script>
	setTimeout(function() {
		window.location.href = 'khachhang/dangnhap.jsp';
	}, 5000);
</script>	 -->
</body>
</html>