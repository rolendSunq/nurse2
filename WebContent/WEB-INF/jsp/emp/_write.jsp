<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/assets/js/emp/httpRequest.js"></script>
<form method="post" action="emp.do?method=writeup"
	enctype="multipart/form-data" class="form-horizontal" role="form">
	<input type="hidden" name="manager" value="1"> <input
		type="hidden" name="firedate" value="1"> <input type="hidden"
		name="dowork" value="1"> <input type="hidden" name="state"
		size="16" value="0"> <input type="hidden" name="jobno"
		size="16" value="${job.jobno }">
	<div class="row">
	<div class="container">
		<div class="span4">
			<h3 class="text-center"><b>사원등록</b></h3>
		</div>
		<div class="span12">
				<fieldset>
					<legend>입력란</legend>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">아이디</label>
						<div class="col-md-2">
							<input class="form-control"  name="id1"  type="text" value="" >
							<input type="hidden" name="id" id="id">
						</div>
						<button type="button" class="btn btn-primary" id="chbt">중복체크</button>&nbsp;&nbsp;
						<a id="idCheck"></a>
						</div><!-- /form-group -->
						<div class="form-group">
						<label for="birth" class="col-sm-2 control-label">비밀번호</label>
						<div class="col-md-2">
							<input class="form-control" id="rePwd1" name="rePwd1" type="password" value="${board.birthday }" >
						</div>
						<div class="col-md-2">
							<input class="form-control" id="rePwd2" name="rePwd2" type="password" value="${board.birthday }" >
						</div>
						<button type="button" class="btn btn-primary" id="rePwdEnter">비밀번호 확인</button>&nbsp;&nbsp;<a id="pwdCheck"></a>
						<input type="hidden" name="pwd" id="pwd">
						</div><!-- /form-group -->
						
					<div class="form-group">
						<label for="gender" class="col-sm-2 control-label">주민번호</label>
						<div class="col-md-2">
							<input class="form-control" id="ssn1" name="ssn1" type="text" value="" >
						</div>
						<div class="col-md-2">
							<input class="form-control" id="ssn2" name="ssn2" type="password" value="" >
						</div>
						<button type="button" class="btn btn-primary" onclick="qq()">주민번호확인</button>&nbsp;&nbsp;<a id="ssnCheck"></a>
						<input type="hidden" name="ssn" id="ssn">
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="depart" class="col-sm-2 control-label">생일</label>
						<div class="col-md-2">
							<input class="form-control" id="datepicker" name="birthday" type="text" value="" >
						</div>
						</div><!-- /form-group -->
						<div class="form-group">
						<label for="state" class="col-sm-2 control-label">이름</label>
							<div class="col-md-2">
							<input class="form-control"  name="name" type="text" value="" >
						</div>
						</div><!-- /form-group -->
					<div class="form-group">
						<label for="localNumber" class="col-sm-2 control-label">사진</label>
						<div class="col-md-3">
							<input type="file" class="form-control" id="photo" name="photo" >
						</div>
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="hiredate" class="col-sm-2 control-label">이메일</label>
							<div class="col-md-2">
							<input class="form-control"  name="email" type="text" value="" >
						</div>
					</div><!-- /form-control -->
					<div class="form-group">
						<label for="id" class="col-sm-2 control-label">성별</label>
						<div class="col-md-2">
							<select class="form-control" id="sex" name="sex">
								<option value="0">선택</option>
								<option value="1">남자</option>
								<option value="2">여자</option>
							</select>
						</div>
					</div><!-- /form-group -->
						<div class="form-group">
						<label for="zipcode" class="col-sm-2 control-label">우편번호</label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="zipcode" name="zipcode" value="${board.zipcode }"readonly="readonly">
						</div>
						<button type="button" class="btn btn-primary" id="zipcodeEnter" data-toggle="modal" data-target="#myModal">수정</button>
					</div>
					<div class="form-group">
						<label for="address1" class="col-sm-2 control-label">기본주소</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="address1" name="address1" value=""readonly="readonly">
						</div>
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="address2" class="col-sm-2 control-label">상세주소</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="address2" name="address2" value="" readonly="readonly">
						</div>
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="localNumber" class="col-sm-2 control-label">집 전화</label>
						<div class="col-md-3">
							<input type="text" class="form-control" id="phone" name="phone" value="" >
						</div>
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="telecom" class="col-sm-2 control-label">핸드폰</label>
						<div class="col-md-2">
							<select class="form-control" id="telecom" name="telecom">
								<option value="0">선택</option>
								<option value="1">SKT</option>
								<option value="2">KT</option>
								<option value="3">LG</option>
							</select>
						</div>
						<div class="col-md-2">
							<select class="form-control" id="cellphone1" name="cellphone1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="000">...</option>
							</select>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" id="cellphone2" name="cellphone2">
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" id="cellphone3" name="cellphone3">
						</div>
						<input type="hidden" name="cellphone">
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="localNumber" class="col-sm-2 control-label">면허번호</label>
						<div class="col-md-3">
							<input type="text" class="form-control" id="certnum" name="certnum" value="" >
						</div>
						<button type="button" class="btn btn-primary" id="certNum">중복확인</button>&nbsp;&nbsp;<a id="certNumCheck"></a>
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="localNumber" class="col-sm-2 control-label">부서</label>
						<div class="col-md-2">
							<select class="form-control" id="dno" name="dno">
								<option value="0">선택</option>
								<option value="2">간호1팀</option>
								<option value="3">간호2팀</option>
							</select>
						</div>
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="localNumber" class="col-sm-2 control-label">입사일</label>
						<div class="col-md-3">
							<input type="text" class="form-control" id="datepicker1" name="hiredate" value="" >
						</div>
					</div><!-- /form-group -->
					
			</fieldset>
			<div class="text-right">
				<button type="button" class="btn btn-primary"  onclick="writeup()">등록</button>
			</div>
		</div>
	</div>
</div><!-- /row -->

</form>

<script type="text/javascript">
	function certnumValidate( arg1 )
	{
		certnumExp = /^[0-9]{6}$/;
		if ( $(arg1).val().trim().length == 0)
		{
			$(arg1).val('').focus();
			alert('면허번호를 입력하세요.(숫자6자리)');
			return false;
		}
		
		if ( !certnumExp.test($(arg1).val().trim()) )
		{
			$(arg1).val('').focus();
			//alert('면허번호의 형식이 틀립니다.(숫자6자리)');
			$('#certNumCheck').html('면허번호의 형식이 틀립니다.(숫자6자리)');
			return false;
		}
		
		return true;
	}

	$(function() {
		$('#chbt').click(function() {
			var id = $('input[name=id1]').val().trim();
			var param = "id=" + id;
			sendRequest("emp.do", param, idCheck, "POST");
		});
	});

	function idCheck() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				var result = eval("(" + httpRequest.responseText + ")");
				if (result.id == 'N') {
					$('#idCheck').css("color","red").html("존재하는 아이디 입니다");
					$('input[name=id1]').val("").focus();
				} else {
					$('#idCheck').css("color","blue").html("사용가능한 아이디 입니다");
					$('input[name=id]').val($('input[name=id1]').val());
					
				}
			}
		}
	}
	$(function(){
		/*아래 소스 면허번호 중복체크   */
		$('#certNum').click(function() {
			var isGoAjax = certnumValidate( $('input[name=certnum]') );
			if ( isGoAjax ){
				var param = "certnum="+$('input[name=certnum]').val().trim();
				sendRequest("emp.do?method=Cerch", param, certNumCheck, "POST");
			}
		});
	});
	
	
	function certNumCheck() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				var result = eval("(" + httpRequest.responseText + ")");
				if (result.certnum == 'N') {
				//alert("중복되는 번호 입니다");
				$('#certNumCheck').html("중복되는 번호 입니다");
				$('input[name=certnum]').val(" ").focus();
				} else {
					//alert('사용가능한 면허 번호 입니다');
					$('#certNumCheck').html("사용가능한 면허 번호 입니다");
				}
			}
		}
	}
	
	
	$(function() {
		$('#datepicker').datepicker(
				{
					showMonthAfterYear : true,
					changeYear : true,
					showButtonPanel : true,
					yearRange : "-50:+5", //-5:+5 , 2000:2020
					altFormat : "yymmdd",
					altField : "#datepicker", // altFormat 만 사용하면 dd/mm/yyyy로 나옴 함께 써야함
					monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
							"8월", "9월", "10월", "11월", "12월" ],
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
					closeText : '닫기',
					currentText : '오늘',
					prevText : '이전달',
					nextText : '다음달',
					yearSuffix : '년',
					buttonText : '달력',
					showOn : "button", //이미지로 사용 , both : 엘리먼트와 이미지 동시사용
					buttonImage : "assets/img/image/date_button.jpg", //버튼으로 사용할 이미지 경로
					buttonImageOnly : true
				//이미지만 보이기
				});
		
		//datepicker에서 사용한 이미지 버튼 style적용
		$("img.ui-datepicker-trigger").attr("style",
				"margin-left:5px; vertical-align:middle; cursor:pointer;");
		
		$('#datepicker1').datepicker(
				{
					showMonthAfterYear : true,
					changeYear : true,
					showButtonPanel : true,
					yearRange : "-50:+5", //-5:+5 , 2000:2020
					altFormat : "yymmdd",
					altField : "#datepicker1", // altFormat 만 사용하면 dd/mm/yyyy로 나옴 함께 써야함
					monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
							"8월", "9월", "10월", "11월", "12월" ],
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
					closeText : '닫기',
					currentText : '오늘',
					prevText : '이전달',
					nextText : '다음달',
					yearSuffix : '년',
					buttonText : '달력',
					showOn : "button", //이미지로 사용 , both : 엘리먼트와 이미지 동시사용
					buttonImage : "assets/img/image/date_button.jpg", //버튼으로 사용할 이미지 경로
					buttonImageOnly : true
				//이미지만 보이기
				});
		
		//datepicker에서 사용한 이미지 버튼 style적용
		$("img.ui-datepicker1-trigger").attr("style",
				"margin-left:5px; vertical-align:middle; cursor:pointer;");
	});
	function writeup() {
		
		if ($('input[name=id]').val().length == 0) {
			alert('아이디를 입력해주세요');
			$('input[name=id]').focus();
			return;

		}
		if ($('input[name=id1]').val()== 0) {
			alert('아이디를 중복체크해주세요');
			return;

		}
		
		if ($('input[name=pwd]').val().length == 0) {
			alert('Input data of pwd\t');
			$('input[name=pwd]').focus();
			return;
		}
		if ($('input[name=ssn1]').val().length == 0) {
			alert('Input data of firstJumin\t');
			$('input[name=ssn1]').focus();
			return;
		}
		if ($('input[name=ssn2]').val().length == 0) {
			alert('Input data of lastJumin\t');
			$('input[name=ssn2]').focus();
			return;
		}
			
		
		if ($('input[name=birthday]').val().length == 0) {
			alert('Input data of birthday\t');
			$('input[name=birthday]').focus();
			return;
		}
		if ($('input[name=name]').val().length == 0) {
			alert('Input data of name\t');
			$('input[name=name]').focus();
			return;
		}
		if ($('input[name=email]').val().length == 0) {
			alert('Input data of email\t');
			$('input[name=email]').focus();
			return;
		}
		if ($('select[name=sex]').val().length == 0) {
			alert('Input data of sex\t');
			$('input[name=sex]').focus();
			return;
		}
		if ($('input[name=zipcode]').val().length == 0) {
			alert('Input data of zipcode\t');
			$('input[name=zipcode]').focus();
			return;
		}
		if ($('input[name=phone]').val().length == 0) {
			alert('Input data of phone\t');
			$('input[name=phone]').focus();
			return;
		}
		if ($('#cellphone1').val().length == 0) {
			alert('Input data of cellphone1\t');
			$('input[name=cellphone1]').focus();
			return;
		}
		if ($('input[name=cellphone2]').val().length == 0) {
			alert('Input data of cellphone2\t');
			$('input[name=cellphone2]').focus();
			return;
		}
		if ($('input[name=cellphone3]').val().length == 0) {
			alert('Input data of cellphone3\t');
			$('input[name=cellphone3]').focus();
			return;
		}
		if ($('input[name=hiredate]').val().length == 0) {
			alert('Input data of hiredate\t');
			$('input[name=hiredate]').focus();
			return;
		}
		if ($('input[name=certnum]').val().length == 0) {
			alert('Input data of certnum\t');
			$('input[name=certnum]').focus();
			return;
		}

		$('input[name=cellphone]').val(
				$('#cellphone1').val()
						+ $('input[name=cellphone2]').val()
						+ $('input[name=cellphone3]').val());
		alert($('input[name=cellphone]').val());
		
		
		
		$('form').submit();
		
		/* 	if ($('select[name=dno]').val().length == 0) {
		alert('Input data of dno\t');
		return;
	} */
	
	/* if ($('input[name=state]').val().length == 0) {
		alert('Input data of state\t');
		$('input[name=state]').focus();
		return;
	} */
	
	/* if ($('input[name=firedate]').val().length == 0) {
		alert('Input data of firedate\t');
		$('input[name=firedate]').focus();
		return;
	} */

	/* if ($('input[type=checkbox]').val().length == 0) {
		alert('Input data of state\t');
		$('input[name=state]').focus();
		return;
	} */
	}
	
	
	function pwdValidate(){
		
		var pwdNewElement1 = null;
		var pwdNewElement2 = null;
		var passwordExp = /^[0-9]{3,19}$/;
		//패스워드는 숫자로만 시작하고 0~9의 숫자가 4자리에서 18자리까지 입력하면 통과
		
		 if (arguments.length == 2)
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
			
			$('#pwdCheck').html('password validte 통과');
			//ajaxCall(urlVal, paramVal);
			
			$('#pwd').val($(pwdNewElement1).val());
		}
	}
	function qq() {
		var jumin = $('input[name=ssn1]').val() + $('input[name=ssn2]').val();
		if(jumin.length != 13){
		window.alert("입력 길이가 틀립니다.");
		return;
		}
		for(var i=0; i<jumin.length; i++){
		if(isNaN(parseInt(jumin.charAt(i)))){
		window.alert("문자열로 입력할 수 없습니다."); 
		//charAt : 메서드는 지정한 인덱스에 해당하는 문자값을 반환한다.
		//parseInt : 문자열에서 앞부분의 유효한 정수를 추출해 온다.
		//inNaN : 수치가 무효수치인가 유효 수치인가를 판명한다.
		return;
		}  
		}


		var checkbit = new Array(2,3,4,5,6,7,8,9,2,3,4,5);
		var total = 0;
		for(var i=0; i<checkbit.length; i++){
		total += parseInt(jumin.charAt(i))*checkbit[i];
		}
		
		 $('input[name=ssn]').val(
				$('input[name=ssn1]').val() + $('input[name=ssn2]').val()); 
		 $('#ssnCheck').html('주민번호확인완료');
	
	}
	
	
	$(function(){
		$('#zipcodeEnter').click(function(){
			window.open('zipcode.do','popup', 'width=600, height=285, directories=no, menubar=no, scrollbars=yes, resizable=no, copyhistory=no');
		});
		
		$('#rePwdEnter').click(function(){
			pwdValidate( $('#rePwd1'), $('#rePwd2') );
		});
	});
	
	
	
</script>
