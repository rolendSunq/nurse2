<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   

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
	function deleteArticle(no){
		document.location.href="notice.do?method=delete&articlePerPage=${notice.articlePerPage}&currentPage=${notice.currentPage}&sno="+no+"";	
	}
	function editArticle(no){
		document.location.href="notice.do?method=edit&articlePerPage=${notice.articlePerPage}&currentPage=${notice.currentPage}&sno="+no+"";	
	}
	function appendArticle(no){
		document.location.href="notice.do?method=append&articlePerPage=${notice.articlePerPage}&currentPage=${notice.currentPage}&sno="+no+"&flag=${notice.flag}";	
	}
</script>
</head>
<body>
<center>
<h3>${notice.subject }</h3>
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
		<td>${notice.subject }</td>
	</tr>
	<tr>
		<th><spring:message code="board.readcount"/></th>
		<td>${notice.readcount }</td>
	</tr>
	<tr>
		<th><spring:message code="board.content"/></th>
		<td>
		<br>
		${notice.content }
		<br><br>
		</td>
	</tr>
	<tr>
		<th>파일명</th>
		<td>
		<c:if test="${empty file }">
		첨부파일 없음
		</c:if>
		<a href="notice.do?method=filedown&fileName=${file.filename}">${file.filename }</a>
		</td>
	</tr>	
	<tr>
		<th><spring:message code="board.regdate"/></th>
		<td>${notice.regdate }</td>
	</tr>
</table>
<table border="1" width="600">
	<tr>
		<td align="center">
		<a href="javascript:appendArticle('${notice.sno }');">
		✐<spring:message code="board.link.append"/></a>&nbsp;&nbsp;&nbsp;&nbsp; 
		<a href="javascript:deleteArticle('${notice.sno }');">
		✄<spring:message code="board.link.delete"/></a>&nbsp;&nbsp;&nbsp;&nbsp; 
		<a href="javascript:editArticle('${notice.sno }');">
		♺<spring:message code="board.link.edit"/></a>&nbsp;&nbsp;&nbsp;&nbsp; 
		<a href="javascript:goToList();">
		←<spring:message code="board.link.list"/></a>
		</td>
	</tr>
</table>
</center>
</body>
</html>