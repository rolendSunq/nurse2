<%@page import="nurse.schedule.vo.ScheduleTable"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>

<link href="<%=request.getContextPath() %>/assets/css/table/simpletable.css" rel="stylesheet" />
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/default/jquery-1.10.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/sidr/jquery.sidr.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/sidr/jquery.sidr.dark.css">
<style type="text/css">
	#eventColor1{
		color:#ff0dff;
	}
	#eventColor2{
		color:#5bcc14;
	}
	#eventColor3{
		color:#f78225;
	}
</style>
<script type="text/javascript">
$(function() {
		/* For zebra striping */
        $("table tr:nth-child(odd)").addClass("odd-row");
		/* For cell text alignment */
		$("table td:first-child, table th:first-child").addClass("first");
		/* For removing the last border */
		$("table td:last-child, table th:last-child").addClass("last");
		
		$('#navigation a').stop().animate({'marginLeft':'-85px'},1000);
        $('#navigation > li').hover(
            function () {
                $('a',$(this)).stop().animate({'marginLeft':'-2px'},200);
            },
            function () {
                $('a',$(this)).stop().animate({'marginLeft':'-85px'},200);
            }
        );
        
        $('#simple-menu').sidr();
        
});
</script>

<%
	String paramYear=null;
	String paramMonth=null;
	
	if(request.getAttribute("y")!=null){
		paramYear=(String)request.getAttribute("y");
	}
	if(request.getAttribute("m")!=null){
		paramMonth=(String)request.getAttribute("m");
	}
	
	Calendar calendar = Calendar.getInstance();
	
	int year=0;
	int month=0;
	if(paramYear!=null){
		year = Integer.parseInt(paramYear);
	} else {
		year = calendar.get(Calendar.YEAR);
	}
	if(paramMonth!=null){
		month = Integer.parseInt(paramMonth)-1;
	} else {
		month = calendar.get(Calendar.MONTH);
	}

	calendar.set(year, month, 1);
	int lastDay = calendar.getActualMaximum(Calendar.DATE);
	
	month+=1;
	request.setAttribute("year", year);
	request.setAttribute("month", month);
	request.setAttribute("lastDay", lastDay);
	
	int preYear=0;
	int preMonth=0;
	int nextYear=0;
	int nextMonth=0;
	if(month==1){
		preYear=year-1;
		preMonth=12;
		nextYear=year;
		nextMonth=month+1;
	} else if(month==12){
		preYear=year;
		preMonth=month-1;
		nextYear=year+1;
		nextMonth=1;
	} else {
		preYear=year;
		preMonth=month-1;
		nextYear=year;
		nextMonth=month+1;
	}
	request.setAttribute("preYear", preYear);
	request.setAttribute("preMonth", preMonth);
	request.setAttribute("nextYear", nextYear);
	request.setAttribute("nextMonth", nextMonth);
	
%>

<br>
<div>
	<img src="assets/img/schedule/menu120.gif"/>
	<a id="simple-menu" href="#sidr">Toggle Menu</a>&nbsp;&nbsp;&nbsp;
	<h4>
	
		<b>
		<a href="calendar.do?method=list&y=${preYear }&m=${preMonth }">&lsaquo;&lsaquo;</a>&nbsp;
		<label style="font-size:30px;">${year }년 
		<a href="calendar.do?method=month&y=${year }&m=${month }">${month }</a>월
		</label>&nbsp;
		<a href="calendar.do?method=list&y=${nextYear }&m=${nextMonth }">&rsaquo;&rsaquo;</a>
		</b>
		
	</h4>
</div>

<table class="zebra">
	<tr>
		<th>name&nbsp;&nbsp;</th>
		<c:forEach begin="1" end="${lastDay }" step="1" varStatus="status">
		<th width="20px"><a href="calendar.do?method=day&y=${year }&m=${month }&d=${status.index }"><c:out value="${status.index }"/></a></th>
		</c:forEach>
	</tr>
	<c:set var="idx" value="01"></c:set>
	<c:forEach var="st" items="${stList }">
	<tr>
		<td style="border-right:1px solid #ccc;">
		<a href="calendar.do?jobno=${st.jobno }">${st.title }</a></td>
		<%
		for(int idx=1;idx<=lastDay;idx++){
			String sidx=""+idx;
			sidx=sidx.length()==1?"0"+sidx:sidx;
			request.setAttribute("sidx", sidx);
		%>
		<%
			if(idx%5==0){
		%>
		<td style="border-right:1px solid #ccc;">
		<%
			} else {
		%>
		<td>
		<%
			}
		%>
			<c:if test="${st.dayMap[sidx]=='Dy' }"><span id="eventColor1"></c:if>
			<c:if test="${st.dayMap[sidx]=='Ev' }"><span id="eventColor2"></c:if>
			<c:if test="${st.dayMap[sidx]=='Ng' }"><span id="eventColor3"></c:if>
			<c:out value="${st.dayMap[sidx] }"/>
			<c:if test="${st.dayMap[sidx]=='Dy' }"></span></c:if>
			<c:if test="${st.dayMap[sidx]=='Ev' }"></span></c:if>
			<c:if test="${st.dayMap[sidx]=='Ng' }"></span></c:if>
		</td>
		<%
		}
		%>
	</tr>
	</c:forEach>
</table>
<br><br>

<div id="sidr">
  <!-- Your content -->
  <ul>
    <li><a href="calendar.do?method=month&y=${year }&m=${month }">Schedule</a></li>
    <li class="active"><a href="#">직원별 일정관리</a></li>
    <li><a href="nakil.do?method=datagraph">근무통계보기</a></li>
    <li><a href="calendar.do?method=manual">도움말</a></li>
  </ul>
</div>
