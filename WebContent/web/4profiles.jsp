<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>关于我们</title>
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
	<div class="container-fluid">
		<img src="${ pageContext.request.contextPath }/img/cpBanner.png" class="img-responsive" width="100%">
	</div>
	<!--introduce结构-->
	<div>
		<div style="padding: 20px 0 80px 0;">
			<div class="container-fluid">
				<!--profiles结构-->
				<div class="col-lg-2 col-md-1 col-sm-1"></div>
				<div class="col-lg-3 col-md-5 col-sm-5 col-xs-12"
					style="margin-top: 60px;">
					<div class="profiles1">
						<p class="f1">
							公司简介<span class="f3"> Company Profiles</span>
						</p>
						<img style="width: 100%;margin-top:20px" src="${ pageContext.request.contextPath }/img/companyProfiles2.png" />
						<p class="f2" style="text-indent:2em;margin-top:10px">承接建筑工程，建筑智能化工程的设计与施工，通信网络设计咨询，软件的技术开发、系统集成，企业形象策划，商务信息咨询，建材、玻璃、大理石、铝合金、水泥、电子器材的销售及进出口贸易。</p>
					</div>
				</div>
				<div class="col-lg-2 col-md-1 col-sm-1"></div>
				<!--advantage结构-->
				<div class="col-lg-3 col-md-4 col-sm-5 col-xs-12"
					style="margin-top: 60px;">
					<table style="width: 100%;">
						<tr>
							<td colspan="2">
								<p class="f1">
									我们的优势<span class="f3"> Our Advantage</span>
								</p>
							</td>
						</tr>
						<tr height="30px"></tr>
						<tr>
							<td style="padding-right: 10px; width: 25%;"><img
								style="width: 100%; border: none;" src="${ pageContext.request.contextPath }/img/element1.png" /></td>
							<td style="vertical-align: top;padding-left:20px">
								<p class="f1" style="color:black;margin-bottom:10px">质量保证</p>
								<p class="f2">设备严格遵循ISO9001质量体系，产品安全按照先进的国际标准进行设计，制造，检验。</p>
							</td>
						</tr>
						<tr height="30px"></tr>
						<tr>
							<td style="padding-right: 10px; width: 25%;"><img
								style="width: 100%; border: none;" src="${ pageContext.request.contextPath }/img/element2.png" /></td>
							<td style="vertical-align: top;padding-left:20px">
								<p class="f1" style="color:black;margin-bottom:10px">先进设备</p>
								<p class="f2">最新进的设备，机械，厂区占地面积xx平方米，技术力量雄厚。</p>
							</td>
						</tr>
						<tr height="30px"></tr>
						<tr>
							<td style="padding-right: 10px; width: 25%;"><img
								style="width: 100%; border: none;" src="${ pageContext.request.contextPath }/img/element3.png" /></td>
							<td style="vertical-align: top;padding-left:20px">
								<p class="f1" style="color:black;margin-bottom:10px">团队合作</p>
								<p class="f2">专业的人做专业的事，拥有完整，严禁的管理模式。</p>
							</td>
						</tr>
					</table>
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