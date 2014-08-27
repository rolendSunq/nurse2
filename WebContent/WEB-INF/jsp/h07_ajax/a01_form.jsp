<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/view/a00_js/httpRequest.js"></script>
<script src="<%=request.getContextPath() %>/view/a00_js/jquery-1.7.js"></script>

<script type="text/javascript">
	$(function(){
		$('input[type=button]').click(function(){
				var id=$('input[name=id]').val();
				var pwd=$('input[name=pwd]').val();
			var param="id="+encodeURIComponent(id);
					param+="&pwd="+pwd;
			 sendRequest("json1.do", param, displayResult, "POST"); 
		});
	});
	function displayResult(){
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
				var result=eval("("+httpRequest.responseText+")");
				alert(result.id);
				if(result.id=='N'){
					$('#idfont').html("없는 id입니다");
				}else{
					$('#idfont').html("로그인성공!!");
				}
				if(result.pwd=='N'){
					$('#pwdfont').html("pwd가 맞지 않습니다");
				}else{
					$('#pwdfont').html("로그인 성공!!");
				}
			}
		}
	}
		function change(){
			var sel=$('select').val();
			
		var param1="sel="+sel;
		 sendRequest("json1.do", param1, tableResult, "POST"); 
	}
		function tableResult(){
			var showData="";
			if(httpRequest.readyState==4){
				if(httpRequest.status==200){
					alert('제이커리 작동중');
					var ta=eval("("+httpRequest.responseText+")");
					alert(ta.time);
					showData="<tr><td>"+ta.time+"</td><td>"+ta.contents+"</td>";
					showData+="<td>"+ta.together+"</td></tr>";
					}
				$('#tab').append(showData);
				}
			}
		
		
</script>
</head>
<body>
<h3>json start!!</h3>

ID:<input type="text" name="id" value=""><font id="idfont"></font><br>
PWD:<input type="password" name="pwd" value=""><font id="pwdfont"></font><br>
<input type="button" value="서버 json dataloading!!">

<div id="jsonData">

</div>
<h3>주말일정 check!!</h3>
<form action="json1.do" method="post">
<select id="sel" onchange="change()">
	<option value="0">열공모드</option>
	<option value="1">여행모드</option>
	<option value="2">놀자모드</option>
</select>
</form>
<div>
<table id="tab">
	<tr>
		<td>시간</td>
		<td>내용</td>
		<td>놀자모드 </td>
	</tr>
</table>
</div>
</body>
</html>