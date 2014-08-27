<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/slide/slide.css">
<!-- <script src="slide/jquery-1.5.1.min.js"></script> -->
<script src="<%=request.getContextPath() %>/assets/js/default/jquery-1.10.2.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/slide/slides.min.jquery.js"/></script>
<script>
	$(function() {
		var startSlide = 2;
		$('#slides2').slides({
			container : 'slide',
			pagination : true,
			generatePagination : true,
			paginationClass : 'page',
			start : 1,
			effect : 'slide',
			slideSpeed : 500,
			play : 2000,
			pause : 0,
			start : startSlide
		});
	});
</script>
</head>
<body>
<div style="padding:20px 0 0 20px">

	<div id="slides2" class="slides2">
	
		<a href="#" class="prev">Prev</a> <a href="#" class="next">Next</a>
		<ul class="slide">
			<li><a href="#"><img src="<%=request.getContextPath() %>/assets/img/slide/_words1.jpg" width="500" height="312" alt="1"></a></li>
			<li><a href="#"><img src="<%=request.getContextPath() %>/assets/img/slide/_words2.jpg" width="500" height="312" alt="2"></a></li>
			<li><a href="#"><img src="<%=request.getContextPath() %>/assets/img/slide/_words3.jpg" width="500" height="312" alt="3"></a></li>
			<li><a href="#"><img src="<%=request.getContextPath() %>/assets/img/slide/_words4.jpg" width="500" height="312" alt="4"></a></li>
		</ul>
	</div>
	
</div>
</body>
</html>