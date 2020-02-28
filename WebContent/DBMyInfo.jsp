<%@page import="model.bean.LichSuDatVeBEAN"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.InfoAccountBEAN"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="block/block_top.jsp"></jsp:include>
<!-- phần dùng chung ở phía trên -->
<!-- film-area-start -->
<%
	InfoAccountBEAN tk = null;
	if (request.getAttribute("taiKhoan") != null) {
		tk = (InfoAccountBEAN) request.getAttribute("taiKhoan");
	}
	ArrayList<LichSuDatVeBEAN> lsdv = (ArrayList<LichSuDatVeBEAN> ) request.getAttribute("lichsudatve");
%>
<div class="film-area mb-70 content-info-film">
	<div class="container">
		<div class="row breadcrumbs-info-film">
			<div class="col-lg-12">
				<div class="breadcrumbs-menu">
					<ul>
						<li><a href="index">Trang chủ</a></li>
						<li><a href="DBMyInfo" class="active"><span>Thông
									tin cá nhân</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row detail-info-film-content">
			<div
				class="col-lg-offset-2 col-lg-12 col-md-offset-2 col-md-8 col-sm-12 col-xs-12 tt07">
				<div class="row tt08">
					<div class="col-md-1 col-sm-1 col-xs-12"></div>
					<div class="col-md-6 col-sm-6 col-xs-12 doipass">
						<div class="modal-pro-content info-account-detail">
							<%
								String noti = "-1";
								if (request.getAttribute("noti") != null) {
									noti = (String) request.getAttribute("noti");
								}
								if (noti.equals("1")) {
							%><div class="alert alert-success" role="alert">Đổi mật
								khẩu thành công!</div>
							<%
								}
								if (noti.equals("2")) {
							%><div class="alert alert-danger" role="alert">Vui lòng
								thử lại!</div>
							<%
								}
							%>
							<h4><%=tk.getHoTen()%></h4>
							<br>
							<table class="table table-borderless table-info" border="0"
								cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<th>Email:</th>
										<td><%=tk.getEmail()%></td>
									</tr>
									<tr>
										<th>Số điện thoại:</th>
										<td><%=tk.getSoDienThoai()%></td>
									</tr>
									<tr>
										<th>Địa chỉ:</th>
										<td><%=tk.getDiaChi()%></td>
									</tr>
									<tr>
										<th>Mật khẩu:</th>
										<td><button type="button" data-toggle="modal"
												data-target="#doiMatKhauModal"
												class="btn btn-outline-danger doimatkhau"
												id="BookingHistory">Đổi mật khẩu</button></td>
									</tr>
									<p style="color: #E7EAED;">
										“ Hi, <b><%=tk.getHoTen()%></b> Từ bảng thông tin tài khoản,
										bạn có thể xem bản sao các hoạt động của tài khoản bạn trong
										thời gian gần đây và cập nhật thông tin tài khoản của bạn.
										Chọn liên kết bên dưới để xem hoặc chỉnh sửa thông tin.”
									</p>
								</tbody>
							</table>
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-12 tt06">
						<div class="modal-tab modal-pro-content info-account-detail">
							<div class="product-details-large tab-content img-info">
								<h5>THÔNG TIN THẺ THÀNH VIÊN</h5>
								<div class="row">
									<div class="col-md-7 col-sm-7 col-xs-7">
										<ul>
											<li>Mã thẻ: <span><b>0000<%=tk.getIdTaiKhoan()%></b></span></li>
											<li>Loại thẻ: <span><b><%=tk.getTenLoaiTaiKhoan()%></b></span></li>
											<li>Điểm tích lũy: <span><b><%=tk.getDiemTichLuy()%></b></span></li>
										</ul>
									</div>
									<div class="col-md-5 col-sm-5 col-xs-5">
										<div id="id_qrcode1"></div>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="col-md-1 col-sm-1 col-xs-12"></div>
				</div>
			</div>
		</div>
		<!-- recent-post-area-end -->
		<div class="row">
			<div class="col-md-1 col-sm-1 col-xs-12"></div>
			<div class="col-md-10 col-sm-10 col-xs-12">
				<div class="modal-pro-content info-account-detail">
					<h4 style="text-align: center;">LỊCH SỬ GIAO DỊCH</h4>
					<br>
					<table class="table table-bordered" style="color: white;">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Thời gian giao dịch</th>
								<th scope="col">Loại ghế</th>
								<th scope="col">Số lượng</th>
								<th scope="col">Giá vé</th>
								<th scope="col">Phim</th>
								<th scope="col">Giảm giá</th>
								<th scope="col">Tổng tiền</th>
							</tr>
						</thead>
						<tbody>
						<%
						long tongtatca = 0;
						if(lsdv != null){
							
							int i = 1;
							for(LichSuDatVeBEAN ls : lsdv){
								int tongtien = ls.getSoLuong()*(int)ls.getGia()-(int)ls.getGiaDuocGiam();
								tongtatca += tongtien;
								%>
								<tr>
								<th scope="row"><%=i %></th>
								<td><%=ls.getNgayDatVe() %> - <%=ls.getGioDatVe() %></td>
								<td><% if(ls.getIdLoaiGhe()==1){out.print("Thường");}else{out.print("VIP");}%></td>
								<td><%=ls.getSoLuong() %></td>
								<td><span class="lsgd_gia<%=i%>"><%=ls.getGia() %></span>VND</td>
								<th><%=ls.getTenPhim() %></th>
								<th><% if(ls.getMaGiamGia()!=null){out.print(ls.getMaGiamGia()+" - "+ls.getGiaDuocGiam());}else{out.print("");} %></th>
								<th><span class="lsgd_tongtien<%=i%>"><%=tongtien %></span>VND</th>
							</tr>
								<%
							i++;
								}
						}else{
							%>
							<tr>
								<th scope="row"></th>
								<td>Bạn chưa giao dịch lần nào!</td>
								<td></td>
								<td></td>
								<td></td>
								<th></th>
								<th></th>
								<th></th>
							</tr>
							<%
						}
						%>
							<tr>
								<th scope="row"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<th></th>
								<th>Tổng: </th>
								<th><span class="lsgd_tongtatca"><%=tongtatca %> </span>vnd</th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="col-md-1 col-sm-1 col-xs-12"></div>
		</div>
		<!-- Modal -->
		<div class="modal fade bd-example-modal-sm" id="doiMatKhauModal"
			tabindex="-1" role="dialog" aria-labelledby="doiMatKhauModalLabel"
			aria-hidden="true" style="background-color: rgba(57, 69, 79, 0.692);">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="doiMatKhauModalLabel">ĐỔI MẬT
							KHẨU</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="DBMyInfo" method="post">
							<div class="form-group">
								<label>Mật khẩu cũ</label> <input type="password"
									class="form-control" placeholder="Nhập mật khẩu cũ"
									name="passOld">
							</div>
							<div class="form-group">
								<label>Mật khẩu mới</label> <input type="password"
									class="form-control" placeholder="Nhập mật khẩu mới"
									name="passNew">
							</div>
							<button type="submit" name="change" value="true"
								class="btn btn-outline-danger">Đổi mật khẩu</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- qr code -->
		<script>
			var qrcode = new QRCode("id_qrcode1", {
				text : "<%=tk.getIdTaiKhoan()%>",
				width : 150,
				height : 150,
				colorDark : "#000000",
				colorLight : "#ffffff",
				correctLevel : QRCode.CorrectLevel.H
			});
		</script>
	</div>
</div>
</div>
</div>
<!-- film-login-area-end -->

<jsp:include page="block/block_bottom.jsp"></jsp:include>
<!-- phần dùng chung ở phía trên -->