
<%@page import="model.bean.EventBEAN"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="header.jsp"></jsp:include>
<%
	ArrayList<EventBEAN> listEvent = null;
	listEvent = (ArrayList<EventBEAN>) request.getAttribute("listEvent");
%>
<%
	int countSuKien=(Integer)request.getAttribute("countSuKien");
if(countSuKien<8){
	countSuKien=8;
}
int startSuKien=1;
if(request.getParameter("startSuKien")!=null){
	startSuKien=Integer.parseInt(request.getParameter("startSuKien"));
}
%>
<div class="content-inner">
	<!-- Page Header-->
	<header class="page-header">
		<div class="container-fluid">
			<h2 class="no-margin-bottom">Sự kiện</h2>
		</div>
	</header>
	<!-- Breadcrumb-->
	<div class="breadcrumb-holder container-fluid">
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="index">Trang chủ</a></li>
			<li class="breadcrumb-item active">Sự kiện</li>
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
	<div class="alert alert-success" role="alert">Xóa sự kiện thành
		công!</div>
	<%
		}
		if (noti.equals("3")) {
	%>
	<div class="alert alert-success" role="alert">Thêm sự kiện thành
		công!</div>
	<%
		}
	%>
	<!-- Forms Section-->
	<section class="forms">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-9">
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
							<h4>DANH SÁCH SỰ KIỆN</h4>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>Tên sự kiện</th>
											<th>Mô tả</th>
											<th style="width: 12%;">Hành động</th>
										</tr>
									</thead>
									<tbody>
										<%
										int i = 0;
										if(startSuKien == 1){
											i = 1;
										}else{
											i = 8*(startSuKien-1) + 1;
										}
											if (listEvent != null) {
												for (EventBEAN event : listEvent) {
										%>

										<tr>
											<th scope="row"><%=i%></th>
											<td><%=event.getTenSuKien()%></td>
											<td><%=event.getMoTa()%></td>
											<td style="width:10%"><span><button class="btn btn-link"
														data-toggle="modal"
														data-target="#suaModal<%=event.getIdSuKien()%>"
														style="padding: 0px; color: #F07C29"
														onclick="document.getElementById('<%=event.getIdSuKien()%>id').style.display='block'">
														<i class="fa fa-edit"></i>
													</button></span>&ensp;&ensp;&ensp; <span><button
														class="btn btn-link" data-toggle="modal"
														data-target="#xoaModal<%=event.getIdSuKien()%>"
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
									<li class="page-item <%if (startSuKien == 1) {%> disabled<%}%>"><a
										class="page-link" href="Event?startSuKien=<%=startSuKien - 1%>">Previous</a></li>
									<%
										for (int h = 1; h <= (countSuKien / 8 -countSuKien % 8  + 1); h++) {
									%>
									<li class="page-item <%if (startSuKien == h) {%> active <%}%>"><a
										class="page-link" href="Event?startSuKien=<%=h%>"><%=h%></a></li>
									<%
										}
									%>
									<li
										class="page-item <%if (startSuKien == countSuKien % 8 - countSuKien / 8 + 1) {%> disabled<%}%>"><a
										class="page-link" href="Event?startSuKien=<%=startSuKien + 1%>">Next</a></li>
								</ul>
							</div>

						</div>
					</div>
				</div>
				<!-- Modal Form-->
				<div class="col-lg-3">
					<div class="card">
						<div class="card-close">
							<div class="dropdown">
								<button type="button" id="closeCard4" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"
									class="dropdown-toggle">
									<i class="fa fa-ellipsis-v"></i>
								</button>
								<div aria-labelledby="closeCard4"
									class="dropdown-menu dropdown-menu-right has-shadow">
									<a href="#" class="dropdown-item remove"> <i
										class="fa fa-times"></i>Close
									</a>
								</div>
							</div>
						</div>
						<div class="card-header d-flex align-items-center">
							<h3 class="h4">Thêm sự kiện</h3>
						</div>
						<div class="card-body text-center">
							<button type="button" data-toggle="modal"
								data-target="#themModal" class="btn btn-primary">Thêm
								sự kiện</button>
							<!-- Modal thêm phim-->
							<div id="themModal" tabindex="-1" role="dialog"
								aria-labelledby="exampleModalLabel" aria-hidden="true"
								class="modal fade text-left">
								<div role="document" class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 id="exampleModalLabel" class="modal-title">THÊM SỰ
												KIỆN</h4>
											<button type="button" data-dismiss="modal" aria-label="Close"
												class="close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
										<div class="modal-body">
											<form action="Event?insert=true" method="post">
												<div class="form-group">
													<label>Tên sự kiện</label> <input type="text"
														placeholder="Tên sự kiện" class="form-control"
														name="tenSuKien">
												</div>
												<div class="form-group">
													<label>Ảnh sự kiện</label> <input type="text"
														placeholder="Ảnh sự kiện" class="form-control"
														name="anhSuKien">
												</div>
												<div class="form-group">
													<label>Mô tả</label> <input type="text" placeholder="Mô tả"
														class="form-control" name="moTa">
												</div>
												<div class="form-group">
													<input type="submit" value="Thêm" class="btn btn-primary">
												</div>
											</form>
										</div>


									</div>
								</div>
							</div>
						</div>
						<%
							for (EventBEAN event : listEvent) {
						%>
						<!-- Model xóa sự kiện -->
						<div class="modal fade" id="xoaModal<%=event.getIdSuKien()%>"
							tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Xóa sự
											kiện</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">Bạn có muốn xóa sự kiện này?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-outline-danger"
											data-dismiss="modal">Đóng</button>
										<a href="XuLy?deleteEvent=<%=event.getIdSuKien()%>"><button
												type="button" class="btn btn-outline-success">Lưu</button></a>
									</div>
								</div>
							</div>
						</div>

						<!-- Model sửa sự kiện -->
						<div id="suaModal<%=event.getIdSuKien()%>" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true" class="modal fade text-left"
							id="<%=event.getIdSuKien()%>id">
							<div role="document" class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h4 id="exampleModalLabel" class="modal-title">SỬA SỰ
											KIỆN</h4>
										<button type="button" data-dismiss="modal" aria-label="Close"
											class="close">
											<span aria-hidden="true">×</span>
										</button>
									</div>
									<div class="modal-body">
										<form method="post"
											action="Event?idSuKien=<%=event.getIdSuKien()%>">
											<div class="form-group">
												<label>Tên sự kiện</label> <input type="text"
													placeholder="Tên sự kiện" class="form-control"
													value="<%=event.getTenSuKien()%>" name="tenSuKien"
													required>
											</div>
											<div class="form-group">
												<label>Ảnh sự kiện</label> <input type="text"
													placeholder="Thời lượng" class="form-control"
													value="<%=event.getAnhSuKien()%>" required
													name="anhSuKien">
											</div>
											<div class="form-group">
												<label>Mô tả ngắn</label> <input type="text"
													placeholder="Mô tả ngắn" class="form-control"
													value="<%=event.getMoTa()%>" required name="moTa">
											</div>
											<div class="form-group">
												<button type="submit" class="btn btn-primary" name="edit"
													value="<%=event.getIdSuKien()%>">Sửa</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<%
							}
						%>
						<script>
							// Get the modal
							var modal = document.getElementById('id');

							// When the user clicks anywhere outside of the modal, close it
							window.onclick = function(event) {
								if (event.target == modal) {
									modal.style.display = "none";
								}
							}
						</script>

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