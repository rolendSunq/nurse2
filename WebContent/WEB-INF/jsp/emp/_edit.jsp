<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
	<div class="container">
		<div class="span4">
			<h3 class="text-center"><b>개인 정보</b></h3>
		</div>
		<div class="span12">
			 <form class="form-horizontal" role="form" method="post" action="emp.do?method=editup" enctype="multipart/form-data" id="frm1">
				<fieldset>
					<legend>기본 정보</legend>
					<input type="hidden" name="jobno" value="${board.jobno }">
					<div class="form-group">
						<div class="col-md-4">
							<label for="name" class="col-sm-4 control-label">이름</label>
							<label for="name" class="col-sm-5 control-label">${board.name
								}</label>
							<label for="name" class="col-sm-4 control-label">성별</label>
							<c:if test="${board.sex==1 }">
								<label for="sex" class="col-sm-5 control-label">남성 </label>
							</c:if>
							<c:if test="${board.sex==2 }">
								<label for="sex" class="col-sm-5 control-label">여성 </label>
							</c:if>	
							<label for="birth" class="col-sm-4 control-label">생년월일</label>
						<label for="birth" class="col-sm-5 control-label">	
						<input type="text" class="form-control" value="${board.birthday}" id="datepicker" name="birthday"></label>
						</div>
						<div class="" align="right">
							<label for="photo" class="col-sm-5 control-label"><img id="photo"
							src="<%=request.getContextPath() %>/photo/${board.photo}" width="200" height="200"/>
							</label>
							<label for="photo" class="col-sm-2 control-label">사진변경</label>
							<label for="photo" class="col-sm-3 control-label">
							<input type="file" class="form-control" name="photo">
							<input type="hidden" class="form-control" name="photo" value="${board.photo}">
							</label>
							
						</div>
					</div>
					</fieldset>
					<fieldset> 
					 <legend>부서 정보</legend>			
					<div class="form-group">
						<label for="depart" class="col-sm-2 control-label">부서</label>
						<%-- <input type="hidden" class="form-control" name="dno" value="${board.dno}">
						<input type="hidden" class="form-control" name="state" value="${board.state}"> --%>
						<div class="col-md-2">
							<select class="form-control" name="dno">
									<option value="1">간호1팀</option>
									<option value="2">간호2팀</option>
							</select>
							
						</div>
						<label for="state" class="col-sm-2 control-label">직급</label>
						<div class="col-md-2">
							<select class="form-control" name="state" id="state">
									<option value="팀장">팀장</option>
									<option value="팀원">팀원</option>
							</select>
							
						</div>
					</div><!-- /form-control -->
					<div class="form-group">
						<label for="hiredate" class="col-sm-2 control-label">입사일</label>
						<div class="col-md-4">
							<label for="birth" class="col-sm-5 control-label">	
							<input type="text" class="form-control" value="${board.hiredate}" id="datepicker2" name="hiredate"></label>
						</div>
						<!-- <button type="button" class="btn btn-primary" id="datepicker"><i class="icon-calendar"></i>&nbsp;</button> -->
					</div><!-- /form-control -->
				</fieldset>
				<fieldset>
					<legend>필수 입력 정보</legend>
					<div class="form-group">
						<label for="id" class="col-sm-2 control-label">아이디</label>
						<div class="col-md-5">
							<label class="col-sm-2 control-label" id="id">${board.id }</label>
						</div>
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="ssn" class="col-sm-2 control-label">주민번호</label>
						<div class="col-md-3">
							<label id="ssn">${board.ssn }</label>
						</div>
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="hiredate" class="col-sm-2 control-label">비밀번호 설정</label>
						<div class="col-md-3">
							<input type="password" class="form-control" id="pwd1" name="pwd1" placeholder="기존 비빌번호 입력">
						</div>
						<button type="button" class="btn btn-primary" id="pwdEnter">확인</button>
					</div>
					<div class="form-group">
						<label for="hiredate" class="col-sm-2 control-label"></label>
						<div class="col-md-3">
							<input type="password" class="form-control" id="rePwd1" name="rePwd1" placeholder="새로운 비빌번호 입력" readonly="readonly">
						</div>

					</div>
					<div class="form-group">
						<label for="hiredate" class="col-sm-2 control-label"></label>
						<div class="col-md-3">
							<input type="password" class="form-control" id="rePwd2" name="pwd" placeholder="새로운 비빌번호 재입력" readonly="readonly">
						</div>
						<button type="button" class="btn btn-primary" id="rePwdEnter">확인</button>
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="newEmail" class="col-sm-2 control-label">EMAIL</label>
						<div class="col-md-3">
							<input type="email" class="form-control" id="newEmail" name="email" value="${board.email }">
						</div>
					</div><!-- /form-group -->
<!-- 					<div class="form-group">
						<label for="reEmail" class="col-sm-2 control-label"></label>
						<div class="col-md-3">
							<input type="email" class="form-control" id="reEmail" name="reEmail" placeholder="새로운 Email 재입력">
						</div>
						<button type="button" class="btn btn-primary" id="emailEnter">중복검사</button>
					</div>/form-group -->
					<div class="form-group">
						<label for="localNumber" class="col-sm-2 control-label">집 전화</label>
						<div class="col-md-2">
							<select class="form-control" id="localNumber" name="phone1">
								<option value="02">02</option>
								<option value="032">031</option>
								<option value="032">032</option>
								<option value="000">지역 번호 추가 할 것!</option>
							</select>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" id="tel1" name="phone2">
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" id="tel2" name="phone3">
						</div>
						<input type="hidden" name="phone" size="16" value="${board.phone }">
						<!-- <button type="button" class="btn btn-primary" id="telEnter">확인</button> -->
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="telecom" class="col-sm-2 control-label">Cell Phone</label>
						<div class="col-md-2">
							<select class="form-control" id="telecom" name="cellphone1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="011">017</option>
								<option value="011">019</option>
								<option value="000">...</option>
							</select>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" id="cell1" name="cellphone2">
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" id="cell2" name="cellphone3">
						</div>
						<input type="hidden" name="cellphone" size="5" maxlength="5" value="${board.cellphone }">
						<!-- <button type="button" class="btn btn-primary" id="cellEnter">확인</button> -->
					</div><!-- /form-group -->
					<div class="form-group">
						<label for="zipcode" class="col-sm-2 control-label">우편번호</label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="zipcode" name="zipcode" value="${board.zipcode }"> - 없이 입력
						</div>
						<!-- <button type="button" class="btn btn-primary" id="zipcodeEnter" data-toggle="modal" data-target="#myModal">수정</button> -->
					</div>
					<div class="form-group">
						<label for="address1" class="col-sm-2 control-label">주소1</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="address1" name="address1" value="${board.address1 }">
						</div>
					</div>
					<div class="form-group">
						<label for="address2" class="col-sm-2 control-label">주소2</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="address2" name="address2" value="${board.address2 }" >
						</div>
					<!-- 	<button type="button" class="btn btn-primary" id="addrEnter">확인</button> -->
					</div>
			</fieldset>
			<legend></legend>
			<div class="text-right">
				<button type="button" class="btn btn-primary" id="finish" onclick="editUpArticle()">수정완료</button>
			</div>
			</form>
		</div>
	</div>
</div><!-- /row -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">우편번호</h4>
			</div>
			<div class="modal-body">
				<form id="dongForm" method="post">
					<div class="form-inline text-center">
						동 이름: <input type="text" class="form-control" name="dong" id="dong" style="width:200px;">
						<button type="button" id="dongBtn" class="btn btn-primary"><i class="icon-search"></i> 검색</button>
						<c:if test="${check eq 'yes' }">
						<p class="text-danger text-center">${fieldErrors.dong }</p>
						</c:if>
					</div>
					<input type="hidden" id="check" name="check" value="yes">
				</form>
				<c:if test="${check eq 'yes' }">
					<c:if test="${result eq 0 }">
					<div class="text-center">
						<p class="text-danger text-center">검색 된 결과가 없습니다 .</p>
					</div>
					</c:if>
					<c:if test="${result eq 1 }">
					<div class="text-center">
						<p class="text-center">※ 아래 우편 번호를 클릭하면 자동으로 입력됩니다.</p>
					</div>
					<div>
						<c:forEach var="zipcodeVO" items="${zipcodeList }">
						<div>
							<a href="javascript:sendAddress('${zipcodeVO.zipcode }', '${zipcodeVO.sido }',	'${zipcodeVO.gugun }', '${zipcodeVO.dong }', '${zipcodeVO.ri }', '${zipcodeVO.bunji }')">
								${zipcodeVO.zipcode }&nbsp;${zipcodeVO.sido }&nbsp;	${zipcodeVO.gugun }&nbsp;${zipcodeVO.dong }&nbsp;${zipcodeVO.ri }&nbsp;${zipcodeVO.bunji }
							</a>
						</div>
						</c:forEach>
					</div>
					</c:if>
				</c:if>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary">적용</button>
			</div>

		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
$(function(){
	var tot=$('input[name=cellphone]').val();
	var si=[];
	   si=tot.split("-");
	  $('select[name=cellphone1]').val(si[0]);
	  $('input[name=cellphone2]').val(si[1]);
	  $('input[name=cellphone3]').val(si[2]);
	
		var tot1=$('input[name=phone]').val();
		var si1=[];
		   si1=tot1.split("-");
		  $('select[name=phone1]').val(si1[0]);
		  $('input[name=phone2]').val(si1[1]);
		  $('input[name=phone3]').val(si1[2]);

	});
	function goToList(){
	document.location.href="emp.do?method=list&articlePerPage=${board.articlePerPage}&currentPage=${board.currentPage}";
	}
	function editUpArticle(){
				var tot=$('select[name=cellphone1]').val()+"-"+$('input[name=cellphone2]').val()+"-"+$('input[name=cellphone3]').val();
				$('input[name=cellphone]').val(tot);
				var tot1=$('select[name=phone1]').val()+"-"+$('input[name=phone2]').val()+"-"+$('input[name=phone3]').val();
				$('input[name=phone]').val(tot1);
				$('#frm1').attr("action","emp.do?method=editup").submit();
			}
	$(function(){
		var cellp= ${board.cellphone};
		alert(cellp);
	});
	function pwdValidate(){
		var pwdOriElement = null;
		var pwdNewElement1 = null;
		var pwdNewElement2 = null;
		var passwordExp = /^[0-9]{3,19}$/;
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
			
			alert('password validte 통과');
			//ajaxCall(urlVal, paramVal);
			$('#pwd1').attr('readonly', 'readonly');
			$('#pwdEnter').attr('disabled', 'true');
			$('#rePwd1').removeAttr('readonly');
			$('#rePwd2').removeAttr('readonly');
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
			
			alert('password validte 통과');
			//ajaxCall(urlVal, paramVal);
			$('#rePwdEnter').attr('disabled', 'true');
			$('#rePwd1').attr('readonly', 'readonly');
			$('#rePwd2').attr('readonly', 'readonly');
		}
	}
	
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
		//ajaxCall(urlVal, paramVal);
		alert('emailValidate 성공');
		$(element1).attr('readonly', 'readonly');
		$(element2).attr('readonly', 'readonly');
		$('#emailEnter').attr('disabled', true);
	}
	function ajaxCall(urlVal, paramVal){
		var url = urlVal;  
		var params = paramVal;
		  
		$.ajax({      
			type:"POST",  
			url:url,      
			data:params,      
			success:function(args){   
				alert(args);      
			},   
			//beforeSend:showRequest,  
			error:function(e){  
				alert(e.responseText);  
			}  
		});  
	}
	
	$(function(){
		$('#zipcodeEnter').click(function(){
			$('#myModal').modal('show');
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
	});
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
	});
	$(function() {
		$('#datepicker2').datepicker(
				{
					showMonthAfterYear : true,
					changeYear : true,
					showButtonPanel : true,
					yearRange : "-50:+5", //-5:+5 , 2000:2020
					altFormat : "yymmdd",
					altField : "#datepicker2", // altFormat 만 사용하면 dd/mm/yyyy로 나옴 함께 써야함
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
	});
</script>