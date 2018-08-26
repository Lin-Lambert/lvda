<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>修改客户</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 日期插件，使用jquery -->
<script type="text/javascript"src="${pageContext.request.contextPath }/js/jquery-1.4.2.js"></script>
<link rel="stylesheet"href="${pageContext.request.contextPath }/js/jquery.datepick.css"type="text/css">
<script type="text/javascript"src="${pageContext.request.contextPath }/js/jquery.datepick.js"></script>
<script type="text/javascript"src="${pageContext.request.contextPath }/js/jquery.datepick-zh-CN.js"></script>
<link rel="stylesheet" href="../themes/default/default.css" />
<link rel="stylesheet" href="../plugins/code/prettify.css" />
<script charset="utf-8" src="../kindeditor-all.js"></script>
<script charset="utf-8" src="../lang/zh-CN.js"></script>
<script charset="utf-8" src="../plugins/code/prettify.js"></script>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
<script type="text/javascript">
	KindEditor.ready(function(K) {
		var editor1 = K.create('textarea[name="content1"]', {
			cssPath : '${pageContext.request.contextPath }/plugins/code/prettify.css',
			uploadJson : '${pageContext.request.contextPath }/upload_json.jsp',
			fileManagerJson : '${pageContext.request.contextPath }/file_manager_json.jsp',
			allowFileManager : true
		});
		 K('#getHtml1').click(function(e) {
				var a = document.getElementById("a");
				a.getAttributeNode("value").value=editor1.html();
				var check = checkForm();
				if(check==null){
					document.form1.submit();
				}
		});
	});
	$(function() {
		//使用class属性处理  'yy-mm-dd' 设置格式"yyyy/mm/dd"
		$('#timeId').datepick({
			dateFormat : 'yy-mm-dd'
		});
		
	})
	function checkForm() {
		// 获取用户输入的登录名
		var code = $("#check1").val();
		// 进行判断，说明没有输入登录名
		if (code.trim() == "") {
			// 给提示
			alert("标题不能为空！");
			return false;
		}
		var code = $(".check2").val();
		// 进行判断，说明没有输入登录名
		if (code.trim() == "") {
			// 给提示
			alert("时间不能为空！");
			return false;
		}
	}
	
</script>
</HEAD>
<BODY>
	<FORM id=form1 name=form1
		action="${pageContext.request.contextPath }/notice_update.action"
		method="post" enctype="multipart/form-data" target="main"
		onsubmit="return checkForm()">
		<input type="hidden" name="notice_id" value="${sessionScope.notice.notice_id }">
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG
						src="${pageContext.request.contextPath }/img/new_019.jpg" border=0></TD>
					<TD width="100%"
						background="${pageContext.request.contextPath }/img/new_020.jpg"
						height=20></TD>
					<TD width=15><IMG
						src="${pageContext.request.contextPath }/img/new_021.jpg" border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TR>
				<TD width=15
					background="${pageContext.request.contextPath }/img/new_022.jpg">
					<IMG src="${pageContext.request.contextPath }/img/new_022.jpg"
					border=0>
				</TD>
				<TD>
					<!-- <TABLE cellSpacing=0 cellPadding=0 width="98%" border=0> -->
					<TABLE cellSpacing=0 cellPadding=10  border=0>
						<TBODY>
							<TR>
								<TD vAlign=top width="100%" bgColor=#ffffff>
									<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
										<TR>
											<TD class=manageHead>当前位置：公告栏管理 &gt; 修改公告</TD>
										</TR>
										<TR>
											<TD height=2></TD>
										</TR>
									</TABLE>

									<TABLE cellSpacing=0 cellPadding=5 border=0>
										<TR>
											<td colspan="4">
												<fieldset>
													<legend>公告栏的内容</legend>
													<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
														<tr>
															<td>标题：</td>
															<td><INPUT class="textbox" id=check1
																style="WIDTH: 180px" maxLength=50 name="notice_title" value="${sessionScope.notice.notice_title }"></td>
															<td>时间：</td>
															<td><INPUT class="textbox check2" id=timeId
																style="WIDTH: 180px" maxLength=50 name="notice_time"
																readonly="readonly" value="${sessionScope.notice.notice_time }"></td>
														</tr>
													</TABLE>
												</fieldset>
											</td>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD colspan="4">
									<table id="menu" style="width:100%" cellSpacing=0 cellPadding=0 width="98%" border=0>
										<tr>
											<td align="center">
											<textarea name="content1" cols="100" rows="20" style="width: 100%; height: 200px;">
												${sessionScope.notice.notice_detail }
											</textarea> 
											<br /></td>
										</tr>
									</table>
									<input type="hidden" id="a" value="" name="notice_detail">
									<input type="button" id="getHtml1" style="float: right" value="保存"/> 
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
				<TD width=15
					background="${pageContext.request.contextPath }/img/new_023.jpg">
					<IMG src="${pageContext.request.contextPath }/img/new_023.jpg"
					border=0>
				</TD>
			</TR>
			
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG
						src="${pageContext.request.contextPath }/img/new_024.jpg" border=0></TD>
					<TD style="vertical-align: middle;" width="100%"
						background="${pageContext.request.contextPath }/img/new_025.jpg"
						height=15></TD>
					<TD width=15><IMG
						src="${pageContext.request.contextPath }/img/new_026.jpg" border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
	</FORM>
</BODY>
</HTML>
