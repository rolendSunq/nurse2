<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/view/a00_js/httpRequest.js"></script>
<script src="<%=request.getContextPath() %>/view/a00_js/jquery-1.7.js"></script>
<script type="text/javascript">
	$(function() {
		$('input[type=button]').click(function() {
			var params = "empno="+$('input[name=empno]').val();
			// 서버에 query String 값으로 넘겨줄때, 한글 처리 ...
			params +="&ename="+encodeURIComponent($('input[name=ename]').val()); 
			params +="&job="+$('input[name=job]').val(); 
			$('input[name=deptnos]').each(function(){
				params+="&deptnos="+$(this).val();
			});
			alert(params);
			$.post("json4.do", params, function(data){
				var list=eval("("+data+")");
				alert(list.length);
				  var showstr="";
				for(var idx=0;idx<list.length;idx++){
					showstr+="<tr>"+"<td>";
					showstr+=list[idx].empno+"</td>"+"<td>";
					showstr+=decodeURI(list[idx].ename)+"</td>"+"<td>";
					showstr+=list[idx].job+"</td>"+"<td>";
					showstr+=list[idx].deptno+"</td>"+"</tr>";
				}
				$('#treeData').append(showstr);  
			});
			
		});
	});
</script>
</head>
<body>
	<center>
	<h2>Emp List</h2>
		empno:<input type="text" name="empno" ><br>
		ename:<input type="text" name="ename" ><br>
		job:<input type="text" name="job" ><br>
	deptno:     <input type="text" name="deptnos" >
					<input type="text" name="deptnos" >
					<input type="text" name="deptnos" ><br>
				<input type="button" value="조회">
	<table	id="treeData" border="1">
	</table>
</center>
</body>
</html>