<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>     
<%@ page import="java.net.InetAddress" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Append</title>
<link rel="stylesheet" type="text/css" href="assets/css/board/065.css" />

<script type="text/javascript" src="assets/js/default/jquery-1.10.2.js"></script>
<script type="text/javascript">
	function appendup(){
		if($('input[name=name]').val().length==0){
			alert('Input data of name\t');
			$('input[name=name]').focus();
			return;
		}
		if($('input[name=subject]').val().length==0){
			alert('Input data of subject\t');
			$('input[name=subject]').focus();
			return;
		}
		if($('textarea[name=content]').val().length==0){
			alert('Input data of content\t');
			$('textarea[name=content]').focus();
			return;
		}
		$('form').submit();
	}
</script>
</head>

<body>
<center>
<h3><spring:message code="board.title"/></h3>
<form method="post" action="notice.do?method=appendup" enctype="multipart/form-data">
<input type="hidden" name="articlePerPage" value="${notice.articlePerPage }">
<input type="hidden" name="currentPage" value="${notice.currentPage }">
<input type="hidden" name="readcount" value="0">
<input type="hidden" name="fno" value="0"> 
<input type="hidden" name="gno" value="${notice.sno }"> 
<input type="hidden" name="flag" value="${notice.flag }">

<table border="1" width="600">

	<tr>
		<td colspan="2" align="right">
		<a href="notice.do?method=list&articlePerPage=${notice.articlePerPage }&currentPage=${notice.currentPage}">
		←<spring:message code="board.link.list"/></a>
		</td>
	<tr>
		<th><spring:message code="board.num"/></th>
		<td>${maxnum }<input type="hidden" name="sno" value="${maxnum }" /></td>
	</tr>
	<tr>
		<th><spring:message code="board.writer"/></th>
		<td><input type="text" name="name" size="10"></td>
	</tr>
	<tr>
		<th><spring:message code="board.subject"/></th>
		<td><input type="text" name="subject" size="60"></td>
	</tr>
	<tr>
		<th><spring:message code="board.content"/></th>
		<td><textarea name="content" rows="10" cols="60"></textarea></td>
	</tr>
	<tr>
		<th>File</th>
		<td><input type="file" name="filename"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<a href="javascript:appendup();">
		✔<spring:message code="board.link.confirm"/></a>
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>