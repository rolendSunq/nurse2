<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
<%@ page import="java.net.InetAddress" %>
<%@ page import="nurse.notice.vo.Notice"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View</title>
<link rel="stylesheet" type="text/css" href="assets/css/board/065.css" />

<script type="text/javascript" src="assets/js/default/jquery-1.10.2.js"></script>
<script type="text/javascript">
	function goToList(){
		document.location.href="notice.do?method=list&articlePerPage=${notice.articlePerPage}&currentPage=${notice.currentPage}";
	}
	function deleteFile(no){
		document.location.href="notice.do?method=deleteFile&articlePerPage=${notice.articlePerPage}&currentPage=${notice.currentPage}&sno="+no+"";	
	}	
	function editUpcencle(){
		document.location.href="notice.do?method=view2&articlePerPage=${notice.articlePerPage}&currentPage=${notice.currentPage}&sno=${notice.sno}";
	}	
	function editUpArticle(){
/* 		if($('input[name=email]').val().length==0){
			alert('Input data of email\t');
			$('input[name=email]').focus();
			return;
		} */
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
/* 		if($('input[name=pass]').val().length==0){
			alert('Input data of password\t');
			$('input[name=pass]').focus();
			return;
		} */
		$('form').submit();
	}
</script>
</head>
<%
/* 	InetAddress inetAddress = InetAddress.getLocalHost();
	String ip = inetAddress.getHostName()+"/"+inetAddress.getHostAddress();
	request.setAttribute("ip",ip); 
	Notice notice = (Notice)request.getAttribute("notice");
	request.setAttribute("content", notice.getContent().replace("<br>","\r\n"));*/
%>
<body>
<center>
<h3><spring:message code="board.title"/></h3>
<form method="post" action="notice.do?method=editup" enctype="multipart/form-data">
<input type="hidden" name="articlePerPage" value="${notice.articlePerPage }">
<input type="hidden" name="currentPage" value="${notice.currentPage }">
<input type="hidden" name="sno" value="${notice.sno }">
<input type="hidden" name="fno" value="1">

<table border="1" width="600">
	<tr>
		<th><spring:message code="board.num"/></th>
		<td>${notice.sno }</td>
	</tr>	
	<tr>
		<th width="100"><spring:message code="board.writer"/></th>
		<td width="500">${notice.name }</td>
	</tr>
	<tr>
		<th><spring:message code="board.subject"/></th>
		<td><input type="text" name="subject" size="60" value="${notice.subject }"></td>
	</tr>
	<tr>
		<th><spring:message code="board.content"/></th>
		<td>
		<textarea name="content" rows="10" cols="60">${notice.content }</textarea>
		</td>
	</tr>
	<tr>
		<th>파일</th>
		<td>${file.filename }
		<c:if test="${empty file }">
		<input type="file" name="filename" size="60" />
		</c:if>
		<c:if test="${not empty file }">
		<a href="javascript:deleteFile('${notice.sno }');">✄파일삭제</a>
		</c:if>
		</td>
	</tr>
</table>
<table border="1" width="600">
	<tr>
		<td align="center">
		<a href="javascript:editUpArticle();">
		✔<spring:message code="board.link.editup"/></a>&nbsp;&nbsp;&nbsp;&nbsp; 
		<a href="javascript:editUpcencle();">
		✘취소</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:goToList();">
		←<spring:message code="board.link.list"/></a>
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>