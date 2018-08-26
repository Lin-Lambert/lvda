<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>新闻动态</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.css" type="text/css" />
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/reset-min.css" />
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/common.css" />
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
		<div class="container-fluid" >
			<img style="margin: 0 auto;" src="${ pageContext.request.contextPath }/img/newsBanner.png" class="img-responsive" width="100%"> 
		</div>
		<!--introduce结构-->
		<div style="padding-bottom: 180px;">
			<div class="container-fluid" style="margin-top: 80px;">
				<div class="col-lg-2 col-md-1"></div>
				<p class="f1">新闻详情<span class="f3"> NEWS DETAILS</span></p>
			</div>
			<div class="container-fluid" style="margin-top: 80px;">
				<div class="col-lg-3 col-md-2"></div>
				<div class="col-lg-6 col-md-8" style="text-align: center;">
					${news.nt_newsdetail }
				</div>
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