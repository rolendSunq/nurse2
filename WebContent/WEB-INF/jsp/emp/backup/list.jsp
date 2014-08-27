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
		
		$('select[name=articlePerPage]').val('${board.articlePerPage}');
		$('select[name=articlePerPage]').change(function(){
			var app = $('select[name=articlePerPage]').val();
			document.location.href='<c:url value="board.do?method=list&articlePerPage='+app+'"/>';
		});
	});
	function pageMove(pno){
		var app = $('select[name=articlePerPage]').val();
		document.location.href="emp.do?method=list&articlePerPage="+app+"&currentPage="+pno;
	}
	function viewArticle(pno,no){
		var app = $('select[name=articlePerPage]').val();
		document.location.href="emp.do?method=view&articlePerPage="+app+"&currentPage="+pno+"&jobno="+no;
	}
</script>
</head>

<body>
<center>
<h3>간호사 리스트</h3>
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
		<td width="50%" align="right">Page <c:out value="${board.currentPage }"/> of <c:out value="${board.totalPage }"/></td>
	</tr>
</table>

<table cellspacing="1" border="1" width="600">
	<tr>
		<th width="50"><spring:message code="board.num"/></th>
		<th width="350">이름</th>
		<th width="200">핸드폰번호</th>
		
	</tr>
	<c:if test="${board.totalCount==0}">
	<tr>
		<td colspan="5" align="center">게시글이 없습니다.</td>
	</tr>
	</c:if>
	<c:forEach var="bd" items="${boardList }">
	<tr>
		<td>${bd.jobno }</td>
		<td>
		<c:forEach begin="1" end="${bd.gap }" step="1" varStatus="s">
			&nbsp;
			<c:if test="${s.last }">'--</c:if>
		</c:forEach>
		<a href="javascript:viewArticle('${board.currentPage }','${bd.jobno }');">
		${bd.name}</a>
		</td>
		<td>${bd.cellphone}</td>
		
	</tr>
	</c:forEach>
	
</table>
<table border="0" width="600">
	<tr>
		<td align="center">
		<c:if test="${board.totalCount==0 }">
			페이징 정보가 없습니다.
		</c:if>
		<c:if test="${board.totalCount>0 }">
		<c:if test="${board.firstPage > board.pagePerBlock }">
			[<a href="emp.do?method=list&articlePerPage=${board.articlePerPage }&currentPage=1">처음</a>] 
			<a href='<c:url value="emp.do?method=list&articlePerPage=${board.articlePerPage }&currentPage=${board.firstPage-1 }"/>'>
			<spring:message code="board.prev"/></a>
		</c:if>
		<c:forEach var="pno" begin="${board.firstPage }" end="${board.lastPage }">
			[
			<c:if test="${pno!=board.currentPage }"><a href="javascript:pageMove('${pno }');"></c:if>
			<c:if test="${pno==board.currentPage }"><b></c:if>
			${pno }
			<c:if test="${pno!=board.currentPage }"></a></c:if>
			<c:if test="${pno==board.currentPage }"></b></c:if>
			]
		</c:forEach>
		<c:if test="${board.lastPage < board.totalPage }">
			<a href='<c:url value="emp.do?method=list&articlePerPage=${board.articlePerPage }&currentPage=${board.lastPage+1 }"/>'>
			<spring:message code="board.next"/></a>
		</c:if>     
		</c:if>
		</td>
	</tr>
</table>
<table cellspacing="0" border="0" width="600">
	<tr>
		<td align="right">
		<a href="emp.do?method=write&articlePerPage=${board.articlePerPage }&currentPage=${board.currentPage}">
		사원등록</a>
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>