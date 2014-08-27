<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Find ID & PASSWORD</title>
		<!-- Bootstrap core CSS -->
		<link href="assets/css/bootstrap.css" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/font-awesome.css">
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="assets/js/html5shiv.js"></script>
		  <script src="assets/js/respond.min.js"></script>
		<![endif]-->
	</head>

	<body>
			<!--container START ================================================== -->
		<div id="findIDnPW" class="modal">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
			<h2 class="text-center">아이디 / 패스워드 찾기</h2>
			<div class="modal-dialog">
			</div>
			<div class="modal-body">
				<h4 class="col-md-8 col-md-offset-3">ID 찾기</h4>
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="email">EMAIL</label>
						<div class="col-sm-5">
							<input type="email" class="form-control" id="email" name="email" placeholder="email 입력" autofocus>
						</div>
					</div>
					<div class="col-md-8 col-md-offset-3">
						<button type="button" id="idFind" class="btn btn-primary"><i class="icon-search"></i> ID 찾기</button>
					</div>
				</form>
			</div>
			<hr class="modal-body">
			<div class="modal-body">
				<h4 class="text-center">PASSWORD 찾기</h4>
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="email">EMAIL</label>
						<div class="col-sm-5">
							<input type="email" class="form-control" id="email" name="email" placeholder="email 입력">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="name">NAME</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="name" name="name" placeholder="이름 입력">
						</div>
					</div>
					<div class="col-md-8 col-md-offset-3">
						<button class="btn btn-primary" type="button" id="submitBtn"><i class="icon-search"></i> PASSWORD 찾기</button>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a href="#" data-dismiss="modal" class="btn">Close</a>
			</div>
		</div>
		<!--container END ================================================== -->
		<!-- Bootstrap core JavaScript	================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="assets/js/jquery.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$('#id').val('').focus();
				

				$('#id, #password').on('keypress', function(e) {
					var idValue = $('#id').val();
					var passwordValue = $('#password').val();
				    if (e.which == 13) {
				    	var element = $(this).attr('id') || $(this).attr('password');
				       	if (element == 'id' && idValue == '')
				       	{
				       		$(element).val('').focus();
				 			return false;
				       	}
				       	
				       	if (element == 'password' && passwordValue == '')
				       	{
				       		$(element).val('').focus();
				       		return false;
				       	}
				    }
				});

				
				$('#submitBtn').click(function(){
					// 정규표현식 id: --> ^ : 시작, $ : 끝, [a-z] : 영문으로 시작, [a-z0-9] 영문과 숫자조합, {6,19} 7자 이상  40자 이하 
					var idRegExp = /^[a-z][a-z0-9]{6,39}$/;
					var passwordRegExp = /^[a-z][a-z0-9]{6,19}$/;
					var idValue = $('#id').val();
					var passwordValue = $('#password').val();
					
					if (idValue == '' && passwordValue == '')
					{
						$('#password').val('');
						$('#id').val('').focus();
						alert('아이디와 패스워드를 입력하세요.');
						return false;
					}
					
					if (idValue == '')
					{
						
						$('#id').val('').focus();
						alert('아이디를 입력해 주세요');
						return false;
					}
					
					if (passwordValue == '' )
					{
						$('#password').val('').focus();
						alert('패스워드를 입력해 주세요');
						return false;
					}
					
					if (!regExp.test(idRegExp) || !regExp.test(passwordRegExp))
					{
						$('#password').val('');
						$('#id').val('').focus();
						alert('아이디 또는 패스워드가 잘못되었습니다.');
						return false;
					}
				});
			});
		</script>
	</body>
</html>