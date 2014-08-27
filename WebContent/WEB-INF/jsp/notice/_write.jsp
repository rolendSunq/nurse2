<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.net.InetAddress"%>
 <center><h3>글쓰기</h3></center>
<form method="post" action="notice.do?method=writeup"
	enctype="multipart/form-data" >
	<input type="hidden" name="articlePerPage"
		value="${notice.articlePerPage }"> <input type="hidden"
		name="readcount" value="0"> <input type="hidden" name="srtno"
		value="1"> <input type="hidden" name="gap" value="0">
	<input type="hidden" name="fno" value="1"> <input type="hidden"
		name="jobno" value="${jobno }" />

	<table class="table table-bordered">
		<tr align="right">
			<td colspan="2"><a
				href="notice.do?method=list&articlePerPage=${notice.articlePerPage }&currentPage=${notice.currentPage}">
					<i class="icon-list"></i> <spring:message code="board.link.list" />
			</a></td>
		</tr>
		<tr align="left">
			<th>글번호</th>
			<td>${maxnum }<input type="hidden" name=sno value="${maxnum }">
			</td>
		</tr>
		<tr align="left">
			<th><spring:message code="board.writer" /></th>
			<td>${name }<input type="hidden" name=name value="${name }">
			</td>
		</tr>
		<tr align="left">
			<th><spring:message code="board.subject" /></th>
			<td>
				<div class="row">
					<div class="col-xs-9">
						<input type="text" class="form-control" placeholder="제목"
							name="subject" >
						<input type="text" style="display: none;" />
					</div>
					 <input type="radio" name="flag" value="0" checked>일반글
					 <input type="radio" name="flag" value="1" >공지글
				</div>
			</td>
		</tr>
		<tr align="left">
			<th><spring:message code="board.content" /></th>
			<td><div class="row">
					<div class="col-xs-9">
						<textarea name="content" class="form-control" rows="10"
							placeholder="내용"></textarea>
					</div>
				</div></td>
		</tr>
		<tr>
			<th>파일명</th>
			<td><input type="file" name="filename"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><a href="javascript:writeup();">
					<i class="icon-ok"></i> <spring:message code="board.link.confirm" />
			</a></td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	function writeup() {
		if ($('input[name=name]').val().length == 0) {
			alert('Input data of writer\t');
			$('input[name=name]').focus();
			return;
		}
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

		$('form').submit();
	}
</script>