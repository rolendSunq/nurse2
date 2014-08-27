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
	function pass(){
		if(confirm("${board.name} 님의 기존 비밀번호를 입력해주세요")){
			 pwd = prompt("Password and Enter: ");
			if(pwd.length<=0){
				alert("Password needed!\t");
				return;
			}
			
			if(pwd=='${board.pwd}'){
				$('input[name=pwd]').removeAttr('readonly');	
				$('input[name=phone]').removeAttr('readonly');	
				$('input[name=cellphone]').removeAttr('readonly');	
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
</head>
<%
	/* Board board = (Board)request.getAttribute("board");
	request.setAttribute("content", board.getContent().replace("<br>","\r\n")); */
%>
<body>
<div id="div"></div>
<center>
<h3>정보수정</h3>
<form method="post" action="emp.do?method=editup">
<input type="hidden" name="articlePerPage" value="${board.articlePerPage }">
<input type="hidden" name="currentPage" value="${board.currentPage }">
<input type="hidden" name="num" value="${board.num }">

<table border="1" width="600">
	<tr>
		<th>PWD</th>
		<td><input type="password" name="pwd" size="20" value="${board.pwd }" readonly="readonly">
		<a href="javascript:pass();">
		수정</a></td>
	</tr>
	<tr>
		<th>주소</th>
		<td>보류</td>
	</tr>
	<tr>
		<th>자택전화</th>
		<td><input type="text" name="phone" size="60" value="${board.phone }" readonly></td>
	</tr>
	<tr>
		<th>핸드폰</th>
		<td><input type="text" name="cellphone" value="${board.cellphone}" readonly></td>
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