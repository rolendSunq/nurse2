<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href='assets/css/calendar/fullcalendar.css' rel='stylesheet' />
<link href='assets/css/calendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='assets/js/calendar/jquery.min.js'></script>
<script src='assets/js/calendar/jquery-ui.custom.min.js'></script>
<script src='assets/js/calendar/fullcalendar.js'></script>
<link href="<%=request.getContextPath()%>/assets/css/datepicker/jquery-ui-1.10.3.custom.css" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/assets/js/datepicker/jquery-ui-1.10.3.custom.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/timepicker/jquery.timepicker.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/timepicker/jquery.timepicker.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/timepicker/base.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/timepicker/base.css" />

<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/sidr/jquery.sidr.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/sidr/jquery.sidr.dark.css">

<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/colorpicker/jscolor.js"></script>    
<style>
	body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	}
	a:link    {color:white;text-decoration: none;}
	a:visited {color:white;}
	a:hover   {color:#f6de00;}
	a:active  {color:orange;}
	#calendar {
		width: 900px;
		margin: 0 auto;
	}
	#dataBox {
		windowSourceID:'#dataBoxTable'; 
		windowPadding:20; 
		draggable:1; 
		windowBGColor:'#FFFF00'; 
		borderColor:'#990000'; 
		opacity:1 !important;
		background:white !important;
		width:450px;
		visibility:hidden;
		z-index:100;
		position: fixed;
		left: 35%;
		top: 30%;
		border-radius: 4px;
		box-shadow:
				    0 2px 2px rgba(0,0,0,0.2),        
				    0 1px 5px rgba(0,0,0,0.2),        
				    0 0 0 12px rgba(200,200,255,0.4);
		font-size: 13px;
		font-family: sans-serif;
	}
	.color {
		display: block;
	  	height: 25px;
	 	width: 125px;
	  	margin: 0;
	  	padding: 0;
	}
	input[readonly="readonly"] {
    	border: 1px solid #ffffff;
	}
	.myLink a:link    {color:black !important;}
	.myLink a:visited {color:black !important;}
	.myLink a:hover   {color:black !important;}
	.myLink a:active  {color:orange !important;}
	
</style>
<div align="left" class="myLink">
<img src="assets/img/schedule/menu120.gif"/>
<a id="simple-menu" href="#sidr">Toggle Menu</a>&nbsp;&nbsp;&nbsp;
</div>

 <div id='calendar'></div> 

 <div id='dataBox'>
 <br>
 <form method='post' id='frm'>
 <input type='hidden' name='allday' value="false"/>
 <input type='hidden' name='url' value=""/>
 <input type='hidden' name='manager' value=""/> <!-- 확장기능대비 칼럼 -->
 <input type='hidden' name='dno' value=""/> <!-- 확장기능대비 칼럼 -->
 <input type='hidden' name='title' value=""/>
 <input type='hidden' name='jobno' value=""/>
 
 <input type='hidden' name='sno' value=""/>
 <input type="hidden" name="className" size="15" maxlength="15" value="">
 
 	<table id="dataBoxTable" width="400" class="table table-condensed">
 	<thead>
 		<tr><th>&nbsp;</th>
 			<th align="left">
 				입력정보를 선택하세요.
 			</th>
 		</tr>
 	</thead>
 	<tbody>
 		<tr><th>&nbsp;시작일</th>
 			<td align="left">
 				<input type='text' name='startdate' value="" size="10" readonly="readonly"/>
 			</td>
 		</tr>
 		<tr><th>&nbsp;종료일</th>
 			<td align="left">
 				<input type='text' name='enddate' value="" size="10" readonly="readonly" id="datepicker"/>
 			</td>
 		</tr>
 		<tr><th>&nbsp;근무선택</th>
 			<td align="left">
 				<input type="radio" name="type" id="radio1" value="1" checked>오전
 				<input type="radio" name="type" id="radio2" value="2">오후
 				<input type="radio" name="type" id="radio3" value="3">야간
 				<input type="radio" name="type" id="radio4" value="4"><font color="red">직접입력</font>&nbsp;
 				<span id="isDot" style="visibility:hidden;">
 				<input type="checkbox" name="isDot" id="chkBox" value="true" style="font-size:10px;"> <font color="red">Time slice</font>
				</span>
 			</td>
 		</tr>
 		<tr><th>&nbsp;근무시간</th>
 			<td align="left">
 				시작: <input type="text" name="starttime" size="4" value="0700" readonly="readonly" id="basicTimePicker"> -&nbsp;
 				종료: <input type="text" name="endtime" size="4" value="1500" readonly="readonly" id="basicTimePicker2">
 			</td>
 		</tr>
 		<tr><th>&nbsp;배경색</th>
 			<td align="left">
 				<!-- <span class="color" style="background-color:#55B473;"></span> -->
 				<input type="text" name="color" value="" class="color" style="border-style:solid;border-width:1px;border-color:white" readonly="readonly">
 			</td>
 		</tr>
 		<tr><th>&nbsp;이름</th>
 			<td align="left">
 				<select name="titleSelect" class="span2 input-sm">
 					<c:forEach var="n" items="${nurse }">
 						<option value="${n.jobno }:${n.name }">${n.name }</option>
 					</c:forEach>
 				</select>
 			</td>
 		</tr>
 	</tbody>
 	<tfoot>
 		<tr>
  			<td colspan="2">
  			<label id="edit" style="visibility:hidden;">
  				<input type='button' name='delete' value='삭 제' class='btn btn-primary btn-xs' onClick="javascript:deleteData();"/>&nbsp;
  				<input type='button' name='update' value='수 정' class='btn btn-primary btn-xs' onClick="javascript:updateData();"/>&nbsp;
  			</label>
  			<label id="confirm" style="visibility:hidden;">
  				<input type='button' name='confirm' value='등 록' class='btn btn-primary btn-xs'/>&nbsp;
  			</label>
  			&nbsp;&nbsp;<input type='button' name='close' value='닫 기' class='btn btn-primary btn-xs' onClick="javascript:closeBox();"/>
  			</td>
 		</tr>
 	</tfoot>
 	</table>
 </form>
 </div>
 <table id="treeData"></table>
 <br><br>

<div id="sidr">
  <!-- Your content -->
  <ul>
    <li class="active"><a href="#">Schedule</a></li>
    <li><a href="calendar.do?method=list">직원별 일정관리</a></li>
    <li><a href="nakil.do?method=datagraph">근무통계보기</a></li>
    <li><a href="calendar.do?method=manual">도움말</a></li>
  </ul>
</div>

<script type="text/javascript">
	///
	var myCurrentView='${myCurrentView}';
	if(myCurrentView==null || myCurrentView==""){
		myCurrentView="month";
	}

	var eventColor1="#ff0dff";
    var eventColor2="#5bcc14";
    var eventColor3="#f78225";
    var eventColor4="#5d40ff";
    var auth='${pageAuth}';
    var hasPermission=false;
    if(auth==null || auth==""){
    	hasPermission=false;
    } else {
	    if (/2/i.test(auth)){
	    	hasPermission=true;
	    } else {
	    	hasPermission=false;
	    }
    }
    
    var sourceData;
    var mainData=new Array();
    var partedData=new Array();
    var SHOW_NG_NEXT_DAY_ON_MONTH=false;
    
    function getData(data){

    	if(typeof data=="undefined"){
    		sourceData='${jsonList}';
    	} else {
    		sourceData=data;
    	}
    	
    	if(myCurrentView=="month"){
			extractData();
		}
    	loadData();
    }
	
	$(function() {
		
		getData();
		
		if(myCurrentView=="agendaDay"){
			var goToDate='${goToDate}';
			if(goToDate==null || goToDate==""){
				var date = new Date();
				var d = date.getDate();
				var m = date.getMonth();
				var y = date.getFullYear();
				m=m.length==1?"0"+m:m;
				d=d.length==1?"0"+d:d;
				goToDate=y+m+d+"0600";
			}
			var targetDate=stringToDate(goToDate);
			$('#calendar').fullCalendar('changeView', 'agendaDay').fullCalendar('gotoDate', targetDate);
		}
		
		var radioHolder=$('input[name=type]');
		radioHolder.click(function(){
			$('input[name=color]').val('');
			
			var type=$('input[name=type]:checked').val();
			var startTime="0000";
			var endTime="0000";
			if (type === "1") {
				$('input[name=starttime]').attr("readonly",true);
				$('input[name=endtime]').attr("readonly",true);
				//$('input[name=color]').val(eventColor1);
				$('input[name=className]').val('eventColor1');
				$('.color').css('background-color',eventColor1);
				$('#isDot').css('visibility','hidden');
				startTime="0700";
				endTime="1500";
			} else if (type === "2") {
				$('input[name=starttime]').attr("readonly",true);
				$('input[name=endtime]').attr("readonly",true);
				//$('input[name=color]').val(eventColor2);
				$('input[name=className]').val('eventColor2');
				$('.color').css('background-color',eventColor2);
				$('#isDot').css('visibility','hidden');
				startTime="1500";
				endTime="2200";
			} else if (type === "3") {
				$('input[name=starttime]').attr("readonly",true);
				$('input[name=endtime]').attr("readonly",true);
				//$('input[name=color]').val(eventColor3);
				$('input[name=className]').val('eventColor3');
				$('.color').css('background-color',eventColor3);
				$('#isDot').css('visibility','hidden');
				startTime="2200";
				endTime="0700";
			} else if (type === "4") {
				$('input[name=starttime]').attr("readonly",false);
				$('input[name=endtime]').attr("readonly",false);
				//$('input[name=color]').val(eventColor4);
				$('input[name=className]').val('eventColor4');
				$('.color').css('background-color',eventColor4);
				$('#isDot').css('visibility','visible');
				startTime="0700";
				endTime="1500";
			}
			$('input[name=starttime]').val(startTime);
			$('input[name=endtime]').val(endTime);
			
		});
		/*
		$.getJSON("assets/js/calendar/holiday.json",function(data,textStatus) {
			$.each(data,function() {
				$('#treeData').append("<tr>"
						+"<td>"+this.day+"</td>"
						+"<td>"+this.title+"</td></tr>");
			});
		});
		*/
		$("#dataBox").draggable();
		
		$("#datepicker").datepicker({
            showMonthAfterYear: true,
            changeYear: true,
            showButtonPanel: true,
            yearRange:  "-5:+5", //-5:+5 , 2000:2020
            altFormat:  "yymmdd",
            altField:   "#datepicker", // altFormat 만 사용하면 dd/mm/yyyy로 나옴 함께 써야함
            monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            dayNamesMin:   ["일", "월", "화", "수", "목", "금", "토"],
            closeText: '닫기',
            currentText: '오늘',
            prevText: '이전달',
            nextText: '다음달',
            yearSuffix: '년',
            buttonText: '달력',
            showOn: "button", //이미지로 사용 , both : 엘리먼트와 이미지 동시사용
            buttonImage: "assets/img/image/date_button.jpg", //버튼으로 사용할 이미지 경로
            buttonImageOnly: true //이미지만 보이기
        });
		
        //datepicker에서 사용한 이미지 버튼 style적용
        $("img.ui-datepicker-trigger").attr("style","margin-left:5px; vertical-align:middle; cursor:pointer;");
        
        $('#basicTimePicker').timepicker({ 'timeFormat': 'H:i' });
        $('#basicTimePicker').change(function(){
        	var myTime=$('#basicTimePicker').val().replace(":","");
        	if(myTime=="2400"){
        		myTime="0000";
        	}
        	if(myTime){
        		$('input[name=starttime]').val(myTime);
        	}
        	$('#basicTimePicker').timepicker('hide');
        });
        $('#basicTimePicker2').timepicker({ 'timeFormat': 'H:i' });
        $('#basicTimePicker2').change(function(){
        	var myTime=$('#basicTimePicker2').val().replace(":","");
        	if(myTime=="2400"){
        		myTime="0000";
        	}
        	if(myTime){
        		$('input[name=endtime]').val(myTime);
        	}
        	$('#basicTimePicker2').timepicker('hide');
        });
        
        $('#simple-menu').sidr();
	});
	
	function extractData(){
		
		mainData=new Array();
		partedData=new Array();
		
		console.log("sourceData >>> \n"+sourceData);
		console.log("mainData >>> \n"+mainData);
		console.log("partedData >>> \n"+partedData);
		var objData;
		if(typeof sourceData==Object){
			alert('sourceData is Object');
			objData=sourceData;
		} else {
			objData=JSON.parse(sourceData);
		}
		
		$.each(objData, function(idx,item){
			if('type' in this){
				
				var type=item.type;
				var startDate=item.start;
				var endDate=item.end;
				
				var startTime=startDate.substring(8,12);
				var endTime=endDate.substring(8,12);
				
				if(type=="3" && startTime=="0000" && endTime=="0700"){

					var obj=JSON.stringify(item);
					partedData.push(obj);
					objData.splice(idx,1);
				}
				
			}
		});
		partedData="["+partedData+"]";
		mainData=JSON.stringify(objData);

		console.log("sourceData >>> \n"+sourceData);
		console.log("mainData >>> \n"+mainData);
		console.log("partedData >>> \n"+partedData);

	}
	
	function closeBox(){
		$('#dataBox').css('visibility','hidden');
		$('#confirm').css('visibility','hidden');
		$('#edit').css('visibility','hidden');
		$('#isDot').css('visibility','hidden');
		$('#radio1').attr("checked","checked");
		$("#radio1").prop("checked", true);
		//TODO:작동체크
		$('#isDot').removeAttr("checked");
		$("#isDot").prop("checked", false);
		$('#calendar').fullCalendar('unselect');
	}
	
	function stringToDate(strdate) {
		var year = Number(strdate.substring(0,4));
		var mon = Number(strdate.substring(4,6))-1;
		var day = Number(strdate.substring(6,8));
		var hh = Number(strdate.substring(8,10));
		var mi = Number(strdate.substring(10,12));
		return new Date(year,mon,day,hh,mi);
	}
	
	function dateToString(date) {
		var y = ""+date.getFullYear();
		var m = spaceFix(""+(date.getMonth()+1));
		var d = spaceFix(""+date.getDate());
		var h = spaceFix(""+date.getHours());
		var min = spaceFix(""+date.getMinutes());
		return y+m+d+h+min;
	}
	
	function spaceFix(str) {
		if(str.length==1) {
			str="0"+str;
		}
		if(str.length==0) {
			str="00";
		}
		return str;
	}

	function loadData(data){
		
		var objMainData=JSON.parse(mainData);
		for(var idx=0; idx < objMainData.length; idx++) {
			objMainData[idx].title = decodeURI(objMainData[idx].title);
			objMainData[idx].start = stringToDate(objMainData[idx].start); //날자 String을 날자 객체로 변경
			
			if(objMainData[idx].end!=null){
				objMainData[idx].end = stringToDate(objMainData[idx].end);
			}
			if(objMainData[idx].allDay!=null && objMainData[idx].allDay!="true"){
				objMainData[idx].allDay=false;
			}
		}
		
		var objPartedData=null;
		if(partedData.length>0){
			objPartedData=JSON.parse(partedData);
			for(var idx=0; idx < objPartedData.length; idx++) {
				objPartedData[idx].title = decodeURI(objPartedData[idx].title);
				objPartedData[idx].start = stringToDate(objPartedData[idx].start); //날자 String을 날자 객체로 변경
				
				if(objPartedData[idx].end!=null){
					objPartedData[idx].end = stringToDate(objPartedData[idx].end);
				}
				if(objPartedData[idx].allDay!=null && objPartedData[idx].allDay!="true"){
					objPartedData[idx].allDay=false;
				}
			}
		}
		
		var objTotalData=null;
		if(objPartedData!=null && SHOW_NG_NEXT_DAY_ON_MONTH){
			objTotalData=$.merge(objMainData,objPartedData);
		} else {
			objTotalData=objMainData;
		}

		$('#calendar').fullCalendar('destroy'); //리프레쉬를 위한 기존 정보 삭제
		var calendar = $('#calendar').fullCalendar({
			defaultView: myCurrentView,
		    dayClick: function(date, allDay, jsEvent, view) {
		        if( jsEvent.target.className == "fc-day-number") {
		            $( "#calendar" ).fullCalendar( "gotoDate" , date).fullCalendar("changeView", "agendaDay");
		        }
		    },
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			selectable: true,
			selectHelper: true,
			eventRender: function(event, element, view){
				/*
				var dateString=$.fullCalendar.formatDate(event.start,'yyyy-MM-dd');
				view.element.find('.fc-day[data-date="'+dateString+'"]').removeClass('fc-event');
				view.element.find('.fc-day[data-date="'+dateString+'"]').addClass('fc-event-am');
				alert(view.name);
				*/
				/*
				var cell=view.dateToCell(event.start);
				//alert((cell.row+1)+","+cell.col);
				view.element.find('tr:eq('+(cell.row+1)+') td:eq('+cell.col+')').css('background','yellow');
				*/
				
				/*
				var time = element.find('.fc-event-time').detach(); 
				element.find('.fc-event-title').after(time); 
				element.append("<div>" + event.type + "</div>");
				*/
				
				var strType="";
				if(event.type=="1"){
					strType="Dy ";
				} else if(event.type=="2"){
					strType="Ev ";
				} else if(event.type=="3"){
					strType="Ng ";
				} else if(event.type=="4"){
					strType="";
				}
				element.find('.fc-event-title').prepend(strType);
			},
			select: function(start, end, allDay) {
				
				if(!hasPermission){
					return;
				}
				
				$('input[name=color]').val('');
				
				$('#dataBox').css('visibility','visible');
				$('#confirm').css('visibility','visible');
				$('#edit').css('visibility','hidden');
				clearBox();
				
				var strStart = dateToString(start);
				var strEnd = dateToString(end);
				var strStartTime = strStart.substring(8,12);
				var strEndTime = strEnd.substring(8,12);
				
				if(strStartTime=="0000" || strEndTime=="0000"){ // 월 모드
					
					var type=$('input[name=type]:checked').val();
					if(type == "4"){
						//TODO:직접입력 값 제약사항 체크 로직
						//alert('checked 4 > TODO:직접입력 값 제약사항 체크 로직');
						$('input[name=className]').val('eventColor4');
						$('.color').css('background-color',eventColor4);
						//$('input[name=color]').val(eventColor4);
					} else {
						//alert("type: "+type);
						if (type === "1") {
							strStartTime="0700";
							strEndTime="1500";
							$('input[name=className]').val('eventColor1');
							$('.color').css('background-color',eventColor1);
							//$('input[name=color]').val(eventColor1);
						} else if (type === "2") {
							strStartTime="1500";
							strEndTime="2200";
							$('input[name=className]').val('eventColor2');
							$('.color').css('background-color',eventColor2);
							//$('input[name=color]').val(eventColor2);
						} else if (type === "3") {
							//2개로 분리 (익일 추가 후반부 더 할 것) > 기획자의 의견에 따라 그냥 유지 함
							strStartTime="2200";
							strEndTime="0700";
							$('input[name=className]').val('eventColor3');
							$('.color').css('background-color',eventColor3);
							//$('input[name=color]').val(eventColor3);
						}
					}
					
				} else { // 주,일 모드
					$('#radio4').attr("checked","checked");
					$("#radio4").prop("checked", true);
					$('#isDot').css('visibility','visible');
					
				}
				
				$('input[name=starttime]').val(strStartTime);
				$('input[name=endtime]').val(strEndTime);
				$('input[name=startdate]').val(strStart.substring(0,8));
				$('input[name=enddate]').val(strEnd.substring(0,8));
				$('input[name=allDay]').val(allDay);
				$('input[name=title]').val('');
				
				//입력(확인)버튼 클릭 시 이벤트 발생
				$('input[name=confirm]').click(function() {
					
					if($('select[name=titleSelect]').val()){
						
						if($('input[name=allDay]').val()!="true"){
							$('input[name=allDay]').val('false');
						}
						
						var startDateConfirm = $('input[name=startdate]').val();
						//alert("startDateConfirm: "+startDateConfirm+" == start: "+dateToString(start).substring(0,8));
						
						if (startDateConfirm==dateToString(start).substring(0,8)) {
							insertData();
							
							calendar.fullCalendar('unselect');
							
							$('#dataBox').css('visibility','hidden');
						}
					}
					
				});
			},
			viewDisplay: function(view) { 
				
				///
				//console.log("mainData viewDisplay ----> \n"+mainData);
				//console.log("partedData viewDisplay ----> \n"+partedData);
				if(myCurrentView=="month"){
					if(myCurrentView!=view.name){
						if(partedData.length>0){
							if(!SHOW_NG_NEXT_DAY_ON_MONTH){
								$.merge(objTotalData, objPartedData);
							}
							
							$('#calendar').fullCalendar('refetchEvents');
						}
					}
				} else if(myCurrentView=="agendaWeek" && view.name!="agendaDay"){
					if(myCurrentView!=view.name){
						myCurrentView=view.name;
						getData(sourceData);
						$('#calendar').fullCalendar('refetchEvents');
					}
				} else if(myCurrentView=="agendaDay" && view.name!="agendaWeek"){
					if(myCurrentView!=view.name){
						myCurrentView=view.name;
						getData(sourceData);
						$('#calendar').fullCalendar('refetchEvents');
					}
				}
				
				
				myCurrentView=view.name;
				if(myCurrentView=="month"){
					if(typeof $('input[type=radio]')=="undefined"){
						location.reload();
					}
					$('#radio1').attr("checked","checked");
					$("#radio1").prop("checked", true); //For jQuery 1.9 or higher use
					$('.color').css('background-color',eventColor1);
					
				} else {
					$('#radio4').attr("checked","checked");
					$("#radio4").prop("checked", true);
					$('.color').css('background-color',eventColor4);
					//TODO:작동체크
					$('#isDot').removeAttr("checked");
					$("#isDot").prop("checked", false);
				}
				/*
				if(myCurrentView!=view.name){
					//TODO:작동체크
					$('#isDot').removeAttr("checked");
					$("#isDot").prop("checked", false);
				}
				*/
				
			},
			eventDrop: function (event, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view) {
		        //!중요:날자 정보가 1일 인경우,
		        //시작시간보다 종료시간이 적은 경우 event.end는 null을 리턴하는 버그(?)가 존재 함.
		        //기획자의 의도에 따라 2200-0700(익일)을 하루로 표시하기 때문에 발생하는 현상.
				/*alert("event.id: "+event.id+"\n"+
		        	  "event.title: "+event.title+"\n"+
		        	  "event.start: "+event.start+"\n"+
		        	  "event.end: "+event.end+"\n"+
		        	  "dayDelta: "+dayDelta+"\n"+
		        	  "minuteDelta: "+minuteDelta+"\n");*/
		        var chStartDate=dateToString(event.start);
		        var chEndDate;
				
		        if(event.end==null){
		        	chEndDate=chStartDate.substring(0,8)+"0700";
		        } else {
		        	chEndDate=dateToString(event.end);
		        }
		        //alert(chStartDate+"/"+chEndDate);
		        
		        var chStartTime=chStartDate.substring(8,12);
				var chEndTime=chEndDate.substring(8,12);
				
				var sy=chStartDate.substring(0,4);
				var sm=chStartDate.substring(4,6);
				var sd=chStartDate.substring(6,8);
				var ey=chEndDate.substring(0,4);
				var em=chEndDate.substring(4,6);
				var ed=chEndDate.substring(6,8);
						
				var sh=chStartTime.substring(0,2);
				var smin=chStartTime.substring(2,4);
				var eh=chEndTime.substring(0,2);
				var emin=chEndTime.substring(2,4);
				var content="시작날자: "+sy+"."+sm+"."+sd+" - 종료날자: "+ey+"."+em+"."+ed+"\n";
				content+="시작시간: "+sh+":"+smin+" - 종료시간: "+eh+":"+emin+"\n\n";
				
		       	if (!confirm(content+"수정 할까요?")) {
					revertFunc();
				} else {
			        clearBox();
					$('input[name=sno]').val(event.id);
					$('input[name=startdate]').val(chStartDate);
					$('input[name=enddate]').val(chEndDate);
					
					//시간 변경에 따라 type 값을 구하기
					var chType="4";
					if(chStartTime=="0700" && chEndTime=="1500"){
						chType="1";
					} else if(chStartTime=="1500" && chEndTime=="2200"){
						chType="2";
					} else if(chStartTime=="2200" && chEndTime=="0700"){
						chType="3";
					}
					$("input[name=type][value=" + chType + "]").attr("checked", "checked");
					$("input[name=type][value=" + chType + "]").prop("checked", true);
					
			        var params = $('#frm').serialize();
			        $.post("calendar.do?method=drop", params, function(data) {
						//loadData(data);
						getData(data);
					});
				}
		    },
		    eventResize: function(event, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view) { 
		    	/*alert("event.id: "+event.id+"\n"+
			        	  "event.title: "+event.title+"\n"+
			        	  "event.start: "+dateToString(event.start)+"\n"+
			        	  "event.end: "+dateToString(event.end)+"\n"+
			        	  "dayDelta: "+dayDelta+"\n"+
			        	  "minuteDelta: "+minuteDelta+"\n");*/
		    	var chStartDate=dateToString(event.start);
		        var chEndDate;
				
		        if(event.end==null){
		        	chEndDate=chStartDate.substring(0,8)+"0700";
		        } else {
		        	chEndDate=dateToString(event.end);
		        }
		        //alert(chStartDate+"/"+chEndDate);
		        
				var chStartTime=chStartDate.substring(8,12);
				var chEndTime=chEndDate.substring(8,12);
				
				var sy=chStartDate.substring(0,4);
				var sm=chStartDate.substring(4,6);
				var sd=chStartDate.substring(6,8);
				var ey=chEndDate.substring(0,4);
				var em=chEndDate.substring(4,6);
				var ed=chEndDate.substring(6,8);
				
				var sh=chStartTime.substring(0,2);
				var smin=chStartTime.substring(2,4);
				var eh=chEndTime.substring(0,2);
				var emin=chEndTime.substring(2,4);
				var content="시작날자: "+sy+"."+sm+"."+sd+" - 종료날자: "+ey+"."+em+"."+ed+"\n";
				content+="시작시간: "+sh+":"+smin+" - 종료시간: "+eh+":"+emin+"\n\n";
				
		        if (!confirm(content+"변경 할까요?")) {
				    revertFunc();
			    } else {
			    	clearBox();
					$('input[name=sno]').val(event.id);
					$('input[name=startdate]').val(chStartDate);
					$('input[name=enddate]').val(chEndDate);
					
					//시간 변경에 따라 type 값을 구하기
					var chType="4";
					if(chStartTime=="0700" && chEndTime=="1500"){
						chType="1";
					} else if(chStartTime=="1500" && chEndTime=="2200"){
						chType="2";
					} else if(chStartTime=="2200" && chEndTime=="0700"){
						chType="3";
					}
					$("input[name=type][value=" + chType + "]").attr("checked", "checked");
					$("input[name=type][value=" + chType + "]").prop("checked", true);
					
			    	var params = $('#frm').serialize();
			        $.post("calendar.do?method=drop", params, function(data) {
						//loadData(data);
						getData(data);
					});
			    }
		        
		    },
		    eventAfterRender: function(event, element, view) {
		    	/*
		    	var width = $(element).width();
		        if($(element).hasClass("HalfClass")) {
		           width = width / 2;
		        }
		        $(element).css('width', width + 'px');
		        */
		    },
			editable: hasPermission,
			events: objTotalData
			/*
			firstDay: 0,				//---	0. 일요일
			weekends: true,
			allDaySlot: true,
			allDayText: '종일',
			axisFormat : 'HH:mm', //tt : am/pm
			slotMinutes: 30,
			defaultEventMinutes: 60,
			firstHour: 6,
			timeFormat: 'hh tt',
			columnFormat: {month: 'ddd', week: 'M/d ddd', day: 'M/d dddd'},
			titleFormat: {month: 'yyyy년 M월', week: 'yyyy년 M월 d일{ — [yyyy년] [M월] d일 }', day: 'yyy y년 M월 d일 dddd'},
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] ,
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	 		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	 		buttonText: {today: '오늘', month: '월', week: '주', day: '일'},
			eventBackgroundColor: '#3a87ad'
			*/
		});		
	} 
	
	function insertData(){

		if(!checkTime()){
			return;
		}
		var startDate=$('input[name=startdate]').val();
		var endDate=$('input[name=enddate]').val();
		var sDate=parseInt(startDate);
		var eDate=parseInt(endDate);
		var days=eDate-sDate;
		
		if(days<0){
			alert("종료일이 시작일보다 과거일 수 없습니다.\n작업이 취소 되었습니다.\t");
			$('#dataBox').css('visibility','hidden');
			$('#confirm').css('visibility','hidden');
			$('#edit').css('visibility','hidden');
			$('#isDot').css('visibility','hidden');
			clearBox();
			return;
		}
		
		var titleArray=$('select[name=titleSelect]').val().split(":"); //jobno:name > parsing
		$('input[name=title]').val(titleArray[1]);
		$('input[name=jobno]').val(titleArray[0]);
		
		var startTime=$('input[name=starttime]').val();
		var endTime=$('input[name=endtime]').val();
		startTime=startTime.replace(":","");
		endTime=endTime.replace(":","");

		var st=parseInt(startTime);
		var et=parseInt(endTime);
		if(st>=et){
			$('input[name=enddate]').val(parseInt($('input[name=enddate]').val())+1);
		}
		
		$('input[name=startdate]').val($('input[name=startdate]').val()+startTime);
		$('input[name=enddate]').val($('input[name=enddate]').val()+endTime);
		//alert($('input[name=startdate]').val()+"-"+$('input[name=enddate]').val());
		
		var params = $('#frm').serialize();
		$.post("calendar.do?method=insert",
			params,
			function(data){
				//loadData(data);
				getData(data);
			}
		);
		$('#dataBox').css('visibility','hidden');
		$('#confirm').css('visibility','hidden');
		$('#edit').css('visibility','hidden');
		$('#isDot').css('visibility','hidden');
		clearBox();
		
	}

	//캘린더 창 > 내용 링크 클릭 시 호출 됨
	function editBox(myArray) {
		if(!hasPermission){
			return;
		}
		var ary=myArray.split(',');
		var title=ary[0];
		var id=ary[1];
		var start=ary[2];
		var end=ary[3];
		var all=ary[4];
		var type=ary[5];
		var jobno=ary[6];
		var bgColor=ary[7];
		
		$('#dataBox').css('visibility','visible');
		$('#confirm').css('visibility','hidden');
		$('#edit').css('visibility','visible');
		$('#isDot').css('visibility','hidden');
		clearBox();
		
		$('input[name=title]').val(title);
		$('input[name=sno]').val(id);
		$('input[name=startdate]').val(start.substring(0,8));
		$('input[name=enddate]').val(end.substring(0,8));
		var startTime=start.substring(8,12);
		var endTime=end.substring(8,12);
		//--------------------------------------------------------
		// 디비에 저장 된 데이타가 20131028 2200-20131028 0700 인경우
		// 0700 임에도 2200 을 리턴하는 버그(?)가 있다. >> 강제 재 설정으로 일단 처리 함.
		//TODO:대체 로직
		if(startTime==endTime){
			endTime="0700";
		}
		//--------------------------------------------------------
		$('input[name=starttime]').val(startTime);
		$('input[name=endtime]').val(endTime);
		
		$('input[name=allday]').val(all);
		
		$("input[name=type][value=" + type + "]").attr("checked", "checked");
		$("input[name=type][value=" + type + "]").prop("checked", true);
		if(type=="1"){
			$('.color').css('background-color',eventColor1);
		} else if(type=="2"){
			$('.color').css('background-color',eventColor2);
		} else if(type=="3"){
			$('.color').css('background-color',eventColor3);
		} else if(type=="4"){
			$('.color').css('background-color',eventColor4);
		}
		
		/* 미사용
		$('input[name=url]').val(url);
		$('input[name=manager]').val(manager);
		$('input[name=dno]').val(dno);
		 */
		$('input[name=jobno]').val(jobno);
		var name = title;
		var no = jobno;
		var titleSelect = no + ":" + name;
		$('select[name=titleSelect]').val(titleSelect);
		
		if(bgColor!=null && bgColor!=""){
			$('input[name=color]').val(bgColor);
			$('.color').css('background-color',bgColor);
		}
		
	}

	function deleteData() {
		$('#dataBox').css('visibility', 'hidden');
		$('#confirm').css('visibility','hidden');
		$('#edit').css('visibility','hidden');
		$('#isDot').css('visibility','hidden');
		var params = $('#frm').serialize();
		$.post("calendar.do?method=delete", params, function(data) {
			//loadData(data);
			getData(data);
		});
		clearBox();
	}

	function updateData() {
		$('#dataBox').css('visibility', 'hidden');
		$('#confirm').css('visibility','hidden');
		$('#edit').css('visibility','hidden');
		$('#isDot').css('visibility','hidden');
		
		var titleArray = $('select[name=titleSelect]').val().split(":"); //jobno:name > parsing
		$('input[name=title]').val(titleArray[1]);
		$('input[name=jobno]').val(titleArray[0]);
		var start = $('input[name=startdate]').val();
		var end = $('input[name=enddate]').val();
		
		var type=$('input[name=type]:checked').val();
		var startTime="0000";
		var endTime="0000";
		if (type === "1") {
			startTime="0700";
			endTime="1500";
		} else if (type === "2") {
			startTime="1500";
			endTime="2200";
		} else if (type === "3") {
			startTime="2200";
			endTime="0700";
		} else if (type === "4"){
			if(!checkTime()){
				return;
			}
			startTime=$('input[name=starttime]').val();
			endTime=$('input[name=endtime]').val();
			startTime=startTime.replace(":","");
			endTime=endTime.replace(":","");
		}
		
		var st=parseInt(startTime);
		var et=parseInt(endTime);
		if(st>=et){
			end=(parseInt(end)+1)+"";
		}
		
		$('input[name=startdate]').val(start.substring(0,8)+startTime);
		$('input[name=enddate]').val(end.substring(0,8)+endTime);

		var params = $('#frm').serialize();
		$.post("calendar.do?method=update", params, function(data) {
			//loadData(data);
			getData(data);
		});
		clearBox();
	}
	
	function clearBox(){
		$('input[name=sno]').val('');
		$('input[name=type][value="1"]').attr('checked',true);
		$('select[name=titleSelect]').eq(0).attr('selected',true);
		$('input[name=startdate]').val('');
		$('input[name=enddate]').val('');
		$('input[name=allday]').val('false');
		$('input[name=url]').val('');
		$('input[name=manager]').val('');
		$('input[name=dno]').val('');
		$('input[name=jobno]').val('');
	}
	function checkTime(){
		
		var st=$('input[name=starttime]').val();
		var et=$('input[name=endtime]').val();
		$('input[name=starttime]').val(st.replace(":",""));
		$('input[name=endtime]').val(et.replace(":",""));
		
		var reg=/[^(0-9)]/;
		
		if(reg.test(st)){
			alert('1.숫자만 입력 가능합니다.');
			$('input[name=starttime]').focus();
			clearBox();
			return false;
		}
		if(reg.test(et)){
			alert('2.숫자만 입력 가능합니다.');
			$('input[name=endtime]').focus();
			clearBox();
			return false;
		}
		
		if(st.length!=4){
			alert('1.시간 값이 허용범위를 벗어났습니다.');
			$('input[name=starttime]').focus();
			clearBox();
			return false;
		}
		if(et.length!=4){
			alert('2.시간 값이 허용범위를 벗어났습니다.');
			$('input[name=endtime]').focus();
			clearBox();
			return false;
		}
		
		var hh=parseInt(st.substring(0,2));
		var min=parseInt(st.substring(2,4));
		
		if(hh<0 || hh>24){
			alert('3.시간 값이 허용범위를 벗어났습니다.');
			$('input[name=starttime]').focus();
			clearBox();
			return false;
		}
		if(min<0 || min>59){
			alert('4.시간 값이 허용범위를 벗어났습니다.');
			$('input[name=starttime]').focus();
			clearBox();
			return false;
		}
		
		hh=parseInt(et.substring(0,2));
		min=parseInt(et.substring(2,4));
		
		if(hh<0 || hh>24){
			alert('5.시간 값이 허용범위를 벗어났습니다.');
			$('input[name=endtime]').focus();
			clearBox();
			return false;
		}
		if(min<0 || min>59){
			alert('6.시간 값이 허용범위를 벗어났습니다.');
			$('input[name=endtime]').focus();
			clearBox();
			return false;
		}
		
		return true;
	}
</script>