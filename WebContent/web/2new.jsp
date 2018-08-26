<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>新闻动态</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.css" type="text/css" />
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/reset-min.css" />
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/common.css" />
<script language=javascript>
	function to_page(page) {
		if (page) {
			$("#page").val(page);
		}
		document.newsForm.submit();
	}
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
	<div class="container-fluid" style="margin-top:20px;">
			<img style="margin: 0 auto;" src="${ pageContext.request.contextPath }/img/newsBanner.png" class="img-responsive" width="100%"> 
		</div>
		<!--introduce结构-->
		<div class="f2">
		<c:forEach items="${page.beanList }" var="news">
			<div class="container-fluid" style="margin-top: 60px;">
				<!--动态结构-->
				<div class="col-lg-2 col-md-1"></div>
				<div class="col-lg-4 col-md-5 col-sm-6" style="margin-top: 20px;">
					<!--news-->
					<table width="100%">
						<tr>
							<p class="f1">
								${news.nt_headline1 }<span class="f3"> ${news.nt_smallheadline1 }</span>
							</p>
						</tr>
						<tr height="40px"></tr>
						<tr>
							<td style="padding-right: 10px; width: 40%;"><img
								style="width: 100%;" src="${news.nt_img1 }" /></td>
							<td style="vertical-align: top; width: 60%;">
								<table style="width:100%">
									<tr>
										<td>
											<p class="f2">
												${news.nt_top }<span style="float: right">${news.nt_time }</span>
											</p>
										</td>
									</tr>
									<tr>
										<td><a class="l1 l2 s" href="${pageContext.request.contextPath }/new_findById.action?nt_id=${news.nt_id}"><p style='text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 3;-webkit-box-orient: vertical;word-wrap: break-word;overflow: hidden;text-indent: 2em' class="f2">${news.nt_content }</p></a>
										</td>
									</tr>
								</table>
							</td>
						<tr>
							<td colspan="2">
								<p class="f2" style="margin-top:5px">
									${news.nt_footer }<span style="float: right;">${news.nt_time }</span>
								</p>
							</td>
						</tr>
					</table>
				</div>
				<div class="col-lg-1 col-md-1 col-sm-1"></div>
				<!--案例结构-->
				<div class="col-lg-3 col-md-4 col-sm-5" style="margin-top: 20px;">
					<!--case-->
					<table width="100%">
						<tr>
							<p class="f1">
								${news.nt_headline2 }<span class="f3"> ${news.nt_smallheadline2 }</span>
							</p>
						</tr>
						<tr height="15px"></tr>
						<tr>
							<td><a class="l1 l2" href="${pageContext.request.contextPath }/new_findById.action?nt_id=${news.nt_id}"><img style="width: 100%;"
									src="${news.nt_img2 }" /></a></td>
						</tr>
					</table>
				</div>
				<div class="col-lg-2"></div>
			</div>
		</c:forEach>
	</div>
		<div class="container-fluid" style="margin: 80px 0 50px 0;">
			<div class="col-lg-8 col-md-8 col-sm-9 col-xs-4"></div>
			<div class="col-lg-4 col-md-4">
				<form name="newsForm" action="${ pageContext.request.contextPath }/new_findByPage.action"
					method="post">
					当前 <input style="background: #E6E6E6; height: 15px;width: 20px;" type="text" size="1" id="page" name="pageCode"
						value="${page.pageCode }" />页 &ensp; 共[<B>${page.totalPage}</B>]页
					&ensp;
					 <c:if test="${page.pageCode>1 }">
						<a style="text-decoration: none;color: black;" href="javascript:to_page(${page.pageCode-1})">
							<span style="display: inline-block; width: 30px;text-align: center;padding: 2px 0 2px 0;background: #E6E6E6;">&lt;</span>
						</a>
					</c:if>
					&ensp;
					<c:if test="${page.pageCode<page.totalPage }">
						<a style="text-decoration: none;color: black;" href="javascript:to_page(${page.pageCode+1})">
							<span style="display: inline-block; width: 30px;text-align: center;padding: 2px 0 2px 0;background: #E6E6E6;">&gt;</span>
						</a>
					</c:if>
				</form>
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
								type="image" src="img/search1.png" alt="Submit" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>