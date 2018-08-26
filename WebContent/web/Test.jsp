<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Bootstrap 实例 - 简单的轮播（Carousel）插件</title>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.css" type="text/css" />
	<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${ pageContext.request.contextPath }/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#myCarousel").carousel('cycle');
		})
	</script>
</head>
<body>
<div style="padding: 30px 0 50px 0;" class="container-fluid">
<div class="col-lg-3  col-md-1"></div>
			
<div class="col-lg-6 col-md-10 col-sm-12 col-xs-12">
	<div id="myCarousel" class="carousel slide">
		<div class="carousel-inner">
			<div class="item active" style="margin: 0 auto;">
				<img src="${ pageContext.request.contextPath }/img/product3.png" alt="First slide" style=" width: 33%;display: inline;">
				<img src="${ pageContext.request.contextPath }/img/product2.png" alt="Second slide" style=" width: 33%;display: inline;">
				<img src="${ pageContext.request.contextPath }/img/product1.png" alt="Third slide" style=" width: 33%;display: inline;">
			</div>
			<div class="item" style="margin: 0 auto;">
				<img src="${ pageContext.request.contextPath }/img/product3.png" alt="First slide" style=" width: 33%;display: inline;">
				<img src="${ pageContext.request.contextPath }/img/product2.png" alt="Second slide" style=" width: 33%;display: inline;">
				<img src="${ pageContext.request.contextPath }/img/product1.png" alt="Third slide" style=" width: 33;display: inline;">
			</div>
			<div class="item" style="margin: 0 auto;">
				<img src="${ pageContext.request.contextPath }/img/product3.png" alt="First slide" style=" width: 33%;display: inline;">
				<img src="${ pageContext.request.contextPath }/img/product2.png" alt="Second slide" style=" width: 33%;display: inline;">
				<img src="${ pageContext.request.contextPath }/img/product1.png" alt="Third slide" style=" width: 33%;display: inline;">
			</div>
		</div>
		<a class="carousel-control left" href="#myCarousel" 
		   data-slide="prev">&lsaquo;</a>
		<a class="carousel-control right" href="#myCarousel" 
		   data-slide="next">&rsaquo;</a>
	</div> 
</div>
</div>
</body>
</html>