<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.SuatBEAN"%>
<%@page import="model.bo.SuatBO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="model.bean.FilmBEAN"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="block/block_top.jsp"></jsp:include>
<!-- phần dùng chung ở phía trên -->

<%
	FilmBEAN infoFilm = (FilmBEAN) request.getAttribute("infoFilm");
	ArrayList<SuatBEAN> listSuatChieu = (ArrayList<SuatBEAN>) request.getAttribute("listSuatChieu");
%>
<!-- film-area-start -->
<div class="film-area mb-70 content-info-film">
	<div class="container">
		<div class="row breadcrumbs-info-film">
			<div class="col-lg-12">
				<div class="breadcrumbs-menu">
					<ul>
						<li><a href="index">Trang chủ</a></li>
						<li><a href="DBSelectShowtime" class="active"><span>Phim</span></a></li>
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
								<span><a href="#book"><button type="button">
											<i class="fa fa-ticket"></i> ĐẶT VÉ NGAY
										</button></a></span> <span><a href="#" class="js-video-button"
									data-channel="video" data-video-url="<%=infoFilm.getVideo()%>"><button
											type="button">
											<i class="fa fa-video-camera"></i> XEM TRAILER
										</button></a></span>
							</form>
							<span id="book"><i class="fa fa-check"></i> Đang chiếu</span>
						</div>
					</div>
				</div>
				<!-- recent-post-area-start -->
				<div class="recent-post-area tt04 pb-100 tt12">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<!-- tab-menu-start -->
								<div class="tab-menu mb-40 text-center tt15">
									<ul>
										<li><a href="#lichchieu" class="title_lichchieu"
											data-toggle="tab" style="font-size: 26px">LỊCH CHIẾU</a></li>
									</ul>
								</div>
								<!-- tab-menu-end -->
							</div>
						</div>
						<!-- tab-area-start -->
						<div class="tab-content">
							<div class="tab-pane active" id="lichchieu">
								<div class="tab-active owl-carousel text-center tt13">
									<%
										Calendar calAC = Calendar.getInstance();
										Date dateAC = calAC.getTime();

										Calendar cal = Calendar.getInstance();
										Date date = cal.getTime();
										SimpleDateFormat sdf = new SimpleDateFormat("dd/MM");
										for (int i = 0; i < 14; i++) {
											cal.add(Calendar.DAY_OF_MONTH, i);
											Date dateAfter = cal.getTime();
											String thu = "";
											switch (dateAfter.getDay()) {
											case 0:
												thu = "Chủ nhật";
											    break;
											case 1:
												thu = "Thứ 2";
											    break;
											case 2:
												thu = "Thứ 3";
											    break;
											case 3:
												thu = "Thứ 4";
											    break;
											case 4:
												thu = "Thứ 5";
											    break;
											case 5:
												thu = "Thứ 6";
											    break;
											case 6:
												thu = "Thứ 7";
											}
											if (sdf.format(dateAC).toString().equals(sdf.format(dateAfter).toString())) {
									%>

									<div class="col-lg-12 tt14">
										<div class="single-post ">
											<a data-toggle="tab" id="temp0" class="suat kichhoat"
												href="#menu0">
												<article>
													<span><%=thu %></span> <br> <span><%=sdf.format(dateAfter)%></span>
												</article>
											</a>
										</div>
									</div>
									<%
										} else {
									%>
									<div class="col-lg-12 tt14">
										<div class="single-post">
											<a data-toggle="tab" id="temp<%=i%>" class="suat"
												href="#menu<%=i%>">
												<article>
													<span><%=thu %></span> <br> <span><%=sdf.format(dateAfter)%></span>
												</article>
											</a>
										</div>
									</div>
									<%
										}
											cal = Calendar.getInstance();
											date = cal.getTime();
										}
									%>



								</div>
								<div class="tab-content tt16">
									<%
										Calendar cal1 = Calendar.getInstance();
										Date date1 = cal1.getTime();
										SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
										SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
										SimpleDateFormat sdf3 = new SimpleDateFormat("hh:mm");
										for (int i = 0; i < 14; i++) {
											cal1.add(Calendar.DAY_OF_MONTH, i);
											Date dateAfter1 = cal1.getTime();
											if (sdf1.format(dateAC).toString().equals(sdf1.format(dateAfter1).toString())) {
									%>

									<div id="menu0" class="tab-pane fade in active">
										<div class="row">
											<div class="col-sm-1"></div>
											<div class="col-sm-3 tt21">
												<article class="info-location1">
													<h3>DONGBA STAR</h3>
													<p>12 Trần Hưng Đạo, phường Thuận Thành, thành phố Huế,
														Việt Nam</p>
												</article>
												<article class="info-location2">
													<a
														href="https://www.google.com/maps/place/12+Tr%E1%BA%A7n+H%C6%B0ng+%C4%90%E1%BA%A1o,+Ph%C3%BA+Ho%C3%A0,+Th%C3%A0nh+ph%E1%BB%91+Hu%E1%BA%BF,+Th%E1%BB%ABa+Thi%C3%AAn+Hu%E1%BA%BF/@16.4675937,107.5818162,17z/data=!3m1!4b1!4m5!3m4!1s0x3141a1305f94b7bd:0x3b6167b605f18ec!8m2!3d16.4675937!4d107.5840049"
														target="_blank"><i class="fa fa-map-marker"
														aria-hidden="true"></i> Xem vị trí</a>
												</article>
											</div>
											<div class="col-sm-1 tt20">
												<article class="tt17" title="Định dạng <%=infoFilm.getDinhDangPhim()%> và ngôn ngữ Việt Sub">
													<%=infoFilm.getDinhDangPhim()%>
													<br> SUB
												</article>
												<article class="tt18" title="Phim dành cho người trên <%=infoFilm.getGioiHanTuoi()%>">
													<b>C<%=infoFilm.getGioiHanTuoi()%></b>
												</article>
											</div>
											<div class="col-sm-6 tt19">
											<% 
											for(SuatBEAN su : listSuatChieu){
												if(su.getNgayChieu().toString().trim().equals(sdf2.format(dateAfter1).toString().trim())){
													%>
													
													<span><a href="DBSelectSeat?idF=<%=infoFilm.getIdPhim() %>&idS=<%=su.getIdSuat() %>&idP=<%=su.getIdPhong() %>#now"><button
															type="button" class="btn btn-warning"><%=su.getGioChieu().toString().substring(0,5) %></button></a></span> 
													
													<%
												}
											}
											%>
											</div>
											<div class="col-sm-1"></div>
										</div>
									</div>

									<%
										} else {
									%>

									<div id="menu<%=i%>" class="tab-pane fade">
										<div class="row">
											<div class="col-sm-1"></div>
											<div class="col-sm-3 tt21">
												<article class="info-location1">
													<h3>DONGBA STAR</h3>
													<p>12 Trần Hưng Đạo, phường Thuận Thành, thành phố Huế,
														Việt Nam</p>
												</article>
												<article class="info-location2">
													<a
														href="https://www.google.com/maps/place/12+Tr%E1%BA%A7n+H%C6%B0ng+%C4%90%E1%BA%A1o,+Ph%C3%BA+Ho%C3%A0,+Th%C3%A0nh+ph%E1%BB%91+Hu%E1%BA%BF,+Th%E1%BB%ABa+Thi%C3%AAn+Hu%E1%BA%BF/@16.4675937,107.5818162,17z/data=!3m1!4b1!4m5!3m4!1s0x3141a1305f94b7bd:0x3b6167b605f18ec!8m2!3d16.4675937!4d107.5840049"
														target="_blank"><i class="fa fa-map-marker"
														aria-hidden="true"></i> Xem vị trí</a>
												</article>
											</div>
											<div class="col-sm-1 tt20">
												<article class="tt17">
													<%=infoFilm.getDinhDangPhim()%>
													<br> SUB
												</article>
												<article class="tt18">
													<b>C<%=infoFilm.getGioiHanTuoi()%></b>
												</article>
											</div>
											<div class="col-sm-6 tt19">
												<% 
												for(SuatBEAN su : listSuatChieu){
													if(su.getNgayChieu().toString().trim().equals(sdf2.format(dateAfter1).toString().trim())){
														%>
														<span><a href="DBSelectSeat?idF=<%=infoFilm.getIdPhim() %>&idS=<%=su.getIdSuat() %>&idP=<%=su.getIdPhong() %>#now"><button
																type="button" class="btn btn-warning"><%=su.getGioChieu().toString().substring(0,5)%></button></a></span> 
														
														<%
													}
												}
												%>
											</div>
											<div class="col-sm-1"></div>
										</div>
									</div>

									<%
										}
											cal1 = Calendar.getInstance();
											date1 = cal.getTime();
										}
									%>

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