<%@page import="model.bean.GiamGiaBEAN"%>
<%@page import="model.bean.EventBEAN"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	ArrayList<EventBEAN> listEvent=(ArrayList<EventBEAN>)request.getAttribute("listEvent");
	ArrayList<GiamGiaBEAN> listGiamGia=(ArrayList<GiamGiaBEAN>)request.getAttribute("listGiamGia");
%>
<jsp:include page="block/block_top.jsp"></jsp:include>
<!-- phần dùng chung ở phía trên -->
<!-- about-main-area-start -->
<div class="about-main-area mb-70 content-promotion">
	<div class="container container-breadcrumbs">
		<div class="row breadcrumbs-info-film">
			<div class="col-lg-12">
				<div class="breadcrumbs-menu">
					<ul>
						<li><a href="index">Trang chủ</a></li>
						<li><a href="DBSelectSeat" class="active"><span>Khuyến mãi</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-7 col-md-7 col-sm-6 col-xs-12">
				<div class="about-img">
					<a href="#"><img src="assets/img/rap.jpg" alt="man" /></a>
				</div>
			</div>
			<div class="col-lg-5 col-md-5 col-sm-6 col-xs-12 khuyenmai-title">
				<div class="about-content">
					<h3>Khuyến mãi của DongBa Star</h3>
					<p>Xuyên suốt thời gian hoạt động, DongBa Star đã có rất nhiều
						chương trình Khuyến mãi và Sự kiện hấp dẫn. Không chỉ vậy, đã là
						thành viên của DongBa Star còn nhận được nhiều ưu đãi đặc biệt.</p>
					<ul>
						<li><a href="#"><i class="fa fa-check"></i>Promotion</a></li>
						<li><a href="#"><i class="fa fa-check"></i>Phim</a></li>
						<li><a href="#"><i class="fa fa-check"></i>Đối tác</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-3 hidden-sm col-xs-12">
				<div class="single-counter text-center mrg-none-sm mrg-none-xs">
					<h2 class="">1</h2>
					<span>Rạp</span>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
				<div class="single-counter text-center">
					<h2 class="">1000+</h2>
					<span>Bộ phim</span>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
				<div class="single-counter text-center">
					<h2 class="">200000+</h2>
					<span>Thành viên</span>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
				<div class="single-counter text-center">
					<h2 class="">1000000+</h2>
					<span>Khách hàng</span>
				</div>
			</div>

		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="team-title text-center mb-50">
					<h2>Khuyến mãi</h2>
				</div>
			</div>
			<%int i=1;
			if(listGiamGia!=null){
				for(GiamGiaBEAN gg:listGiamGia){%>
			
			<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
				<div class="single-team">
					<div class="team-img-area">
						<div class="team-img">
							<a href="#"><img src="<%=gg.getMoTaNgan() %>" alt="man" /></a>
						</div>
					</div>
				</div>
			</div>
<%if(i==4){
	
	break;
}
i++;
}
				}%>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="team-title text-center mb-50">
					<h2>Sự kiện</h2>
				</div>
			</div>
			<% int j=1;
			
			if(listEvent!=null){
				for(EventBEAN event:listEvent){%>
			<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
				<div class="single-team">
					<div class="team-img-area">
						<div class="team-img">
							<a href="#"><img src="<%=event.getAnhSuKien() %>" alt="man" /></a>
						</div>
					</div>
				</div>
			</div>
<%if(j==4){
	
	break;
}
j++;}} %>
		</div>
	</div>
</div>

<!-- our-mission-area-end -->
<!-- skill-area-end -->
<jsp:include page="block/block_bottom.jsp"></jsp:include>
<!-- phần dùng chung ở phía trên -->