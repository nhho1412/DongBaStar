<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="block/block_top.jsp"></jsp:include>
<!-- phần dùng chung ở phía trên -->

<!-- user-login-area-start -->
<div class="user-login-area mb-70 content-register">
	<div class="container">
		<div class="row breadcrumbs-info-film">
			<div class="col-lg-12">
				<div class="breadcrumbs-menu">
					<ul>
						<li><a href="index">Trang chủ</a></li>
						<li><a href="DBRegister" class="active"><span>Đăng
									ký</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div
				class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12 tt23">
				<div class="col-lg-12 title-register">
					<div class="login-title text-center mb-30">
						<h2>ĐĂNG KÝ</h2>
						<%
							String noti = "-1";
							if (request.getAttribute("noti") != null) {
								noti = (String) request.getAttribute("noti");
							}
							if (noti.equals("0")) {
						%><div class="alert alert-warning" role="alert">tài khoản đã
							tồn tại trong hệ thống!</div>
						<%
							}
							if (noti.equals("1")) {
						%><div class="alert alert-warning" role="alert">Email đã tồn
							tại trong hệ thống!</div>
						<%
							}
							if (noti.equals("3")) {
						%><div class="alert alert-warning" role="alert">Số điện thoại đã
							tồn tại trong hệ thống!</div>
						<%
							}
							if (noti.equals("2")) {
						%><div class="alert alert-success" role="alert">
							Tạo tài khoản thành công! nhấn <a href="DBLogin">vào đây</a> để
							đăng nhập
						</div>
						<%
							}
						%>

					</div>
				</div>
				<form action="DBRegister" method="post">
					<div class="billing-fields tt22">
						<div class="single-register tt27">
							<label>Tên đăng nhập <span>*</span></label> <input type="text"
								placeholder="nhập taikhoan" name="taikhoan" required />
						</div>
						<div class="single-register">
							<label>Họ tên <span>*</span></label> <input type="text"
								placeholder="nhập họ tên" name="hoten" required />
						</div>
						<div class="single-register">
							<label>Địa chỉ <span>*</span></label> <input type="text"
								placeholder="nhập địa chỉ" name="diachi" required />
						</div>
						<div class="single-register">
							<label>Email <span>*</span></label> <input type="email"
								placeholder="nhập email" name="email" required />
						</div>
						<div class="single-register">
							<label>Số điện thoại <span>*</span></label> <input type="text"
								placeholder="nhập số điện thoại" name="sdt" required />
						</div>
						<div class="single-register">
							<label>Mật khẩu<span>*</span></label> <input type="password"
								placeholder="Password" name="password" required />
						</div>
						<div class="single-register">
							<label>Xác nhận mật khẩu<span>*</span></label> <input
								type="password" placeholder="Password" name="password1" required />
						</div>
						<label class="inline">Khi bạn nhấn đăng ký thì đồng thời
							bạn sẽ đồng ý với<a href="#"> Quy định và Điều khoản</a> của
							chúng tôi!
						</label>
						<div class="single-register">
							<button class="btn btn-primary btnsubmit" type="submit"
								name="register" value="true">ĐĂNG KÝ</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>
<!-- user-login-area-end -->
<jsp:include page="block/block_bottom.jsp"></jsp:include>
<!-- phần dùng chung ở phía trên -->