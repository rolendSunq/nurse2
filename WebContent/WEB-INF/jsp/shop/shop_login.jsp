<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/shop/style.css" />
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function(){

	});
	$(function(){
		$('button[name=submit]').click(function(){
			if ($('input[name=login]').val() == "") {
				alert("아이디를 입력해 주세요.\t");
				$('input[name=login]').focus();
				return false;
			} else if ($('input[name=password]').val() == "") {
				alert("비밀번호를 입력해 주세요.\t");
				$('input[name=password]').focus();
				return false;
			}
			$('input[name=page]').val('loginCheck');
			$('form[name=frm2]').submit();
		});
	});
		
	function next(){
		$('input[name=page]').val('shop_signup');
		$('form[name=frm1]').submit();
	}
	function logout(){
		$('input[name=page]').val('shop_logout');
		$('form[name=frm1]').submit();
	}
	function kickmyass(){
		alert("Oooooops! Programmer Mr.Jung is on vacation!\t");
	}
	function manager(){
		$('input[name=page]').val('shop_member_list');
		$('form[name=frm1]').submit();
	}
</script>
</head>
<body>

	<form name="frm1" method="post"><input type="hidden" name="page"></form>

	<div class="container">
		<!-- top bar -->
		<div class="codrops-top">
			<strong>&laquo; Designed by Googling: </strong>
			Project Manager : 
			<strong><font color="orange">Moongi Jung</font></strong>
			<span class="right">
				<strong>
				<c:if test="${empty member }">
				<a href="http://localhost:8080/webprg/shopping">[ Login ]</a>
				</c:if>
				<c:if test="${not empty member }">
				<a href="javascript:logout()">[ Logout ]</a> &nbsp;
				Your ID : <font color="orange">${member.id }</font> &nbsp;
					<c:if test="${member.auth=='a' }">
					<a href="javascript:manager()">[ Admin ]</a> &nbsp;
					</c:if>
				</c:if>
				</strong>&nbsp;&nbsp;
			</span>
		</div>

		<header>
		<h1>Welcome <strong>Moon Sports </strong>Shop</h1>
		<h2>All about Sports! Territory beyond : It's still out there.</h2>
		</header>

		<section class="main">
		<c:if test="${not empty member }">
		<form name="frm2" method="post" class="form-2">
			<input type="hidden" name="page">
			<span>
			<table border="1">
				<tr>
					<td width="50%">
					<img src="shoppingmall/images/sistar.jpg" width="100%">
					</td>
					<td width="50%" valign="top">
					
					<p class="field">
					<font style="font-family: 돋움; font-size: 12px;">
					[ ${member.id } ] 고객님 방문을 환영합니다.<br><br>
					
					지금 구매하시면 네버랜드 무료방문권을 드립니다.
					</font>
					</p>
					
					</td>
				</tr>
			</table>
			<br><br><br>
			</span>
			<p class="field" align="center">
				<nav class="codrops-demos">
					<a href="javascript:logout()">Log-out</a>
					<a href="javascript:kickmyass()">I want to leave this site ever!</a>
				</nav>
			</p>
		</form>
		</c:if>
		<c:if test="${empty member }">
		<form name="frm2" method="post" class="form-1">
			<input type="hidden" name="page">
			<p class="field">
				<input type="text" name="login" placeholder="User ID"> 
				<i class="icon-user icon-large"></i>
			</p>
			<p class="field">
				<input type="password" name="password" placeholder="Password"><br>
				<font color="red">${loginCheckResult }</font><br> 
				<i class="icon-lock icon-large"></i>
			</p>
			<p class="submit">
				<button id="submit" type="submit" name="submit">
					<i class="icon-arrow-right icon-large"></i>
				</button>
			</p>
			<p class="field" align="center">
				<nav class="codrops-demos">
					<a href="javascript:next()">Signup</a>
				</nav>
			</p>
			
		</form>
		</c:if>
		</section>
	</div>
	
</body>
</html>