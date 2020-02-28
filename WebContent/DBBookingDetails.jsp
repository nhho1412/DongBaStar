<%@page import="model.bean.InfoAccountBEAN"%>
<%@page import="model.bean.ChiTietThanhToanBEAN"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.ChiTietHoaDonBEAN"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="block/block_top.jsp"></jsp:include>
<!-- phần dùng chung ở phía trên -->

<%
	ChiTietHoaDonBEAN cthd = (ChiTietHoaDonBEAN) request.getAttribute("chiTietHoaDon");
	ArrayList<ChiTietThanhToanBEAN> cttt = (ArrayList<ChiTietThanhToanBEAN>) request.getAttribute("chiTietThanhToan");

	InfoAccountBEAN tk = null;
	if (request.getAttribute("taiKhoan") != null) {
		tk = (InfoAccountBEAN) request.getAttribute("taiKhoan");
	}
	
	int gheThuong = 0;
	String tenGheThuong = "";
	float giaTienThuong = 0;
	
	int gheVip = 0;
	String tenGheVip = "";
	float giaTienVip = 0;
	for(ChiTietThanhToanBEAN ct : cttt){
		if(ct.getIdLoaiGhe()==1){
			gheThuong++;
			tenGheThuong = tenGheThuong+ct.getTenDay()+ct.getGheSo()+", ";
			giaTienThuong += ct.getGia();
		}
		if(ct.getIdLoaiGhe()==2){
			gheVip++;
			tenGheVip = tenGheVip+ct.getTenDay()+ct.getGheSo()+", ";
			giaTienVip += ct.getGia();
		}
	}
	
%>

<!-- checkout-area-start -->
<div class="checkout-area mb-70 content-checkout">
	<div class="container">
		<div class="row breadcrumbs-info-film">
			<div class="col-lg-12">
				<div class="breadcrumbs-menu">
					<ul>
						<li><a href="index">Trang chủ</a></li>
						<li><a href="DBCheckOut" class="active"><span>Chi
									tiết đặt vé</span></a></li>
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
					<div class="col-md-10 col-sm-10 col-xs-12"
						style="padding-bottom: 30px;">
						<div class="modal-pro-content info-account-detail">
							<div class="row">
								<div class="col-sm-12 col-md-4">
									<p>
										Xin chào, <b><%=tk.getHoTen() %></b>
									</p>
									<br>
									<p>Bạn đã đặt vé thành công trên website DONGBA Star.</p>
									<br>
									<p>
										<b>Mã nhận vé: <%=cthd.getIdHoaDon() %></b>
									</p>
									<br>
									<div id="id_qrcode"></div>
									<p>Vì vấn đề bảo mật nên bạn cần giữ mã này cẩn thận, để
										tránh trường hợp mất vé. Sử dụng Mã này và thông tin đặt vé để
										xác nhận và lấy vé tại Quầy.</p>
									<br>
								</div>
								<div class="col-sm-12 col-md-8 chitietdatve">
									<div class="title-bill">
										<span>CHI TIẾT ĐẶT VÉ</span>
									</div>
									<table cellspacing="0" cellpadding="0" border="0"
										class="table-bill">
										<tbody>
											<tr style="height: 0px">
												<td style="width: 5px"></td>
												<td style="width: 210px"></td>
												<td style="width: 3px"></td>
												<td style="width: 2px"></td>
												<td style="width: 260px"></td>
												<td style="width: 100px"></td>
											</tr>
											<tr class="col-table-bill">
												<td colspan="6" style="padding: 5px"><span
													class="title-bill1">Thông tin khách hàng</span></td>
											</tr>
											<tr class="col-table-bill">
												<td colspan="1" style="padding: 5px"></td>
												<td align="left" colspan="2" style="padding: 5px"><span>Họ
														và tên:</span></td>
												<td colspan="1"></td>
												<td colspan="1"><label class="label-bill"><%=tk.getHoTen() %></label></td>
												<td align="center" colspan="1"></td>
											</tr>
											<tr class="col-table-bill">
												<td colspan="1" style="padding: 5px"></td>
												<td align="left" colspan="2" style="padding: 5px"><span
													class="details-bill">Di động:</span></td>
												<td colspan="1"></td>
												<td colspan="1"><label class="label-bill"><%=tk.getSoDienThoai() %>
												</label></td>
												<td colspan="1"></td>
											</tr>
											<tr class="col-table-bill">
												<td colspan="1" style="padding: 5px"></td>
												<td align="left" colspan="2" style="padding: 5px"><span
													class="details-bill">Địa chỉ:</span></td>
												<td colspan="1"></td>
												<td colspan="1"><label class="label-bill"><%=tk.getDiaChi() %></label></td>
												<td colspan="1"></td>
											</tr>
											<tr class="col-table-bill">
												<td colspan="1" style="padding: 5px"></td>
												<td align="left" colspan="2" style="padding: 5px"><span
													class="details-bill">Email:</span></td>
												<td colspan="1"></td>
												<td colspan="1"><label class="label-bill"><%=tk.getEmail() %></label></td>
												<td colspan="1"></td>
											</tr>
											<tr class="col-table-bill">
												<td colspan="6" style="padding: 5px"><span
													class="title-bill1">Thông Tin Hóa Đơn</span></td>
											</tr>
											<tr class="col-table-bill">
												<td colspan="1" style="padding: 5px"></td>
												<td align="left" colspan="2" style="padding: 5px"><span
													class="details-bill">Giá trị đơn hàng:</span></td>
												<td colspan="1"></td>
												<td colspan="1"><label class="label-bill"><span id="tongtienthanhtoan"><%=cthd.getTongTien() %></span>
														VNĐ</label></td>
												<td colspan="1"></td>
											</tr>
											<tr class="col-table-bill">
												<td colspan="1" style="padding: 5px"></td>
												<td align="left" colspan="2" style="padding: 5px"><span
													class="details-bill">Tên phim:</span></td>
												<td colspan="1"></td>
												<td colspan="1"><label class="label-bill"><%=cthd.getTenPhim() %></label></td>
												<td colspan="1"></td>
											</tr>
											<tr class="col-table-bill">
												<td colspan="1" style="padding: 5px"></td>
												<td align="left" colspan="2" style="padding: 5px"><span
													class="details-bill">Rạp:</span></td>
												<td colspan="1"></td>
												<td colspan="1"><label class="label-bill"><%=cthd.getTenPhong() %>
														- DONGBA STAR HUẾ </label></td>
												<td colspan="1"></td>
											</tr>
											<tr class="col-table-bill">
												<td colspan="1" style="padding: 5px"></td>
												<td align="left" colspan="2" style="padding: 5px"><span
													class="details-bill">Thời gian:</span></td>
												<td colspan="1"></td>
												<td colspan="1"><label class="label-bill"><%=cthd.getNgayChieu() %>
														<%=cthd.getGioChieu() %></label></td>
												<td colspan="1"></td>
											</tr>
											<tr class="col-table-bill">
												<td colspan="1" style="padding: 5px"></td>
												<td align="left" colspan="2" style="padding: 5px"><span
													class="details-bill">Ghế:</span></td>
												<td colspan="1"></td>
												<td colspan="1"><label class="label-bill"><%=tenGheThuong+tenGheVip %></label>
												</td>
												<td colspan="1"></td>
											</tr>
											<tr class="col-table-bill">
												<td colspan="1" style="padding: 5px"></td>
												<td align="left" colspan="2" style="padding: 5px"><span
													class="details-bill">Mã giảm giá:</span></td>
												<td colspan="1"></td>
												<td colspan="1"><label class="label-bill"><% if(cthd.getMaGiamGia()!=null) out.print(cthd.getMaGiamGia()); %></label></td>
												<td colspan="1"></td>
											</tr>
										</tbody>
									</table>
									<a href="index"><button type=button
											class="btn btn-outline-danger quayve">Quay về trang
											chủ</button></a>
								</div>
							</div>
						</div>

					</div>
					<div class="col-md-1 col-sm-1 col-xs-12"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- qr code -->
	<script>
		var qrcode = new QRCode("id_qrcode", {
			text : "<%=cthd.getIdHoaDon()%>-<%=tk.getIdTaiKhoan()%>",
			width : 150,
			height : 150,
			colorDark : "#000000",
			colorLight : "#ffffff",
			correctLevel : QRCode.CorrectLevel.H
		});
	</script>
</div>
<!-- checkout-area-end -->

<jsp:include page="block/block_bottom.jsp"></jsp:include>
<!-- phần dùng chung ở phía trên -->