<%@page import="model.bean.ViewDayTheoPhongBEAN"%>
<%@page import="model.bean.ViewGheTheoPhongBEAN"%>
<%@page import="model.bean.VeGheBEAN"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.FilmBEAN"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="block/block_top.jsp"></jsp:include>
<!-- phần dùng chung ở phía trên -->

<%
	FilmBEAN infoFilm = (FilmBEAN) request.getAttribute("infoFilm");
	ArrayList<ViewDayTheoPhongBEAN> listDayTheoPhong = (ArrayList<ViewDayTheoPhongBEAN>) request.getAttribute("listDayTheoPhong");
	ArrayList<ViewGheTheoPhongBEAN> listGheTheoPhong = (ArrayList<ViewGheTheoPhongBEAN>) request.getAttribute("listGheTheoPhong");
	ArrayList<VeGheBEAN> listGheDaDat = (ArrayList<VeGheBEAN>) request.getAttribute("listGheDaDat");
%>

<!-- film-area-start -->
<div class="film-area mb-70 content-info-film">
	<div class="container">
		<div class="row breadcrumbs-info-film">
			<div class="col-lg-12">
				<div class="breadcrumbs-menu">
					<ul>
						<li><a href="index">Trang chủ</a></li>
						<li><a href="DBSelectSeat" class="active"><span>Phim</span></a></li>
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
					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="modal-tab">
							<div class="product-details-large tab-content img-info">
								<div class="tab-pane active" id="image-1">
									<img src="<%=infoFilm.getHinhAnh1()%>" alt="" />
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-8 col-sm-8 col-xs-12 tt06">
						<div class="modal-pro-content info-film-detail">
							<h3><%=infoFilm.getTenPhim()%></h3>
							<p><%=infoFilm.getMoTaNgan()%></p>
							<br>
							<table class="table table-borderless table-info" border="0"
								cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<th>Phân loại:</th>
										<td>Phim dành cho khán giả trên <%=infoFilm.getGioiHanTuoi()%>
											tuổi
										</td>
									</tr>
									<tr>
										<th>Đạo diễn:</th>
										<td><%=infoFilm.getDaoDien()%></td>
									</tr>
									<tr>
										<th>Diễn viên:</th>
										<td><%=infoFilm.getDienVien()%></td>
									</tr>
									<tr>
										<th>Thể loại:</th>
										<td><%=infoFilm.getTheLoai()%></td>
									</tr>
									<tr>
										<th>Khởi chiếu:</th>
										<td><%=infoFilm.getNgayCongChieu()%></td>
									</tr>
									<tr>
										<th>thời lượng:</th>
										<td><%=infoFilm.getThoiLuong()%></td>
									</tr>
									<tr>
										<th>Định dạng:</th>
										<td><%=infoFilm.getDinhDangPhim()%></td>
									</tr>
								</tbody>
							</table>
							<form>
								<span><a href="#" class="js-video-button"
									data-channel="video" data-video-url="<%=infoFilm.getVideo()%>"><button
											type="button">
											<i class="fa fa-video-camera"></i> XEM TRAILER
										</button></a></span>
							</form>
							<span><i class="fa fa-check"></i> Đang chiếu</span>
						</div>
					</div>
				</div>
				<!-- recent-post-area-start -->
				<div id="now" class="recent-post-area tt04 pb-100 tt12">
					<div class="container">
						<div class="row">
							<div class="now"></div>
							<div class="thanhtoan"></div>
						</div>
						<div class="screen">
							<div class="room-name">
								<h3>PHÒNG CHIẾU <%=request.getParameter("idP") %></h3>
							</div>
							<div><h3><span>0</span><span id="phut">5:00</span></h3></div>
							<div class="word">Màn hình</div>
						</div>
						<div class="block">
							<div id="layout-film" style="width: 641px;">
								<table cellspacing="0" cellpadding="0" style="width: auto;"
									class="setmain">
									<tbody>
									<%
									if(listDayTheoPhong != null){
										int i = 1;
										for(ViewDayTheoPhongBEAN vid : listDayTheoPhong){
											%>
											<tr>
											<td>
												<div class="seatR Setrow1"><%=vid.getTenDay() %></div>
											</td>
											<td class="SRow1">
												<div class="seatI">&nbsp;</div>
												<%
												if(listGheTheoPhong != null){
													
													for(ViewGheTheoPhongBEAN vig : listGheTheoPhong){
														if(vig.getIdDayGhe()==vid.getIdDayGhe()){
															if(vig.getGheSo()==3 || vig.getGheSo()==9){
																%>
																<div class="seatI">&nbsp;</div>
																<%
															}
															int j = 0;
															for(VeGheBEAN ve : listGheDaDat){
																if(vig.getIdGhe()==ve.getIdGhe())
																	j = 1;
															}
															if(j==0){
																%>
																<div id="A_01_2-A1" class="seatI">
																	<a href="javascript:;" id='<%=vig.getIdGhe() %>' title='<%=vid.getTenDay() %>-<%=vig.getGheSo() %>' data_owns1='<%=vig.getIdLoaiGhe() %>' data_owns='<%=vig.getGheSo() %>-<%=i %>'
																		class="_available <%if(vig.getIdLoaiGhe()==2){%>vip<%}%>"><%=vig.getGheSo() %></a>
																</div>
																<%
															}else{
																%>
																<div id="A_01_2-A1" class="seatI">
																	<a href="javascript:;" id='<%=vig.getIdGhe() %>' title='<%=vid.getTenDay() %>-<%=vig.getGheSo() %>' data_owns1='<%=vig.getIdLoaiGhe() %>' data_owns='<%=vig.getGheSo() %>-<%=i %>'
																		class="_block <%if(vig.getIdLoaiGhe()==2){%>vip<%}%>"><%=vig.getGheSo() %></a>
																</div>
																<%
															}
														}
													
													}
												}
												%>
												<div class="seatI">&nbsp;</div>
											</td>
											<td>
												<div class="seatR Setrow1"  style="float: left"><%=vid.getTenDay() %></div>
											</td>
										</tr>
											<%
										i++;
										}
									}
									%>
									</tbody>
								</table>
								<div class="chuthich">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-4">
                                            <h3>Chú thích:</h3>
                                            <div class="block">
                                                    <div id="layout-film" style="width: 641px;">
                                                        <table cellspacing="0" cellpadding="0" style="width:100%px;" class="setmain1">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <div class="seatR Setrow1 Setrow2">Ghế VIP: </div>
                                                                    </td>
                                                                    <td class="SRow1">
                                                                        <div class="seatI">&nbsp;</div>
                                                                        <div id="A_01_2-A1" class="seatI"><a href="javascript:;" class="_available vip">1</a></div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div class="seatR Setrow1 Setrow2">Ghế trống: </div>
                                                                    </td>
                                                                    <td class="SRow1">
                                                                        <div class="seatI">&nbsp;</div>
                                                                        <div id="A_01_2-A1" class="seatI"><a href="javascript:;" class="_available">1</a></div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div class="seatR Setrow1 Setrow2">Ghế đang chọn: </div>
                                                                    </td>
                                                                    <td class="SRow1">
                                                                        <div class="seatI">&nbsp;</div>
                                                                        <div id="A_01_2-A1" class="seatI"><a href="javascript:;" class="_available selected">1</a></div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div class="seatR Setrow1 Setrow2">Ghế đã bán: </div>
                                                                    </td>
                                                                    <td class="SRow1">
                                                                        <div class="seatI">&nbsp;</div>
                                                                        <div id="A_01_2-A1" class="seatI"><a href="javascript:;" class="_block">1</a></div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div class="seatR Setrow1 Setrow2">Ghế đang chờ: </div>
                                                                    </td>
                                                                    <td class="SRow1">
                                                                        <div class="seatI">&nbsp;</div>
                                                                        <div id="A_01_2-A1" class="seatI"><a href="javascript:;" class="_waitting">1</a></div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-3">

                                        </div>
                                        <div class="col-sm-12 col-md-5 tt29">
                                            <div> <span><b id="total">0</b><b> vnd</b></span></div>
                                            <a id='xacnhan'> <button style="float: left" type="button" class="submit-chonghe">
											<i class="fa fa-check-square-o"></i> XÁC NHẬN
										</button></a>
                                        </div>
                                    </div>
                                </div>
								
								
								
							</div>
						</div>
					</div>
				</div>
				<!-- tab-lichchieu-area-end -->
			</div>
		</div>
		<!-- recent-post-area-end -->
	</div>
</div>
</div>
</div>
<!-- film-login-area-end -->

<jsp:include page="block/block_bottom.jsp"></jsp:include>
<!-- phần dùng chung ở phía trên -->