<%@page import="model.bean.AccountBEAN"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="header.jsp"></jsp:include>


<div class="content-inner">
	<!-- Page Header-->
	<header class="page-header">
		<div class="container-fluid">
			<h2 class="no-margin-bottom">Thông tin cá nhân</h2>
		</div>
	</header>
	<!-- Breadcrumb-->
	<div class="breadcrumb-holder container-fluid">
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="index">Trang chủ</a></li>
			<li class="breadcrumb-item active">Thông tin cá nhân</li>
		</ul>
	</div>
	<%
AccountBEAN taiKhoan = null;
if(request.getAttribute("taiKhoan")!=null)
	taiKhoan = (AccountBEAN) request.getAttribute("taiKhoan");

String noti = "0";
if(request.getAttribute("noti")!=null){
	noti = (String)request.getAttribute("noti");	
}
if(noti.equals("1")){
	%><div class="alert alert-success" role="alert">Cập nhật thông tin thành công!</div> <%
}

%>
	<section class="tables">
		<div class="container-fluid">
			<div class="row">
				<!-- Client Profile -->
				<div class="col-lg-5">
					<div class="client card">
						<div class="card-close">
							<div class="dropdown">
								<button type="button" id="closeCard2" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"
									class="dropdown-toggle">
									<i class="fa fa-ellipsis-v"></i>
								</button>
								<div aria-labelledby="closeCard2"
									class="dropdown-menu dropdown-menu-right has-shadow">
									<a href="#" class="dropdown-item remove"> <i
										class="fa fa-times"></i>Close
									</a>
								</div>
							</div>
						</div>
						<div class="card-body text-center">
							<div class="client-avatar">
								<img src="assets/img/ava.jpg" alt="..."
									class="img-fluid rounded-circle">
								<div class="status bg-green"></div>
							</div>
							<div class="client-title">
								<h3><%=taiKhoan.getHoTen() %></h3>
								<span>Quản lý</span><a href="#">Follow</a>
							</div>
							<div class="client-social d-flex justify-content-between">
								<a href="#" target="_blank"><i class="fa fa-facebook"></i></a><a
									href="#" target="_blank"><i class="fa fa-twitter"></i></a><a
									href="#" target="_blank"><i class="fa fa-google-plus"></i></a><a
									href="#" target="_blank"><i class="fa fa-instagram"></i></a><a
									href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
							</div>

						</div>
					</div>
				</div>

				<div class="col-lg-7">
					<div class="client card">
						<div class="card-close">
							<div class="dropdown">
								<button type="button" id="closeCard2" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"
									class="dropdown-toggle">
									<i class="fa fa-ellipsis-v"></i>
								</button>
								<div aria-labelledby="closeCard2"
									class="dropdown-menu dropdown-menu-right has-shadow">
									<a href="#" class="dropdown-item remove"> <i
										class="fa fa-times"></i>Close
									</a>
								</div>
							</div>
						</div>
						<div class="card-body text-center">
							<table class="table table-borderless"
								style="background-color: white;">
								<tbody>
									<tr>
										<th scope="row">Tài khoản:</th>
										<td><%=taiKhoan.getTaiKhoan() %></td>
									</tr>
									<tr>
										<th scope="row">Mật khẩu:</th>
										<td colspan="2"><%=taiKhoan.getMatKhau() %></td>
									</tr>
									<tr>
										<th scope="row">Họ tên:</th>
										<td colspan="2"><%=taiKhoan.getHoTen() %></td>
									</tr>
									<tr>
										<th scope="row">Số điện thoại:</th>
										<td colspan="2"><%=taiKhoan.getSoDienThoai() %></td>
									</tr>
									<tr>
										<th scope="row">Địa chỉ:</th>
										<td><%=taiKhoan.getDiaChi() %></td>
									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td colspan="2"><%=taiKhoan.getEmail() %></td>
									</tr>

								</tbody>

							</table>
							<button type="button" data-toggle="modal" data-target="#suaModal"
								class="btn btn-primary">Sửa thông tin</button>
						</div>
					</div>
				</div>


			</div>
		</div>
		<div class="card-body text-center">
			<!-- Model sửa thành viên -->
			<div id="suaModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true"
				class="modal fade text-left">
				<div role="document" class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 id="exampleModalLabel" class="modal-title">SỬA THÔNG TIN
								THÀNH VIÊN</h4>
							<button type="button" data-dismiss="modal" aria-label="Close"
								class="close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<form method="post" action="Info">
								<div class="form-group">
									<label>Tài khoản</label> <input type="text"
										placeholder="Tên phim" class="form-control" name="taiKhoann" value="<%=taiKhoan.getTaiKhoan() %>" readonly>
								</div>
								<div class="form-group">
									<label>Mật khẩu</label> <input type="text"
										placeholder="Điểm tích lũy" class="form-control" name="matKhau" value="<%=taiKhoan.getMatKhau()%>">
								</div>
								<div class="form-group">
									<label>Họ tên</label> <input type="text"
										placeholder="Thời lượng" class="form-control"
										value="<%=taiKhoan.getHoTen() %>" name="hoTen">
								</div>
								<div class="form-group">
									<label>Số điện thoại</label> <input type="text"
										placeholder="Mô tả ngắn" class="form-control"
										value="<%=taiKhoan.getSoDienThoai() %>" name="soDienThoai">
								</div>
								<div class="form-group">
									<label>Địa chỉ</label> <input type="text"
										placeholder="Đạo diễn" class="form-control" value="<%=taiKhoan.getDiaChi() %>" name="diaChi">
								</div>
								<div class="form-group">
									<label>Email</label> <input type="email" placeholder="Diễn viên" name="email"
										class="form-control" value="<%=taiKhoan.getEmail()%>">
								</div>


								<div class="form-group">
									<input type="submit" name="edit" value="Sửa" class="btn btn-primary">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Page Footer-->
	<footer class="main-footer">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-6">
					<p>My team &copy; 2019</p>
				</div>
				<div class="col-sm-6 text-right">
					<p>
						Design by <a href="" class="external">DongBa Star</a>
					</p>
				</div>
			</div>
		</div>
	</footer>
</div>
</div>
</div>
<!-- JavaScript files-->
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/popper.js/umd/popper.min.js"> </script>
<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="assets/vendor/chart.js/Chart.min.js"></script>
<script src="assets/vendor/jquery-validation/jquery.validate.min.js"></script>
<!-- Main File-->
<script src="assets/js/front.js"></script>

</body>

</html>