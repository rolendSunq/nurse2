<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>User's guide</title>

<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/default/jquery-1.10.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/sidr/jquery.sidr.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/sidr/jquery.sidr.dark.css">
<style type="text/css">
	body {
		margin-top: 40px;
		text-align: left;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	}

	#box {
		width:800px;
		border-radius: 4px;
		box-shadow:
				    0 2px 2px rgba(0,0,0,0.2),        
				    0 1px 5px rgba(0,0,0,0.2),        
				    0 0 0 12px rgba(200,200,255,0.4);
	}
	
</style>
<script type="text/javascript">
	$(function(){
		$('#title01').click(function(){$('#content01').slideToggle('slow',function(){});});
		$('#title02').click(function(){$('#content02').slideToggle('slow',function(){});});
		$('#title03').click(function(){$('#content03').slideToggle('slow',function(){});});
		$('#title04').click(function(){$('#content04').slideToggle('slow',function(){});});
		$('#title05').click(function(){$('#content05').slideToggle('slow',function(){});});
		$('#title06').click(function(){$('#content06').slideToggle('slow',function(){});});
		$('#title07').click(function(){$('#content07').slideToggle('slow',function(){});});
		$('div[id^=c]').slideToggle('fast',function(){});
		$('input[name=chAll]').click(function(){
			if($('input[name=chAll]').is(':checked')){
				$('#box div[id^=c]').filter(function(){
					if($(this).is(':hidden')){
						return true;
					} else {
						return false;
					}
				}).slideToggle('slow',function(){});
			} else {
				$('#box div[id^=c]').filter(function(){
					if($(this).is(':hidden')){
						return false;
					} else {
						return true;
					}
				}).slideToggle('slow',function(){});
			}
		});
		
		$('#simple-menu').sidr();
	});
</script>
</head>
<body>
<img src="assets/img/schedule/menu120.gif"/>
<a id="simple-menu" href="#sidr">Toggle Menu</a>&nbsp;&nbsp;&nbsp;
<br><br>
<div id="box">
<table>
	<tr>
		<td style="padding:10px;">

<table width="800px" style="table-layout:fixed; word-break:break-all;">
<tr>
	<td align="right">
		<input type="checkbox" name="chAll"> 모두 펼치기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</td>
</tr>
<tr>
	<td>
		<div id="title01"><label>1. 일정정보 입력</label></div>
	</td>
</tr>
<tr>
	<td>
		<div id="content01">
			<table>
				<tr>
					<td><img alt="" src="assets/img/schedule/001.jpg" align="top"></td>
					<td  style="padding:10px; font-size:14px;" valign="top">
					- 월 모드에서 작업을 원하는 일정을 마우스 <br>
					드래그 하여 선택하면 뜨는 창입니다.<br><br>
					
					- 근무시간: <br>
					&nbsp;&nbsp;&nbsp;&nbsp;Dy(오전 7:00~15:00),<br>
					&nbsp;&nbsp;&nbsp;&nbsp;Ev(오후 15:00~22:00),<br>
					&nbsp;&nbsp;&nbsp;&nbsp;Ng(야간 22:00~익일 07:00)
					</td>
				</tr>
			</table>
		</div>
	</td>
</tr>
<tr>
	<td>
		<div id="title02"><label>2. 종료일 변경</label></div>
	</td>
</tr>
<tr>
	<td>
		<div id="content02">
			<table>
				<tr>
					<td><img alt="" src="assets/img/schedule/002.jpg" align="top"></td>
					<td  style="padding:10px;" valign="top">
					- 캘린더 아이콘을 클릭하면 종료일을 변경 <br>
					할 수 있습니다.<br><br></td>
				</tr>
			</table>
		</div>
	</td>
</tr>
<tr>
	<td>
		<div id="title03"><label>3. 근무시간 변경</label></div>
	</td>
</tr>
<tr>
	<td>
		<div id="content03">
			<table>
				<tr>
					<td><img alt="" src="assets/img/schedule/003.jpg" align="top"></td>
					<td  style="padding:10px;" valign="top">
					- 기본 근무유형(오전,오후,야간) 외에 <br>
					직접입력을 선택하면 시간을 변경 <br>
					할 수 있으나 통계에는 잡히지 않습니다.</td>
				</tr>
			</table>
		</div>
	</td>
</tr>
<tr>
	<td>
		<div id="title04"><label>4. 배경색 변경</label></div>
	</td>
</tr>
<tr>
	<td>
		<div id="content04">
			<table>
				<tr>
					<td><img alt="" src="assets/img/schedule/004.jpg" align="top"></td>
					<td  style="padding:10px;" valign="top">
					- 기본 근무유형에 정해진 색 외에 다른 <br>
					색으로 변경 할 수 있습니다.</td>
				</tr>
			</table>
		</div>
	</td>
</tr>
<tr>
	<td>
		<div id="title05"><label>5. 일정의 2가지 패턴(유형)</label></div>
	</td>
</tr>
<tr>
	<td>
		<div id="content05">
			<table>
				<tr>
					<td><img alt="" src="assets/img/schedule/005.jpg" align="top"></td>
					<td  style="padding:10px;" valign="top">
					- 기본 근무유형은 기본적으로 매일 분할되서 처리됩니다.<br><br>
					- 전일 업무를 등록하기 위해서는 근무선택에서 직접입력을<br>
					선택하고 time slice를 체크하지 않은 상태에서<br>
					등록하면 됩니다.</td>
				</tr>
			</table>
		</div>
	</td>
</tr>
<tr>
	<td>
		<div id="title06"><label>6. 주(week) 모드</label></div>
	</td>
</tr>
<tr>
	<td>
		<div id="content06">
			<table>
				<tr>
					<td><img alt="" src="assets/img/schedule/006.jpg" align="top"></td>
					<td  style="padding:10px;" valign="top">
					- 주/일 모드에서 등록 및 확인이 가능합니다.<br><br>
					- 파란색은 직접입력(time slice 체크 안 함)으로 등록하여<br>
					일정이 계속이어져서 표시 됩니다.
					</td>
				</tr>
			</table>
		</div>
	</td>
</tr>
<tr>
	<td>
		<div id="title07"><label>7. 직원별 근무일정 리스트</label></div>
	</td>
</tr>
<tr>
	<td>
		<div id="content07">
			<table>
				<tr>
					<td><img alt="" src="assets/img/schedule/007.jpg" align="top"></td>
					<td  style="padding:10px;" valign="top">
					- 직원별 근무일정 리스트에서 날자를 선택하면<br>
					바로 해당 날자의 캘린더 일정정보로 이동됩니다.<br><br>
					- 월 부분을 클릭하면 캘린더 정보화면으로 이동합니다.</td>
				</tr>
			</table>
		</div>
	</td>
</tr>
</table>

		</td>
	</tr>
</table>
</div>
<br><br><br>

<div id="sidr">
  <!-- Your content -->
  <ul>
    <li><a href="calendar.do?method=month">Schedule</a></li>
    <li><a href="calendar.do?method=list">직원별 일정관리</a></li>
    <li><a href="nakil.do?method=datagraph">근무통계보기</a></li>
    <li class="active"><a href="#">도움말</a></li>
  </ul>
</div>

</body>
</html>