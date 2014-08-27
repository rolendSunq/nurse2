<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
<%@ page import="java.net.InetAddress" %>
<%@ page import="nurse.board.vo.Board"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보수정</title>
<link rel="stylesheet" type="text/css" href="assets/css/board/065.css" />

<script type="text/javascript" src="assets/js/default/jquery-1.10.2.js"></script>
<script type="text/javascript">
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
</head>
<%
	/* Board board = (Board)request.getAttribute("board");
	request.setAttribute("content", board.getContent().replace("<br>","\r\n")); */
%>
<body>
<center>
<h3>정보수정</h3>
<form method="post" action="emp.do?method=editup">
<input type="hidden" name="articlePerPage" value="${board.articlePerPage }">
<input type="hidden" name="currentPage" value="${board.currentPage }">
<input type="hidden" name="num" value="${board.num }">

<table border="1" width="600">
	<tr>
		<th>ID</th>
		<td><input type="text" name="id" size="10" value="${board.id }"></td>
	</tr>
	<tr>
		<th>PWD</th>
		<td><input type="password" name="pwd" size="60 " value="${board.pwd }"></td>
	</tr>
	<tr>
		<th>주민번호</th>
		<td><input type="password" name="ssn" size="60" value="${board.ssn }"></td>
	</tr>
	<tr>
		<th>생일</th>
		<td><input type="text" name="birthday" size="60" value="${board.birthday }"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" size="60" value="${board.name }"></td>
	</tr>
	<tr>
		<th>gender</th>
		<td><select>
			<option value="0" selected>선택
			<option value="1" >남자
			<option value="2" >여자
		</select></td>
	</tr>
	<tr>
		<th>주소</th>
		<td>보류</td>
	</tr>
	<tr>
		<th>부서번호</th>
		<td><input type="text" name="dno" size="60" value="${board.dno }"></td>
	</tr>
	<tr>
		<th>자택전화</th>
		<td><input type="text" name="phone" size="60" value="${board.phone }"></td>
	</tr>
	<tr>
		<th>핸드폰</th>
		<td><input type="text" name="cellphone" value="${board.cellphone}"></td>
	</tr>
	<tr>
		<th>수간호&일반</th>
		<td><input type="text" name="state" value="${board.state}"></td>
	</tr>
	<tr>
		<th>사진</th>
		<td><input type="text" name="photo" value="${board.photo }"></td>
		<td colspan="2"><input type="submit" name="photo2" value= 업데이트></td>
	</tr>
	<tr>
		<th><spring:message code="board.pass"/></th>
		<td><input type="password" name="pass" size="4"></td>
	</tr>
	<tr>
		<th>입사일</th>
		<td><input type="text" name="hiredate" size="20" value="${board.hiredate }" ></td>
	</tr>
	<tr>
		<th>퇴사일</th>
		<td><input type="text" name="firedate" size="20" value="${board.firedate }"></td>
	</tr>
	<tr>
		<th>재직여부</th>
		<td><input type="text" name="dowork" size="20" value="${board.dowork }"></td>
	</tr>
	<tr>
		<th>매니져</th>
		<td><input type="text" name="manager" size="20" value="${board.manager}"></td>
	</tr>
	<tr>
		<th>권한</th>
		<td>
			<c:forEach var="menu" items="${menuList }"> 
			${menu.menuno }
			</c:forEach>
		</td>
	</tr>
</table>
<table border="1" width="600">
	<tr>
		<td align="center">
		<a href="javascript:editUpArticle();">
		<spring:message code="board.link.editup"/></a> / 
		<a href="javascript:goToList();">
		<spring:message code="board.link.list"/></a>
		</td>
	</tr>
</table>
</form>  
</center>
</body>
</html>