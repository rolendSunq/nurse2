<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<center><h3>공지사항 게시판</h3></center>
<form method="post">
	<table class="table">
		<tr>
			<td>
			<div class="col-sm-6">
			Articles per page: 
				<select name="articlePerPage" class="span1">
					<option value="3">3</option>
					<option value="5">5</option>
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="40">40</option>
				</select>
			</div>
			</td>
			<td width="50%" align="right">Page 
				<c:out value="${notice2.currentPage }"/> of <c:out value="${notice2.totalPage }"/>
			</td>
		</tr>
	</table>
	
	<table class="table table-bordered">
		<tr>
			<th width="50"><spring:message code="board.num"/></th>
			<th width="350"><spring:message code="board.subject"/></th>
			<th width="50"><spring:message code="board.writer"/></th>
			<th width="100"><spring:message code="board.regdate"/></th>
			<th width="50"><spring:message code="board.readcount"/></th>
		</tr>
		<c:if test="${notice2.totalCount==0 }">
		<tr>
			<td colspan="5">공지사항이 없습니다.</td>
		</tr>
		</c:if>
		<c:forEach var="nl" items="${noticeList3 }">
		<tr style="background:#F7F7F7" align="left">
			<td>${nl.sno }</td>
			<td>
			<c:forEach begin="1" end="${nl.gap }" step="1" varStatus="s">
				&nbsp;
				<c:if test="${s.last }"><i class="icon-hand-right"></i> re:</c:if>
			</c:forEach>
			<a href="javascript:viewArticle('${notice2.currentPage }','${nl.sno }');"style="color:#2F9D27;">
			${nl.subject }</a>
			<c:forEach var="fn" items="${file }">
			<c:if test="${fn.sno==nl.sno }"><i class="icon-file-text"></i>
			</c:if>
			</c:forEach>		
			</td>
			<td>${nl.name }</td>
			<td>${nl.regdate }</td>
			<td>${nl.readcount }</td>
		</tr>
		</c:forEach>
		<tr align="center">
			<td colspan="5">
				<a href="notice.do?method=list"><i class="icon-list"></i>목록보기&nbsp;</a>
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
		<tr>
			<td colspan="5" align="right">
			<a href="notice.do?method=write&articlePerPage=${notice2.articlePerPage }&currentPage=${notice2.currentPage}">
				<i class="icon-pencil"></i> <spring:message code="board.link.write"/>
			</a>
			</td>
		</tr>
	</table>
</form>
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