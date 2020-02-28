<%@page import="model.bean.AccountBEAN"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Quản lý website đặt vé xem phim</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->

<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="assets/vendor/font-awesome/css/font-awesome.min.css">
<!-- Fontastic Custom icon font-->
<link rel="stylesheet" href="assets/css/fontastic.css">
<!-- Google fonts - Poppins -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
<!-- theme stylesheet-->
<link rel="stylesheet" href="assets/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="assets/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="assets/img/favicon.ico">

<link rel="stylesheet" href="assets/js/datatables.min.css">
</head>

<body>
<%AccountBEAN taiKhoan=null;
	if(request.getAttribute("taiKhoan")!=null){
		taiKhoan=(AccountBEAN)request.getAttribute("taiKhoan");
	}
	
		%>
	<div class="page">
		<!-- Main Navbar-->
		<header class="header">
			<nav class="navbar">
				<!-- Search Box-->
				<div class="search-box">
					<button class="dismiss">
						<i class="icon-close"></i>
					</button>
					<form id="searchForm" action="#" role="search">
						<input type="search" placeholder="What are you looking for..."
							class="form-control">
					</form>
				</div>
				<div class="container-fluid">
					<div
						class="navbar-holder d-flex align-items-center justify-content-between">
						<!-- Navbar Header-->
						<div class="navbar-header">
							<!-- Navbar Brand -->
							<a href="index.html"
								class="navbar-brand d-none d-sm-inline-block">
								<div class="brand-text d-none d-lg-inline-block">
									<span><strong>DONGBA</strong> </span> Star
								</div>
								<div class="brand-text d-none d-sm-inline-block d-lg-none">
									<strong>DB</strong>
								</div>
							</a>
							<!-- Toggle Button-->
							<a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
						</div>
						<!-- Navbar Menu -->
						<ul
							class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
							<!-- Search-->
							<li class="nav-item d-flex align-items-center"><a
								id="search" href="#"><i class="icon-search"></i></a></li>

							<!-- Logout    -->
							<li class="nav-item"><a href="XuLy?logout=true" class="nav-link logout">
									<span class="d-none d-sm-inline">Đăng xuất</span><i
									class="fa fa-sign-out"></i>
							</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</header>
		<div class="page-content d-flex align-items-stretch">
			<!-- Side Navbar -->
			<nav class="side-navbar">
				<!-- Sidebar Header-->
				<div class="sidebar-header d-flex align-items-center">
					<div class="avatar">
						<img src="assets/img/ava.jpg" alt="..."
							class="assets/img-fluid rounded-circle"
							style="width: 100%; height: 100%;">
					</div>
					<div class="title">
						<h1 class="h4">
							<%if(taiKhoan!=null){
								%>
							<%=taiKhoan.getHoTen() %>
							<%} %>
						</h1>
						<p>Quản lý</p>
					</div>
				</div>
				<!-- Sidebar Navidation Menus-->
				<span class="heading">Menu</span>
				<ul class="list-unstyled">
					<li><a href="Home"> <i class="icon-home"></i>Trang
							chủ
					</a></li>
					<li><a href="Info"> <i class="icon-grid"></i>Thông tin cá
							nhân
					</a></li>
					<li><a href="Account"> <i class="fa fa-bar-chart"></i>Thành
							viên
					</a></li>
					<li><a href="Film"> <i class="icon-padnote"></i>Phim
					</a></li>
					<li><a href="Event"> <i class="icon-grid"></i>Sự kiện
					</a></li>
				</ul>
			</nav>