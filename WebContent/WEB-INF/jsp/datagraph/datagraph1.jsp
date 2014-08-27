<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <title id='Description'>jqxChart Events Example</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/datagraph/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/datagraph/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/datagraph/jqx-all.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/datagraph/jqxchart.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/datagraph/jqxcore.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/datagraph/jqxdata.js"></script>
    <link href="<%=request.getContextPath()%>/assets/css/datepicker/jquery-ui-1.10.3.custom.css" rel="stylesheet" />
	<%-- <script src="<%=request.getContextPath()%>/assets/js/datepicker/jquery-1.9.1.js"></script> --%>
	<script src="<%=request.getContextPath()%>/assets/js/datepicker/jquery-ui-1.10.3.custom.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/sidr/jquery.sidr.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/sidr/jquery.sidr.dark.css">
    <script type="text/javascript">
        $(document).ready(function () {

        	/* 
        	alert("${dglist[0].title }");
        	var main = new Array(); // json의 전체를 가리키는 배열
        	sub = new Object();     // 객체 값 입력후 main배열의 0번 index에 셋팅
        	sub['key1'] = 'value1';
        	sub['key2'] = 'value2';
        	sub['key3'] = 'value3';
        	main[0] = sub;
        	 
        	sub = new Object();      // 객체 값 입력후 main배열의 1번 index에 셋팅
        	sub['key1'] = 'value4';
        	sub['key2'] = 'value5';
        	sub['key3'] = 'value6';
        	main[1] = sub;
        	 
        	sub = new Object();      // 객체 값 입력후 main배열의 2번 index에 셋팅
        	sub['key1'] = 'value7';
        	sub['key2'] = 'value8';
        	sub['key3'] = 'value9';
        	main[2] = sub;
        	 
        	var jsonObject = {list:main}; //jsonObject라는 변수에 json형식으로 key이름은 list, value 배열은 이전에 만들었던 main 배열을 넣는다
        	 
        	//json데이터의 값 출력
        	for(var i=0; i<jsonObject.list.length; i++) {
        	    var obj = jsonObject.list[i];
        	    alert(obj.key1+" , "+obj.key2 + " , " + obj.key3);
        	}
        	
        	 $("#datepicker").datepicker({
                 showMonthAfterYear: true,
                 changeYear: true,
                 changeMonth: true,
                 showButtonPanel: true,
                 yearRange:  "-5:+5", //-5:+5 , 2000:2020
                 altFormat:  "yymmdd",
                 altField:   "#datepicker", // altFormat 만 사용하면 dd/mm/yyyy로 나옴 함께 써야함
                 monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dayNamesMin:   ["일", "월", "화", "수", "목", "금", "토"],
                 closeText: '닫기',
                 currentText: '오늘',
                 prevText: '이전달',
                 nextText: '다음달',
                 yearSuffix: '년',
                 monthSuffix: '월',
                 buttonText: '달력',
                 showOn: "both", //이미지로 사용 , both : 엘리먼트와 이미지 동시사용
                 buttonImage: "assets/img/image/date_button.jpg", //버튼으로 사용할 이미지 경로
                 buttonImageOnly: true, //이미지만 보이기
                 onSelect: differance
             });
        	 $("#datepickerr").datepicker({
                 showMonthAfterYear: true,
                 changeYear: true,
                 changeMonth: true,
                 showButtonPanel: true,
                 yearRange:  "-5:+5", //-5:+5 , 2000:2020
                 altFormat:  "yymmdd",
                 altField:   "#datepickerr", // altFormat 만 사용하면 dd/mm/yyyy로 나옴 함께 써야함
                 monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dayNamesMin:   ["일", "월", "화", "수", "목", "금", "토"],
                 closeText: '닫기',
                 currentText: '오늘',
                 prevText: '이전달',
                 nextText: '다음달',
                 yearSuffix: '년',
                 monthSuffix: '월',
                 buttonText: '달력',
                 showOn: "both", //이미지로 사용 , both : 엘리먼트와 이미지 동시사용
                 buttonImage: "assets/img/image/date_button.jpg", //버튼으로 사용할 이미지 경로
                 buttonImageOnly: true, //이미지만 보이기
                 onSelect: differancee
             });

             //datepicker에서 사용한 이미지 버튼 style적용
             $("img.ui-datepicker-trigger").attr("style","margin-left:5px; vertical-align:middle; cursor:pointer;");
             */
            
             $('#datepicker, #datepickerr').datepicker({
            	 /* 
                 altFormat:  "yymmdd",
                 altField:   "#datepicker, #datepickerr", // altFormat 만 사용하면 dd/mm/yyyy로 나옴 함께 써야함
                  */
            	 showMonthAfterYear: true,
                 changeYear: true,
                 changeMonth: true,
                 showButtonPanel: true,
                 yearRange:  "-5:+5", //-5:+5 , 2000:2020
                 monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dayNamesMin:   ["일", "월", "화", "수", "목", "금", "토"],
                 closeText: '닫기',
                 currentText: '오늘',
                 prevText: '이전달',
                 nextText: '다음달',
                 yearSuffix: '년',
                 monthSuffix: '월',
                 buttonText: '달력',
                 showOn: "both", //button이미지로 사용 , both : 엘리먼트와 이미지 동시사용
                 buttonImage: "assets/img/image/date_button.jpg", //버튼으로 사용할 이미지 경로
                 buttonImageOnly: true, //이미지만 보이기
                 onSelect:
                	function(dateStr) {
   	    	     		var d1 = $('#datepicker').datepicker('getDate');
   	    	     		var d2 = $('#datepickerr').datepicker('getDate');
   	    	     		var diff = 0;
   	    	     		if (d1 && d2) {
   	    	        		diff = Math.floor((d2.getTime() - d1.getTime()) / 86400000)+1; // ms per day
   	    	      		}
   	    	     		/* alert(diff); */
   	    	      		$('input[name=allc]').val(diff);
   	    			},
	    		});
             
             $('input[name=select]').click(function() {
					
            	var startTime="0000";
     			var endTime="2400";
     			var sd="";
     			var ed="";
     			var sdo=$('input[name=sd]').val();
     			var edo=$('input[name=ed]').val();
     			sd += sdo.substring(6,10);
     			sd += sdo.substring(0,2);
     			sd += sdo.substring(3,5);
     			sd += startTime;
     			ed += edo.substring(6,10);
     			ed += edo.substring(0,2);
     			ed += edo.substring(3,5);
     			ed += endTime;
     			/* alert(sd +" : "+ed); */
     			$('input[name=startdate]').val(sd);
    			$('input[name=enddate]').val(ed);
             });
             
            // prepare chart data
            var sampleData = [
					<c:forEach var="dg" items="${dglist }">
                    { nursename: '${dg.title }', day: '${dg.day }', evening: '${dg.evening }', night: '${dg.night }', work: '${dg.work }', off: Number('${alldaycount }'-'${dg.work }') },
					</c:forEach>
                ];

            // prepare jqxChart settings
            var settings = {
                title: "간호사별 근무 현황",
                description: "(근무유형 별 근무일수)",
                padding: { left: 5, top: 5, right: 5, bottom: 5 },
                titlePadding: { left: 90, top: 0, right: 0, bottom: 10 },
                source: sampleData,
                categoryAxis:
                    {
                        dataField: 'nursename',
                        showGridLines: false
                    },
                colorScheme: 'scheme01',
                showToolTips: false,
                enableAnimations: true,
                seriesGroups:
                    [
                        {
                            type: 'column',
                            valueAxis:
                            {
                                minValue: 0,
                                maxValue: Number('${alldaycount }'),
                                unitInterval: 5,
                                description: 'days'
                            },
                            mouseover: myEventHandler,
                            mouseout: myEventHandler,
                            click: myEventHandler,

                            series: [
                                    { dataField: 'day', displayText: 'day' },
                                    { dataField: 'evening', displayText: 'evening' },
                                    { dataField: 'night', displayText: 'night' },
                                    { dataField: 'work', displayText: 'work' },
                                    { dataField: 'off', displayText: 'off' }
                                ]
                        }
                    ]
            };
			
            function myEventHandler(e) {
                var eventData = ' [&nbsp;&nbsp; 근무유형 : ' +'<b>'+ e.serie.dataField +'</b>'+ '&nbsp;&nbsp;]&nbsp;&nbsp;,&nbsp;&nbsp;&nbsp;&nbsp;  [&nbsp;&nbsp; days : ' +'<b>'+ e.elementValue +'</b>'+ "&nbsp;&nbsp;]</div>";
                $('#eventText').html(eventData);
            };

            // select the chartContainer DIV element and render the chart.
            $('#chartContainer').jqxChart(settings);
            
            $('#simple-menu').sidr();
        });
        
    </script>
    
    <style>
        body {font-size:9pt;}
        img {vertical-align:top;}
        #datepicker { font-size:9pt; margin:5px; height:20px; width:75px;vertical-align:center; text-align:center; }
        #datepickerr { font-size:9pt; margin:5px; height:20px; width:75px;vertical-align:center; text-align:center;}
        #butt { font-size:9pt; }
    </style>
    
</head>
<body style="background:white;">
<br>
<div align="left">
<img src="assets/img/schedule/menu120.gif"/>
<a id="simple-menu" href="#sidr">Toggle Menu</a>&nbsp;&nbsp;&nbsp;
</div>
<center>
<form method="post">
	<table border="0" width="500" height="22">
		<tr>
    		<td align="center">
		    	 <input type="hidden" name="startdate">
		    	 <input type="hidden" name="enddate"><br/>
		    	 <input type="hidden" name="allc">
    		</td>
    	</tr>
	</table>
	<table border="0" width="800" height="10"><tr>
		<td align="left" width="250">
 			<b>근무현황 조회기간</b> &nbsp;&nbsp;&nbsp; >>>>>
    	</td>
    	<td align="center">
	    	시작일 <input type="text" name="sd" id="datepicker" readonly>
	    	&nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp;&nbsp;
	    	종료일 <input type="text" name="ed" id="datepickerr" readonly>
    	</td>
    	<td align="right" width="150">
    		<b><input type="submit" name="select" id="butt" value="조회">
    	</td>
    </tr></table>
    <table>
    	<tr>
    		<td>
    			<div id='chartContainer' style="width:800px; height: 400px"/>
    		</td>
    	</tr>
    	<tr>
    		<td align="center">
    			<div id='eventText' style="width:600px; height: 30px"/>
    		</td>
    	</tr>
    </table>
</form>
</center>

<div id="sidr">
  <!-- Your content -->
  <ul>
    <li><a href="calendar.do?method=month">Schedule</a></li>
    <li><a href="calendar.do?method=list">직원별 일정관리</a></li>
    <li class="active"><a href="#">근무통계보기</a></li>
    <li><a href="calendar.do?method=manual">도움말</a></li>
  </ul>
</div>

</body>
</html>