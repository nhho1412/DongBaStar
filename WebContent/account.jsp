<%@page import="model.bean.AccountBEAN"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="header.jsp"></jsp:include>
<%
	ArrayList<AccountBEAN> listAccount = null;
	ArrayList<AccountBEAN> listAccountVang = null;
	ArrayList<AccountBEAN> listAccountBac = null;
	ArrayList<AccountBEAN> listAccountDong = null;
	listAccount = (ArrayList<AccountBEAN>) request.getAttribute("listAccount");
	listAccountVang = (ArrayList<AccountBEAN>) request.getAttribute("listAccountVang");
	listAccountBac = (ArrayList<AccountBEAN>) request.getAttribute("listAccountBac");
	listAccountDong = (ArrayList<AccountBEAN>) request.getAttribute("listAccountDong");
	int countVang = (Integer) request.getAttribute("countVang");
	int countBac = (Integer) request.getAttribute("countBac");
	int countDong = (Integer) request.getAttribute("countDong");
	if (countDong < 8) {
		countDong = 8;
	}
	if (countBac < 8) {
		countBac = 8;
	}
	if (countVang < 8) {
		countVang = 8;
	}
	int startDong = 1;
	int startBac = 1;
	int startVang = 1;

	if (request.getParameter("startDong") != null) {
		startDong = Integer.parseInt(request.getParameter("startDong"));
	}
	if (request.getParameter("startBac") != null) {
		startBac = Integer.parseInt(request.getParameter("startBac"));
	}
	if (request.getParameter("startVang") != null) {
		startVang = Integer.parseInt(request.getParameter("startVang"));
	}
%>



<div class="content-inner">
	<!-- Page Header-->
	<header class="page-header">
		<div class="container-fluid">
			<h2 class="no-margin-bottom">Thành viên</h2>
		</div>
	</header>
	<!-- Breadcrumb-->
	<div class="breadcrumb-holder container-fluid">
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="index">Trang chủ</a></li>
			<li class="breadcrumb-item active">Thành viên</li>
		</ul>
	</div>
	<%
		String noti = "0";
		if (request.getAttribute("noti") != null) {
			noti = (String) request.getAttribute("noti");
		}
		if (noti.equals("2")) {
	%>
	<div class="alert alert-success" role="alert">Cập nhật thông tin
		thành công!</div>
	<%
		}
		if (noti.equals("1")) {
	%>
	<div class="alert alert-success" role="alert">Xóa tài khoản thành
		công!</div>
	<%
		}
	%>
	<section class="tables">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6">
					<div class="card">
						<div class="card-close">
							<div class="dropdown">
								<button type="button" id="closeCard1" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"
									class="dropdown-toggle">
									<i class="fa fa-ellipsis-v"></i>
								</button>
								<div aria-labelledby="closeCard1"
									class="dropdown-menu dropdown-menu-right has-shadow">
									<a href="#" class="dropdown-item remove"> <i
										class="fa fa-times"></i>Close
									</a>
								</div>
							</div>
						</div>
						<div class="card-header d-flex align-items-center">
							<h3 class="h4">Thành viên Đồng</h3>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>

										<tr>
											<th>#</th>
											<th>Tài khoản</th>
											<th>Tên</th>
											<th>Điểm tích lũy</th>
											<th style="width: 25%;">Hành động</th>
										</tr>

									</thead>
									<tbody>
										<%
										int i = 0;
										if(startDong == 1){
											i = 1;
										}else{
											i = 8*(startDong-1) + 1;
										}
											if (listAccountDong != null) {
												for (AccountBEAN ac : listAccountDong) {
										%>
										<tr>
											<th scope="row"><%=i%></th>
											<td><%=ac.getTaiKhoan()%></td>
											<td><%=ac.getHoTen()%></td>
											<td><%=ac.getDiemTichLuy()%></td>
											<td><span><button class="btn btn-link"
														style="padding: 0px; color: #F07C29" data-toggle="modal"
														data-target="#xemModal<%=ac.getIdTaiKhoan()%>"
														onclick="document.getElementById('<%=ac.getIdTaiKhoan()%>id').style.display='block'">
														<i class="fa fa-info"></i>
													</button></span>&ensp;&ensp;&ensp; <span><button
														class="btn btn-link" data-toggle="modal"
														data-target="#suaModal<%=ac.getIdTaiKhoan()%>"
														style="padding: 0px; color: #F07C29"
														onclick="document.getElementById('<%=ac.getIdTaiKhoan()%>id').style.display='block'">
														<i class="fa fa-edit"></i>
													</button></span>&ensp;&ensp;&ensp; <span><button
														class="btn btn-link" data-toggle="modal"
														data-target="#xoaModal<%=ac.getIdTaiKhoan()%>"
														style="padding: 0px; color: #F07C29">
														<i class="fa fa-trash"></i>
													</button></span></td>
										</tr>
										<%
											i++;
												}
											}
										%>
									</tbody>

								</table>
								<ul class="pagination align-items-center">
									<li class="page-item <%if (startDong == 1) {%> disabled<%}%>"><a
										class="page-link" href="Account?startDong=<%=startDong - 1%>">Previous</a></li>
									<%
										for (int k = 1; k <= (countDong % 8 - countDong / 8+1); k++) {
									%>
									<li class="page-item <%if (startDong == k) {%> active <%}%>"><a
										class="page-link" href="Account?startDong=<%=k%>"><%=k%></a></li>
									<%
										}
									%>
									<li
										class="page-item <%if (startDong == countDong % 8 - countDong / 8+1) {%> disabled<%}%>"><a
										class="page-link" href="Account?startDong=<%=startDong + 1%>">Next</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card">
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
						<div class="card-header d-flex align-items-center">
							<h3 class="h4">Thành viên Bạc</h3>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>Tài khoản</th>
											<th>Tên</th>
											<th>Điểm tích lũy</th>
											<th style="width: 25%;">Hành động</th>
										</tr>
									</thead>
									<tbody>
										<%
										int j = 0;
										if(startBac == 1){
											j = 1;
										}else{
											j = 8*(startBac-1) + 1;
										}
											if (listAccountBac != null) {
												for (AccountBEAN ac : listAccountBac) {
										%>
										<tr>
											<th scope="row"><%=j%></th>
											<td><%=ac.getTaiKhoan()%></td>
											<td><%=ac.getHoTen()%></td>
											<td><%=ac.getDiemTichLuy()%></td>
											<td><span><button class="btn btn-link"
														style="padding: 0px; color: #F07C29" data-toggle="modal"
														data-target="#xemModal<%=ac.getIdTaiKhoan()%>"
														onclick="document.getElementById('<%=ac.getIdTaiKhoan()%>id').style.display='block'">
														<i class="fa fa-info"></i>
													</button></span>&ensp;&ensp;&ensp; <span><button
														class="btn btn-link" data-toggle="modal"
														data-target="#suaModal<%=ac.getIdTaiKhoan()%>"
														style="padding: 0px; color: #F07C29"
														onclick="document.getElementById('<%=ac.getIdTaiKhoan()%>id').style.display='block'">
														<i class="fa fa-edit"></i>
													</button></span>&ensp;&ensp;&ensp; <span><button
														class="btn btn-link" data-toggle="modal"
														data-target="#xoaModal<%=ac.getIdTaiKhoan()%>"
														style="padding: 0px; color: #F07C29">
														<i class="fa fa-trash"></i>
													</button></span></td>
										</tr>
										<%
											j++;
												}
											}
										%>

									</tbody>
								</table>
								<ul class="pagination align-items-center">
									<li class="page-item <%if (startBac == 1) {%> disabled<%}%>"><a
										class="page-link" href="Account?startBac=<%=startBac - 1%>">Previous</a></li>
									<%
										for (int h = 1; h <= (countBac % 8 - countBac / 8 + 1); h++) {
									%>
									<li class="page-item <%if (startBac == h) {%> active <%}%>"><a
										class="page-link" href="Account?startBac=<%=h%>"><%=h%></a></li>
									<%
										}
									%>
									<li
										class="page-item <%if (startBac == countBac % 8 - countBac / 8 + 1) {%> disabled<%}%>"><a
										class="page-link" href="Account?startBac=<%=startBac + 1%>">Next</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="card">
						<div class="card-close">
							<div class="dropdown">
								<button type="button" id="closeCard3" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"
									class="dropdown-toggle">
									<i class="fa fa-ellipsis-v"></i>
								</button>
								<div aria-labelledby="closeCard3"
									class="dropdown-menu dropdown-menu-right has-shadow">
									<a href="#" class="dropdown-item remove"> <i
										class="fa fa-times"></i>Close
									</a>
								</div>
							</div>
						</div>
						<div class="card-header d-flex align-items-center">
							<h3 class="h4">Thành viên Vàng</h3>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-hover" id="example">
									<thead>
										<tr>
											<th>#</th>
											<th>Tài khoản</th>
											<th>Tên</th>
											<th>Điểm tích lũy</th>
											<th>Hành động</th>
										</tr>
									</thead>
									<tbody>
										<%
											int m = 1;
										if(startVang == 1){
											m = 1;
										}else{
											m = 8*(startVang-1) + 1;
										}
											if (listAccountVang != null) {
												for (AccountBEAN ac : listAccountVang) {
										%>
										<tr>
											<th scope="row"><%=m%></th>
											<td><%=ac.getTaiKhoan()%></td>
											<td><%=ac.getHoTen()%></td>
											<td><%=ac.getDiemTichLuy()%></td>
											<td><span><button class="btn btn-link"
														style="padding: 0px; color: #F07C29" data-toggle="modal"
														data-target="#xemModal<%=ac.getIdTaiKhoan()%>"
														onclick="document.getElementById('<%=ac.getIdTaiKhoan()%>id').style.display='block'">
														<i class="fa fa-info"></i>
													</button></span>&ensp;&ensp;&ensp; <span><button
														class="btn btn-link" data-toggle="modal"
														data-target="#suaModal<%=ac.getIdTaiKhoan()%>"
														style="padding: 0px; color: #F07C29"
														onclick="document.getElementById('<%=ac.getIdTaiKhoan()%>id').style.display='block'">
														<i class="fa fa-edit"></i>
													</button></span>&ensp;&ensp;&ensp; <span><button
														class="btn btn-link" data-toggle="modal"
														data-target="#xoaModal<%=ac.getIdTaiKhoan()%>"
														style="padding: 0px; color: #F07C29">
														<i class="fa fa-trash"></i>
													</button></span></td>
										</tr>
										<%
											m++;
												}
											}
										%>
									</tbody>

								</table>
								<ul class="pagination align-items-center">
									<li class="page-item <%if (startVang == 1) {%> disabled<%}%>"><a
										class="page-link" href="Account?startVang=<%=startVang - 1%>">Previous</a></li>
									<%
										for (int l = 1; l <= (countVang % 8 - countVang / 8 + 1); l++) {
									%>
									<li class="page-item <%if (startVang == l) {%> active <%}%>"><a
										class="page-link" href="Account?startVang=<%=l%>"><%=l%></a></li>
									<%
										}
									%>
									<li
										class="page-item <%if (startVang == countVang % 8 - countVang / 8 + 1) {%> disabled<%}%>"><a
										class="page-link" href="Account?startVang=<%=startVang + 1%>">Next</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="card-body text-center">
					<%
						for (AccountBEAN ac : listAccount) {
					%>
					<!-- Model xóa thành viên -->
					<div class="modal fade" id="xoaModal<%=ac.getIdTaiKhoan()%>"
						tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Xóa thành
										viên</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									Bạn có muốn xóa thành viên
									<%=ac.getHoTen()%>?
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-danger"
										data-dismiss="modal">Không</button>
									<a href="XuLy?deleteAccount=<%=ac.getIdTaiKhoan()%>"><button
											type="button" class="btn btn-outline-success">Có</button></a>
								</div>
							</div>
						</div>
					</div>

					<!-- Model sửa thành viên -->
					<div id="suaModal<%=ac.getIdTaiKhoan()%>" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true" class="modal fade text-left"
						id="<%=ac.getIdTaiKhoan()%>id">
						<div role="document" class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 id="exampleModalLabel" class="modal-title">SỬA THÔNG
										TIN THÀNH VIÊN</h4>
									<button type="button" data-dismiss="modal" aria-label="Close"
										class="close">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">
									<form method="post"
										action="Account?idLoaiTaiKhoan=<%=ac.getIdLoaiTaiKhoan()%>">
										<div class="form-group">
											<label>Tài khoản</label> <input type="text"
												placeholder="Tài khoản" class="form-control"
												value="<%=ac.getTaiKhoan()%>" name="taiKhoann" required readonly>
										</div>
										<div class="form-group">
											<label>Họ tên</label> <input type="text" placeholder="Họ tên"
												class="form-control" value="<%=ac.getHoTen()%>" name="hoTen"
												required>
										</div>
										<div class="form-group">
											<label>Số điện thoại</label> <input type="text"
												placeholder="Số điện thoại" class="form-control"
												value="<%=ac.getSoDienThoai()%>" name="soDienThoai" required>
										</div>
										<div class="form-group">
											<label>Địa chỉ</label> <input type="text"
												placeholder="Địa chỉ" class="form-control"
												value="<%=ac.getDiaChi()%>" name="diaChi" required>
										</div>
										<div class="form-group">
											<label>Email</label> <input type="text" placeholder="Email"
												class="form-control" value="<%=ac.getEmail()%>" required
												name="email">
										</div>
										<div class="form-group">
											<label>Điểm tích lũy</label> <input type="text"
												placeholder="Điểm tích lũy" class="form-control"
												value="<%=ac.getDiemTichLuy()%>" name="diemTichLuy" required>
										</div>

										<div class="form-group">
											<button type="submit" class="btn btn-primary" name="edit1"
												value="<%=ac.getIdTaiKhoan()%>">Sửa</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>

					<!-- Modal xem thành viên -->

					<div id="xemModal<%=ac.getIdTaiKhoan()%>" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true" class="modal fade text-left"
						id="<%=ac.getIdTaiKhoan()%>id">
						<div role="document" class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 id="exampleModalLabel" class="modal-title">XEM THÔNG
										TIN THÀNH VIÊN</h4>
									<button type="button" data-dismiss="modal" aria-label="Close"
										class="close">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">
									<table class="table table-borderless"
										style="background-color: white;">
										<tbody>
											<tr>
												<th scope="row">Tài khoản:</th>
												<td><%=ac.getTaiKhoan()%></td>
											</tr>
											<tr>
												<th scope="row">Họ tên:</th>
												<td colspan="2"><%=ac.getHoTen()%></td>
											</tr>
											<tr>
												<th scope="row">Số điện thoại:</th>
												<td colspan="2"><%=ac.getSoDienThoai()%></td>
											</tr>
											<tr>
												<th scope="row">Địa chỉ:</th>
												<td><%=ac.getDiaChi()%></td>
											</tr>
											<tr>
												<th scope="row">Email:</th>
												<td colspan="2"><%=ac.getEmail()%></td>
											</tr>
											<tr>
												<th scope="row">Điểm tích lũy:</th>
												<td colspan="2"><%=ac.getDiemTichLuy()%></td>
											</tr>
										</tbody>

									</table>
								</div>
							</div>
						</div>
					</div>
					<script>
	// Get the modal
	var modal = document.getElementById('<%=ac.getIdTaiKhoan()%>id');

						// When the user clicks anywhere outside of the modal, close it
						window.onclick = function(event) {
							if (event.target == modal) {
								modal.style.display = "none";
							}
						}
					</script>
					<%
						}
					%>
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