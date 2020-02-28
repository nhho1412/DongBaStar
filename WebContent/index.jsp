
<%@page import="model.bean.ADFilmBEAN"%>
<%@page import="model.bean.DoanhThuBEAN"%>
<%@page import="model.bean.DoanhSoBEAN"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.bean.FilmBEAN"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<jsp:include page="header.jsp"></jsp:include>

<%
	int countFilm = (Integer) request.getAttribute("countFilm");
	int countAccount = (Integer) request.getAttribute("countAccount");
	long tongDoanhThu = (Long) request.getAttribute("tongDoanhThu");
	int hoaDon = (Integer) request.getAttribute("hoaDon");
	ArrayList<DoanhSoBEAN> doanhSo = (ArrayList<DoanhSoBEAN>) request.getAttribute("doanhSo");
	ArrayList<DoanhThuBEAN> doanhThu = (ArrayList<DoanhThuBEAN>) request.getAttribute("doanhThu");
	ArrayList<ADFilmBEAN> listFilm = (ArrayList<ADFilmBEAN>) request.getAttribute("listFilm");
	
%>

<%
	int currentSelectThang = (Integer) (request.getAttribute("currentSelectThang"));
	int currentSelectNam = (Integer) (request.getAttribute("currentSelectNam"));
	SimpleDateFormat ff = new SimpleDateFormat("dd/MM/yyyy");
%>

<%
if(countFilm<10){
	countFilm=10;
}
int startFilm=1;
if(request.getParameter("startFilm")!=null){
	startFilm=Integer.parseInt(request.getParameter("startFilm"));
}
%>

<div class="content-inner">
	<!-- Page Header-->
	<header class="page-header">
		<div class="container-fluid">
			<h2 class="no-margin-bottom">Quản lý</h2>
		</div>
	</header>
	<!-- Dashboard Counts Section-->
	<section class="dashboard-counts no-padding-bottom">
		<div class="container-fluid">
			<div class="row bg-white has-shadow">
				<!-- Item -->
				<div class="col-xl-3 col-sm-6">
					<div class="item d-flex align-items-center">
						<div class="icon bg-violet">
							<i class="icon-user"></i>
						</div>
						<div class="title">
							<span>Tổng<br>thành viên
							</span>
							<div class="progress">
								<div role="progressbar" style="width: 25%; height: 4px;"
									aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"
									class="progress-bar bg-violet"></div>
							</div>
						</div>
						<div class="number">
							<strong><%=countAccount%></strong>
						</div>
					</div>
				</div>
				<!-- Item -->
				<div class="col-xl-3 col-sm-6">
					<div class="item d-flex align-items-center">
						<div class="icon bg-red">
							<i class="icon-padnote"></i>
						</div>
						<div class="title">
							<span>Số lượng<br>Đặt vé
							</span>
							<div class="progress">
								<div role="progressbar" style="width: 70%; height: 4px;"
									aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
									class="progress-bar bg-red"></div>
							</div>
						</div>
						<div class="number">
							<strong><%=hoaDon%></strong>
						</div>
					</div>
				</div>
				<!-- Item -->
				<div class="col-xl-3 col-sm-6">
					<div class="item d-flex align-items-center">
						<div class="icon bg-green">
							<i class="icon-bill"></i>
						</div>
						<div class="title">
							<span>Tổng<br>Doanh thu
							</span>
							<div class="progress">
								<div role="progressbar" style="width: 40%; height: 4px;"
									aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
									class="progress-bar bg-green"></div>
							</div>
						</div>
						<div class="number">
							<strong><%=tongDoanhThu%> VND</strong>
						</div>
					</div>
				</div>
				<!-- Item -->
				<div class="col-xl-3 col-sm-6">
					<div class="item d-flex align-items-center">
						<div class="icon bg-orange">
							<i class="icon-check"></i>
						</div>
						<div class="title">
							<span>Số lượng <br>phim
							</span>
							<div class="progress">
								<div role="progressbar" style="width: 50%; height: 4px;"
									aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"
									class="progress-bar bg-orange"></div>
							</div>
						</div>
						<div class="number">
							<strong><%=countFilm%></strong>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br> <br>


	<!-- Thống kê doanh thu theo doanh thu-->
	<div class="col-lg-12">
		<div class="card">
			<div class="card-close">
				<div class="dropdown">
					<button type="button" id="closeCard3" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false" class="dropdown-toggle">
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
					<h3 class="h4">THỐNG KÊ THEO DOANH THU</h3>
				</div>

				<div class="form-group row col-lg-8">
					<form action="Home" method="post" style="width: 100%;">
						<div class="col-lg-2" style="float: right">
							<button type="button" class="btn btn-primary" onclick="window.print();">
								<i class="fa fa-print"></i> In
							</button>
						</div>
						<div class="col-lg-2" style="float: right">
							<button type="submit" data-toggle="modal" data-target="#myModal"
								class="btn btn-primary">Chọn</button>
						</div>
						<div class="col-lg-4" style="float: right">
							<select class="custom-select mr-sm-2" id="inlineFormCustomSelect"
								name="txt_nam">
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
							<select class="custom-select mr-sm-2" id="inlineFormCustomSelect"
								name="txt_thang">
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
					<table class="table table-hover">
						<thead>
							<tr data-toggle="modal" data-target="#myModal">
								<th>#</th>
								<th>Tên phim</th>
								<th>Ngày công chiếu</th>
								<th>Số lượng vé đã đặt</th>
								<th>Doanh thu</th>
							</tr>
						</thead>
						<tbody>
							<%
								if (listFilm != null) {
									if (listFilm.size() == 0) {
							%>
							<tr>
								<th scope="row"></th>
								<td><%="Không có phim nào"%></td>
								<td><%=" "%></td>
								<td><%=" "%></td>
								<td><%=" "%></td>
							</tr>
							<%
								}
								}
							%>
							<%
							int j=0;
							if(startFilm == 1){
								j = 1;
							}else{
								j = 10*(startFilm-1) + 1;
							}
								if (listFilm != null) {
									for (int i = 0; i < listFilm.size(); i++) {
							%>
							<tr>
								<th scope="row"><%=j+i%></th>
								<td><%=listFilm.get(i).getTenPhim()%></td>
								<td><%=listFilm.get(i).getNgayCongChieu()%></td>
								<%
									int k = 0;
											for (DoanhSoBEAN ds : doanhSo) {
												if (ds.getIdPhim() == listFilm.get(i).getIdPhim()) {
													int doanhso = 0;
													if (ds.getDoanhSo() != 0) {
														doanhso = ds.getDoanhSo();
													}
													out.print("<td>" + doanhso + "</td>");
													k = 1;
												}
											}
											if (k == 0) {
												out.print("<td>0</td>");
											}

											int k1 = 0;
											for (DoanhThuBEAN dt : doanhThu) {
												if (dt.getIdPhim() == listFilm.get(i).getIdPhim()) {
													long doanhthu = 0;
													if (dt.getDoanhThu() != 0) {
														doanhthu = dt.getDoanhThu();
													}
													out.print("<td>" + doanhthu + " VND</td>");
													k1 = 1;
												}
											}
											if (k1 == 0) {
												out.print("<td>0 VND</td>");
											}
								%>

							</tr>

							<%
								}
								}
							%>

						</tbody>

					</table>
					<%
					String temp = "";
					if(request.getParameter("txt_thang")!=null && request.getParameter("txt_nam")!=null){
						temp = "?txt_thang="+request.getParameter("txt_thang")+"&txt_nam="+ request.getParameter("txt_nam")+"&";
					}
					%>
					<ul class="pagination align-items-center">
						<li class="page-item <%if (startFilm == 1) {%> disabled<%}%>"><a
							class="page-link" href="Home?<%=temp %>startFilm=<%=startFilm - 1%>">Previous</a></li>
						<%
										for (int k = 1; k <= (countFilm % 10 - countFilm /10); k++) {
									%>
						<li class="page-item <%if (startFilm == k) {%> active <%}%>"><a
							class="page-link" href="Home?startFilm=<%=k%>"><%=k%></a></li>
						<%
										}
									%>
						<li
							class="page-item <%if (startFilm == countFilm % 10 - countFilm / 10) {%> disabled<%}%>"><a
							class="page-link" href="Home?startFilm=<%=startFilm + 1%>">Next</a></li>
					</ul>
				</div>

			</div>

		</div>

	</div>

	<!-- Page Footer-->
	<footer class="main-footer">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-6">
					<p>Your team &copy; 2019</p>
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
<script src="assets/vendor/jquery/jquery.js"></script>
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/jquery/jquery.slim.js"></script>
<script src="assets/vendor/jquery/jquery.slim.min.js"></script>
<script src="assets/vendor/popper.js/umd/popper.js"></script>
<script src="assets/vendor/popper.js/umd/popper.min.js"></script>


<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/vendor/jquery.cookie/jquery.cookie.js">	</script>
<script src="assets/vendor/jquery-validation/jquery.validate.min.js"></script>
<!-- Main File-->
<script src="assets/js/front.js"></script>

</body>

</html>