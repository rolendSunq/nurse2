<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> 날짜 입력 </title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <link href="<%=request.getContextPath()%>/assets/css/datepicker/jquery-ui-1.10.3.custom.css" rel="stylesheet" />
	<script src="<%=request.getContextPath()%>/assets/js/datepicker/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/datepicker/jquery-ui-1.10.3.custom.js"></script>
    <script>
    $(document).ready(function () {
    	//$("#date1").datepicker({ minDate: new Date(2012, 7 - 1, 8), maxDate: new Date(2012, 7 - 1, 28) });
    	//$("#date2").datepicker({ minDate: new Date(2012, 7 - 1, 9), maxDate: //new Date(2012, 7 - 1, 28) });
    	$("#date1").datepicker({ altFormat:  "yymmdd",
            altField:   "#date1" });
    	$("#date2").datepicker({ altFormat:  "yymmdd",
            altField:   "#date2" });
    	    
    	$('#date1, #date2').datepicker({onSelect: function(dateStr) {
    	      var d1 = $('#date1').datepicker('getDate');
    	      var d2 = $('#date2').datepicker('getDate');
    	      var diff = 0;
    	      if (d1 && d2) {
    	            diff = Math.floor((d2.getTime() - d1.getTime()) / 86400000); // ms per day
    	      }
    	      $('#calculated').val(diff);
    	}
    	});
    	
   });
</script>
<body>
<input type="text" id="date1">
<input type="text" id="date2">
<input type="text" id="calculated">

</body> 
</html>


