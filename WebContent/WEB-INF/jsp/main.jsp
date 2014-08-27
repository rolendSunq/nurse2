<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<link rel="shortcut icon" href="assets/ico/nurse.ico">

		<title>Main Page</title>

		<!-- Bootstrap core CSS -->
		<link href="assets/css/bootstrap.css" rel="stylesheet">
		<link href="assets/css/font-awesome.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link href="assets/css/starter-template.css" rel="stylesheet">
		<c:choose>
		<c:when test="${pageSelecter eq null }">
		<script src="<%=request.getContextPath()%>/assets/js/gridly/jquery-2.0.3.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/gridly/jquery.gridly.js" type="text/javascript"></script>
		<link href="<%=request.getContextPath()%>/assets/css/gridly/jquery.gridly.css" rel="stylesheet" type="text/css">
		<link href='<%=request.getContextPath()%>/assets/css/gridly/sample.css' rel='stylesheet' type='text/css'>
		</c:when>
		<c:otherwise>
		<script src="assets/js/default/jquery-1.10.2.js"></script>
		</c:otherwise>
		</c:choose>
		<link href="<%=request.getContextPath()%>/assets/css/datepicker/jquery-ui-1.10.3.custom.css" rel="stylesheet">
		<script src="<%=request.getContextPath()%>/assets/js/datepicker/jquery-ui-1.10.3.custom.js"></script>
		
		<style type="text/css">
			#ititle{
				font-size:15px;
				font-family: Dotum, Gulim, 'Malgun Gothic' !important;
				color: white;
			}
			#icontent{
				padding-top:10px;padding-bottom:10px;padding-right:10px;padding-left:10px;
				font-size:13px;
				font-family: Dotum, Gulim, 'Malgun Gothic' !important;
			}
			#icontent a:link    {color:black !important;}
			#icontent a:visited {color:black !important;}
			#icontent a:hover   {color:yellow !important;}
			#icontent a:active  {color:orange !important;}
		</style>
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="assets/js/html5shiv.js"></script>
		  <script src="assets/js/respond.min.js"></script>
		<![endif]-->
		
		<!-- main css -->
		
	</head>
	<body>
		<!-- navbar START ================================================== -->
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="goMain.do">Home</a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="emp.do?method=list"><i class=" icon-caret-right"></i> ${pageAuth == '123' ? 'Manage Members' : 'Members' }</a></li>
						<li><a href="calendar.do"><i class="icon-calendar"></i> Schedule</a>
						<li><a href="notice.do?method=list"><i class=" icon-file-text-alt"></i> FreeBoard</a></li>
					</ul>
					<ul class="nav navbar-nav pull-right">
                        <li><a href="emp.do?method=person&jobno=${jobno }"><i class="icon-user"></i> ${name }</a></li>
                        <li><a href="logout.do"><i class="icon-signout text-info"> 로그아웃</i></a></li>
                    </ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
		<!-- navbar END ================================================== -->
		
		<!-- Content Section START ================================================== -->
		<div class="container" id="push">
			<div class="">
			<c:choose>
				<c:when test="${pageSelecter eq null }">
				<!-- gridly Section START ================================================== -->
				
 
	<div class='content'>
      <section class='example'>
        <div class='gridly'>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
            <div id="icontent">
	            <p id="ititle"><b><i class="icon-calendar"></i> Schedule</b></p>
	            <a href="calendar.do">Schedule 보기</a>
            </div>
          </div>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
            <div id="icontent">
	            <p id="ititle"><b><i class="icon-list"></i> 근무리스트</b></p>
	            <a href="calendar.do?method=list">리스트 보기</a>
            </div>
          </div>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
            <div id="icontent">
	            <p id="ititle"><b><i class="icon-bar-chart"></i> 근무통계</b></p>
	            <a href="nakil.do?method=datagraph">통계 보기</a>
            </div>
          </div>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
            <div id="icontent">
	            <p id="ititle"><b><i class="icon-question"></i> 도움말</b></p>
	            <a href="calendar.do?method=manual">도움말 보기</a>
            </div>
          </div>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
            <div id="icontent">
            	<p id="ititle"><b><i class="icon-bullhorn"></i> 공지사항</b></p>
	            <a href="notice.do?method=news">공지사항 보기</a>
	        </div>
          </div>
          <div class='brick large'>
            <a class='delete' href='#'>&times;</a>
            <div id="icontent">
	            <label id="ititle"><b>시계</b></label>
	            <center>
	            <script src="http://widgetprovider.daum.net/view?url=http://widgetcfs1.daum.net/xml/3/widget/2011/01/20/12/10/4d37a7bda279a.xml&&width=166&height=100&widgetId=1048&scrap=1" type="text/javascript"></script>
	            </center>
            </div>
          </div>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
          </div>
          <div class='brick large'>
            <a class='delete' href='#'>&times;</a>
            <div id="icontent">
            	<p id="ititle"><b>날씨</b></p>
            	<center>
				<script src="http://widgetprovider.daum.net/view?url=http://widgetcfs1.daum.net/xml/12/widget/2008/09/23/11/01/48d84de12a690.xml&up_setLocal=108&&width=166&height=80&widgetId=120&scrap=1" type="text/javascript"></script>
				</center>
	        </div>
          </div>

          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
          </div>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
          </div>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
          </div>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
          </div>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
          </div>
        </div>
      </section>
    </div>
    			<script type="text/javascript">
					$(function(){
						$('.gridly').gridly({
							    base: 60, // px 
							    gutter: 20, // px
							    columns: 10
						});
					});
				</script>
    
				<!-- gridly Section END ================================================== -->
				</c:when>
				<c:when test="${pageSelecter == 1 }">
					<c:import url="emp/_list.jsp"/>
				</c:when>
				<c:when test="${pageSelecter == 2 }">
					<c:import url="emp/_edit.jsp"/>
				</c:when>
				<c:when test="${pageSelecter == 3 }">
					<c:import url="emp/_write.jsp"/>
				</c:when>
				<c:when test="${pageSelecter == 4 }">
					<c:import url="emp/_view.jsp"/>
				</c:when>
				<c:when test="${pageSelecter == 5 }">
					<c:import url="notice/_list.jsp"/>
				</c:when>
				<c:when test="${pageSelecter == 6 }">
					<c:import url="notice/_write.jsp"/>
				</c:when>
				<c:when test="${pageSelecter == 7 }">
					<c:import url="notice/_news.jsp"/>
				</c:when>
				<c:when test="${pageSelecter == 8 }">
					<c:import url="notice/_edit.jsp"/>
				</c:when>
				<c:when test="${pageSelecter == 9 }">
					<c:import url="notice/_append.jsp"/>
				</c:when>
				<c:when test="${pageSelecter == 10 }">
					<c:import url="schedule/_calendar.jsp"/>
				</c:when>
				<c:when test="${pageSelecter == 11 }">
					<c:import url="notice/_view.jsp"/>
				</c:when>
				<c:when test="${pageSelecter == 12 }">
					<c:import url="emp/personInfo.jsp"/>
				</c:when>	
				<c:when test="${pageSelecter == 13 }">
					<c:import url="schedule/_caltable.jsp"/>
				</c:when>
				<c:when test="${pageSelecter == 14 }">
					<c:import url="datagraph/datagraph1.jsp"/>
				</c:when>	
				<c:when test="${pageSelecter == 15 }">
					<c:import url="schedule/_calmanual.jsp"/>
				</c:when>
			</c:choose>
			</div>
		</div><!-- /.container -->
		
		<!-- Footer Section START ================================================== -->
		<div id="footer">
			<div class="container">
				<p class="muted credit" style="font-size:12px;font-family: Dotum, Gulim, 'Malgun Gothic' !important;">All Contents Copyleft 2013 KH정보교육원 424기 4조(송석원, 최창인, 최낙일, 이진우, 김규형, 심성규)</p>
				<p class="muted credit" style="font-size:12px;font-family: Dotum, Gulim, 'Malgun Gothic' !important;">Save Your Mavericks! Thanks Himan!</p>
			</div>
		</div>
		<!-- Bootstrap core JavaScript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
		

	</body>
</html>
