<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
		<style type="text/css">
			.center-table
			{
			  margin: 0 auto !important;
			  float: none !important;
			}
			.modal-backdrop 
			{background-color: white;}
		</style>
	</head>
	<body>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="false" id="closeBtn">&times;</button>
						<h4 class="modal-title text-center" id="myModalLabel">우편번호</h4>
					</div>
					<div class="modal-body">
						<div class="container">
							<form id="dongForm" method="post">
								<div class="form-group">
									<table class="center-table">
										<tr>
											<td> 동 이름 </td>
											<td>
												<div class="col-md-3">
													<input type="text" class="form-control" name="dong" id="dong" style="width:200px;">
												</div>
											</td>
											<td>
												<button type="button" id="dongBtn" class="btn btn-primary"><i class="icon-search"></i> 검색</button>
											</td>
										</tr>
										<tr>
											<c:if test="${check eq 'yes' }">
											<td>
												<p class="text-danger text-center"></p>
											</td>
											</c:if>
										</tr>
									</table>
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
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" id="zipClose">닫기</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		<script src="assets/js/jquery.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			function dongValidate( arg1 )
			{
				dongExp = /^[가-힣]{2,9}$/;
				var element = arg1;
				if ( $(element).val().trim().length == 0 )
				{
					$(element).val('').focus();
					alert('동 이름을 입력하세요');
					return false;
				}
				
				if ( !dongExp.test($(element).val().trim()) )
				{
					$(element).val('').focus();
					alert('동 이름이 알맞지 않습니다.');
					return false;
				}
				
				return true;
			}
		
			function sendAddress(zipcode, sido, gugun, dong, ri, bunji) {
				var address = sido +" "+ gugun +" "+ dong +" "+ ri +" "+ bunji;
				var noDashZipcode = zipcode.split('-');
				alert(noDashZipcode[0] + noDashZipcode[1]);
				$("#zipcode", opener.document).val(noDashZipcode[0] + noDashZipcode[1]);
				$("#address1", opener.document).val(address);
				$("#address2", opener.document).removeAttr('readonly').focus();
				window.close();
			}
			$(document).ready(function(){
				$('#myModal').modal('show');
				$('#dongBtn').click(function(){
					var goSubmit = dongValidate( $('#dong') );
					if ( goSubmit )
						$('form').attr('action', 'zipcode.do').attr('method', 'post').submit();
				});
				
				$('#zipClose, #closeBtn').click(function(){
					window.close();
				});
			});
		</script>
	</body>
</html>