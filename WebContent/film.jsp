<%@page import="model.bean.ADFilmBEAN"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.bean.FilmBEAN"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="header.jsp"></jsp:include>
<%
	ArrayList<ADFilmBEAN> listFilm = null;
	listFilm = (ArrayList<ADFilmBEAN>) request.getAttribute("listFilm");
%>

<%
	int currentSelectThang = (Integer) (request.getAttribute("currentSelectThang"));
	int currentSelectNam = (Integer) (request.getAttribute("currentSelectNam"));
	SimpleDateFormat ff = new SimpleDateFormat("dd/MM/yyyy");
%>
<div class="content-inner">
	<!-- Page Header-->
	<header class="page-header">
		<div class="container-fluid">
			<h2 class="no-margin-bottom">Phim</h2>
		</div>
	</header>
	<!-- Breadcrumb-->
	<div class="breadcrumb-holder container-fluid">
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="index">Trang chủ</a></li>
			<li class="breadcrumb-item active">Phim</li>
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
		phim thành công!</div>
	<%
		}
		if (noti.equals("1")) {
	%>
	<div class="alert alert-success" role="alert">Xóa phim thành
		công!</div>
	<%
		}
		if (noti.equals("3")) {
	%>
	<div class="alert alert-success" role="alert">Thêm phim thành
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
							<div class="col-lg-4">
								<h3 class="h4">Chọn thời gian</h3>
							</div>

							<div class="form-group row col-lg-8">
								<form action="Film" method="post" style="width: 100%;">
									<div class="col-lg-4" style="float: right">
										<button type="submit" data-toggle="modal"
											data-target="#myModal" class="btn btn-primary">Chọn</button>
									</div>
									<div class="col-lg-4" style="float: right">
										<select class="custom-select mr-sm-2"
											id="inlineFormCustomSelect" name="txt_nam">
											<option selected value="<%=currentSelectNam%>">Năm:
												<%=currentSelectNam != -1 ? currentSelectNam : "ALL"%></option>
											<option value="-1">Năm: Tất cả</option>
											<option value="2016">2016</option>
											<option value="2017">2017</option>
											<option value="2018">2018</option>
											<option value="2019">2019</option>
											<option value="2020">2020</option>
										</select>
									</div>

									<div class="col-lg-4" style="float: right">
										<select class="custom-select mr-sm-2"
											id="inlineFormCustomSelect" name="txt_thang">
											<option selected value="<%=currentSelectThang%>">Tháng:
												<%=currentSelectThang != -1 ? currentSelectThang : "ALL"%></option>
											<option value="-1">Tháng: Tất cả</option>
											<%
												for (int i = 1; i < 13; i++) {
											%>
											<option value="<%=i%>"><%=i%></option>
											<%
												}
											%>


										</select>
									</div>

								</form>
							</div>

						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-hover" id="example" class="display"
									style="width: 100%">
									<thead>
										<tr>
											<th>#</th>
											<th>Tên phim</th>
											<th>Thể loại</th>
											<th>Thời lượng</th>
											<th>Đạo diễn</th>
											<th style="width: 15%;">Ngày công chiếu</th>
											<th style="width: 16%;">Hành động</th>
										</tr>
									</thead>
									<tbody>
										<%
											if (listFilm != null) {
												if (listFilm.size() == 0) {
										%>
										<tr>
											<th scope="row"><%=1%></th>
											<td><%="Không có phim nào"%></td>
											<td><%=" "%></td>
											<td><%=" "%></td>
											<td><%=" "%></td>
											<td><%=" "%></td>
											<td><%=" "%></td>
										</tr>
										<%
											}
											}
										%>
										<%
											if (listFilm != null) {
												for (int i = 0; i < listFilm.size(); i++) {
										%>
										<tr>
											<th scope="row"><%=i%></th>
											<td><%=listFilm.get(i).getTenPhim()%></td>
											<td><%=listFilm.get(i).getTheLoai()%></td>
											<td><%=listFilm.get(i).getThoiLuong()%></td>
											<td><%=listFilm.get(i).getDaoDien()%></td>
											<td style="width: 13%"><%=listFilm.get(i).getNgayCongChieu()%></td>
											<td style="width: 13%"><span><button
														class="btn btn-link" style="padding: 0px; color: #F07C29"
														data-toggle="modal"
														data-target="#xemModal<%=listFilm.get(i).getIdPhim()%>"
														onclick="document.getElementById('<%=listFilm.get(i).getIdPhim()%>id').style.display='block'">
														<i class="fa fa-info"></i>
													</button></span>&ensp;&ensp;&ensp; <span><button
														class="btn btn-link" data-toggle="modal"
														data-target="#suaModal<%=listFilm.get(i).getIdPhim()%>"
														style="padding: 0px; color: #F07C29"
														onclick="document.getElementById('<%=listFilm.get(i).getIdPhim()%>id').style.display='block'">
														<i class="fa fa-edit"></i>
													</button></span>&ensp;&ensp;&ensp; <span><button
														class="btn btn-link" data-toggle="modal"
														data-target="#xoaModal<%=listFilm.get(i).getIdPhim()%>"
														style="padding: 0px; color: #F07C29">
														<i class="fa fa-trash"></i>
													</button></span></td>
										</tr>
										<%
											}
											}
										%>
									</tbody>
								</table>

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
							<h3 class="h4">Thêm phim</h3>
						</div>
						<div class="card-body text-center">
							<button type="button" data-toggle="modal"
								data-target="#themModal" class="btn btn-primary">Thêm
								phim</button>
							<!-- Modal thêm phim-->
							<div id="themModal" tabindex="-1" role="dialog"
								aria-labelledby="exampleModalLabel" aria-hidden="true"
								class="modal fade text-left">
								<div role="document" class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 id="exampleModalLabel" class="modal-title">THÊM PHIM</h4>
											<button type="button" data-dismiss="modal" aria-label="Close"
												class="close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
										<div class="modal-body">
											<form action="Film?insert=true" method="post">
												<div class="form-group">
													<label>Tên phim</label> <input type="text"
														placeholder="Tên phim" class="form-control" name="tenPhim">
												</div>
												<div class="form-group">
													<label>Thời lượng</label> <input type="text"
														placeholder="Thời lượng" class="form-control"
														name="thoiLuong">
												</div>
												<div class="form-group">
													<label>Mô tả ngắn</label> <input type="text"
														placeholder="Mô tả ngắn" class="form-control"
														name="moTaNgan">
												</div>
												<div class="form-group">
													<label>Đạo diễn</label> <input type="text"
														placeholder="Đạo diễn" class="form-control" name="daoDien">
												</div>
												<div class="form-group">
													<label>Diễn viên</label> <input type="text"
														placeholder="Diễn viên" class="form-control"
														name="dienVien">
												</div>
												<div class="form-group">
													<label>Hình ảnh 1</label> <input type="text"
														placeholder="Chọn hình 1" class="form-control"
														name="hinhAnh1">
												</div>
												<div class="form-group">
													<label>Hình ảnh 2</label> <input type="text"
														placeholder="Chọn hình 1" class="form-control"
														name="hinhAnh2">
												</div>
												<div class="form-group">
													<label>Hình ảnh 3</label> <input type="text"
														placeholder="Chọn hình 1" class="form-control"
														name="hinhAnh3">
												</div>
												<div class="form-group">
													<label>Hình ảnh 4</label> <input type="text"
														placeholder="Chọn hình 1" class="form-control"
														name="hinhAnh4">
												</div>
												<div class="form-group">
													<label>Video</label> <input type="text" placeholder="Video"
														class="form-control" name="video">
												</div>
												<div class="form-group">
													<label>Thể loại</label> <input type="text"
														placeholder="Thể loại" class="form-control" name="theLoai">
												</div>
												<div class="form-group">
													<label>Ngày công chiếu</label> <input type="date"
														placeholder="Ngày công chiếu" class="form-control"
														name="ngayCongChieu">
												</div>
												<div class="form-group">
													<label>Giới hạn tuổi</label> <input type="number"
														placeholder="Giới hạn tuổi" class="form-control"
														name="gioiHanTuoi">
												</div>
												<div class="form-group">
													<label>Định dạng phim</label> <input type="text"
														placeholder="Định dạng phim" class="form-control"
														name="dinhDangPhim">
												</div>
												<div class="form-group">
													<input type="submit" value="Thêm" class="btn btn-primary">
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<%
								if (listFilm != null) {
									for (ADFilmBEAN film : listFilm) {
							%>
							<!-- Model xóa phim -->
							<div class="modal fade" id="xoaModal<%=film.getIdPhim()%>"
								tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Xóa phim</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											Bạn có muốn xóa phim
											<%=film.getTenPhim()%>?
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-outline-danger"
												data-dismiss="modal">Đóng</button>
											<a href="XuLy?deleteFilm=<%=film.getIdPhim()%>"><button
													type="button" class="btn btn-outline-success">Lưu</button></a>
										</div>
									</div>
								</div>
							</div>

							<!-- Model sửa phim -->
							<div id="suaModal<%=film.getIdPhim()%>" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true" class="modal fade text-left"
								id="<%=film.getIdPhim()%>id">
								<div role="document" class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 id="exampleModalLabel" class="modal-title">SỬA PHIM</h4>
											<button type="button" data-dismiss="modal" aria-label="Close"
												class="close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
										<div class="modal-body">
											<form method="post" action="Film" enctype= "multipart/form-data">
												<div class="form-group">
													<label>Tên phim</label> <input type="text"
														placeholder="Tên phim" class="form-control"
														value="<%=film.getTenPhim()%>" name="tenPhim" required>
												</div>
												<div class="form-group">
													<label>Thời lượng</label> <input type="text"
														placeholder="Thời lượng" class="form-control"
														value="<%=film.getThoiLuong()%>" name="thoiLuong" required>
												</div>
												<div class="form-group">
													<label>Mô tả ngắn</label> <input type="text"
														placeholder="Mô tả ngắn" class="form-control"
														value="<%=film.getMoTaNgan()%>" name="moTaNgan" required>
												</div>
												<div class="form-group">
													<label>Đạo diễn</label> <input type="text"
														placeholder="Đạo diễn" class="form-control"
														value="<%=film.getDaoDien()%>" name="daoDien" required>
												</div>
												<div class="form-group">
													<label>Diễn viên</label> <input type="text"
														placeholder="Diễn viên" class="form-control"
														value="<%=film.getDienVien()%>" name="dienVien" required>
												</div>
												<div class="form-group">
													<label>Hình ảnh 1</label> <input type="file"
														placeholder="Chọn hình 1" class="form-control"
														value="<%=film.getHinhAnh1()%>" name="hinhAnh1" required>
												</div>
												<div class="form-group">
													<label>Hình ảnh 2</label> <input type="file"
														placeholder="Chọn hình 1" class="form-control"
														value="<%=film.getHinhAnh2()%>" name="hinhAnh2" required>
												</div>
												<div class="form-group">
													<label>Hình ảnh 3</label> <input type="file"
														placeholder="Chọn hình 1" class="form-control"
														value="<%=film.getHinhAnh3()%>" name="hinhAnh3" required>
												</div>
												<div class="form-group">
													<label>Hình ảnh 4</label> <input type="file"
														placeholder="Chọn hình 1" class="form-control"
														value="<%=film.getHinhAnh4()%>" name="hinhAnh4" required>
												</div>
												<div class="form-group">
													<label>Video</label> <input type="text" placeholder="Video"
														class="form-control" value="<%=film.getVideo()%>"
														name="video" required>
												</div>
												<div class="form-group">
													<label>Thể loại</label> <input type="text"
														placeholder="Thể loại" class="form-control"
														value="<%=film.getTheLoai()%>" name="theLoai" required>
												</div>
												<div class="form-group">
													<label>Ngày công chiếu</label> <input type="date"
														placeholder="Ngày công chiếu" class="form-control"
														value="<%=film.getNgayCongChieu()%>" name="ngayCongChieu"
														required>
												</div>
												<div class="form-group">
													<label>Giới hạn tuổi</label> <input type="text"
														placeholder="Giới hạn tuổi" class="form-control"
														value="<%=film.getGioiHanTuoi()%>" name="gioiHanTuoi"
														required>
												</div>
												<div class="form-group">
													<label>Định dạng phim</label> <input type="text"
														placeholder="Định dạng phim" class="form-control"
														value="<%=film.getDinhDangPhim()%>" name="dinhDangPhim"
														required>
												</div>
												<div class="form-group" style="text-align: center;">
													<label class="form-check-label" style="margin-right: 40px">
														<input type="radio" class="form-control" name="trangThai"
														value="true" <%if (film.isTrangThai() == true) {%>
														checked="checked" <%}%>>Đang chiếu
													</label> <label class="form-check-label"> <input
														type="radio" class="form-control" name="trangThai"
														value="false" <%if (film.isTrangThai() == false) {%>
														checked="checked" <%}%>>Ngừng chiếu
													</label>
												</div>
												<div class="form-group">
													<button type="submit" class="btn btn-primary" name="edit"
														value="<%=film.getIdPhim()%>">Sửa</button>
												</div>

											</form>
										</div>
									</div>
								</div>
							</div>

							<!-- Modal xem phim -->

							<div id="xemModal<%=film.getIdPhim()%>" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true" class="modal fade text-left"
								id="<%=film.getIdPhim()%>id">
								<div role="document" class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 id="exampleModalLabel" class="modal-title">XEM THÔNG
												TIN PHIM</h4>
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
														<th scope="row">Tên phim:</th>
														<td><%=film.getTenPhim()%></td>
													</tr>
													<tr>
														<th scope="row">Thời lượng:</th>
														<td colspan="2"><%=film.getThoiLuong()%></td>
													</tr>
													<tr>
														<th scope="row">Mô tả ngắn:</th>
														<td colspan="2"><%=film.getMoTaNgan()%></td>
													</tr>
													<tr>
														<th scope="row">Đạo diễn:</th>
														<td><%=film.getDaoDien()%></td>
													</tr>
													<tr>
														<th scope="row">Diễn viên:</th>
														<td colspan="2"><%=film.getDienVien()%></td>
													</tr>
													<tr>
														<th scope="row">Hình ảnh 1:</th>
														<td colspan="2"><%=film.getHinhAnh1()%></td>
													</tr>
													<tr>
														<th scope="row">Hình ảnh 2:</th>
														<td colspan="2"><%=film.getHinhAnh2()%></td>
													</tr>
													<tr>
														<th scope="row">Hình ảnh 3:</th>
														<td colspan="2"><%=film.getHinhAnh3()%></td>
													</tr>
													<tr>
														<th scope="row">Hình ảnh 4:</th>
														<td colspan="2"><%=film.getHinhAnh4()%></td>
													</tr>
													<tr>
														<th scope="row">Video:</th>
														<td colspan="2"><%=film.getVideo()%></td>
													</tr>
													<tr>
														<th scope="row">Thể loại:</th>
														<td colspan="2"><%=film.getTheLoai()%></td>
													</tr>
													<tr>
														<th scope="row">Ngày công chiếu:</th>
														<td colspan="2"><%=film.getNgayCongChieu()%></td>
													</tr>
													<tr>
														<th scope="row">Giới hạn tuổi:</th>
														<td colspan="2"><%=film.getGioiHanTuoi()%></td>
													</tr>
													<tr>
														<th scope="row">Định dạng phim:</th>
														<td colspan="2"><%=film.getDinhDangPhim()%></td>
													</tr>
													<tr>
														<th scope="row">Trạng thái:</th>
														<td colspan="2"><%=film.isTrangThai()%></td>
													</tr>
												</tbody>

											</table>
										</div>
									</div>
								</div>
							</div>
							<script>
	// Get the modal
	var modal = document.getElementById('<%=film.getIdPhim()%>id');

								// When the user clicks anywhere outside of the modal, close it
								window.onclick = function(event) {
									if (event.target == modal) {
										modal.style.display = "none";
									}
								}
							</script>
							<%
								}
								}
							%>
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