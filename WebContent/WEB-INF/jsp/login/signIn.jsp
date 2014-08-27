<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>회원가입</title>
		
		<!-- Bootstrap core CSS -->
		<link href="assets/css/bootstrap.css" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/font-awesome.css">
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="assets/js/html5shiv.js"></script>
		  <script src="assets/js/respond.min.js"></script>
		<![endif]-->
		
		<!-- datePicker -->
		<link rel="stylesheet" href="assets/css/datepicker/jquery-ui-1.10.3.custom.css">
	</head>
	<body>
		<div class="row">
			<div class="container">
				<div class="span4">
					<h3 class="text-center"><b>회원가입</b></h3>
				</div>
				<div class="span12">
					<form class="form-horizontal" role="form">
						<fieldset>
							<legend></legend>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">이름</label>
								<div class="col-md-3">
									<input type="text" class="form-control" id="name" name="name" data-toggle="tooltip" title="한글 4자까지 허용합니다.">
								</div>
								<button type="button" class="btn btn-primary" id="nameEnter" data-toggle="tooltip" title="확인버튼을 꼭 눌러 주세요.">확인</button>
							</div><!-- /form-group -->
							<div class="form-group">
								<label for="birth" class="col-sm-2 control-label">생년월일</label>
								<div class="col-md-2">
									<input class="form-control" id="datepicker" name="birthday" type="text" readonly="readonly">
								</div>
							</div>
						</fieldset>
						<div class="form-group form-inline">
							<label for="id" class="col-sm-2 control-label">아이디</label>
							<div class="col-md-3" id="idInput">
								<input type="text" class="form-control" id="id" name="id" placeholder="특수문자 허용 않함" data-toggle="tooltip" title="영문으로 시작하며 숫자포함하여 5자 이상 15자 이하">
							</div>
							<button type="button" class="btn btn-primary" id="idEnter"  data-toggle="tooltip" title="중복 검사는 반드시 해야합니다.">중복확인</button>
							<a href="#" id="idMessage" data-toggle="tooltip" title="꼭 클릭해 주세요"></a>
						</div><!-- /form-group -->
						<div class="form-group">
							<label for="ssn" class="col-sm-2 control-label">주민번호</label>
							<div class="col-md-3">
								<input type="text" class="form-control" id="ssn" name="ssn" placeholder="숫자만 입력 - 생략 ">
							</div>
							<button type="button" class="btn btn-primary" id="ssnEnter"  data-toggle="tooltip" title="중복 검사는 반드시 해야합니다.">중복확인</button>
							<a href="#" id="ssnMessage" data-toggle="tooltip" title="꼭 클릭해 주세요."></a>
						</div><!-- /form-group -->
						<div class="form-group">
							<label for="pwd1" class="col-sm-2 control-label">비밀번호</label>
							<div class="col-md-3">
								<input type="password" class="form-control" id="pwd1" placeholder="비빌번호 입력" data-toggle="tooltip" title="영문, 숫자 혼용해서 6~20자 이내">
							</div>
						</div><!-- /form-group -->
						<div class="form-group">
							<label for="hiredate" class="col-sm-2 control-label"></label>
							<div class="col-md-3">
								<input type="password" class="form-control" id="rePwd" placeholder="비빌번호 재입력">
							</div>
							<button type="button" class="btn btn-primary" id="pwdEnter" data-toggle="tooltip" title="확인버튼을 꼭 눌러 주세요.">확인</button>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-2 control-label">EMAIL</label>
							<div class="col-md-3">
								<input type="email" class="form-control" id="email" name="email" placeholder="Email 입력">
							</div>
							<button type="button" class="btn btn-primary" id="emailEnter" data-toggle="tooltip" title="중복 검사는 반드시 해야합니다.">중복검사</button>
							<a href="#" id="emailMessage"  data-toggle="tooltip" title="꼭 클릭해 주세요."></a>
						</div><!-- /form-group -->
						<div class="form-group">
							<label for="localNumber" class="col-sm-2 control-label">집 전화</label>
							<div class="col-md-2">
								<select class="form-control" id="localNumber">
									<option value="02">02</option>
									<option value="031">031</option>
									<option value="032">032</option>
									<option value="033">033</option>
									<option value="041">041</option>
									<option value="042">042</option>
									<option value="043">043</option>
									<option value="044">044</option>
									<option value="051">051</option>
									<option value="052">052</option>
									<option value="053">053</option>
									<option value="054">054</option>
									<option value="055">055</option>
									<option value="061">061</option>
									<option value="062">062</option>
									<option value="063">063</option>
									<option value="064">064</option>
								</select>
							</div>
							<div class="col-md-2">
								<input type="text" class="form-control" id="tel1">
							</div>
							<div class="col-md-2">
								<input type="text" class="form-control" id="tel2">
							</div>
							<button type="button" class="btn btn-primary" id="phoneEnter"  data-toggle="tooltip" title="확인버튼을 꼭 눌러 주세요.">확인</button>
						</div><!-- /form-group -->
						<div class="form-group">
							<label for="telecom" class="col-sm-2 control-label">Cell Phone</label>
							<div class="col-md-2">
								<select class="form-control" id="telecom">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</div>
							<div class="col-md-2">
								<input type="text" class="form-control" id="cell1">
							</div>
							<div class="col-md-2">
								<input type="text" class="form-control" id="cell2">
							</div>
							<button type="button" class="btn btn-primary" id="cellEnter"  data-toggle="tooltip" title="확인버튼을 꼭 눌러 주세요.">확인</button>
						</div><!-- /form-group -->
						<div class="form-group">
							<label for="zipcode" class="col-sm-2 control-label">우편번호</label>
							<div class="col-md-2">
								<input type="text" class="form-control" id="zipcode" name="zipcode" readonly="readonly">
							</div>
							<button type="button" class="btn btn-primary" id="zipcodeEnter" data-toggle="modal tooltip" data-target="#myModal" title="버튼을 누르면 검색창이 나옵니다.">찾기</button>
						</div>
						<div class="form-group">
							<label for="address1" class="col-sm-2 control-label">주소1</label>
							<div class="col-md-5">
								<input type="text" class="form-control" id="address1" name="address1" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label for="address2" class="col-sm-2 control-label">주소2</label>
							<div class="col-md-5">
								<input type="text" class="form-control" id="address2" name="address2" readonly="readonly">
							</div>
							<button type="button" class="btn btn-primary" id="addrEnter" data-toggle="tooltip" title="확인버튼을 꼭 눌러 주세요.">확인</button>
						</div>
						<legend></legend>
						<div class="text-right">
							<button type="reset" class="btn btn-primary" id="reset" data-toggle="tooltip" title="모든 데이터가 삭제됩니다.">다시작성</button>
							<button type="button" class="btn btn-primary" id="finish" data-toggle="tooltip" title="가입 성공시 로그인 페이지로 이동합니다.">완료</button>
						</div>
						<input type="hidden" id="pwd" name="pwd">
						<input type="hidden" id="phone" name="phone">
						<input type="hidden" id="cellphone" name="cellphone">
						<input type="hidden" id="sex" name="sex">
					</form>
				</div>
			</div>
		</div><!-- /row -->
		<script type="text/javascript" src="assets/js/default/jquery-1.10.2.js"></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
		
		<script type="text/javascript" src="assets/js/datepicker/jquery-ui-1.10.3.custom.js"></script>
		<script type="text/javascript">
			// 필수 항목 검사 체크 클래스
			function CheckSignIn (){
				this.checkCounter = 0;
				this.addCount = function (){
					this.checkCounter++;
				};
				this.minusCount = function (){
					this.checkCounter--;
				};
				this.getCount = function (){
					return this.checkCounter;
				};
			}
			
			// 이름 항목 검사
			function nameValidate(arg1)
			{
				var nameExp = /^[가-힣]{2,4}$/;
				if ($(arg1).val().trim().length == 0)
				{
					$(arg1).val('').focus();
					alert('이름을 입력하세요.');
					return false;
				}
				
				if ( !nameExp.test($(arg1).val().trim()))
				{
					$(arg1).val('').focus();
					alert('이름 형식이 맞지 않습니다.');
					return false;
				}
				
				return true;
			}
			
			// PWD 항목 검사 
			function pwdValidate(arg1, arg2){
				var pwdElement1 = arg1;
				var pwdElement2 = arg2;
				var passwordExp = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
					
				if ( $(pwdElement1).val().trim().length == 0 && $(pwdElement2).val().trim().length == 0 )
				{
					$(pwdElement2).val('');
					$(pwdElement1).val('').focus();
					alert('비밀번호를 입력하세요.');
					return false;
				}
				
				if ( $(pwdElement1).val().trim().length == 0 )
				{
					$(pwdElement1).val('').focus();
					alert('비밀번호를 입력하세요.');
					return false;
				}
				
				if ( $(pwdElement2).val().trim().length == 0 )
				{
					$(pwdElement2).val('').focus();
					alert('비밀번호를 입력하세요.');
					return false;
				}
				
				if ( !passwordExp.test( $(pwdElement1).val().trim() ) || !passwordExp.test( $(pwdElement2).val().trim() ) )
				{
					$(pwdElement2).val('');
					$(pwdElement1).val('').focus();
					alert('패스워드 형식이 맞지 않습니다.');
					return false;
				}
				
				if ( ($(pwdElement1).val().trim()).toLowerCase() !== ($(pwdElement2).val().trim()).toLowerCase() )
				{
					$(pwdElement2).val('');
					$(pwdElement1).val('').focus();
					alert('패스워드가 일치하지 않습니다.');
					return false;
				}
				
				$('#pwd').val($(pwdElement1).val());
				return true;
			}
			
			// email 항목 검사
			function emailValidate( arg )
			{
				var element = arg;
				var emailExp = /^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
				if ( $(element).val().trim().length == 0 )
				{
					$(element).val('').focus();
					alert('Email을 입력하세요.');
					return false;
				}
				
				if ( !emailExp.test( $(element).val().trim() )  )
				{
					$(element).val('').focus();
					alert('Email 형식이 맞지 않습니다.');
					return false;
				}
				
				return true;
			}
			
			// ID 항목 검사
			function idValidate( arg )
			{
				var idExp = /^[a-z][a-z0-9]{4,15}$/;
				var element = arg;
				
				if ( $(element).val().trim().length == 0 )
				{
					$( element ).val('').focus();
					alert('아이디를 입력하세요.');
					return false;
				}
				
				if ( !idExp.test($(element).val().trim()) )
				{
					$( element ).val('').focus();
					alert('아이디 형식이 맞지 않습니다.');
					return false;
				}
				
				return true;
			}
			
			// 주민번호 항목 검사
			function ssnValidate( arg )
			{
				var ssnExp = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))[1-6][0-9]{6}$/;  
				var element = arg;
				
				if ( $(element).val().trim().length == 0 )
				{
					$(element).val('').focus();
					alert('주민번호를 입력하세요.');
					return false;
				}
				
				if ( !ssnExp.test($(element).val().trim()) )
				{
					$(element).val('').focus();
					alert('주민번호 형식이 틀립니다.');
					return false;
				}
				// 주민번호 7번째 자리의 숫자는 성별을 결정 짖는다. 
				// charAt()는 배열 인덱스 0번 부터 시작한다.
				$('#sex').val( ($(element).val().trim()).charAt(6) );
				return true;
			}
			
			// Ajax 처리 함수
			// 다른 항목에서 Ajax를 적용하기 위해 private 클래스 tmp 를 넣었다.
			// json 형식을 맞추기 위해서 사용한다.
			// key와 value를 parameter 값으로 이용한다.
			// tmp[key] = value ---> 결국 key: value로 매칭된다.
			function ajaxCall(urlVal, paramId, msgId){
				var tmp = {};
				var url = urlVal;
				var key = $(paramId).attr('id');
				var value = $(paramId).val();
				tmp[key] = value;
				var params = tmp;
				$.ajax({      
					type:"POST",
					url:url,      
					data:params,      
					success:function(jsonMsg){
						message = $.parseJSON(jsonMsg);
						setATagMessage( $(msgId), message.sendMessage);
					},   
					//beforeSend:showRequest,  
					error:function(e){  
						alert(e.responseText);  
					}  
				});  
			}
			
			// 집 전화, 휴대폰 항목 검사
			function phoneValidate(arg1, arg2){
				var element1 = arg1;
				var element2 = arg2;
				var phone1Exp = /^[0-9]{3,4}$/;
				var phone2Exp = /^[0-9]{4}$/;
				var idElement = $(arg1).attr('id');
				if ( $(element1).val().trim().length == 0 && $(element2).val().trim().length == 0 )
				{
					$(element2).val('');
					$(element1).val('').focus();
					alert('번호를 입력하세요.');
					return false;
				}
				
				if ( $(element1).val().trim().length == 0 )
				{
					$(element1).val('').focus();
					alert('번호를 입력하세요.');
					return false;
				}
				
				if ( $(element2).val().trim().length == 0)
				{
					$(element2).val('').focus();
					alert('번호를 입력하세요.');
					return false;
				}
				
				if ( !phone1Exp.test($(element1).val().trim()) || !phone2Exp.test($(element2).val().trim()) )
				{
					$(element2).val('');
					$(element1).val('').focus();
					alert('번호 형식이 맞지 않습니다.');
					return false;
				}
				
				if ( idElement == 'tel1' )
				{
					var phoneValue = $('#localNumber').val() + '-' + $(element1).val() + '-' + $(element2).val();
					$('#phone').val(phoneValue);
					return true;

				}
				else if ( idElement == 'cell1' )
				{
					var cellValue = $('#telecom').val() + '-' + $(element1).val() + '-' + $(element2).val();
					$('#cellphone').val(cellValue);
					return true;
				}
			}
			
			// arg1: a tag id, arg2: input id
			function setATagMessage( arg1, arg2 )
			{
				element1 = arg1;
				if ( arg2 == '1')
					$(arg1).text(' 사용 가능');
				else
				{
					$(arg1).css('color', ' #d14');
					$(arg1).text(' 사용 불가');
				}
			}
			
			// arg1: a tag id, arg2: input id
			function setATagClick( arg1, arg2 )
			{
				if ( $(arg1).text().trim() == '사용 불가' )
				{
					$(arg1).css('color', 'blue').html('');
					$(arg2).val('').focus();
				}
				else
				{
					$(arg2).attr('readonly', 'readonly');
					$(arg1).text('');
					checkSignIn.addCount();
					if ( $(arg2).attr('id') == 'ssn' )
						$(arg2).attr('type', 'password');
				}
				
			}
			
			
			function addressValidate( arg1 )
			{
				if ( $(arg1).val().trim().length == 0 )
				{
					$(arg1).val('').focus();
					alert('나머지 주소를 입력해 주세요');
					return false;
				}
				
				return true;
			}
			
			
			$(function(){
				checkSignIn = new CheckSignIn();
				$('button, input, a').hover(function(){
					$(this).tooltip('show');
				});
				
				$('#nameEnter').click(function(){
					
					$('#nameEnter').tooltip('show');
					
					if ( $('#name').attr('readonly') == 'readonly' )
					{
						var isReName = confirm('이름을 다시 입력하시겠습니까?');
						if (isReName)
						{
							$('#name').removeAttr('readonly').val('').focus();
							checkSignIn.minusCount();
						}
					}
					else
					{
						var isNext = nameValidate( $('#name') );
						if (isNext)
						{
							$('#name').attr('readonly', 'readonly');
							checkSignIn.addCount();
						}
					}
				});
				$('#zipcodeEnter').click(function(){
					if ( $('#zipcode').val().trim().length != 0 )
					{
						var isReSearch = confirm('다시 주소 검색을 하시겠습니까?');
						if(isReSearch)
						{
							$('#zipcode').val('');
							$('#address1').val('');
							$('#address2').val('');
							$('#addrEnter').removeAttr('disabled');
							checkSignIn.minusCount();
						}
						
					}
					window.open('zipcode.do','popup', 'width=600, height=285, directories=no, menubar=no, scrollbars=yes, resizable=no, copyhistory=no');
				});
				
				$('#pwdEnter').click(function(){
					if ( $('#pwd').attr('readonly') == 'readonly' )
					{
						var isRePWD = confirm('비밀번호를 다시 작성하시겠습니까?');
						if (isRePWD)
						{
							$('#rePwd').removeAttr('readonly').val('');
							$('#pwd1').removeAttr('readonly').val('').focus();
							$('#pwd').val('');
							checkSignIn.minusCount();
						}
					}
					else
					{
						var result = pwdValidate($('#pwd1'), $('#rePwd'));
						if (result)
						{
							$('#pwd1').attr('readonly', 'readonly');
							$('#rePwd').attr('readonly', 'readonly');
							checkSignIn.addCount();
							$('#email').focus();
						}
					}
				});
				
				$('#idEnter').click(function(){
					if ( $('#id').attr('readonly') == 'readonly' )
					{
						var isReIdSearch = confirm('아이디를 새로 작성하시겠습니까?');
						if ( isReIdSearch )
						{
							$('#id').removeAttr('readonly').val('').focus();
							checkSignIn.minusCount();
						}
					} 
					else
					{
						var result = idValidate( $('#id') );
						
						if (result)
							ajaxCall("signId.do", $('#id'), $('#idMessage') );
					}
				});
				
				$('#ssnEnter').click(function(){
					if ( $('#ssn').attr('readonly') == 'readonly' )
					{
						var isReSSN = confirm('주민번호를 다시 입력 하시겠습니까?');
						if (isReSSN)
						{
							$('#ssn').attr('type', 'text');
							$('#ssn').removeAttr('readonly').val('').focus();
							checkSignIn.minusCount();
						}
					}
					else
					{
						var result = ssnValidate( $('#ssn') );
						if (result)
							ajaxCall( "signSsn.do", $('#ssn'), $('#ssnMessage') );
					}
				});
				
				$('#emailEnter').click(function(){
					if ( $('#email').attr('readonly') == 'readonly' )
					{
						var isReEmail = confirm('이메일을 다시 작성 하시겠습니까?');
						if (isReEmail)
						{
							$('#email').removeAttr('readonly').val('').focus();
							checkSignIn.minusCount();
						}
					}
					else
					{
						var isAjaxCall = emailValidate( $('#email') );
						if (isAjaxCall)
							ajaxCall("signEmail.do", $('#email'), $('#emailMessage'));
					}
				});
				
				$('#phoneEnter').click(function(){
					if ( $('#tel1').attr('readonly') == 'readonly' )
					{
						var isRePhone = confirm('집 전화를 다시 작성 하시겠습니까?');
						if (isRePhone)
						{
							$('#tel2').removeAttr('readonly').val('');
							$('#tel1').removeAttr('readonly').val('');
							$('#localNumber').removeAttr('readonly').val('02').focus();
							checkSignIn.minusCount();
							$('#phone').val('');
						}
					}
					else
					{
						var result = phoneValidate( $('#tel1'), $('#tel2') );
						if (result)
						{
							$('#localNumber').attr('readonly', 'readonly');
							$('#tel1').attr('readonly', 'readonly');
							$('#tel2').attr('readonly', 'readonly');
							checkSignIn.addCount();
							$('#telecom').focus();
						}
					}
				});
				
				$('#cellEnter').click(function(){
					if ( $('#cell1').attr('readonly') == 'readonly' )
					{
						var isRephone = confirm('휴대전화 번호를 다시 작성 하시겠습니까?');
						if (isRephone)
						{
							$('#cell2').removeAttr('readonly').val('');
							$('#cell1').removeAttr('readonly').val('');
							$('#telecom').removeAttr('readonly').val('010').focus();
							checkSignIn.minusCount();
							$('#cellphone').val('');
						}
					}
					else
					{
						var result = phoneValidate( $('#cell1'), $('#cell2') );
						if (result)
						{
							$('#telecom').attr('readonly', 'readonly');
							$('#cell1').attr('readonly', 'readonly');
							$('#cell2').attr('readonly', 'readonly');
							checkSignIn.addCount();
							$('#zipcodeEnter').focus();
							
						}
					}
				});
				
				$('#finish').click(function(){
					if ( checkSignIn.getCount() == 8 )
						$('form').attr('action', 'signInMember.do').attr('method', 'post').submit();
					else
					{
						alert('회원가입 양식을 다 채워주세요.');
						return false;
					}
				});
				
				$('#idMessage').click(function(){
					setATagClick( $('#idMessage'), $('#id') );
				});
				
				$('#ssnMessage').click(function(){
					setATagClick( $('#ssnMessage'), $('#ssn') );
				});
				
				$('#emailMessage').click(function(){
					setATagClick( $('#emailMessage'), $('#email') );
				});
				
				$('#addrEnter').click(function(){
					var result = addressValidate( $('#address2') );
					if (result)
					{
						$('#address2').attr('readonly', 'readonly');
						$('#addrEnter').attr('disabled', 'true');
						checkSignIn.addCount();
					}
				});
				
				$("#datepicker").datepicker({
					showMonthAfterYear: true,
					changeYear: true,
					changeMonth: true,
					showButtonPanel: true,
					yearRange:  "-50:+5", //-5:+5 , 2000:2020
					altFormat:  "yymmdd",
					altField:   "#datepicker", // altFormat 만 사용하면 dd/mm/yyyy로 나옴 함께 써야함
					monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
					monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
					dayNamesMin:   ["일", "월", "화", "수", "목", "금", "토"],
					closeText: '닫기',
					currentText: '오늘',
					prevText: '이전달',
					nextText: '다음달',
					/* yearSuffix: '년', */
					buttonText: '달력',
					showOn: "button", //button: 이미지로 사용 , both : 엘리먼트와 이미지 동시사용
					buttonImage: "assets/img/image/date_button.jpg", //버튼으로 사용할 이미지 경로
					buttonImageOnly: true //이미지만 보이기
				});
				
			});
		</script>
	</body>
</html>