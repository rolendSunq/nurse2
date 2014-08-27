<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	function goToList() {
		document.location.href = "notice.do?method=list&articlePerPage=${notice.articlePerPage}&currentPage=${notice.currentPage}";
	}
	function deleteArticle(no) {
		document.location.href = "notice.do?method=delete&articlePerPage=${notice.articlePerPage}&currentPage=${notice.currentPage}&sno="
				+ no + "";
	}
	function editArticle(no) {
		document.location.href = "notice.do?method=edit&articlePerPage=${notice.articlePerPage}&currentPage=${notice.currentPage}&sno="
				+ no + "";
	}
	function appendArticle(no) {
		document.location.href = "notice.do?method=append&articlePerPage=${notice.articlePerPage}&currentPage=${notice.currentPage}&sno="
				+ no + "&flag=${notice.flag}";
	}
</script>
</head>
<body>
	<center>
		<h3>${notice.sno } : ${notice.subject }</h3>

		<table class="table table-bordered">
			<tr>
			<td align="right" colspan="4"><a href="javascript:goToList();"> <i class="icon-list"></i> <spring:message
							code="board.link.list" /></a></td>
			</tr>
			<tr>
				<th width="10%">글번호</th>
				<td width="50%">${notice.sno }</td>
				<th width="10%">작성일</th>
				<td>${notice.regdate }</td>
			</tr>
			<tr>
				<th width="10%"><spring:message code="board.writer" /></th>
				<td width="50%">${notice.name }</td>
				<th width="10%"><spring:message code="board.readcount" /></th>
				<td>${notice.readcount }</td>
				
			</tr>
			<tr>
				<th width="10%"><spring:message code="board.subject" /></th>
				<td width="50%">${notice.subject }</td>
				<th width="10%">글형태</th>
				<td><c:if test="${notice.flag==1 }">공지</c:if> 
				<c:if test="${notice.flag==0 }">일반</c:if></td>
			</tr>
			<tr>
				<th width="10%"><spring:message code="board.content" /></th>
				<td colspan="3" width="90%" height="240">${notice.content }</td>
			</tr>
			<tr>
				<th width="10%">파일명</th>
				<td colspan="3"><c:if test="${empty file }">
		첨부파일 없음
		</c:if> <a href="notice.do?method=filedown&fileName=${file.filename}" style="color: blue">${file.filename 
						}</a></td>
			</tr>
			<tr>
				<td align="center" colspan="4"><a
					href="javascript:appendArticle('${notice.sno }');"> <i
						class="icon-pencil"></i> <spring:message code="board.link.append" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${jobno==notice.jobno }">
					<a href="javascript:editArticle('${notice.sno }');"> <i
							class="icon-edit"></i> <spring:message code="board.link.edit" /></a>&nbsp;&nbsp;&nbsp;&nbsp; 
						<a href="javascript:deleteArticle('${notice.sno }');"> <i
							class="icon-trash"></i> <spring:message code="board.link.delete" /></a>		
		</c:if></td>
			</tr>
		</table>
	</center>
</body>
</html>