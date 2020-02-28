<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.ChiTietThanhToanBEAN"%>
<%@page import="model.bean.ChiTietHoaDonBEAN"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="block/block_top.jsp"></jsp:include>
<!-- phần dùng chung ở phía trên -->
	<%
	ChiTietHoaDonBEAN cthd = (ChiTietHoaDonBEAN) request.getAttribute("chiTietHoaDon");
	ArrayList<ChiTietThanhToanBEAN> cttt = (ArrayList<ChiTietThanhToanBEAN>) request.getAttribute("chiTietThanhToan");
	%>
	<!-- checkout-area-start -->
	<div class="checkout-area mb-70 content-checkout">
		<div class="container">
			<div class="row breadcrumbs-info-film">
				<div class="col-lg-12">
					<div class="breadcrumbs-menu">
						<ul>
							<li><a href="index">Trang chủ</a></li>
							<li><a href="DBCheckOut" class="active"><span>Thanh
										toán</span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<form action="#">
					<div class="your-order">
						<h3>Chi tiết thanh toán</h3>
						<div class="your-order-table table-responsive">
							<table>
								<thead>
									<tr>
										<th class="product-name">Phim</th>
										<th class="product-total"><%=cthd.getTenPhim() %></th>
									</tr>
								</thead>
								<tbody>
								<%
								int gheThuong = 0;
								String tenGheThuong = "";
								float giaTienThuong = 0;
								
								int gheVip = 0;
								String tenGheVip = "";
								float giaTienVip = 0;
								for(ChiTietThanhToanBEAN ct : cttt){
									if(ct.getIdLoaiGhe()==1){
										gheThuong++;
										tenGheThuong += ct.getTenDay()+ct.getGheSo()+", ";
										giaTienThuong += ct.getGia();
									}
									if(ct.getIdLoaiGhe()==2){
										gheVip++;
										tenGheVip += ct.getTenDay()+ct.getGheSo()+", ";
										giaTienVip += ct.getGia();
									}
								}
								%>
									<tr class="cart_item">
										<td class="product-name">Ghế VIP 
										<strong	class="product-quantity"> × <%=gheThuong %> (<%=tenGheThuong %>)
											</strong>
										</td>
										<td class="product-total"><span class="amount" id="giaTienThuong"><%=giaTienThuong %></span> vnd
										</td>
									</tr>
									<tr class="cart_item">
										<td class="product-name">Ghế Thường<strong
											class="product-quantity"> × <%=gheVip %> (<%=tenGheVip %>)</strong>
										</td>
										<td class="product-total"><span class="amount" id="giaTienVip"><%=giaTienVip %></span> vnd
										</td>
									</tr>
								</tbody>
								<tfoot>
									<tr class="order-total">
										<th>Tổng thanh toán</th>
										<td>
											<strong id="daApplyMGG">
                                            <span style="color: white; font-size: 25px"><span  style="color: white; font-size: 25px" id="tongtien"></span> - <span  style="color: white; font-size: 25px" id="giamgia"></span> = </span><span class="amount" id="thanhtien"></span> vnd
                                            </strong>
                                            <strong id="daApplyMGG2">
                                            <span style="color: white; font-size: 25px"><span  style="color: white; font-size: 25px" id="tongtien2"></span> - <span  style="color: white; font-size: 25px" id="giamgia2"></span>% = </span><span class="amount" id="thanhtien2"></span> vnd
                                            </strong>
                                            <strong id="chuaApplyMGG">
                                            <span><span id="tongtien1"><%=giaTienThuong+giaTienVip %></span><span style="font-size: 15px"> vnd</span></span>
                                            </strong>
										</td>
									</tr>
									<tr>
                                        <th class="th_giamgia"></th>
                                        <td class="td_giamgia">
                                            <strong>
                                                <span>Mã giảm giá: </span>
                                                <span><input type="text" id="txtMGG" style="width: 34%" class="form-control magiamgia"></span>
                                                <span></span>
                                                <span>
                                                        <button id="btnMGG" type="button" class="btn btn-default btngiamgia">Apply</button>
                                                </span>
                                                <div id='notiGiamGia'>
                                                    <br><br>
                                                    <p id='notiGiamGiaThatBai'>Mã giảm giá không có hiểu lực hoặc không đúng, vui lòng thử lại!</p>
                                                    <p id='notiGiamGiaThanhCong'>Chúc mừng bạn đã áp dụng thành công mã <span id="tenMGG"></span></p>
                                                </div>
                                            </strong>
                                        </td>
                                    </tr>
								</tfoot>
							</table>
						</div>
						<div class="payment-method">
							<div class="payment-accordion">
								<div class="collapses-group">
									<div class="panel-group" id="accordion" role="tablist"
										aria-multiselectable="true">
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="headingOne">
												<h4>HÌNH THỨC THANH TOÁN</h4>
												<h4 class="panel-title">
													
														<label class="radio-inline"><input type="radio" name="optradio" checked><a data-toggle="collapse" data-parent="#accordion"
														href="#collapseOne" aria-expanded="true"
														aria-controls="collapseOne">Zalo Pay</a></label>
												</h4>
											</div>
											<div id="collapseOne" class="panel-collapse collapse in"
												role="tabpanel" aria-labelledby="headingOne">
												<div class="panel-body">
													<p>Thanh toán thông qua Zalo hoặc Zalo Pay được tặng 1
														combo bắp - nước khi nhận vé.</p>
												</div>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="headingTwo">
												<h4 class="panel-title">
													
														<label class="radio-inline"><input type="radio" name="optradio" checked><a class="collapsed" role="button" data-toggle="collapse"
														data-parent="#accordion" href="#collapseTwo"
														aria-expanded="false" aria-controls="collapseTwo">Napas</a></label>
												</h4>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="headingThree">
												<h4 class="panel-title">
													
														<label class="radio-inline"><input type="radio" name="optradio" checked><a class="collapsed" role="button" data-toggle="collapse"
														data-parent="#accordion" href="#collapseThree"
														aria-expanded="false" aria-controls="collapseThree">PayPal<img src="assets/img/2.png" alt="payment" />
													</a></label>
												</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="order-button-payment">
								<a><button type="button" value="THANH TOÁN" data-toggle="modal" data-target="#ModalThanhToan">THANH TOÁN</button></a>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- checkout-area-end -->
	<!-- Modal -->
	  <div class="modal fade" id="ModalThanhToan" role="dialog">
	    <div class="modal-dialog modal-sm modalthanhtoan">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">THANH TOÁN</h4>
	        </div>
	        <div class="modal-body">
	          <p>Bạn chắc chắn thanh toán chứ?.</p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	          <a id='agreeThanhToan'><button type="button" class="btn btn-success">Đồng ý</button></a>
	        </div>
	      </div>
	    </div>
	  </div>
	  <!-- end modal -->
<jsp:include page="block/block_bottom.jsp"></jsp:include>
<!-- phần dùng chung ở phía trên -->