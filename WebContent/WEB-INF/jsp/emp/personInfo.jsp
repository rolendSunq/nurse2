<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row">
	<div class="container">
		<div class="span4">
			<h3 class="text-center"><b>개인 정보</b></h3>
		</div>
		<div class="span12">
			<form class="form-horizontal" role="form">
				<fieldset>
					<legend>기본 정보</legend>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">이름</label>
						<div class="col-md-3">
							<label for="name" class="col-sm-4 control-label">${board.name }</label>
						</div>
						</div><!-- /form-group -->
						<div class="form-group">
						<label for="birth" class="col-sm-2 control-label">생년월일</label>
						<div class="col-md-2">
							<input class="form-control" id="datepicker" name="birthday" type="text" value="${board.birthday }" readonly="readonly">
						</div>
						<!-- <button type="button" class="btn btn-primary" id="birthEnter"><i class="icon-calendar"></i>&nbsp;</button> -->
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="gender" class="col-sm-2 control-label">성별</label>
						<div class="col-md-3">
							<!-- <div class="radio-inline">
								<label>
									<input type="radio" name="sex" value="1" id="sex1">남
								</label>
							</div>
							<div class="radio-inline">
								<label>
									<input type="radio" name="sex" value="2" id="sex2">여
								</label>
							</div> -->
							<label class="col-sm-3 control-label">${board.sex eq '1' ? '남' : '여'  }</label>
						</div>
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="depart" class="col-sm-2 control-label">부서</label>
						<div class="col-md-3">
							<!-- <select class="form-control" name="depart" id="depart">
								<option value="간호실">간호실</option>
								<optgroup label="팀">
									<option value="간호1팀">간호1팀</option>
									<option value="간호2팀">간호2팀</option>
								</optgroup>
							</select> -->
							<label class="col-sm-4 control-label">${board.dno eq '2' ? '간호1팀' : '간호2팀'  }</label>
						</div>
						</div><!-- /form-group -->
						<div class="form-group">
						<label for="state" class="col-sm-2 control-label">직급</label>
						<div class="col-md-4">
							<!-- <select class="form-control" name="state" id="state">
								<option value="수간호사">수간호사</option>
								<optgroup label="1팀">
									<option value="1팀장">1팀장</option>
									<option value="1팀원">1팀원</option>
								</optgroup>
								<optgroup label="2팀">
									<option value="2팀장">2팀장</option>
									<option value="2팀원">2팀원</option>
								</optgroup>
							</select> -->
							<label class="col-sm-3 control-label">${board.state}</label>
						</div>
						</div><!-- /form-group -->
					
					<div class="form-group">
						<label for="hiredate" class="col-sm-2 control-label">입사일</label>
						<div class="col-md-3">
							<!-- <input type="text" class="form-control" id="hiredate" name="hiredate" value="" readonly="readonly"> -->
							<label class="col-sm-4 control-label">${board.hiredate}</label>
						</div>
						<!-- <button type="button" class="btn btn-primary" id="hireEnter"><i class="icon-calendar"></i>&nbsp;</button> -->
					</div><!-- /form-control -->
				</fieldset>
				<fieldset>
					<legend>사진</legend>
					<div class="bs-example">
						<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
								<li data-target="#carousel-example-generic" data-slide-to="1"></li>
								<li data-target="#carousel-example-generic" data-slide-to="2"></li>
							</ol>
						    <div class="carousel-inner">
								<div class="item active">
									<img data-src="holder.js/900x500/auto/#777:#555/text:First slide" alt="First slide">
								</div>
								<div class="item">
									<img data-src="holder.js/900x500/auto/#666:#444/text:Second slide" alt="Second slide">
								</div>
								<div class="item">
									<img data-src="holder.js/900x500/auto/#555:#333/text:Third slide" alt="Third slide">
								</div>
						    </div>
							<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
							  	<span class="glyphicon glyphicon-chevron-left"></span>
							</a>
							<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
							  	<span class="glyphicon-chevron-right"></span>
							</a>
						</div>
					</div><!-- /carousel -->
				</fieldset>
				<fieldset>
					<legend>필수 입력 정보</legend>
					<div class="form-group">
						<label for="id" class="col-sm-2 control-label">아이디</label>
						<div class="col-md-2">
							<label class="col-sm-2 control-label" id="id">${board.id }</label>
						</div>
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="ssn" class="col-sm-2 control-label">주민번호</label>
						<div class="col-md-3">
							<label id="ssn"></label>
						</div>
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="hiredate" class="col-sm-2 control-label">비밀번호 설정</label>
						<div class="col-md-3">
							<input type="password" class="form-control" id="pwd1" name="pwd1" placeholder="기존 비빌번호 입력">
						</div>
						<button type="button" class="btn btn-primary" id="pwdEnter">확인</button>
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="hiredate" class="col-sm-2 control-label"></label>
						<div class="col-md-3">
							<input type="password" class="form-control" id="rePwd1" name="rePwd1" placeholder="새로운 비빌번호 입력" readonly="readonly">
						</div>

					</div>
					<div class="form-group">
						<label for="hiredate" class="col-sm-2 control-label"></label>
						<div class="col-md-3">
							<input type="password" class="form-control" id="rePwd2" name="rePwd2" placeholder="새로운 비빌번호 재입력" readonly="readonly">
						</div>
						<button type="button" class="btn btn-primary" id="rePwdEnter">확인</button>
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="newEmail" class="col-sm-2 control-label">EMAIL</label>
						<div class="col-md-3">
							<input type="text" class="form-control" id="newEmail" name="newEmail" placeholder="새로운 Email 입력">
						</div>
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="reEmail" class="col-sm-2 control-label"></label>
						<div class="col-md-3">
							<input type="text" class="form-control" id="reEmail" name="reEmail" placeholder="새로운 Email 재입력">
						</div>
						<button type="button" class="btn btn-primary" id="emailEnter">확인</button>
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="localNumber" class="col-sm-2 control-label">집 전화</label>
						<div class="col-md-2">
							<select class="form-control" id="localNumber" name="localNumber">
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
							<input type="text" class="form-control" id="tel1" name="tel1">
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" id="tel2" name="tel2">
						</div>
						<button type="button" class="btn btn-primary" id="telEnter">수정</button>
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="telecom" class="col-sm-2 control-label">Cell Phone</label>
						<div class="col-md-2">
							<select class="form-control" id="telecom" name="telecom">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" id="cell1" name="cell1">
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" id="cell2" name="cell2">
						</div>
						<button type="button" class="btn btn-primary" id="cellEnter">수정</button>
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="zipcode" class="col-sm-2 control-label">우편번호</label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="zipcode" name="zipcode" value="${board.zipcode }"readonly="readonly">
						</div>
						<button type="button" class="btn btn-primary" id="zipcodeEnter" data-toggle="modal" data-target="#myModal">수정</button>
					</div>
					<div class="form-group">
						<label for="address1" class="col-sm-2 control-label">주소1</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="address1" name="address1" value="${board.address1 }"readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label for="address2" class="col-sm-2 control-label">주소2</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="address2" name="address2" value="${board.address2 }" readonly="readonly">
						</div>
						<button type="button" class="btn btn-primary" id="addrEnter">확인</button>
					</div>
			</fieldset>
			<legend></legend>
			<div class="text-right">
				<button type="button" class="btn btn-primary" id="finish">수정완료</button>
			</div>
			<input type="hidden" id="phone" name="phone">
			<input type="hidden" id="cellphone" name="cellphone">
		  </form>
		</div>
	</div>
</div><!-- /row -->
<script type="text/javascript">
	// 패스워드 입력값 검사
	function pwdValidate(){
		var pwdOriElement = null;
		var pwdNewElement1 = null;
		var pwdNewElement2 = null;
		var passwordExp = /^.*(?=.{4,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		//패스워드는 숫자로만 시작하고 0~9의 숫자가 4자리에서 20자리까지 입력하면 통과
		if (arguments.length == 1)
		{
			pwdOriElement = arguments[0];
			if ( $(pwdOriElement).val().trim().length == 0 )
			{
				$(pwdOriElement).val('').focus();
				alert('비밀번호를 입력하세요.');
				return false;
			}
			
			if ( !passwordExp.test( $(pwdOriElement).val().trim() ) )
			{
				$(pwdOriElement).val('').focus();
				alert('패스워드 형식이 맞지 않습니다.');
				return false;
			}
			
			ajaxCall('personPwdCheck.do', $('#pwd1'));
			
		}
		else if (arguments.length == 2)
		{
			pwdNewElement1 = arguments[0];
			pwdNewElement2 = arguments[1];
			
			if ( $(pwdNewElement1).val().trim().length == 0 && $(pwdNewElement2).val().trim().length == 0 )
			{
				$(pwdNewElement2).val('');
				$(pwdNewElement1).val('').focus();
				alert('비밀번호를 입력하세요.');
				return false;
			}
			
			if ( $(pwdNewElement1).val().trim().length == 0 )
			{
				$(pwdOriElement).val('').focus();
				alert('비밀번호를 입력하세요.');
				return false;
			}
			
			if ( $(pwdNewElement2).val().trim().length == 0 )
			{
				$(pwdOriElement).val('').focus();
				alert('비밀번호를 입력하세요.');
				return false;
			}
			
			if ( !passwordExp.test( $(pwdNewElement1).val().trim() ) || !passwordExp.test( $(pwdNewElement2).val().trim() ) )
			{
				$(pwdNewElement2).val('');
				$(pwdNewElement1).val('').focus();
				alert('패스워드 형식이 맞지 않습니다.');
				return false;
			}
			
			if ( ($(pwdNewElement1).val().trim()).toLowerCase() !== ($(pwdNewElement2).val().trim()).toLowerCase() )
			{
				$(pwdNewElement2).val('');
				$(pwdNewElement1).val('').focus();
				alert('패스워드가 일치하지 않습니다.');
				return false;
			}
			ajaxCall('personPwdUpdate.do', $('#pwd1'), $('#rePwd1'));
		}
	}
	
	// Email 입력값 검사
	function emailValidate( arg1, arg2)
	{
		var element1 = arg1;
		var element2 = arg2;
		var emailExp = /^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if ( $(element1).val().trim().length == 0 )
		{
			$(element1).val('').focus();
			alert('Email을 입력하세요.');
			return false;
		}
		
		if ( $(element2).val().trim().length == 0 )
		{
			$(element2).val('').focus();
			alert('Email을 입력하세요.');
			return false;
		}
		
		if ( $(element1).val().trim().length == 0 && $(element2).val().trim().length == 0 )
		{
			$(element2).val('');
			$(element1).val('').focus();
			alert('Email을 입력하세요.');
			return false;
		}
		
		if ( !emailExp.test( $(element1).val().trim() ) || !emailExp.test( $(element2).val().trim() ) )
		{
			$(element2).val('');
			$(element1).val('').focus();
			alert('Email 형식이 맞지 않습니다.');
			return false;
		}
		
		if ( ($(element1).val().trim()).toLowerCase() !== ($(element2).val().trim()).toLowerCase() )
		{
			$(element2).val('');
			$(element1).val('').focus();
			alert('Email이 일치하지 않습니다.');
			return false;
		}
		ajaxCall('personEmailUpdate.do', $('#newEmail'));
		
	}
	
	// 집 전화, 휴대폰 validate
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
			ajaxCall('personPhoneModify.do', $('#phone'));

		}
		else if ( idElement == 'cell1' )
		{
			var cellValue = $('#telecom').val() + '-' + $(element1).val() + '-' + $(element2).val();
			$('#cellphone').val(cellValue);
			ajaxCall('personCellPhoneModify.do', $('#cellphone'));
		}
	}
	
	// 주소 입력값 검사
	function addressValidate()
	{
		if ($(arguments[0]).val().trim().length == 0)
		{
			$(aruments[0]).val('').focus();
			alert('나머지 주소를 입력하세요.');
			return false;
		}
		else
			ajaxCall('personAddressModify.do', $('#zipcode'), $('#address1'), $('#address2'));
	}
	
	function ajaxCall(){
		var urlValue = arguments[0];
		var argLength = arguments.length;
		var elementValue = $(arguments[1]).attr('id');
		var value1 = $(arguments[1]).val();
		var value2 = $(arguments[2]).val();
		var value3 = $(arguments[3]).val();
		if (argLength == 3)
			params = { id: '${board.id}', pwd: value1, rePwd: value2 };
		if (argLength == 2)
			params = { id: '${board.id}', pwd: value1 };
		if (argLength == 2 && elementValue == 'newEmail')
			params = { id: '${board.id}', email: value1 };
		if (argLength == 2 && elementValue == 'phone')
			params = { id: '${board.id}', phone: value1 };
		if (argLength == 2 && elementValue == 'cellphone')
			params = { id: '${board.id}', cellphone: value1 };
		if (argLength == 4)
			params = { id: '${board.id}', zipcode: value1, address1: value2, address2: value3 };
		
		$.ajax({      
			type:"POST",  
			url:urlValue,      
			data:params,      
			success:function(args){   
				var jsonParams = JSON.parse(args);
				
				if (jsonParams.sendMessage == 1 && argLength == 3)
				{
					$('#rePwd1').attr('readonly', 'readonly').val('');
					$('#rePwd2').attr('readonly', 'readonly').val('');
					$('#rePwdEnter').attr('disabled', true);
					alert("패스워드를 변경하였습니다.");
					$('#newEmail').focus();
				}
				else if ( jsonParams.sendMessage == 0 && argLength == 3 )
					alert('패스워드가 맞지 않습니다.');
				
				if ( jsonParams.sendMessage == 1 && argLength == 2 && elementValue == 'rePwd1')
				{
					$('#rePwd2').removeAttr('readonly').val('');
					$('#rePwd1').removeAttr('readonly').val('').focus();
					$('#pwdEnter').attr('disabled', 'true');
					$('#pwd1').attr('readonly', 'readonly');
					alert('확인 완료');
				}
				else if ( jsonParams.sendMessage == 0 && argLength == 2 && elementValue == 'rePwd1')
					alert('패스워드가 맞지 않습니다.');
				
				if ( jsonParams.sendMessage == 1 && elementValue == 'newEmail' )
				{
					$('#newEmail').attr('readonly', 'readonly');
					$('#reEmail').attr('readonly', 'readonly');
					$('#emailEnter').attr('disabled', true);
					alert('수정 완료.');
				}
				else if ( jsonParams.sendMessage == 0 && elementValue == 'newEmail' )
					alert('Email 등록 실패');
				
				if ( jsonParams.sendMessage == 1 && elementValue == 'phone')
				{
					$('#localNumber').attr('readonly', 'readonly');
					$('#tel1').attr('readonly', 'readonly');
					$('#tel2').attr('readonly', 'readonly');
					$('#telEnter').attr('disabled', true);
					alert('수정 완료.');
				}
				else if ( jsonParams.sendMessage == 0 && elementValue == 'phone')
					alert('수정 오류.');
				if ( jsonParams.sendMessage == 1 && elementValue == 'cellphone')
				{
					$('#telecom').attr('readonly', 'readonly');
					$('#cell1').attr('readonly', 'readonly');
					$('#cell2').attr('readonly', 'readonly');
					$('#cellEnter').attr('disabled', true);
					alert('수정 완료.');
				}
				else if ( jsonParams.sendMessage == 0 && elementValue == 'cellphone')
					alert('수정 오류.');
				
				if ( jsonParams.sendMessage == 1 && argLength == 4)
				{
					$('#address2').attr('readonly', 'readonly');
					$('#addrEnter').attr('disabled', true);
					alert('수정 완료.');
				}
				else if ( jsonParams.sendMessge == 0 && argLength == 4)
					alert('수정 오류.');
			},  
			//beforeSend:showRequest,  
			error:function(e){  
				alert(e.responseText);  
			}  
		});  
	}
	
	$(function(){
		// carousel Loading
		$('.carousel').carousel();
		//핸드폰 화면 뿌리기
		var cellp = "${board.cellphone}";
		var si 	  = cellp.split("-");
		$('#telecom').val(si[0]);
		$('#cell1').val(si[1]);
		$('#cell2').val(si[2]);
		//일반전화 뿌리기
		var phone = "${board.phone}";
		var si1   = phone.split("-");
		$('#localNumber').val(si1[0]);
		$('#tel1').val(si1[1]);
		$('#tel2').val(si1[2]);
		//주민 처리 가운데 구분자 넣기
		var ssn = "${board.ssn}";
		var ss	= ssn.substring(0,6)+"-"+ssn.substring(6,12);
		$('#ssn').html(ss);	
			
		var  sex = "${board.sex}";
		if(sex==1){
			$('#sex1').attr("checked","checked");
		}else{
			$('#sex2').attr("checked","checked");
		}
		
		$('#zipcodeEnter').click(function(){
			window.open('zipcode.do','popup', 'width=600, height=285, directories=no, menubar=no, scrollbars=yes, resizable=no, copyhistory=no');
		});
		
		$('#pwdEnter').click(function(){
			pwdValidate($('#pwd1'));
		});
		
		$('#rePwdEnter').click(function(){
			pwdValidate( $('#rePwd1'), $('#rePwd2') );
		});
		
		$('#emailEnter').click(function(){
			emailValidate( $('#newEmail'), $('#reEmail') );
		});
		
		$('#telEnter').click(function(){
			phoneValidate( $('#tel1'), $('#tel2'));
		});
		
		$('#cellEnter').click(function(){
			phoneValidate( $('#cell1'), $('#cell2'));
		});
		
		$('#addrEnter').click(function(){
			addressValidate( $('#address2') );
		});
		
		$('#finish').click(function(){
			$('form').attr('action', 'goMain.do').submit();
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
			showOn: "button", //이미지로 사용 , both : 엘리먼트와 이미지 동시사용
			buttonImage: "assets/img/image/date_button.jpg", // 버튼으로 사용할 이미지 경로
			buttonImageOnly: false //이미지만 보이기
		});
	});
</script>