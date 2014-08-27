<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Login Page</title>
		<link rel="shortcut icon" href="assets/ico/nurse.ico">
		<!-- Bootstrap core CSS -->
		<link href="assets/css/bootstrap.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link rel="stylesheet" href="assets/css/signin.css">
		<link rel="stylesheet" href="assets/css/codrops.css">
		<link rel="stylesheet" href="assets/css/font-awesome.css">
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="assets/js/html5shiv.js"></script>
		  <script src="assets/js/respond.min.js"></script>
		<![endif]-->
		<style type="text/css">
			#full-screen-background-image {
		        z-index: -999;
		        min-height: 100%;
		        min-width: 1024px;
		        width: 100%;
		        height: auto;
		        position: fixed;
		        top: 0;
		        left: 0;
		     }
			#loginMain {
				margin-top: 40%;
				opacity: 0.6;
				background-color:#fff;
				border-width:1px;
				border-style:solid;
				border-bottom-color:#fff;
				border-right-color:#fff;
				border-top-color:#fff;
				border-left-color:#fff;
				border-radius:2px;
				-moz-border-radius:2px;
				-webkit-border-radius:2px;
			}
			.form-2 {
				/* Styles */
				background: #fffaf6;
				border-radius: 4px;
				color: #7e7975;
				box-shadow:
				    0 2px 2px rgba(0,0,0,0.2),        
				    0 1px 5px rgba(0,0,0,0.2),        
				    0 0 0 12px rgba(255,255,255,0.4);
			}
			.signIn {
				font-size: 17px;
				float: right;
			}
		</style>
	</head>

	<body>
		<img src="assets/img/background${random }.jpg" id="full-screen-background-image">
		<!-- Codrops top bar START ==================================================-->
		<div class="codrops-top">
			<a href="http://www.getbootstrap.com">
				<strong>&laquo; Designed By Bootstrap. Theme: Road. </strong>Team Project Name: Nurse Schedule
			</a>
			<span class="right">
				<a href="nakil.do?method=pc">
					<strong>Team NAME: Mavericks & Perfect Stranger</strong>
				</a>
			</span>
		</div>
		<!--/ Codrops top bar END ==================================================--> 
		
		<!--container START ================================================== -->
		<div class="row">
			<div class="container">
				<form class="form-signin" method="post">
					<div class="well form-2" id="loginMain">
						<h3>Login
							<span class="signIn"><!-- signIn.do -->
								<a href="#" id="openSignIn">회원가입</a>
							</span>
						</h3>
						<legend></legend>
						<input type="text" class="form-control" id="id" name="id" placeholder="아이디 입력" autofocus>
						<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password 입력">
						<p class="text-right"><a data-toggle="modal" href="#" id="openModal">아이디/비밀번호 찾기</a></p>
						<button class="btn btn-lg btn-primary btn-block" type="button" id="submitBtn"><i class="icon-signin"></i> 확인</button>
					</div>
				</form>
			</div>
		</div>
		<!--container END ================================================== -->
		<!--container START ================================================== -->
		<div id="findIDnPW" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
						<h4 class="text-center"><b>아이디 / 패스워드 찾기</b></h4>
					</div>
					<div class="modal-body">
						<div class="container">
							<div class="row">
								<h5 class="text-center"><b>ID 찾기</b></h5>
								<form class="form-horizontal" role="form" id="formFindID">
									<div class="form-group">
										<label class="col-sm-2 control-label" for="email">EMAIL</label>
										<div class="col-sm-8 text-center" id="getId">
											<input type="email" class="form-control" id="email1" name="email" placeholder="email 입력" autofocus>
										</div>
									</div>
									<div class="text-center">
										<button type="button" id="idFind" class="btn btn-primary"><i class="icon-search"></i> ID 찾기</button>
									</div>
								</form>
							</div>
							<hr class="featurette-divider">
							<div class="row">
								<h5 class="text-center"><b>PASSWORD 찾기</b></h5>
								<form class="form-horizontal" role="form" id="formFindPWD">
									<div class="form-group">
										<label class="col-sm-2 control-label" for="email">EMAIL</label>
										<div class="col-sm-8">
											<input type="email" class="form-control" id="email2" name="email" placeholder="email 입력">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="name">ID</label>
										<div class="col-sm-8 text-center" id="getPwd">
											<input type="text" class="form-control" id="id2" name="id" placeholder="ID 입력">
										</div>
									</div>
									<div class="text-center">
										<button class="btn btn-primary" type="button" id="pwdFind"><i class="icon-search"></i> PASSWORD 찾기</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--container END ================================================== -->
		<!--container START ================================================== -->
		<div id="certiModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
						<h4 class="text-center"><b>사원번호입력</b></h4>
					</div>
					<div class="modal-body">
						<div class="container">
							<form id="ccodeForm" method="post" action="signIn.do">
								<input type="password" class="form-control" id="certificationCode" name="certificationCode">
							</form>
						</div>
					</div>
					 <div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" id="ccEnter">인증요청</button>
					</div>
				</div>
			</div>
		</div>
		<!--container END ================================================== -->
		<!-- Bootstrap core JavaScript	================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="assets/js/jquery.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			
			function idNPwdValidation(elementId, elementPWD, formID){
				var idValue = $(elementId).val();
				var passwordValue = $(elementPWD).val();
				// 정규표현식 id: --> ^ : 시작, $ : 끝, [a-z] : 영문으로 시작, [a-z0-9] 영문과 숫자조합, {6,19} 7자 이상  40자 이하 
				var idExp = /^[a-z][a-z0-9]{4,39}$/;
				//var passwordExp = /^[a-z][a-z0-9]{3,19}$/;
				var passwordExp = /^.*(?=.{4,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
				if (idValue.length == 0 && passwordValue.length == 0)
				{
					$(elementId).val('');
					$(elementId).val('').focus();
					alert('아이디와 패스워드를 입력하세요.');
					return false;
				}
				
				if (idValue.length == 0)
				{
					$(elementId).val('').focus();
					alert('아이디를 입력해 주세요');
					return false;
				}
				
				if (passwordValue.length == 0)
				{
					$(elementPWD).val('').focus();
					alert('패스워드를 입력해 주세요');
					return false;
				}
				
				if (!(idExp.test($(elementId).val())) || !(passwordExp.test($(elementPWD).val())))
				{
					$(elementPWD).val('');
					$(elementId).val('').focus();
					alert('아이디 또는 패스워드가 잘못되었습니다.');
					return false;
				}
				
				if (idExp.test($(elementId).val()) && passwordExp.test($(elementPWD).val()))
					joinAjax( formID );
			}
			
			function checkEmailnPWDValidation()
			{
				var emailExp = /^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
				var idExp  = /^[a-z][a-z0-9]{4,39}$/;
				var emailValue   = null;
				var idValue = null;
				
				if (arguments.length == 1)
				{
					emailValue = $(arguments[0]).val();
					
				}
				
				if (arguments.length == 2)
				{
					emailValue = $(arguments[0]).val();
					idValue = $(arguments[1]).val();
				}
				
				if (arguments.length == 2 && emailValue.length == 0 && idValue.length == 0)
				{
					$(arguments[1]).val('');
					$(arguments[0]).val('').focus();
					alert('email과 ID를 입력하세요');
					return false;
				}
				
				if (emailValue.length == 0)
				{
					alert('Email을 입력하세요.');
					$(arguments[0]).val('').focus();
					return false;
				}
				
				if (arguments.length == 2 && idValue.length == 0)
				{
					alert('ID를 입력하세요');
					$(arguments[1]).val('').focus();
					return false;
				}
				
				if (arguments.length == 2 && emailValue.length == 0 && idValue.length == 0)
				{
					alert('email과 ID를 입력하세요');
					$(aruments[1]).val('');
					$(aruments[0]).val('').focus();
					return false;
				}
				
				if (arguments.length == 1 && emailValue.length > 0)
				{
					if (!emailExp.test($(arguments[0]).val()))
					{
						alert('이메일 형식이 맞지 않습니다.');
						$(arguments[0]).val('').focus();
						return false;
					}
					//$('#formFindID').attr('action', 'findID.do').attr('method', 'post').submit();
					ajaxCall("findId.do", $(arguments[0]));
				}
				
				if (arguments.length == 2 && emailValue.length > 0 && idValue.length > 0)
				{
					if (!emailExp.test($(arguments[0]).val()) || !idExp.test($(arguments[1]).val()))
					{
						alert('이메일 또는 ID가 틀립니다.');
						$(arguments[0]).val('');
						$(arguments[1]).val('').focus();
						return false;
					}
					ajaxCall("findPWD.do", $(arguments[0]), $(arguments[1]));
					
				}
			}
			
			function ajaxCall(){
				var params = null;
				var value1 = null;
				var value2 = null;
				var urlValue = null;
				
				urlValue = arguments[0];
				
				if (arguments.length == 2)
				{
					value1 = $(arguments[1]).val();
					params = {email: value1};
				}
				
				if (arguments.length == 3)
				{
					value1 = $(arguments[1]).val();
					value2 = $(arguments[2]).val();
					params = {email: value1, id: value2};
				}
				
				$.ajax({      
					type:"POST",
					url:urlValue,      
					data:params,      
					success:function(jsonMsg){
						message = JSON.parse(jsonMsg);
						if (message.section == 'id')
						{
							if (message.sendMessage == '0')
								alert('아이디가 존재하지 않습니다.');
							else
							{
								var addTag = '<a href="javascript:findIdATagClick(1);" id="idClick">'+message.sendMessage+'</a>';
								
								$('#email1').attr('readonly', 'readonly');
								$('#getId').append(addTag);
								$('#idClick').css('color', 'blue');
							}
						}
						else
						{
							if (message.sendMessagse == '0')
								alert('패스워드가 존재하지 않습니다.');
							else
							{
								var addTag = '<a href="javascript:findIdATagClick(2);" id="pwdClick">'+message.sendMessage+'</a>';
								$('#email2').attr('readonly', 'readonly');
								$('#id2').attr('readonly', 'readonly');
								$('#getPwd').append(addTag);
							}
						}
						//setATagMessage( $(msgId), message.sendMessage);
					},   
					//beforeSend:showRequest,  
					error:function(e){  
						alert(e.responseText);  
					}  
				});  
			}
			
			function findIdATagClick(arg1)
			{
				if (arg1 == '1')
				{
					$('#id').val($('#idClick').text().trim());
					$('#email1').removeAttr('readonly').val('');
					$('#getId').children().last().remove();
					$('#findIDnPW').modal('hide');
				}
				else
				{
					$('#pwd').val($('#pwdClick').text().trim());
					$('#email2').removeAttr('readonly').val('');
					$('#id2').removeAttr('readonly').val('');
					$('#getPwd').children().last().remove();
					$('#findIDnPW').modal('hide');
				}
			}
			
			function joinAjax( formID ){
				var urlValue = 'loginAjax.do';
				var params = {id: $('#id').val().trim(), pwd: $('#pwd').val().trim()};
				$.ajax({      
					type:"POST",
					url:urlValue,      
					data:params,      
					success:function(jsonMsg){
						message = JSON.parse(jsonMsg);
						if (message.sendMessage == 0)
						{
							$('#pwd').val('');
							$('#id').val('').focus();
							alert('아이디또는 패스워드 오류입니다.');
						}
						else
							$(formID).attr('action', 'login.do').submit();
					},   
					//beforeSend:showRequest,  
					error:function(e){  
						alert(e.responseText);  
					}  
				});  
			}
			
			function certificationCodeValidate( param1, param2 )
			{
				if ( $(param1).val().trim().length == 0 )
				{
					$(param).val('').focus();
					alert('인증 코드를 입력하세요.');
					return false;
				}
				
				if ( $(param1).val().trim().length < 0 )
				{
					$(param1).val('').focus();
					alert('인증 코드를 다시 확인하세요.');
					return false;
				}
				
				if ( $(param1).val().trim() == 1234567890 )
				{
					$(param1).val('').focus();
					alert('인증 성공');
					$('#certiModal').modal('hide');
					$(param2).submit();
				}
			}
			
			$(function(){
				$('#openModal').click(function(){
					$('#findIDnPW').modal({show:true});
				});
				
				$('#id').val('').focus();
				$('#loginMain').click(function(){
					$(this).css('opacity', '1');
				});
				
				$('#id, #pwd').on('keypress', function(e) {
					$('#loginMain').css('opacity', '1');
					var idValue = $('#id').val();
					var passwordValue = $('#pwd').val();
				    if (e.which == 13) {
				    	var element = $(this).attr('id');
				       	if (element == 'id')
				       	{
				       		if (idValue.length == 0)
				       			$(element).val('').focus();
				       		else
				       			$('#pwd').val('').focus();
				 			return false;
				       	}
				       	
				       	if (element == 'pwd' )
				       	{
				       		if (passwordValue.length == 0){
					       		$(element).val('').focus();
					       		return false;
				       		}
				       		else 
				       		{
					       		idNPwdValidation($('#id'), $('#pwd'), $('.form-signin'));
					       		return false;
				       		}
				       	}
				    }
				});

				
				$('#submitBtn').click(function(){
					var value = idNPwdValidation($('#id'), $('#pwd'), $('.form-signin'));
					return value;
				});
				
				$('#idFind, #pwdFind').click(function(){
					element = $(this).attr('id');
					if (element == 'idFind')
						checkEmailnPWDValidation($('#email1'));
					else
						checkEmailnPWDValidation($('#email2'), $('#id2'));
				});
				
				$('#idClick').click(function(){
					findIdATagClick();
				});
				
				$('#openSignIn').click(function(){
					$('#certiModal').modal('show');
				});
				
				$('#ccEnter').click(function(){
					certificationCodeValidate( $('#certificationCode'), $('#ccodeForm') );
				});
			});
		</script>
	</body>
</html>