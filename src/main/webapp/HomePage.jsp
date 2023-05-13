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
<link rel="stylesheet" type="text/css" href="<%=url%>/css/homepage.css">
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
</head>
<body>
	<jsp:include page="header.jsp"/>
	<main>
		<div class="container">
			<div class="row">
				<!-- End SideBar -->
				<div class="col-lg-4" >
					<%@include file ="left.jsp" %>
				</div>
				<!-- End SideBar -->
				
				<!-- Start slider -->
				<div class="col-lg-8 mt-3" >
					<div id="slider" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider" data-slide-to="0"
								class="active"></li>
							<li data-target="#slider" data-slide-to="1"></li>
							<li data-target="#slider" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img class="d-block w-100" src="./img/1643897001sale-banner-background.svg" alt="First slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="./img/1614246851sale-poster-template.svg" alt="Second slide">
							</div>
							<div class="carousel-item" >
								<img class="d-block w-100"  src="./img/1622394958big-sale-banner-shop.svg" alt="Third slide">
							</div>
						</div>
						<a class="carousel-control-prev" href="#slider"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#slider" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				<!-- End slider -->
					<div class="row mt-2 mb-5">
						<div class="card-deck">
							<div class="card">
								<img class="card-img-top" src="https://i0.wp.com/www.filmspourenfants.net/wp-content/uploads/2018/07/one-piece-serie-a.jpg?fit=348%2C500&ssl=1" alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title">One Piece</h5>
									<p class="card-text">Câu truyện phiêu lưu kì thú và đầy dũng cảm của băng mũ rơm.</p>									
								</div>
								<div class="card-footer">
									<a href="#" class="btn btn-primary">Xem chi tiết</a>
								</div>
							</div>
							<div class="card">
								<img class="card-img-top" src="https://adcbook.net.vn/web/image/product.template/70971/image_1024?unique=2766675" alt="Toán học">
								<div class="card-body">
									<h5 class="card-title">Toán Học</h5>
									<p class="card-text">Học toán để nâng cao tư duy.</p>								
								</div>
								<div class="card-footer">
									<a href="#" class="btn btn-primary">Xem chi tiết</a>
								</div>
							</div>
							<div class="card">
								<img class="card-img-top" src="https://i.ex-cdn.com/phatgiao.org.vn/files/content/2019/06/05/buong-xa-phien-nao-bia-1743-1406.jpg" alt="Phật Giáo">
								<div class="card-body">
									<h5 class="card-title">Sách Phật Giáo</h5>
									<p class="card-text">Tâm và Hành động.</p>
								</div>
								<div class="card-footer">
									<a href="#" class="btn btn-primary">Xem chi tiết</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</main>
	<%@ include file = "../footer.jsp" %>
</body>
</html>