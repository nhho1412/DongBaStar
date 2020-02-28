<%@page import="model.bean.AccountBEAN"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Đăng nhập</title>
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

</head>
<body>

	<%
		AccountBEAN ac = null;
		if (request.getAttribute("taiKhoan") != null) {
			ac = (AccountBEAN) request.getAttribute("taiKhoan");
		}
		String noti = "1";
		noti = (String) request.getAttribute("noti");
		if (noti != null) {
	%>
	
	<div class="page login-page">
		<div class="container d-flex align-items-center">
			<div class="form-holder has-shadow">
			<div>
		<%
			if (noti.equals("0")) {
		%>
		<div class="alert alert-danger" role="alert">
			<b>Đăng nhập thất bại!</b> Tài khoản hoặc mật khẩu không chính xác
		</div>
		<%
			}
			}
		%>
	</div>
				<div class="row">
					<!-- Logo & Information Panel-->
					<div class="col-lg-6">
						<div class="info d-flex align-items-center">
							<div class="content">
								<div class="logo">
									<h1>DONGBA STAR</h1>
								</div>
								<p>Thế giới phim trong tầm tay.</p>
							</div>
						</div>
					</div>
					<!-- Form Panel    -->
					<div class="col-lg-6 bg-white">
						<div class="form d-flex align-items-center">
							<div class="content">
								<form method="post" action="Login" class="form-validate">
									<!--  ?? action đâu?? không có action thì răng hắn gửi về servlet -->
									<div class="form-group">
										<input id="login-username" type="text" name="taiKhoan"
											required data-msg="Hãy nhập tài khoản" class="input-material">
										<label for="login-username" class="label-material">Tài
											khoản</label>
									</div>
									<div class="form-group">
										<input id="login-password" type="password" name="matKhau"
											required data-msg="Hãy nhập mật khẩu" class="input-material">
										<label for="login-password" class="label-material">Mật
											khẩu</label>
									</div>
									<!-- 									<a id="login" href="index.html" class="btn btn-primary">Đăng
										nhập</a> -->
									<button type="submit" id="login" class="btn btn-primary">Đăng
										nhập</button>

								</form>
								<a href="#" class="forgot-pass"><button class="btn btn-link"
										data-toggle="modal" data-target="#quenmatkhauModal">Quên
										mật khẩu?</button></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="copyrights text-center">
			<p>
				Design by <a href="" class="external">DongBa Star</a>
			</p>
		</div>
		<div class="text-center card-body">
			<!-- Modal quên mật khẩu -->
			<div class="modal fade" id="quenmatkhauModal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Quên mật khẩu</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">Liên hệ với admin :
							support@dongbastar.com.vn để lấy lại mật khẩu đăng nhập.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-danger"
								data-dismiss="modal">Đóng</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- JavaScript files-->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/jquery/jquery.slim.min.js"></script>
	<script src="assets/vendor/popper.js/umd/popper.min.js">
		
	</script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery.cookie/jquery.cookie.js">
		
	</script>
	<script src="assets/vendor/chart.js/Chart.min.js"></script>
	<script src="assets/vendor/jquery-validation/jquery.validate.min.js"></script>
	<!-- Main File-->
	<script src="assets/js/front.js"></script>


</body>
</html>