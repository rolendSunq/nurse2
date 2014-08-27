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
		<input type="checkbox" name="chAll"> ��� ��ġ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</td>
</tr>
<tr>
	<td>
		<div id="title01"><label>1. �������� �Է�</label></div>
	</td>
</tr>
<tr>
	<td>
		<div id="content01">
			<table>
				<tr>
					<td><img alt="" src="assets/img/schedule/001.jpg" align="top"></td>
					<td  style="padding:10px; font-size:14px;" valign="top">
					- �� ��忡�� �۾��� ���ϴ� ������ ���콺 <br>
					�巡�� �Ͽ� �����ϸ� �ߴ� â�Դϴ�.<br><br>
					
					- �ٹ��ð�: <br>
					&nbsp;&nbsp;&nbsp;&nbsp;Dy(���� 7:00~15:00),<br>
					&nbsp;&nbsp;&nbsp;&nbsp;Ev(���� 15:00~22:00),<br>
					&nbsp;&nbsp;&nbsp;&nbsp;Ng(�߰� 22:00~���� 07:00)
					</td>
				</tr>
			</table>
		</div>
	</td>
</tr>
<tr>
	<td>
		<div id="title02"><label>2. ������ ����</label></div>
	</td>
</tr>
<tr>
	<td>
		<div id="content02">
			<table>
				<tr>
					<td><img alt="" src="assets/img/schedule/002.jpg" align="top"></td>
					<td  style="padding:10px;" valign="top">
					- Ķ���� �������� Ŭ���ϸ� �������� ���� <br>
					�� �� �ֽ��ϴ�.<br><br></td>
				</tr>
			</table>
		</div>
	</td>
</tr>
<tr>
	<td>
		<div id="title03"><label>3. �ٹ��ð� ����</label></div>
	</td>
</tr>
<tr>
	<td>
		<div id="content03">
			<table>
				<tr>
					<td><img alt="" src="assets/img/schedule/003.jpg" align="top"></td>
					<td  style="padding:10px;" valign="top">
					- �⺻ �ٹ�����(����,����,�߰�) �ܿ� <br>
					�����Է��� �����ϸ� �ð��� ���� <br>
					�� �� ������ ��迡�� ������ �ʽ��ϴ�.</td>
				</tr>
			</table>
		</div>
	</td>
</tr>
<tr>
	<td>
		<div id="title04"><label>4. ���� ����</label></div>
	</td>
</tr>
<tr>
	<td>
		<div id="content04">
			<table>
				<tr>
					<td><img alt="" src="assets/img/schedule/004.jpg" align="top"></td>
					<td  style="padding:10px;" valign="top">
					- �⺻ �ٹ������� ������ �� �ܿ� �ٸ� <br>
					������ ���� �� �� �ֽ��ϴ�.</td>
				</tr>
			</table>
		</div>
	</td>
</tr>
<tr>
	<td>
		<div id="title05"><label>5. ������ 2���� ����(����)</label></div>
	</td>
</tr>
<tr>
	<td>
		<div id="content05">
			<table>
				<tr>
					<td><img alt="" src="assets/img/schedule/005.jpg" align="top"></td>
					<td  style="padding:10px;" valign="top">
					- �⺻ �ٹ������� �⺻������ ���� ���ҵǼ� ó���˴ϴ�.<br><br>
					- ���� ������ ����ϱ� ���ؼ��� �ٹ����ÿ��� �����Է���<br>
					�����ϰ� time slice�� üũ���� ���� ���¿���<br>
					����ϸ� �˴ϴ�.</td>
				</tr>
			</table>
		</div>
	</td>
</tr>
<tr>
	<td>
		<div id="title06"><label>6. ��(week) ���</label></div>
	</td>
</tr>
<tr>
	<td>
		<div id="content06">
			<table>
				<tr>
					<td><img alt="" src="assets/img/schedule/006.jpg" align="top"></td>
					<td  style="padding:10px;" valign="top">
					- ��/�� ��忡�� ��� �� Ȯ���� �����մϴ�.<br><br>
					- �Ķ����� �����Է�(time slice üũ �� ��)���� ����Ͽ�<br>
					������ ����̾����� ǥ�� �˴ϴ�.
					</td>
				</tr>
			</table>
		</div>
	</td>
</tr>
<tr>
	<td>
		<div id="title07"><label>7. ������ �ٹ����� ����Ʈ</label></div>
	</td>
</tr>
<tr>
	<td>
		<div id="content07">
			<table>
				<tr>
					<td><img alt="" src="assets/img/schedule/007.jpg" align="top"></td>
					<td  style="padding:10px;" valign="top">
					- ������ �ٹ����� ����Ʈ���� ���ڸ� �����ϸ�<br>
					�ٷ� �ش� ������ Ķ���� ���������� �̵��˴ϴ�.<br><br>
					- �� �κ��� Ŭ���ϸ� Ķ���� ����ȭ������ �̵��մϴ�.</td>
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
    <li><a href="calendar.do?method=list">������ ��������</a></li>
    <li><a href="nakil.do?method=datagraph">�ٹ���躸��</a></li>
    <li class="active"><a href="#">����</a></li>
  </ul>
</div>

</body>
</html>