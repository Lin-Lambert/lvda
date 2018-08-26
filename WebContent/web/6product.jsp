<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>产品服务</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.css" type="text/css" />
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/reset-min.css" />
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/common.css" />
<style type="text/css">
.a {
	position: absolute;
	margin: auto;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
}
</style>
<script>
	function inImg(a){
		$(a).siblings("img").show();
	}
	function outImg(a){
		$(a).siblings("img").hide();
	}
	$(function(){
		var url="${pageContext.request.contextPath}/product_findAll.action";
		var param = {};
		$.post(url,param,function(data){
			$(data).each(function(i,n){
				if(i%2==0){
					$("#product").append(
						"<div class='col-lg-2 col-md-1 col-xs-12'></div>"
					);
				}else{
					$("#product").append(
						"<div class='col-lg-1 col-md-1'></div>"
					);
				};
				$("#product").append(
					"<div class='col-lg-4 col-md-5 col-sm-6 col-xs-12' style='margin-top: 30px;'><div style='position: relative; display: inline-block; width: 100%;'><a class='l1 l2' href='${ pageContext.request.contextPath }/product_findById.action?pro_id="+n.pro_id+"' style='text-align: center; display: inline-block; width: 100%;'><img style='width: 100%;' onmouseenter='inImg(this)' onmouseleave='outImg(this)' src='"+n.pro_img+"' /> <img class='a' hidden='hidden' src='${pageContext.request.contextPath}/img/search.png' /><p style='margin-top:10px'>"+n.pro_name+"</p></a></div></div>"
				);
			});
		},"json");
	});
</script>
</head>
<body>
	<!--header结构-->
	<div class="container-fluid">
		<div style="height: 20px;"></div>
		<div class="col-lg-2"></div>
		<div class="col-lg-4 col-md-6 col-xs-12">
			<a href="#"><img src="${ pageContext.request.contextPath }/img/logo.png" width="100%" /></a>
		</div>
		<div class="col-lg-5 col-md-6 col-xs-12" style="padding-top: 10px;">
			<table class="nav1">
				<tr>
					<td><a href="${ pageContext.request.contextPath }/web/1home.jsp">首页</a></td>
					<td><a href="${ pageContext.request.contextPath }/new_findByPage.action">新闻动态</a></td>
					<td><a href="${ pageContext.request.contextPath }/web/4profiles.jsp">关于我们</a></td>
					<td><a href="${ pageContext.request.contextPath }/web/6product.jsp">产品服务</a></td>
					<td><a href="${ pageContext.request.contextPath }/web/8contact.jsp">联系我们</a></td>
				</tr>
			</table>
		</div>
	</div>
	<div style="height: 20px;"></div>
	<!--banner结构-->
	<div class="container-fluid">
		<img style="margin: 0 auto;" src="${ pageContext.request.contextPath }/img/productBanner.png"
			class="img-responsive" width="100%">
	</div>
	<!--introduce结构-->
	<div class="container-fluid" style="padding: 80px 0;">
		<div class="col-lg-2 col-md-1"></div>
		<p class="f1 col-lg-9 col-md-11 col-sm-11 col-xs-12">产品中心</p>
		
		<div class="container-fluid" id="product">
		</div>
		
	</div>
	<!--footer结构-->
	<div class="footer1">
		<div class="container-fluid" style="padding:40px 0 40px 0">
			<div class="col-lg-2 col-md-1"></div>
			<div class="col-lg-6 col-md-6 col-sm-7 col-xs-12">
				<div>
					<p style="line-height:1.8">版权所有&ensp;&ensp;中国铝业股份有限公司&ensp;&ensp;京ICP备05024156号-1&ensp;&ensp;京公网安备110401000017</p>
					<p style="line-height:1.8">地址:中华人民共和国北京市海淀区西直门北大街62号&ensp;&ensp;技术支持:北京中恒电国际信息技术有限公司</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-5 col-sm-5 col-xs-12">
				<div>
					<form action="${pageContext.request.contextPath }/notice_findByPage2.action">
						<div>
							<input type="text" placeholder="  请输入您想输入的内容" /><input
								type="image" src="${ pageContext.request.contextPath }/img/search1.png" alt="Submit" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>