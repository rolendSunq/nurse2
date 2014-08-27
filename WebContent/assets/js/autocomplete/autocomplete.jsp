<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Autocomplete Demo</title>
<link href="<%=request.getContextPath() %>/assets/css/autocomplete/ui-lightness/jquery-ui-1.10.3.custom.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/assets/js/default/jquery-1.10.2.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/autocomplete/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/autocomplete/httpRequest.js"></script>
<style type="text/css">
	body {
		font: 62.5% "Trebuchet MS", sans-serif;
		margin: 50px;
	}
	.demoHeaders {
		margin-top: 2em;
	}
	#dialog-link {
		padding: .4em 1em .4em 20px;
		text-decoration: none;
		position: relative;
	}
	#dialog-link span.ui-icon {
		margin: 0 5px 0 0;
		position: absolute;
		left: .2em;
		top: 50%;
		margin-top: -8px;
	}
	#icons {
		margin: 0;
		padding: 0;
	}
	#icons li {
		margin: 2px;
		position: relative;
		padding: 4px 0;
		cursor: pointer;
		float: left;
		list-style: none;
	}
	#icons span.ui-icon {
		float: left;
		margin: 0 4px;
	}
	.fakewindowcontain .ui-widget-overlay {
		position: absolute;
	}
</style>

<script type="text/javascript">

	function call(url){
		if($('input[name=schWord]').val().length>1){
			sendKeyword(url);
		}
	}
	
	function sendKeyword(url){
		// 제이쿼리 ui에서 자체적으로 2자 이상일 때 작동 하는 듯, 가끔 한 글자 일 때 작동을 하기도 함. 일관성의 부재!!
		if($('input[name=schWord]').val().length>1){
			getAjaxData(url);
		}
	}
	
	function getAjaxData(url,target) {
		var keyword = $('input[name=schWord]').val();
		var params = "keyword=" + encodeURIComponent(keyword);
		if(target=="search"){
			//TODO: 데이타베이스 접근하여 해당하는 업무를 처리 할 것
			alert("TODO: 데이타베이스 접근하여 해당하는 업무를 처리 할 것");
		} else {
			sendRequest(url, params, displayAjaxResult, "POST");
		}
	}
	
	function displayAjaxResult() {
		//alert(httpRequest.readyState+":"+httpRequest.status);
		if (httpRequest.readyState == 4 && httpRequest.status == 200) {
			var temp = httpRequest.responseText;
			var availableTags = temp.split(",");
			$( "#autocomplete" ).autocomplete({
				source: availableTags
			});
		} else {
			//TODO: 예외처리
		}
	}
	
</script>
</head>
<body>
<center>

<form name="search">
<!-- Autocomplete -->
<h2 class="demoHeaders">Autocomplete</h2>
<div>
	<input id="autocomplete" type="text" name="schWord" placeholder="Search Here" onkeyup="call('getData.jsp','');">
	<input type="button" value="Search" onclick="getAjaxData('getData.jsp','search')">
</div>
</form>

</center>
</body>
</html>