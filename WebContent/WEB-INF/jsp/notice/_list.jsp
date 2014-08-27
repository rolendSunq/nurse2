<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<center><h3>게시판</h3></center>
<form method="post">
	<table class="table">
		<tr>
			<td>
				<div class="col-sm-6">
					Articles per page: 
					<select name="articlePerPage" class="span1" onchange="javascript:setPerPage();">
						<option value="3">3</option>
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="40">40</option>
					</select>
				</div>
			</td>
			<td width="50%" align="right">Page <c:out value="${notice.currentPage }"/> of <c:out value="${notice.totalPage }"/></td>
		</tr>
	</table>

	<table class="table table-bordered">
		<tr>
			<th width="50"><b><spring:message code="board.num"/></b></th>
			<th width="350"><b><spring:message code="board.subject"/></b></th>
			<th width="50"><b><spring:message code="board.writer"/></b></th>
			<th width="100"><b><spring:message code="board.regdate"/></b></th>
			<th width="50"><b><spring:message code="board.readcount"/></b></th>
		</tr>
		<c:if test="${notice.totalCount==0 }">
		<tr>
			<td colspan="5" align="center">게시글이 없습니다.</td>
		</tr>
		</c:if>
		<!-- 공지사항 게시글 -->
		<c:forEach var="nl2" items="${noticeList2 }" end="3">
		<tr style="background:#F7F7F7" align="left">
			<td>
			${nl2.sno }
			</td>
			<td>		
			<c:forEach begin="1" end="${nl2.gap }" step="1" varStatus="s">
				&nbsp;
				<c:if test="${s.last }"><i class="icon-hand-right"></i>re:</c:if>
			</c:forEach>	
			<a href="javascript:viewArticle('${notice.currentPage }','${nl2.sno }');" style="color:#2F9D27;">
				<i class="icon-bell"></i> 공지:&nbsp;${nl2.subject }
			</a>
			<c:forEach var="fn" items="${file }">
			<c:if test="${fn.sno==nl2.sno }"><i class="icon-file-text"></i>
			</c:if>
			</c:forEach>			
			</td>
			<td>${nl2.name }</td>
			<td>${nl2.regdate }</td>
			<td>${nl2.readcount }</td>
		</tr>
		</c:forEach>
		<!-- 공지사항 게시 (끝) -->
		<c:forEach var="nl" items="${noticeList }">
		<tr align="left">
			<td>${nl.sno }</td>
			<td>
			<c:forEach begin="1" end="${nl.gap }" step="1" varStatus="s">
				&nbsp;
				<c:if test="${s.last }"><i class="icon-hand-right"></i> re:</c:if>
			</c:forEach>
			<a href="javascript:viewArticle('${notice.currentPage }','${nl.sno }');">
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
			<a href="notice.do?method=news" style="color: #2F9D27;"><i class="icon-bullhorn"></i> 공지사항</a>
			<c:if test="${notice.totalCount==0 }">
				페이징 정보가 없습니다.
			</c:if>
			<c:if test="${notice.totalCount>0 }">
			<c:if test="${notice.firstPage > notice.pagePerBlock }">
				[<a href="notice.do?method=list&articlePerPage=${notice.articlePerPage }&currentPage=1">처음</a>] 
				<a href='<c:url value="notice.do?method=list&articlePerPage=${notice.articlePerPage }&currentPage=${notice.firstPage-1 }"/>'>
				<spring:message code="board.prev"/></a>
			</c:if>
			<c:forEach var="pno" begin="${notice.firstPage }" end="${notice.lastPage }">
				[
				<c:if test="${pno!=notice.currentPage }"><a href="javascript:pageMove('${pno }');"></c:if>
				<c:if test="${pno==notice.currentPage }"><b></c:if>
				${pno }
				<c:if test="${pno!=notice.currentPage }"></a></c:if>
				<c:if test="${pno==notice.currentPage }"></b></c:if>
				]
			</c:forEach>
			<c:if test="${notice.lastPage < notice.totalPage }">
				<a href='<c:url value="notice.do?method=list&articlePerPage=${notice.articlePerPage }&currentPage=${notice.lastPage+1 }"/>'>
				<spring:message code="board.next"/></a>
			</c:if>
			</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="5" align="right">
				<a href="notice.do?method=write&articlePerPage=${notice.articlePerPage }&currentPage=${notice.currentPage}">
				<i class="icon-pencil"></i>
				<spring:message code="board.link.write"/>
				</a>
			</td>
		</tr>
	</table>
</form>
<script src="assets/js/jquery.js"></script>
<script type="text/javascript">
	(function(){
		$('select[name=articlePerPage]').val('${notice.articlePerPage}');
	})(jQuery);
	
 	function setPerPage(){
 		var perPageValue = $('[name=articlePerPage]').val();
		var app = perPageValue;
		$('[name=articlePerPage]').attr('option', perPageValue);
		document.location.href="notice.do?method=list&articlePerPage="+app;
 	}
 	
	function pageMove(pno){
		var app = $('select[name=articlePerPage]').val();
		document.location.href="notice.do?method=list&articlePerPage="+app+"&currentPage="+pno;
	}
	function viewArticle(pno,no){
		var app = $('select[name=articlePerPage]').val();
		document.location.href="notice.do?method=view&articlePerPage="+app+"&currentPage="+pno+"&sno="+no+"&jobno=${jobno}";
	} 
</script>