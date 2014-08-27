<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.net.InetAddress"%>
<%@ page import="nurse.notice.vo.Notice"%>
<center><h3>글수정</h3></center>
<form method="post" action="notice.do?method=editup&jobno=${jobno}"
	enctype="multipart/form-data">
	<input type="hidden" name="articlePerPage"
		value="${notice.articlePerPage }"> <input type="hidden"
		name="currentPage" value="${notice.currentPage }"> <input
		type="hidden" name="sno" value="${notice.sno }"> <input
		type="hidden" name="fno" value="1">

	<table class="table table-bordered">
	<tr>
		<td colspan="2" align="right"><a href="javascript:goToList();"> <i
					class="icon-list"></i>
				<spring:message code="board.link.list" /></a>
				</td>
	</tr>
		<tr align="left">
			<th><spring:message code="board.num" /></th>
			<td>${notice.sno }</td>
		</tr>
		<tr align="left">
			<th width="100"><spring:message code="board.writer" /></th>
			<td width="500">${notice.name }</td>
		</tr>
		<tr align="left">
			<th><spring:message code="board.subject" /></th>
			<td>
				<div class="row">
					<div class="col-xs-9">
						<input type="text" class="form-control" placeholder="제목"
							name="subject" value="${notice.subject }">
							<input type="text" style="display: none;" />
					</div>
				</div>
			</td>
		</tr>
		<tr align="left">
			<th><spring:message code="board.content" /></th>
			<td><div class="row">
					<div class="col-xs-9">
						<textarea name="content" class="form-control" rows="10" placeholder="내용">${notice.content }</textarea>
					</div>
				</div>
			</td>
		</tr>
		<tr align="left">
			<th>파일</th>
			<td>${file.filename } <c:if test="${empty file }">
					<input type="file" name="filename" size="60" />
				</c:if> <c:if test="${not empty file }">
					<a href="javascript:deleteFile('${notice.sno }');">&nbsp;&nbsp;&nbsp;&nbsp;<i
						class="icon-trash"></i>파일삭제
					</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2"><a href="javascript:editUpArticle();"> <i
					class="icon-ok"></i>
				<spring:message code="board.link.editup" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:editUpcencle();"> <i class="icon-ban-circle"></i>취소
			</a></td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	function goToList() {
		document.location.href = "notice.do?method=list&articlePerPage=${notice.articlePerPage}&currentPage=${notice.currentPage}";
	}
	function deleteFile(no) {
		document.location.href = "notice.do?method=deleteFile&articlePerPage=${notice.articlePerPage}&currentPage=${notice.currentPage}&sno="
				+ no + "";
	}
	function editUpcencle() {
		document.location.href = "notice.do?method=view&articlePerPage=${notice.articlePerPage}&currentPage=${notice.currentPage}&sno=${notice.sno}";
	}
	function editUpArticle() {
		/* 		if($('input[name=email]').val().length==0){
		 alert('Input data of email\t');
		 $('input[name=email]').focus();
		 return;
		 } */
		if ($('input[name=subject]').val().length == 0) {
			alert('Input data of subject\t');
			$('input[name=subject]').focus();
			return;
		}
		if ($('textarea[name=content]').val().length == 0) {
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