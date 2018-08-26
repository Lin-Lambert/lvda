<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>公告栏</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.css" type="text/css" />
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/reset-min.css" />
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/common.css" />
<SCRIPT language=javascript>
	// 提交分页的查询的表单
	function to_page(page){
		if(page){
			$("#page").val(page);
		}
		document.Form.submit();
	}
</SCRIPT>
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
		<img style="margin: 0 auto;" src="${ pageContext.request.contextPath }/img/cpBanner.png"
			class="img-responsive" width="100%">
	</div>
	<!--introduce结构-->
	<div>
		<div style="padding-bottom: 80px;">
			<div class="container-fluid" style="margin-top: 80px;">
				<div class="col-lg-2 col-md-1"></div>
				<p class="f1">
					公告栏<span class="f3"> Notice Board</span>
				</p>
			</div>
			<div class="container-fluid" style="margin-top: 80px;">
				<div class="col-lg-3 col-md-2"></div>
				<div class="col-lg-6 col-md-8">
					<c:forEach items="${page.beanList }" var="notice">
						<div>
							<ul style="list-style-image: url(${ pageContext.request.contextPath }/img/ico_2.gif);border-bottom:dashed 2px #C0C5D5;">
								<li style="padding: 10px 0;"><span><a href="${pageContext.request.contextPath}/notice_findById.action?notice_id=${notice.notice_id}">${notice.notice_title } </a></span><span style="float: right;">[${notice.notice_time }]</span></li>
							</ul>
						</div>
					</c:forEach>
					<form action="${pageContext.request.contextPath }/notice_findByPage2.action" name="Form" method="post">
						<DIV style="line-height: 20px; height: 20px; text-align: center;margin-top: 40px;">
							共[<b style="color: #4B97FC">${page.totalCount }</b>]条记录&nbsp;&nbsp;共[<B style="color: #4B97FC">${page.totalPage }</B>]页&nbsp;&nbsp; 当前<b style="color: #4B97FC">${page.pageCode }</b>/<b style="color: #4B97FC">${page.totalPage }</b>页&nbsp;&nbsp;
							<c:if test="${page.pageCode > 1}">
								[<A href="javascript:to_page(${page.pageCode-1})">前一页</A>]
							</c:if>
							&nbsp;&nbsp;
							<c:if test="${page.pageCode < page.totalPage }">
								[<A href="javascript:to_page(${page.pageCode+1})">后一页</A>] 
							</c:if>
							&nbsp;&nbsp;
							到
							<input type="text" size="3" id="page" name="pageCode" />
							页
							&nbsp;&nbsp;
							<input type="button" value="Go" onclick="to_page()"/>
						</DIV>
					</form>
				</div>
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