<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首页</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.css" type="text/css" />
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/reset-min.css" />
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/common.css" />
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript">
$(function(){
	var url="${pageContext.request.contextPath}/notice_findByPage.action";
	var param = {};
	$.post(url,param,function(data){
		$(data).each(function(i,n){
			$("#notice").append(
				"<tr><td style=\"white-space: nowrap;overflow: hidden;text-overflow: ellipsis;width:80%\"><a class=\"f2 l1 l2\" href=\"${pageContext.request.contextPath}/notice_findById.action?notice_id=" + n.notice_id + "\"><li>"+n.notice_title+"</li></a></td><td style=\"text-align: right;width:100px\"><span class=\"f2\">"+n.notice_time+"</span></td></tr>"
			);
			$(".bd ul").append(
					"<li><a href='3newsDetails.jsp'>"+n.notice_title+"</a></li>"
			);
		});
		jQuery(".txtMarquee-top").slide({mainCell:".bd ul",autoPlay:true,effect:"topMarquee",vis:1,interTime:100});
	},"json"); 
	var url1="${pageContext.request.contextPath}/new_findByPage2.action";
	$.post(url1,param,function(data){
		$(data).each(function(i,n){
			$("#news").append(
				"<tr><td colspan=2><p class=f1>"+n.nt_headline1+"<span class=f3> "+ n.nt_smallheadline1+"</span></p></td></tr><tr height=20px></tr><tr><td style='width: 40%; padding-right: 5px;'><img src='"+n.nt_img1 +"' /></td><td style='width: 60%; vertical-align: top;'><a class='l1 l2 f2' style='text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 3;-webkit-box-orient: vertical;word-wrap: break-word;overflow: hidden;text-indent:2em;' href='${pageContext.request.contextPath}/new_findById.action?nt_id="+ n.nt_id+"' style='text-indent: 2em;'>"+n.nt_content+"</a></td></tr><tr><td colspan=2  style='padding-top:5px;'><span class=f2>"+n.nt_footer+"</span></td></tr><tr><td colspan='2' style='text-align: right;'><a class='l1 l2' href='${pageContext.request.contextPath}/new_findByPage3.action?nt_id="+n.nt_id+"'> 详情>></a></td></tr>"
			);
		});
	},"json");
})
										
</script>
<style>
	/*轮播图*/
.box1{
	width: 800px;
	height: 154px;
	padding: 0 50px;
	margin: 20px auto;
	position: relative;
}
.box2{
	width: 700px;
	height: 100%;
	overflow: hidden;
	margin: 0 auto;
}
.box2 ul{
	width: 200%;
	overflow: hidden !important;
}
.box2 ul li{
	float: left;
}
.box2 ul li img{
	width: 221px;
	height: 154px;
	margin-right: 10px;
}
.left ,.right{
	display: inline-block;
	width: 50px;
	background: rgba(0,0,0,0.4);
	height: 154px;
	color: #ffffff;
	text-align: center;
	line-height: 154px;
	font-size: 30px;
	font-weight: 900;
	position: absolute;
}
.left{
	top: 0;
	left: 0;
}
.right{
	top: 0;
	right: 0;
}
.left:hover,.right:hover{
	background: rgba(0,0,0,0.5);
}
</style>
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
		<img src="${ pageContext.request.contextPath }/img/cpBanner.png" class="img-responsive"
			style="margin: 0 auto; width: 100%;border: none">
	</div>
	<!--notice结构-->
	<div style="padding: 10px 0;">
		<div style="margin: 0 auto;" class="container-fluid clearfix">
			<div class="col-lg-2"></div>
			<div class="col-lg-7 col-md-11 col-sm-11 col-xs-9" style="vertical-align: middle;">
				<!-- <p class="f1">
					最新公告:<a class="f2" href="5noticeBoard.jsp">祝全体员工五一节快乐</a>
				</p> -->
				<p class="f2" style="display: inline-block;vertical-align: top;">最新公告:</p>
				<div id="myCarousel" class="carousel slide f2" style="display:inline-block;">

					<div class="txtMarquee-top"> 
						<div class="bd">
							<ul>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-3">
				<a class="l1 l2 f2" href="${pageContext.request.contextPath }/notice_findByPage2.action">更多>></a>
			</div>
		</div>
	</div>
	<!--product结构-->
	<div style="background: #F1F1F1;">
		<div class="container-fluid">
			<div class="col-lg-2"></div>
			<p class="f1 col-lg-4 col-xs-12" style="padding-top: 10px;">
				产品中心<span class="f3"> Product Center</span>
			</p>
		</div>
		<%-- <div style="padding: 30px 0 50px 0;" class="container-fluid">
			<div class="col-lg-3  col-md-1"></div>
			
			<div class="col-lg-2 col-md-3 col-sm-4 col-xs-12">
				<a href="${ pageContext.request.contextPath }/web/6product.jsp"><img src="${ pageContext.request.contextPath }/img/product3.png" style="width: 100%;" /></a>
			</div>
			<div class="col-lg-2 col-md-3 col-sm-4 col-xs-12">
				<a href="${ pageContext.request.contextPath }/web/6product.jsp"><img src="${ pageContext.request.contextPath }/img/product2.png" style="width: 100%;" /></a>
			</div>
			<div class="col-lg-2 col-md-3 col-sm-4 col-xs-12">
				<a href="${ pageContext.request.contextPath }/web/6product.jsp"><img src="${ pageContext.request.contextPath }/img/product1.png" style="width: 100%;" /></a>
			</div>
				
			</div>--%>
			<div class="box1">
				<i class="left"><</i>
				<div class="box2">
					<ul style="transform: translateX(0px);">
						<li><a href="${ pageContext.request.contextPath }/web/6product.jsp"><img src="${ pageContext.request.contextPath }/img/product3.png" /></a></li>
						<li><a href="${ pageContext.request.contextPath }/web/6product.jsp"><img src="${ pageContext.request.contextPath }/img/product2.png" /></a></li>
						<li><a href="${ pageContext.request.contextPath }/web/6product.jsp"><img src="${ pageContext.request.contextPath }/img/product1.png" /></a></li>
						<li><a href="${ pageContext.request.contextPath }/web/6product.jsp"><img src="${ pageContext.request.contextPath }/img/product4.png" /></a></li>
						<li><a href="${ pageContext.request.contextPath }/web/6product.jsp"><img src="${ pageContext.request.contextPath }/img/product5.png" /></a></li>
						<li><a href="${ pageContext.request.contextPath }/web/6product.jsp"><img src="${ pageContext.request.contextPath }/img/product6.png" /></a></li>
						<li><a href="${ pageContext.request.contextPath }/web/6product.jsp"><img src="${ pageContext.request.contextPath }/img/product7.png" /></a></li>
					</ul>
				</div>
				<i class="right">></i>
			</div>
	</div> 
	<!--introduce结构-->
	<div>
		<div>
			<div class="container-fluid f2">
				<!--cp结构-->
				<div class="col-lg-2 col-md-1 col-sm-1"></div>
				<div class="col-lg-3 col-md-5 col-sm-5 col-xs-12">
					<div class="content_w" style="margin-top: 50px;">
						<div>
							<p class="f1">
								企业简介<span class="f3"> Company Profiles</span>
							</p>
							<img src="${ pageContext.request.contextPath }/img/companyProfiles1.png" style="margin-top: 20px;"
								width="100%" />
							<p class="f2" style="text-indent: 2em;margin-top: 10px;">中国铝业股份有限公司（一下简称“中国铝业”）于2001年9月10日在中国人民共和国注册成立，控股股东是中国铝业公司。中国铝业是中国有色金属行业的龙头企业，综合实力位居全球铝行业前列。</p>
						</div>
					</div>
				</div>
				<!--cp1结构-->
				<div class="col-lg-2 col-md-1 col-sm-1"></div>
				<div class="col-lg-3 col-md-4 col-sm-5 col-xs-12">
					<div class="content_w" style="margin-top: 50px;">
						<div>
							<p style="text-indent: 2em;">中国铝行业唯一集铝土矿、煤炭等资源勘探开采，氧化铝、原铝和铝合金产品生产、销售、技术研发，国际贸易，物流产业，火力发电，新能源发电于一体的大型生产经营企业。现有所属企业39户，其中：全资子公司18户，控股子公司21户。中国铝业股票分别在纽约证券交易所（股票代码：ACH）、香港联合交易所（股票代码：2600）和上海证券交易所（股票代码：601600）三地挂牌上市。十游快产能转移步伐，加大国际产能合作，提升国际化经营能力，努力打造具有国际竞争力的世界一流企业，实现股东增值、企业增效、员工增收，为谱写中国梦中铝新篇章做出新的更大的贡献。</p>
							<p style="text-align: right;">
								<a class="l1 l2" href="4profiles.jsp">查看更多>></a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-1"></div>
			</div>

			<div style="margin-top: 80px;" class="container-fluid">
				<!--new结构-->
				<div class="col-lg-2 col-md-1 col-sm-1"></div>
				<div class="col-lg-3 col-md-5 col-sm-5 col-xs-12"
					style="margin-bottom: 50px;">
					<table class="content_w" id="news">
						
					</table>
				</div>
				<div class="col-lg-2 col-md-1 col-sm-1"></div>
				<!--board结构-->
				<div class="col-lg-3 col-md-4 col-sm-5 col-xs-12"
					style="margin-bottom: 50px;">
					<table class="content_w">
						<tr>
							<td><p class="f1">
									公告栏<span class="f3"> Notice Board</span>
								</p></td>
						</tr>
						<tr height="20px"></tr>
						<tr>
							<td>
								<table width="100%" style="table-layout: fixed;" id="notice">
								</table>
							</td>
						</tr>
						<tr height="40px"></tr>
						<tr>
							<td style="text-align: right;"><a class="f2 l1 l2" href="${pageContext.request.contextPath }/notice_findByPage2.action">查看更多>></a></td>
						</tr>
					</table>
				</div>
				<div class="col-lg-2 col-md-1"></div>
			</div>
			<div style="height: 40px;"></div>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/home.js"></script>
</html>