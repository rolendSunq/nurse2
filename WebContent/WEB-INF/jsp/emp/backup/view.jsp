<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	
	
	function goToList(){
		document.location.href="emp.do?method=list&articlePerPage=${board.articlePerPage}&currentPage=${board.currentPage}";
	}
	function deleteArticle(no){
		if(confirm("Do you really want to delete?\t")){
			var pass = prompt("Password and Enter: ");
			if(pass.length<=0){
				alert("Password needed!\t");
				return;
			}
			if(pass=='${board.pwd}'){
				document.location.href="emp.do?method=delete&articlePerPage=${board.articlePerPage}&currentPage=${board.currentPage}&jobno="+jobno+"&pwd="+pwd+"";	
			} else {
				alert("Password doesn't match!\t");
			}
		}
	}
	function editArticle(no){
	
		if(confirm("Do you want to update?\t")){
			var pass = prompt("Password and Enter: ");
			if(pass.length<=0){
				alert("Password needed!\t");
				return;
			}
			if(pass=='${board.pwd}'){
				document.location.href="emp.do?method=edit&articlePerPage=${board.articlePerPage}&currentPage=${board.currentPage}&jobno="+no+"&pwd="+pass+"";	
			} else {
				alert("Password doesn't match!\t");
			}
		}
	}
	function appendArticle(no){
		
		document.location.href="board.do?method=append&articlePerPage=${board.articlePerPage}&currentPage=${board.currentPage}&num="+no+"";	
	}
	
</script>
</head>
<body>
<center>
<h3>사원정보</h3>
<table border="1" width="600">
	<tr>
		<th width="100">jobno</th>
		<td width="500">${board.jobno }</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${board.name }</td>
	</tr>
	<tr>
		<th>부서번호</th>
		<td>${board.dno }</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>
		${board.id}
		</td>
	<tr>
		<th>비밀번호</th>
		<td>${board.pwd }</td>
	</tr>
	<tr>
		<th>E-mail</th>
		<td>${board.email}</td>
	</tr><tr>
		<th>전화번호</th>
		<td>${board.phone }</td>
	</tr><tr>
		<th>통신사</th>
		<td>${board.telecom }</td>
	</tr><tr>
		<th>핸드폰</th>
		<td>${board.cellphone }</td>
	</tr><tr>
		<th>직급</th>
		<td>${board.state}</td>
	</tr>
	<tr>
		<th>사진</th>
		<td>${board.photo }</td>
	</tr>
	<tr>
		<th>주민등록번호</th>
		<td>${board.ssn }</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>${board.sex }</td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td>${board.zipcode}</td>
	</tr>
	<tr>
		<th>주소1</th>
		<td>${board.address1 }</td>
	</tr>
	<tr>
		<th>주소2</th>
		<td>${board.address2}</td>
	</tr>
	<tr>
		<th>입사일</th>
		<td>${board.hiredate}</td>
	</tr>
	<tr>
		<th>면허번호</th>
		<td>${board.certnum}</td>
	</tr>
	<tr>
		<th>생일</th>
		<td>${board.birthday}</td>
	</tr>
	<tr>
		<th>퇴사일</th>
		<td>${board.	firedate}</td>
	</tr>
	<tr>
		<th>재직이냐 퇴직</th>
		<td>${board.dowork}</td>
	</tr>
	<tr>
		<th>매니져</th>
		<td>${board. manager}</td>
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
		
		<a href="javascript:deleteArticle('${board.jobno }');">
		삭제</a> / 
		<a href="javascript:editArticle('${board.jobno }');">
		수정</a> / 
		<a href="javascript:goToList();">
		목록</a>
		</td>
	</tr>
</table>
</center>
</body>
</html>