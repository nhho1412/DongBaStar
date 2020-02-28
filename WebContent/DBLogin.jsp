<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="block/block_top.jsp"></jsp:include>
<!-- phần dùng chung ở phía trên -->

	<!-- user-login-area-start -->
	<div class="user-login-area mb-70 content-login">
		<div class="container">
			<div class="row breadcrumbs-info-film">
				<div class="col-lg-12">
					<div class="breadcrumbs-menu">
						<ul>
							<li><a href="index">Trang chủ</a></li>
							<li><a href="DBLogin" class="active"><span>Đăng
										nhập</span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div
					class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-12 col-xs-12 tt24">
					<div class="col-lg-12 tt26">
						<div class="login-title text-center mb-30 title-register">
							<h2>ĐĂNG NHẬP</h2>
							<%
								String noti = "-1";
								if (request.getAttribute("noti") != null) {
									noti = (String) request.getAttribute("noti");
								}
								if (noti.equals("0")) {
							%><div class="alert alert-danger" role="alert">Tài khoản hoặc mật khẩu không đúng!</div>
							<%
								}
							%>
							
						</div>
					</div>
					<form action="DBLogin<%if(request.getParameter("selectseat")!=null){%>?id=<%=request.getParameter("selectseat")%><%} %>" method="post">
						<div class="login-form">
							<div class="single-login">
								<label>Tài khoản <span>*</span></label> <input type="text" name="taiKhoan" required/>
							</div>
							<div class="single-login">
								<label>Mật khẩu <span>*</span></label> <input type="password" name="matKhau" required/>
							</div>
							<div class="single-login single-login-2">
								<button type="submit" name="submit" value="true"
									class="btn btn-warning">Đăng Nhập</button>
								<input id="rememberme" type="checkbox" name="rememberme"
									value="forever"> <span>Remember me? </span>
							</div>
							<a href="#">Quên mật khẩu?</a> <br> <a href="DBRegister">Đăng ký</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- user-login-area-end -->
	<jsp:include page="block/block_bottom.jsp"></jsp:include>
<!-- phần dùng chung ở phía trên -->