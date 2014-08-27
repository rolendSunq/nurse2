<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
<h3>간호사 리스트</h3>
<script type="text/javascript" src="assets/js/default/jquery-1.10.2.js"></script>
<style type="text/css">
	.sawonEnter {
		color: white;
	}
</style>
<form method="post">
 	<div class="col-xs-6 form-inline text-left">
 		<label for="articlePerPage">근무자 수: </label> 
		<select name="articlePerPage" id="articlePerPage" class="input-sm" onchange="javascript:setArticlePerPage();" style="border:0px;">
			<option value="3" >3</option>
			<option value="5">5</option>
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="40">40</option>
		</select>
	</div>
	<div class="col-xs-6 text-right">
		Page <c:out value="${board.currentPage }"/> of <c:out value="${board.totalPage }"/>
	</div>
	<table class="table table-bordered" >
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
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${board.totalCount==0 }">
					페이징 정보가 없습니다.
				</c:if>
				<c:if test="${board.totalCount>0 }">
				<c:if test="${board.firstPage > board.pagePerBlock }">
					<li><a href="emp.do?method=list&articlePerPage=${board.articlePerPage }&currentPage=1">&laquo;</a></li>
					<a href='<c:url value="emp.do?method=list&articlePerPage=${board.articlePerPage }&currentPage=${board.firstPage-1 }"/>'>
					</a>
				</c:if>
				<c:forEach var="pno" begin="${board.firstPage }" end="${board.lastPage }">
					<c:if test="${pno!=board.currentPage }"><li><a href="javascript:pageMove('${pno }');">${pno }</c:if>
					<c:if test="${pno==board.currentPage }"><li class="active"><a href="javascript:pageMove('${pno }');">${pno }<span class="sr-only">(current)</span></c:if>
					<c:if test="${pno!=board.currentPage }"></a></li></c:if>
					<c:if test="${pno==board.currentPage }"></a></li></c:if>
					
				</c:forEach>
				<c:if test="${board.lastPage < board.totalPage }">
					<li><a href='<c:url value="emp.do?method=list&articlePerPage=${board.articlePerPage }&currentPage=${board.lastPage+1 }"/>'>&raquo;</a></li>
				</c:if>     
				</c:if>
			</ul>
		</div>
	<c:forTokens var="auth" items="${pageAuth }" delims="-">
		<%-- ${auth }<br> --%>
		 <c:if test="${auth=='123' }">
		 	<c:set var="isAuth" value="true"/>
		 </c:if>
	</c:forTokens>
	<div class="text-right">
		<c:if test="${isAuth=='true' }">
			<button type="button" class="btn btn-primary">
				<a href="emp.do?method=write&articlePerPage=${board.articlePerPage }&currentPage=${board.currentPage}" class="sawonEnter">
				사원등록</a>
			</button>
		</c:if>
	</div>
</form>
<script type="text/javascript">
$(function(){
	$('select[name=articlePerPage]').val('${board.articlePerPage}');
});


	function pageMove(pno){
		
		var app = $('select[name=articlePerPage]').val();
		document.location.href="emp.do?method=list&articlePerPage="+app+"&currentPage="+pno;
	}
 


	function setArticlePerPage(){
		$(this).val('${board.articlePerPage}');
		var app = $('select[name=articlePerPage]').val();
		document.location.href="emp.do?method=list&articlePerPage="+app;
		
	}
	
	function viewArticle(pno,no){
		var app = $('select[name=articlePerPage]').val();
		document.location.href="emp.do?method=view&articlePerPage="+app+"&currentPage="+pno+"&jobno="+no;
	}
	function pass(){
		if(confirm("${board.name} 님의 기존 비밀번호를 입력해주세요")){
			 pwd = prompt("Password and Enter: ");
			if(pwd.length<=0){
				alert("Password needed!\t");
				return;
			}
			
			if(pwd=='${board.pwd}'){
				$('input[name=pwd]').removeAttr('readonly');	
				alert('수정가능');
			} else {
				alert("Password doesn't match!\t");
			}
		}
	}

	function goToList(){
		document.location.href="emp.do?method=list&articlePerPage=${board.articlePerPage}&currentPage=${board.currentPage}";
	}
	function editUpArticle(){
		
		if($('input[name=email]').val().length==0){
			alert('Input data of email\t');
			$('input[name=email]').focus();
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
		if($('input[name=pass]').val().length==0){
			alert('Input data of password\t');
			$('input[name=pass]').focus();
			return;
		}
		//$('form').submit();
		document.location.href="emp.do?method=editup&articlePerPage=${board.articlePerPage}&currentPage=${board.currentPage}";
	}

</script>