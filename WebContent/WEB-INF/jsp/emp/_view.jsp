<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <div class="row">
	<div class="container">
		<div class="span4">
			<h3 class="text-center">
				<b>사원 정보</b>
			</h3>
			
		</div>
		
		<div class="span12">
		<!-- 	<form class="form-horizontal" role="form"> -->
				<fieldset>
					<legend>기본 정보</legend>
					
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
							<label for="birthday" class="col-sm-5 control-label">${board.birthday}</label>

						</div>
						<div class="col-md-4" >
							<label for="photo" class="col-sm-5 control-label"><img id="photo"
							src="<%=request.getContextPath() %>/photo/${board.photo}" width="200" height="200"/></label>
						</div>
					</div>
					
				</fieldset>
				<fieldset>
					<legend>부서 정보</legend>
					<div class="form-group">	
						<div class="col-md-5">
						<label for="dno" class="col-sm-4 control-label">부서</label>
						<div class="col-md-4">
							<select class="form-control" id="dno" name="dno">
								<option value="0">선택</option>
								<option value="2">간호1팀</option>
								<option value="3">간호2팀</option>
							</select>
						</div>
						</div>
						<div class="col-md-6">
						<label for="state" class="col-sm-2">직급</label>	
						<div class="col-md-3">	
						<select class="form-control" id="state" name="state">
								<option value="0">선택</option>
								<option value="1">팀장</option>
								<option value="2">팀원</option>
							</select>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-5">
							<label for="hiredate" class="col-sm-4 control-label">입사일</label>						
							<div class="col-md-4">
							<input type="text" class="form-control" id="datepicker1" name="hiredate" value="" >
						</div>
						</div>
						<div class="col-md-5">
						 	<label for="firedate" class="col-sm-4 control-label">퇴사여부</label>
							<c:if test="${board.firedate!=null}">
								<label for=firedate class="col-sm-5 control-label">${board.firedate}</label>
							</c:if>
							<c:if test="${board.firedate==null}">
								<label for=firedate class="col-sm-6 control-label">재직중</label>
							</c:if>
						</div>
						<div class="col-md-4">
						<button type="button" class="btn btn-primary" id="firedate">퇴사처리</button>&nbsp;&nbsp;<input type="hidden" name="firedate" id="fireDateNumCheck">
						<a id="fireDateNumCheck1"></a>
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>기타 정보</legend>
					<div class="form-group">
						
						<div class="col-md-5">
							<label for="cellphone" class="col-sm-4 control-label">H.P</label>
							<label for=cellphone class="col-sm-8 control-label">${board.cellphone}</label>
							</div>
						<div class="col-md-5">	
							<label for="phone" class="col-sm-4 control-label">전화번호</label>
							<label for=phone class="col-sm-8 control-label">${board.phone}</label>
							</div>
						</div>
					<div class="form-group">
						<div class="col-md-5">
						<label for="email" class="col-sm-4 control-label">email</label>
						<label for=email class="col-sm-8 control-label">${board.email}</label>
						</div>
						<div class="col-md-5">
						<label for="zipcode" class="col-sm-4 control-label">우편번호</label>
						<label for=zipcode class="col-sm-8 control-label">${board.zipcode}</label>
						</div>
					</div>
					<div class="form-group">	
					<div class="col-md-5">
						<label for="address" class="col-sm-4 control-label">주소</label>
						<label for="address1" class="col-sm-8 control-label">${board.address1} -</label>
					</div>
					<div class="col-md-5">
						<label for="address2" class="col-sm-8 control-label"> ${board.address2}</label>
					</div>
					</div>
				</fieldset>
				<fieldset>
				<legend></legend>
				<div class="col-md-5" >
				<c:if test="${jobno==board.jobno || jobno==1}">
					<a href="javascript:editArticle('${board.jobno }');"><i class="icon-edit"></i> 수정</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>  
					<a href="javascript:goToList();"><i class="icon-list"></i> 목록</a>
				</div>
				</fieldset>
		<!-- 	</form> -->
		</div>
	</div>
</div>





<script type="text/javascript">
	$(function() {

		var telecom = $('#telecom').html();
		if (telecom == 1) {
			$('#telecom').html("SK");
		}
		if (telecom == 2) {
			$('#telecom').html("KT");
		}
		if (telecom == 3) {
			$('#telecom').html("LG");
		}

		var dno = $('#dno').html();
		if (dno == 1) {
			$('#dno').html("간호실");
		}
		if (dno == 2) {
			$('#dno').html("간호1팀");
		}
		if (dno == 3) {
			$('#dno').html("간호2팀");
		}

		var state = $('#state').html();
		if (state == 1) {
			$('#state').html("수간호사");
		}
		if (state == 2) {
			$('#state').html("간호사");
		}

		var sex = $('#sex').html();
		if (sex == 1) {
			$('#sex').html("남자");
		}
		if (state == 2) {
			$('#sex').html("여자");
		}

		var dowork = $('#dowork').html();
		if (dowork == 1) {
			$('#dowork').html("재직중");
		}
		if (dowork == 2) {
			$('#dowork').html("퇴사");
		}

		var auth1 = $('#auth1').html();
		if (auth1 == 1) {
			$('#auth1').html("간호사관리");
		}
		if (auth1 == 2) {
			$('#auth1').html("스케줄관리");
		}
		if (auth1 == 3) {
			$('#auth1').html("게시판관리");
		}
		if (auth1 == 12) {
			$('#auth1').html("간호사관리,스케줄관리");
		}
		if (auth1 == 13) {
			$('#auth1').html("간호사관리,게시판관리");
		}
		if (auth1 == 23) {
			$('#auth1').html("스케줄관리,게시판관리");
		}
		if (auth1 == 123) {
			$('#auth1').html("간호사관리,스케줄관리,게시판관리");
		}

	});
	$(function(){
		$('#fireDateNumCheck').datepicker(
				{
					showMonthAfterYear : true,
					changeYear : true,
					showButtonPanel : true,
					yearRange : "-50:+5", //-5:+5 , 2000:2020
					altFormat : "yymmdd",
					altField : "#fireDateNumCheck", // altFormat 만 사용하면 dd/mm/yyyy로 나옴 함께 써야함
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
		$("img.ui-fireDateNumCheck-trigger").attr("style",
				"margin-left:5px; vertical-align:middle; cursor:pointer;");
		
	});
	function deleteArticle(no) {
		if (confirm("Do you really want to delete?\t")) {
			var pass = prompt("Password and Enter: ");
			if (pass.length <= 0) {
				alert("Password needed!\t");
				return;
			}
			if (pass == '${board.pwd}') {
				document.location.href = "emp.do?method=delete&articlePerPage=${board.articlePerPage}&currentPage=${board.currentPage}&jobno="
						+ no + "&pwd=" + pwd + "";
			} else {
				alert("Password doesn't match!\t");
			}
		}
	}

	function goToList() {
		document.location.href = "emp.do?method=list&articlePerPage=${board.articlePerPage}&currentPage=${board.currentPage}";
	}

	function editArticle(no, pwd) {

		/* 		if(confirm("Do you want to update?\t")){
		 var pass = prompt("Password and Enter: ");
		 if(pass.length<=0){
		 alert("Password needed!\t");
		 return;
		 }
		 if(pass=='${board.pwd}'){ */
		document.location.href = "emp.do?method=edit&articlePerPage=${board.articlePerPage}&currentPage=${board.currentPage}&jobno="
				+ no + "&pwd=${board.pwd}";

		/* 		} else {
					alert("Password doesn't match!\t");
				}
			} */
	}
	$('#firedate').click(function(){
		if($('#fireDateNumCheck').val()==0){
			$('#fireDateNumCheck').attr('type','text');
			$('#firedate').html("퇴사Go");
		}else{
		var firedate =	$('#fireDateNumCheck').val().trim();
		var param ="firedate="+firedate;
		sendRequest("emp.do", param, fireCheck, "POST");
		}
		
	});
	$('#fireDateNumCheck').click(function(){
		
		var id = $('input[name=firedate]').val().trim();
		
		var param = "id=" + id;
		sendRequest("emp.do", param, fireCheck, "POST");
		
		
		$('#fireDateNumCheck').html('퇴사되었습니다');
	});

	function fireCheck() {
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
	function appendArticle(no) {

		document.location.href = "board.do?method=append&articlePerPage=${board.articlePerPage}&currentPage=${board.currentPage}&num="
				+ no + "";
	}
	
</script>