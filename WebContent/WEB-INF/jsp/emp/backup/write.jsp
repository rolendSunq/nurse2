<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>     
<%@ page import="java.net.InetAddress" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원등록</title>
<link rel="stylesheet" type="text/css" href="assets/css/board/065.css" />
    <link href="<%=request.getContextPath()%>/assets/css/datepicker/jquery-ui-1.10.3.custom.css" rel="stylesheet" />
	<script src="<%=request.getContextPath()%>/assets/js/datepicker/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/datepicker/jquery-ui-1.10.3.custom.js"></script>





<style>
    /*body {font-size:9pt}
    img {vertical-align:middle}*/
    #datepicker { margin:2px 2px; height:15px; width:75px;vertical-align:center}
    
</style>

</head>

<body>
${board.articlePerPage }<-----페이지 정보
<center>
<h3>사원등록</h3>
<form method="post" action="emp.do?method=writeup" enctype="multipart/form-data">
<input type="text" name="articlePerPage" value="${board.articlePerPage }">
<%-- <input type="hidden" name="currentPage" value="${board.currentPage }">  --%>
<input type="hidden" name="readcount" value="0">
<input type="hidden" name="ref" value="0">
<input type="hidden" name="step" value="0">
<input type="hidden" name="depth" value="0">
<input type="hidden" name="email" value="1">
<input type="hidden" name="zipcode" value="1">
<input type="hidden" name="address1" value="1">
<input type="hidden" name="address2" value="1">
<input type="hidden" name="certnum" value="1">







<table border="1" width="600">
	<tr>
		<td colspan="2" align="right">
		<a href="emp.do?method=list&articlePerPage=${board.articlePerPage }&currentPage=${board.currentPage}">
		목록보기</a>
		</td>
	</tr>
	<tr>
		<th>ID</th>
		<td><input type="text" name="id" size="10"></td>
	</tr>
	<tr>
		<th>PWD</th>
		<td><input type="password" name="pwd" size="60"></td>
	</tr>
	<tr>
		<th>주민번호</th>
		<td><input type="password" name="ssn" size="60"></td>
	</tr>
	<tr>
		<th>생일</th>
		<td><input type="text" name="birthday" id="datepicker" value="20131114"></td><!-- name="birthday" -->
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" size="60"></td>
	</tr>
	<tr>
		<th>gender</th>
		<td><select name="sex">
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
		<td><input type="text" name="dno" size="60"></td>
	</tr>
	<tr>
		<th>자택전화</th>
		<td><input type="text" name="phone" size="60"></td>
	</tr>
	<tr>
		<th>핸드폰</th>
		<td><input type="text" name="cellphone"></td>
		<td><input type="text" name="telecom"></td>
	</tr>
	<tr>
		<th>수간호&일반</th>
		<td><input type="text" name="state"></td>
	</tr>
	<tr>
		<th>사진</th>
		<td><input type="text" name="photo"></td>
	</tr>
	
	<tr>
		<th>입사일</th>
		<td><input type="text" name="hiredate" size="20"  ></td>
	</tr>
	<tr>
		<th>퇴사일</th>
		<td><input type="text" name="firedate" size="20" ></td>
	</tr>
	<tr>
		<th>재직여부</th>
		<td><input type="text" name="dowork" size="20" ></td>
	</tr>
	<tr>
		<th>매니져</th>
		<td><input type="text" name="manager" size="20" ></td>
	</tr>
		<tr>
		<th>JOBNO</th>
		<td><input type="text" name="jobno" size="10"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<a href="javascript:writeup();">
		등록</a>
		</td>
		
		
	</tr>
</table>
</form>
</center>
<script type="text/javascript">
$(document).ready(function(){
	
    /* $('input[name=birth]').datepicker({ */
    $('#datepicker').datepicker({
    	showMonthAfterYear: true,
        changeYear: true, 
        showButtonPanel: true,
        yearRange:  "-5:+5", //-5:+5 , 2000:2020
        altFormat:  "yymmdd",
        altField:   "#datepicker", // altFormat 만 사용하면 dd/mm/yyyy로 나옴 함께 써야함
        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        dayNamesMin:   ["일", "월", "화", "수", "목", "금", "토"],
        closeText: '닫기',
        currentText: '오늘',
        prevText: '이전달',
        nextText: '다음달',
        yearSuffix: '년',
        buttonText: '달력',
        showOn: "button", //이미지로 사용 , both : 엘리먼트와 이미지 동시사용
        buttonImage: "assets/img/image/date_button.jpg", //버튼으로 사용할 이미지 경로
        buttonImageOnly: true //이미지만 보이기
    });

    //datepicker에서 사용한 이미지 버튼 style적용
    $("img.ui-datepicker-trigger").attr("style","margin-left:5px; vertical-align:middle; cursor:pointer;");
    
});

	function writeup(){
	/* if($('input[name=writer]').val().length==0){
			alert('Input data of writer\t');
			$('input[name=writer]').focus();
			return;
		}
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
		} */
		$('form').submit(); 
	}

</script>

</body>
</html>