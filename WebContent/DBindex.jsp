<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.bean.GiamGiaBEAN"%>
<%@page import="model.bean.EventBEAN"%>
<%@page import="model.bean.FilmBEAN"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<jsp:include page="block/block_top.jsp"></jsp:include>
<!-- phần dùng chung ở phía trên -->
<% 
ArrayList<FilmBEAN> listFilmDangChieu = (ArrayList<FilmBEAN>)request.getAttribute("listFilmDangChieu");
ArrayList<FilmBEAN> listFilmSapChieu = (ArrayList<FilmBEAN>)request.getAttribute("listFilmSapChieu");
ArrayList<FilmBEAN> listFilmChieuSom = (ArrayList<FilmBEAN>)request.getAttribute("listFilmChieuSom");
ArrayList<FilmBEAN> listFilmSlide = (ArrayList<FilmBEAN>)request.getAttribute("listSildeFilm");
ArrayList<EventBEAN> listSuKien = (ArrayList<EventBEAN>)request.getAttribute("listSuKien");
ArrayList<GiamGiaBEAN> listKhuyenMai = (ArrayList<GiamGiaBEAN>)request.getAttribute("listKhuyenMai");
%>
<!-- slider-area-start -->
<div class="slider-area">
	<div class="slider-active owl-carousel">
		<%
		if(listFilmSlide != null){
			for(FilmBEAN fi : listFilmSlide){
				%>
				<div class="single-slider pt-125 pb-130 bg-img"
					style="background-image: url(<%=fi.getHinhAnh4()%>); overflow: hidden;">
					<div class="container">
						<div class="row">
							<div class="col-md-5">
								<div class="slider-content slider-animated-1 text-center">
									<h1>BOM TẤN</h1>
									<h2><%=fi.getTenPhim().toUpperCase() %></h2>
									<h5>Khởi chiếu <%=fi.getNgayCongChieu()%></h5>
									<a href="DBSelectShowtime?id=<%=fi.getIdPhim() %>#book"">Đặt vé ngay</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
			}
		}
		%>
		
		<div class="single-slider pt-125 pb-130 bg-img"
			style="background-image: url(assets/img/slider/8.jpg);">
			<div class="container">
				<div class="row">
					<div class="col-md-5">
						<div class="slider-content slider-animated-1 text-center">
							<h1>BOM TẤN</h1>
							<h2>AQUAMAN</h2>
							<h5>Khởi chiếu 29/2/2019</h5>
							<a href="#">Đặt vé ngay</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="single-slider pt-125 pb-130 bg-img"
			style="background-image: url(assets/img/slider/4.jpg);">
			<div class="container">
				<div class="row">
					<div class="col-md-5">
						<div class="slider-content slider-animated-1 text-center">
							<h1>BOM TẤN</h1>
							<h2>AQUAMAN</h2>
							<h5>Khởi chiếu 29/2/2019</h5>
							<a href="#">Đặt vé ngay</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- slider-area-end -->
<!-- product-area-start -->
<div class="product-area pt-95 xs-mb" id='showtime'>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<!-- tab-menu-start -->
				<div class="tab-menu mb-40 text-center">
					<ul>
						<li class="none_active active"><a href="#nowshowing" data-toggle="tab">PHIM
								ĐANG CHIẾU </a></li>
						<li class="none_active"><a href="#comingsoon" data-toggle="tab">PHIM SẮP
								CHIẾU</a></li>
						<li class="none_active"><a href="#chieusom" data-toggle="tab">SUẤT CHIẾU SỚM</a></li>
					</ul>
				</div>
				<!-- tab-menu-end -->
			</div>
		</div>
		<!-- tab-area-start -->
		<div class="tab-content">
			<!-- tab-now-showing-start -->
			<div class="tab-pane active" id="nowshowing">
				<div class="tab-active owl-carousel">
				<%
				if(listFilmDangChieu!=null){
					for(FilmBEAN fi : listFilmDangChieu){
				%>
						<!-- single-product-start -->
						<div class="product-wrapper">
							<div class="product-img">
								<a href="#"> <img src="<%=fi.getHinhAnh1() %>" alt="book"
									class="primary" />
								</a>
								<div class="quick-view">
									<a class="action-view" href="#" data-target="#<%=fi.getIdPhim() %>productModal"
										data-toggle="modal" title="Xem nhanh"> <i
										class="fa fa-search-plus"></i>
									</a>
								</div>
								<div class="product-flag">
									<ul>
										<li><span class="sale"><%=fi.getThoiLuong() %></span></li>
									</ul>
								</div>
							</div>
							<div class="product-details text-center">
								<h4>
									<a href="#"><%=fi.getTenPhim() %></a>
								</h4>
								<div class="product-price">
									<ul>
										<li><a href="DBSelectShowtime?id=<%=fi.getIdPhim() %>#book"><button type="button"
													class="btn btn-primary">
													<i class="fa fa-ticket"></i> MUA VÉ
												</button></a></li>
									</ul>
								</div>
							</div>
						</div>
						<!-- single-product-end -->
						<%
					}
				}
				%>
					
				</div>
			</div>
			<!-- tab-now-showing-end -->
			<!-- tab-coming-soon-start -->
			<div class="tab-pane fade" id="comingsoon">
				<div class="tab-active owl-carousel">
				<%
				if(listFilmSapChieu!=null){
					for(FilmBEAN fi : listFilmSapChieu){
				%>
					<!-- single-product-start -->
					<div class="product-wrapper">
						<div class="product-img">
							<a href="#"> <img src="<%=fi.getHinhAnh1() %>" alt="book"
								class="primary" />
							</a>
							<div class="quick-view">
								<a class="action-view" href="#" data-target="#<%=fi.getIdPhim() %>productModal"
									data-toggle="modal" title="Quick View"> <i
									class="fa fa-search-plus"></i>
								</a>
							</div>
							<div class="product-flag">
								<ul>
									<li><span class="sale"><%=fi.getNgayCongChieu() %></span></li>
								</ul>
							</div>
						</div>
						<div class="product-details text-center">
							<h4>
								<a href="#"><%=fi.getTenPhim() %></a>
							</h4>
							<div class="product-price">
								<ul>
									<li><a href="DBSelectShowtime?id=<%=fi.getIdPhim() %>#book"><button type="button"
												class="btn btn-primary">
												<i class="fa fa-ticket"></i> MUA VÉ
											</button></a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- single-product-end -->
						<%
					}
				}
				%>	
				</div>
			</div>
			<!-- tab-coming-soon-end -->
			<!-- tab-chieu-som-start -->
			<div class="tab-pane fade" id="chieusom">
				<div class="tab-active owl-carousel">
				<%
				if(listFilmChieuSom!=null){
					for(FilmBEAN fi : listFilmChieuSom){
				%>
						<!-- single-product-start -->
						<div class="product-wrapper">
							<div class="product-img">
								<a href="#"> <img src="<%=fi.getHinhAnh1() %>" alt="book"
									class="primary" />
								</a>
								<div class="quick-view">
									<a class="action-view" href="#" data-target="#<%=fi.getIdPhim() %>productModal"
										data-toggle="modal" title="Xem nhanh"> <i
										class="fa fa-search-plus"></i>
									</a>
								</div>
								<div class="product-flag">
									<ul>
										<li><span class="sale"><%=fi.getThoiLuong() %></span></li>
									</ul>
								</div>
							</div>
							<div class="product-details text-center">
								<h4>
									<a href="#"><%=fi.getTenPhim() %></a>
								</h4>
								<div class="product-price">
									<ul>
										<li><a href="DBSelectShowtime?id=<%=fi.getIdPhim() %>#book"><button type="button"
													class="btn btn-primary">
													<i class="fa fa-ticket"></i> MUA VÉ
												</button></a></li>
									</ul>
								</div>
							</div>
						</div>
						<!-- single-product-end -->
						<%
					}
				}
				%>
					
				</div>
			</div>
			<!-- tab-chieu-som-end -->
		</div>
		<!-- tab-area-end -->
	</div>
</div>

<!-- product-area-end -->
<!-- banner-area-start -->
<div class="banner-area-5 mtb-95">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="banner-img-2">
					<a href="#"><img src="assets/img/banners.png" alt="banner" /></a>

				</div>
			</div>
		</div>
	</div>
</div>
<!-- banner-area-end -->
<!-- recent-post-area-start -->
<div class="recent-post-area tt04 pb-100 tt30">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<!-- tab-menu-start -->
				<div class="tab-menu mb-40 text-center">
					<ul>
						<li class="active"><a href="#nowshowing11" data-toggle="tab"
							style="font-size: 26px">KHUYẾN MÃI</a></li>
						<li><a href="#comingsoon11" data-toggle="tab"
							style="font-size: 26px">SỰ KIỆN</a></li>
					</ul>
				</div>
				<!-- tab-menu-end -->
			</div>
		</div>
		<!-- tab-area-start -->
		<div class="tab-content">
			<!-- tab-now-showing-start -->
			<div class="tab-pane active" id="nowshowing11">
				<div class="post-active owl-carousel text-center">
				<%
				if(listKhuyenMai!=null){
					for(GiamGiaBEAN gg : listKhuyenMai){
						%>
						<div class="col-lg-12">
							<div class="single-post">
								<div class="post-img">
									<a href="#"><img src="<%=gg.getMoTaNgan() %>" alt="post" /></a>
									<div class="blog-date-time">
										<span class="day-time"><%=gg.getNgayBatDau().getDate() %>-<%=gg.getNgayBatDau().getMonth() %></span> <span class="moth-time"><%=gg.getNgayKetThuc().getDate() %>-<%=gg.getNgayKetThuc().getMonth() %></span>
									</div>
								</div>
								<div class="post-content">
                                    <h3><a href="#"><%=gg.getTenGianGia() %></a></h3>
                                    <p></p>
                                </div>
							</div>
						</div>
						<%
					}
				}
				%>
				
					
					
				</div>
			</div>
			<!-- tab-now-showing-end -->
			<!-- tab-coming-soon-start -->
			<div class="tab-pane fade" id="comingsoon11">
				<div class="post-active owl-carousel text-center">
				<%
				if(listSuKien != null){
					for(EventBEAN ev : listSuKien){
						%>
						<div class="col-lg-12">
							<div class="single-post">
								<div class="post-img">
									<a href="#"><img src="<%=ev.getAnhSuKien() %>" alt="post" /></a>
									<!-- <div class="blog-date-time">
										<span class="day-time"></span> <span class="moth-time">HOT</span>
									</div> -->
								</div>
								<div class="post-content">
                                    <h3><a href="#"><%=ev.getTenSuKien() %></a></h3>
                                    <p></p>
                                </div>
							</div>
						</div>
						
						<%
					}
				}
				%>
					
				</div>
			</div>
			<!-- tab-coming-soon-end -->
		</div>
		<!-- tab-area-end -->
	</div>
</div>
<!-- recent-post-area-end -->
<hr style="margin: 0px">
<!-- social-group-area-start -->

<!-- social-group-area-end -->

<%
if(listFilmDangChieu!=null){
	for(FilmBEAN fi : listFilmDangChieu){
%>
<!-- Modal Film Dang Chieu-->
<div class="modal fade tt28" id="<%=fi.getIdPhim() %>productModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content info-film" style="margin-bottom: 10px;">
			<div class="modal-header header-info"></div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-5 col-sm-5 col-xs-12">
						<div class="modal-tab">
							<div class="product-details-large tab-content img-info">
								<div class="tab-pane active" id="image-1-<%=fi.getIdPhim() %>">
									<img src="<%=fi.getHinhAnh1() %>" alt="" />
								</div>
								<div class="tab-pane" id="image-2-<%=fi.getIdPhim() %>">
									<img src="<%=fi.getHinhAnh1() %>" alt="" />
								</div>
								<div class="tab-pane" id="image-3-<%=fi.getIdPhim() %>">
									<img src="<%=fi.getHinhAnh2() %>" alt="" />
								</div>
								<div class="tab-pane" id="image-4-<%=fi.getIdPhim() %>">
									<img src="<%=fi.getHinhAnh3() %>" alt="" />
								</div>
							</div>
							<div class="product-details-small quickview-active owl-carousel">
								<a class="active" href="#image-1-<%=fi.getIdPhim() %>"><img
									src="<%=fi.getHinhAnh1() %>" alt="" /></a> <a href="#image-2-<%=fi.getIdPhim() %>"><img
									src="<%=fi.getHinhAnh2() %>" alt="" /></a> <a href="#image-3-<%=fi.getIdPhim() %>"><img
									src="<%=fi.getHinhAnh3() %>" alt="" /></a>
							</div>
						</div>
					</div>
					<div class="col-md-7 col-sm-7 col-xs-12 tt06">
						<div class="modal-pro-content info-film-detail">
							<h3><%=fi.getTenPhim() %></h3>

							<p><%=fi.getMoTaNgan() %></p>

							<br>
							<table class="table table-borderless table-info" border="0"
								cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<th>Phân loại:</th>
										<td>Phim dành cho khán giả trên <%=fi.getGioiHanTuoi() %> tuổi</td>
									</tr>
									<tr>
										<th>Đạo diễn:</th>
										<td><%=fi.getDaoDien() %></td>
									</tr>
									<tr>
										<th>Diễn viên:</th>
										<td><%=fi.getDienVien() %></td>
									</tr>
									<tr>
										<th>Thể loại:</th>
										<td><%=fi.getTheLoai() %></td>
									</tr>
									<tr>
										<th>Khởi chiếu:</th>
										<td><%=fi.getNgayCongChieu() %></td>
									</tr>
									<tr>
										<th>thời lượng:</th>
										<td><%=fi.getThoiLuong() %></td>
									</tr>
									<tr>
										<th>Định dạng:</th>
										<td><%=fi.getDinhDangPhim() %></td>
									</tr>
								</tbody>
							</table>
							<div class="price">
								<span style="color: white;">Giá vé: </span> <span><b>45.000
										- 55.000vnd/vé</b></span>
							</div>
							<form>
								<span><a href="DBSelectShowtime?id=<%=fi.getIdPhim() %>#book"><button
											type="button">
											<i class="fa fa-ticket"></i> ĐẶT VÉ NGAY
										</button></a></span> <span><a href="#" class="js-video-button"
									data-channel="video" data-video-url="<%=fi.getVideo()%>"><button
											type="button">
											<i class="fa fa-video-camera"></i> XEM TRAILER
										</button></a></span>
							</form>
							<span><i class="fa fa-check"></i> Đang chiếu</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal Film Dang Chieu -->
<%}} %>

<%
if(listFilmSapChieu!=null){
	for(FilmBEAN fi : listFilmSapChieu){
%>
<!-- Modal Film Sap Chieu-->
<div class="modal fade tt28" id="<%=fi.getIdPhim() %>productModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content info-film" style="margin-bottom: 10px;">
			<div class="modal-header header-info"></div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-5 col-sm-5 col-xs-12">
						<div class="modal-tab">
							<div class="product-details-large tab-content img-info">
								<div class="tab-pane active" id="image-1-<%=fi.getIdPhim() %>">
									<img src="<%=fi.getHinhAnh1() %>" alt="" />
								</div>
								<div class="tab-pane" id="image-2-<%=fi.getIdPhim() %>">
									<img src="<%=fi.getHinhAnh1() %>" alt="" />
								</div>
								<div class="tab-pane" id="image-3-<%=fi.getIdPhim() %>">
									<img src="<%=fi.getHinhAnh2() %>" alt="" />
								</div>
								<div class="tab-pane" id="image-4-<%=fi.getIdPhim() %>">
									<img src="<%=fi.getHinhAnh3() %>" alt="" />
								</div>
							</div>
							<div class="product-details-small quickview-active owl-carousel">
								<a class="active" href="#image-1-<%=fi.getIdPhim() %>"><img
									src="<%=fi.getHinhAnh1() %>" alt="" /></a> <a href="#image-2-<%=fi.getIdPhim() %>"><img
									src="<%=fi.getHinhAnh2() %>" alt="" /></a> <a href="#image-3-<%=fi.getIdPhim() %>"><img
									src="<%=fi.getHinhAnh3() %>" alt="" /></a>
							</div>
						</div>
					</div>
					<div class="col-md-7 col-sm-7 col-xs-12 tt06">
						<div class="modal-pro-content info-film-detail">
							<h3><%=fi.getTenPhim() %></h3>

							<p><%=fi.getMoTaNgan() %></p>

							<br>
							<table class="table table-borderless table-info" border="0"
								cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<th>Phân loại:</th>
										<td>Phim dành cho khán giả trên <%=fi.getGioiHanTuoi() %> tuổi</td>
									</tr>
									<tr>
										<th>Đạo diễn:</th>
										<td><%=fi.getDaoDien() %></td>
									</tr>
									<tr>
										<th>Diễn viên:</th>
										<td><%=fi.getDienVien() %></td>
									</tr>
									<tr>
										<th>Thể loại:</th>
										<td><%=fi.getTheLoai() %></td>
									</tr>
									<tr>
										<th>Khởi chiếu:</th>
										<td><%=fi.getNgayCongChieu() %></td>
									</tr>
									<tr>
										<th>thời lượng:</th>
										<td><%=fi.getThoiLuong() %></td>
									</tr>
									<tr>
										<th>Định dạng:</th>
										<td><%=fi.getDinhDangPhim() %></td>
									</tr>
								</tbody>
							</table>
							<div class="price">
								<span style="color: white;">Giá vé: </span> <span><b>45.000
										- 55.000vnd/vé</b></span>
							</div>
							<form>
								<span><a href="DBSelectShowtime?id=<%=fi.getIdPhim() %>#book"><button
											type="button">
											<i class="fa fa-ticket"></i> ĐẶT VÉ NGAY
										</button></a></span> <span><a href="#" class="js-video-button"
									data-channel="video" data-video-url="<%=fi.getVideo()%>"><button
											type="button">
											<i class="fa fa-video-camera"></i> XEM TRAILER
										</button></a></span>
							</form>
							<span><i class="fa fa-check"></i> Sắp chiếu</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal Film Sap Chieu -->
<%}} %>


<%
if(listFilmChieuSom!=null){
	for(FilmBEAN fi : listFilmChieuSom){
%>
<!-- Modal Film Chieu Som-->
<div class="modal fade tt28" id="<%=fi.getIdPhim() %>productModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content info-film" style="margin-bottom: 10px;">
			<div class="modal-header header-info"></div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-5 col-sm-5 col-xs-12">
						<div class="modal-tab">
							<div class="product-details-large tab-content img-info">
								<div class="tab-pane active" id="image-1-<%=fi.getIdPhim() %>">
									<img src="<%=fi.getHinhAnh1() %>" alt="" />
								</div>
								<div class="tab-pane" id="image-2-<%=fi.getIdPhim() %>">
									<img src="<%=fi.getHinhAnh1() %>" alt="" />
								</div>
								<div class="tab-pane" id="image-3-<%=fi.getIdPhim() %>">
									<img src="<%=fi.getHinhAnh2() %>" alt="" />
								</div>
								<div class="tab-pane" id="image-4-<%=fi.getIdPhim() %>">
									<img src="<%=fi.getHinhAnh3() %>" alt="" />
								</div>
							</div>
							<div class="product-details-small quickview-active owl-carousel">
								<a class="active" href="#image-1-<%=fi.getIdPhim() %>"><img
									src="<%=fi.getHinhAnh1() %>" alt="" /></a> <a href="#image-2-<%=fi.getIdPhim() %>"><img
									src="<%=fi.getHinhAnh2() %>" alt="" /></a> <a href="#image-3-<%=fi.getIdPhim() %>"><img
									src="<%=fi.getHinhAnh3() %>" alt="" /></a>
							</div>
						</div>
					</div>
					<div class="col-md-7 col-sm-7 col-xs-12 tt06">
						<div class="modal-pro-content info-film-detail">
							<h3><%=fi.getTenPhim() %></h3>

							<p><%=fi.getMoTaNgan() %></p>

							<br>
							<table class="table table-borderless table-info" border="0"
								cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<th>Phân loại:</th>
										<td>Phim dành cho khán giả trên <%=fi.getGioiHanTuoi() %> tuổi</td>
									</tr>
									<tr>
										<th>Đạo diễn:</th>
										<td><%=fi.getDaoDien() %></td>
									</tr>
									<tr>
										<th>Diễn viên:</th>
										<td><%=fi.getDienVien() %></td>
									</tr>
									<tr>
										<th>Thể loại:</th>
										<td><%=fi.getTheLoai() %></td>
									</tr>
									<tr>
										<th>Khởi chiếu:</th>
										<td><%=fi.getNgayCongChieu() %></td>
									</tr>
									<tr>
										<th>thời lượng:</th>
										<td><%=fi.getThoiLuong() %></td>
									</tr>
									<tr>
										<th>Định dạng:</th>
										<td><%=fi.getDinhDangPhim() %></td>
									</tr>
								</tbody>
							</table>
							<div class="price">
								<span style="color: white;">Giá vé: </span> <span><b>45.000
										- 55.000vnd/vé</b></span>
							</div>
							<form>
								<span><a href="DBSelectShowtime?id=<%=fi.getIdPhim() %>#book"><button
											type="button">
											<i class="fa fa-ticket"></i> ĐẶT VÉ NGAY
										</button></a></span> <span><a href="#" class="js-video-button"
									data-channel="video" data-video-url="<%=fi.getVideo()%>"><button
											type="button">
											<i class="fa fa-video-camera"></i> XEM TRAILER
										</button></a></span>
							</form>
							<span><i class="fa fa-check"></i> Sắp chiếu</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal Film Chieu Som-->
<%}} %>
<jsp:include page="block/block_bottom.jsp"></jsp:include>
<!-- phần dùng chung ở phía trên -->
