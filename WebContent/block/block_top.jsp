<%@page import="model.bean.InfoAccountBEAN"%>
<%@page import="model.bean.FilmBEAN"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.AccountBEAN"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Đông Ba Star - Rạp Chiếu Phim Hiện Đại</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="assets/img/logo/star.png">

<!-- all css here -->
<!-- bootstrap v3.3.6 css -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<!-- animate css -->
<link rel="stylesheet" href="assets/css/animate.css">
<!-- meanmenu css -->
<link rel="stylesheet" href="assets/css/meanmenu.min.css">
<!-- owl.carousel css -->
<link rel="stylesheet" href="assets/css/owl.carousel.css">
<!-- font-awesome css -->
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<!-- flexslider.css-->
<link rel="stylesheet" href="assets/css/flexslider.css">
<!-- chosen.min.css-->
<link rel="stylesheet" href="assets/css/chosen.min.css">
<!-- style css -->
<link rel="stylesheet" href="assets/css/style.css">
<!-- responsive css -->
<link rel="stylesheet" href="assets/css/responsive.css">
<!-- modernizr css -->
<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
<!-- modal video -->
<link rel="stylesheet" href="assets/css/modal-video.min.css">
<!-- select seat -->
<link rel="stylesheet" type="text/css" href="assets/css/seat.css">
<!-- QR code -->
<script type="text/javascript" src="assets/js/qrcode.min.js"></script>
<!-- all font -->
<!-- google font -->
<link href="https://fonts.googleapis.com/css?family=Fira+Sans"
	rel="stylesheet">
</head>

<body>
	<%
		ArrayList<FilmBEAN> listFilmDangChieu = (ArrayList<FilmBEAN>) request.getAttribute("listFilmDangChieu");
		ArrayList<FilmBEAN> listFilmSapChieu = (ArrayList<FilmBEAN>) request.getAttribute("listFilmSapChieu");
		ArrayList<FilmBEAN> listFilmChieuSom = (ArrayList<FilmBEAN>) request.getAttribute("listFilmChieuSom");
	%>
	<!-- header-area-start -->
	<header>
		<!-- header-mid-area-start -->
		<div class="header-mid-area ptb-40">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-5 col-xs-12"></div>
					<div class="col-lg-6 col-md-6 col-sm-4 col-xs-12">
						<div class="logo-area text-center logo-xs-mrg">
							<a href="index"><img src="assets/img/logo/logolo.jpg"
								alt="logo" /></a>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
				</div>
			</div>
		</div>
		<!-- header-mid-area-end -->
		<!-- main-menu-area-start -->
		<div class="main-menu-area hidden-sm hidden-xs sticky-header-1"
			id="header-sticky">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="menu-area">
							<nav>
								<ul>
									<li class="active"><a href="index">Trang chủ </a></li>
									<li><a href="index#showtime">Lịch chiếu</a></li>
									<li><a href="">Phim<i class="fa fa-angle-down"></i></a>
										<div class="mega-menu">
											<span> <a href="#" class="title">Đang chiếu</a> <%
 	if (listFilmDangChieu != null) {
 		for (FilmBEAN fi : listFilmDangChieu) {
 %> <a href="DBSelectShowtime?id=<%=fi.getIdPhim()%>"><%=fi.getTenPhim()%></a>
												<%
													}
													}
												%>
											</span> <span> <a href="#" class="title">Sắp chiếu</a> <%
 	if (listFilmSapChieu != null) {
 		for (FilmBEAN fi : listFilmSapChieu) {
 %> <a href="DBSelectShowtime?id=<%=fi.getIdPhim()%>"><%=fi.getTenPhim()%></a>
												<%
													}
													}
												%>
											</span> <span> <a href="#" class="title">Chiếu sớm</a> <%
 	if (listFilmChieuSom != null) {
 		for (FilmBEAN fi : listFilmChieuSom) {
 %> <a href="DBSelectShowtime?id=<%=fi.getIdPhim()%>"><%=fi.getTenPhim()%></a>
												<%
													}
													}
												%>
											</span>
										</div></li>
									<li><a href="DBPromotion">Sự kiện/khuyến mãi</i></a></li>
									<%
										if (request.getAttribute("taiKhoan") != null) {
											InfoAccountBEAN taikhoan = (InfoAccountBEAN) request.getAttribute("taiKhoan");
									%>
									<li class="tt03"><a href="DBMyAccount"><%=taikhoan.getTaiKhoan()%><i
											class="fa fa-angle-down"></i></a>
										<div class="sub-menu sub-menu-2">
											<ul>
												<li><a href="DBMyInfo">Thông tin tài khoản</a></li>
												<li><a href="DBMyInfo">Đổi mật khẩu</a></li>
												<li><a href="DBMyInfo#BookingHistory">Lịch sử đặt
														vé</a></li>
												<li><a href="DBLogin?logOut=true">Đăng xuất</a></li>
											</ul>
										</div></li>
									<%
										} else {
									%>
									<li class="tt03"><a href="DBRegister">Đăng ký</a></li>
									<li class="tt03"><a href="DBLogin">Đăng nhập</a></li>
									<%
										}
									%>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- main-menu-area-end -->
		<!-- mobile-menu-area-start -->
		<div class="mobile-menu-area hidden-md hidden-lg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="mobile-menu">
							<nav id="mobile-menu-active">
								<ul id="nav">
									<li><a href="index">Trang chủ</a></li>
									<li><a href="index#showtime">Lịch chiếu</a></li>
									<li><a>Phim</a>
										<ul>
											<li><a href="index.html"><b>ĐANG CHIẾU</b></a></li>
											<%
												if (listFilmDangChieu != null) {
													for (FilmBEAN fi : listFilmDangChieu) {
											%>
											<li class="tt25"><a
												href="DBSelectShowtime?id=<%=fi.getIdPhim()%>"><%=fi.getTenPhim()%></a></li>
											<%
												}
												}
											%>
											<li><a href="index.html"><b>SẮP CHIẾU</b></a></li>
											<%
												if (listFilmSapChieu != null) {
													for (FilmBEAN fi : listFilmSapChieu) {
											%>
											<li class="tt25"><a
												href="DBSelectShowtime?id=<%=fi.getIdPhim()%>"><%=fi.getTenPhim()%></a></li>
											<%
												}
												}
											%>
											<li><a href="index.html"><b>CHIẾU SỚM</b></a></li>
											<%
												if (listFilmChieuSom != null) {
													for (FilmBEAN fi : listFilmChieuSom) {
											%>
											<li class="tt25"><a
												href="DBSelectShowtime?id=<%=fi.getIdPhim()%>"><%=fi.getTenPhim()%></a></li>
											<%
												}
												}
											%>
										</ul></li>
									<li><a href="DBPromotion">Sự kiện/khuyến mãi</a></li>
									<%
										if (request.getAttribute("taiKhoan") != null) {
											InfoAccountBEAN taikhoan = (InfoAccountBEAN) request.getAttribute("taiKhoan");
									%>
									<li><a href="DBMyAccount">Tài khoản</a>
										<ul>
											<li><a href="DBMyInfo">Thông tin tài khoản</a></li>
											<li><a href="DBMyInfo">Đổi mật khẩu</a></li>
											<li><a href="DBMyInfo#BookingHistory">lịch sử đặt vé</a></li>
											<li><a href="DBLogin?logOut=true">Đăng xuất</a></li>
										</ul></li>
									<%
										} else {
									%>
									<li><a href="DBLogin">Đăng nhập</a></li>
									<li><a href="DBRegister">Đăng ký</a></li>
									<%
										}
									%>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- mobile-menu-area-end -->
	</header>
	<!-- header-area-end -->