<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><spring:message code="board.title"/></title>
<link rel="stylesheet" type="text/css" href="assets/css/board/065.css" />

<script type="text/javascript" src="assets/js/default/jquery-1.10.2.js"></script>
<script type="text/javascript">
 	$(function(){
		
		$('select[name=articlePerPage]').val('${notice2.articlePerPage}');
		$('select[name=articlePerPage]').change(function(){
			var app = $('select[name=articlePerPage]').val();
			document.location.href='<c:url value="notice.do?method=news&articlePerPage='+app+'"/>';
		});
	});
	function pageMove(pno){
		var app = $('select[name=articlePerPage]').val();
		document.location.href="notice.do?method=news&articlePerPage="+app+"&currentPage="+pno;
	}
	function viewArticle(pno,no){
		var app = $('select[name=articlePerPage]').val();
		document.location.href="notice.do?method=view&articlePerPage="+app+"&currentPage="+pno+"&sno="+no;
	} 
</script>
</head>

<body>
<center>
<h3>공지사항 <spring:message code="board.title"/></h3>
<form method="post">
<table border="0" width="600">
	<tr>
		<td width="50%" align="left">
		Articles per page: 
		<select name="articlePerPage">
			<option value="3">3</option>
			<option value="5">5</option>
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="40">40</option>
		</select>
		</td>
		<td width="50%" align="right">Page <c:out value="${notice2.currentPage }"/> of <c:out value="${notice2.totalPage }"/></td>
	</tr>
</table>

<table cellspacing="1" border="1" width="600">
	<tr>
		<th width="50"><spring:message code="board.num"/></th>
		<th width="350"><spring:message code="board.subject"/></th>
		<th width="50"><spring:message code="board.writer"/></th>
		<th width="100"><spring:message code="board.regdate"/></th>
		<th width="50"><spring:message code="board.readcount"/></th>
	</tr>
	<c:if test="${notice2.totalCount==0 }">
	<tr>
		<td colspan="5" align="center">공지사항이 없습니다.</td>
	</tr>
	</c:if>
	<c:forEach var="nl" items="${noticeList3 }">
	<tr>
		<td>${nl.sno }</td>
		<td>
		<c:forEach begin="1" end="${nl.gap }" step="1" varStatus="s">
			&nbsp;
			<c:if test="${s.last }">➥</c:if>
		</c:forEach>
		<a href="javascript:viewArticle('${notice2.currentPage }','${nl.sno }');"style="color:#2F9D27;">
		${nl.subject }</a>
		<c:forEach var="fn" items="${file }">
		<c:if test="${fn.sno==nl.sno }"><font style="color:navy;" size="">⚑</font>
		</c:if>
		</c:forEach>		
		</td>
		<td>${nl.name }</td>
		<td>${nl.regdate }</td>
		<td>${nl.readcount }</td>
	</tr>
	</c:forEach>
	
</table>
<table border="0" width="600">
	<tr>
		<td align="center">
		<a href="notice.do?method=list">[목록보기]&nbsp;</a>
		<c:if test="${notice2.totalCount==0 }">
			페이징 정보가 없습니다.
		</c:if>
		<c:if test="${notice2.totalCount>0 }">
		<c:if test="${notice2.firstPage > notice2.pagePerBlock }">
			[<a href="notice.do?method=news&articlePerPage=${notice2.articlePerPage }&currentPage=1">처음</a>] 
			<a href='<c:url value="notice.do?method=news&articlePerPage=${notice2.articlePerPage }&currentPage=${notice2.firstPage-1 }"/>'>
			<spring:message code="board.prev"/></a>
		</c:if>
		<c:forEach var="pno" begin="${notice2.firstPage }" end="${notice2.lastPage }">
			[
			<c:if test="${pno!=notice2.currentPage }"><a href="javascript:pageMove('${pno }');"></c:if>
			<c:if test="${pno==notice2.currentPage }"><b></c:if>
			${pno }
			<c:if test="${pno!=notice2.currentPage }"></a></c:if>
			<c:if test="${pno==notice2.currentPage }"></b></c:if>
			]
		</c:forEach>
		<c:if test="${notice2.lastPage < notice2.totalPage }">
			<a href='<c:url value="notice.do?method=news&articlePerPage=${notice2.articlePerPage }&currentPage=${notice2.lastPage+1 }"/>'>
			<spring:message code="board.next"/></a>
		</c:if>
		</c:if>
		</td>
	</tr>
</table>
<table cellspacing="0" border="0" width="600">
	<tr>
		<td align="right">
		<a href="notice.do?method=write&articlePerPage=${notice2.articlePerPage }&currentPage=${notice2.currentPage}">
		✎<spring:message code="board.link.write"/></a>
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>