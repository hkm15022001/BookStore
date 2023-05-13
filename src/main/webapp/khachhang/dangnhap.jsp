<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Store</title>
<link rel="icon" type="image/x-icon"
	href="./img/1200px-Closed_Book_Icon.svg.png">
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
	
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=url%>/css/dangnhap.css">
</head>
<body>
<%
	String error_matkhau = request.getAttribute("fail-matkhau")+"";
	error_matkhau = (error_matkhau.equals("null")) ? "" : error_matkhau;
	String tenDangNhap = request.getAttribute("tenDangNhap")+ "";
	tenDangNhap = (tenDangNhap.equals("null")) ? "" : tenDangNhap;
%>
<section class="vh-100">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
          class="img-fluid" alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
        <form action="<%=url %>/khach-hang-controller" method="post">
        <input name="hanhDong" type="hidden" value="dang-nhap">
          <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
            <p class="lead fw-normal mb-0 me-3">Đăng nhập bằng </p>
            <button type="button" class="btn btn-primary btn-floating mx-1">
              <i class="fab fa-facebook-f"></i>
            </button>

            <button type="button" class="btn btn-primary btn-floating mx-1">
              <i class="fab fa-twitter"></i>
            </button>

            <button type="button" class="btn btn-primary btn-floating mx-1">
              <i class="fab fa-linkedin-in"></i>
            </button>
          </div>

          <div class="divider d-flex align-items-center my-4">
            <p class="text-center fw-bold mx-3 mb-0">Hoặc</p>
          </div>

          <!-- Email input -->
          <div class="form-outline mb-4">
            <label class="form-label" for="form3Example3">Tên đăng nhập</label>
            <input type="text" id="form3Example3" class="form-control form-control-lg" value="<%=tenDangNhap%>"
              placeholder="Nhập vào tên đăng nhập" name ="tenDangNhap"/>
          </div>

          <!-- Password input -->
          <div class="form-outline mb-3">
            <label class="form-label" for="form3Example4">Mật khẩu</label>
            <input type="password" id="form3Example4" class="form-control form-control-lg"
              placeholder="Nhập vào mật khẩu" name="matKhau"/>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <!-- Checkbox -->
            <div class="form-check mb-0">
              <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
              <label class="form-check-label" for="form2Example3">
				Nhớ mật khẩu
              </label>
            </div>
            <a href="#!" class="text-body">Quên mật khẩu?</a>
          </div>
		
		  <div class="error">
		  		<%=error_matkhau%>
		  </div>
		
          <div class="log-btn text-center text-lg-start mt-4 pt-2">
            <button type="submit" class="btn btn-primary btn-lg"
              style="padding-left: 2.5rem; padding-right: 2.5rem;">Đăng Nhập</button>
            <p class="small fw-bold mt-2 pt-1 mb-0">Bạn chưa có account? <a href="<%=url %>/khachhang/dangky.jsp"
                class="link-danger">Đăng ký</a></p>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<style>
	@media screen and (min-width: 992px){
		body {
			height: 100vh;
		}
	}
	.log-btn {
		margin-bottom: 84px;
	}
</style>
</body>
</html>