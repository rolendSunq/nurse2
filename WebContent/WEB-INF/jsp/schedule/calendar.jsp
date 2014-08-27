<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href='assets/css/calendar/fullcalendar.css' rel='stylesheet' />
<link href='assets/css/calendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='assets/js/calendar/jquery.min.js'></script>
<script src='assets/js/calendar/jquery-ui.custom.min.js'></script>
<script src='assets/js/calendar/fullcalendar.js'></script>
<script type="text/javascript">

	var myCurrentView="month";
	
	$(function() {
			
		loadData('${jsonList}');
		
		var radioHolder=$('input[name=type]');
		radioHolder.click(function(){
			var type=$('input[name=type]:checked').val();
			var startTime="0000";
			var endTime="0000";
			if (type === "1") {
				$('input[name=starttime]').attr("readonly",true);
				$('input[name=endtime]').attr("readonly",true);
				startTime="0700";
				endTime="1500";
			} else if (type === "2") {
				$('input[name=starttime]').attr("readonly",true);
				$('input[name=endtime]').attr("readonly",true);
				startTime="1500";
				endTime="2200";
			} else if (type === "3") {
				$('input[name=starttime]').attr("readonly",true);
				$('input[name=endtime]').attr("readonly",true);
				startTime="2200";
				endTime="0700";
			} else if (type === "4") {
				$('input[name=starttime]').attr("readonly",false);
				$('input[name=endtime]').attr("readonly",false);
				startTime="0700";
				endTime="1500";
			}
			$('input[name=starttime]').val(startTime);
			$('input[name=endtime]').val(endTime);
		});
	});
	
	function closeBox(){
		$('#dataBox').css('visibility','hidden');
		$('#confirm').css('visibility','hidden');
		$('#edit').css('visibility','hidden');
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
		var m = mkfrm(""+(date.getMonth()+1));
		var d = mkfrm(""+date.getDate());
		var h = mkfrm(""+date.getHours());
		var min = mkfrm(""+date.getMinutes());
		return y+m+d+h+min;
	}
	
	function mkfrm(str) {
		if(str.length==1) {
			str="0"+str;
		}
		if(str.length==0) {
			str="00";
		}
		return str;
	}

	function loadData(data){
		
		//데이타 가공
		var sourceData=JSON.parse(data);
		for(var idx=0; idx < sourceData.length; idx++) {
			sourceData[idx].title = decodeURI(sourceData[idx].title);
			sourceData[idx].start = stringToDate(sourceData[idx].start); //날자 String을 날자 객체로 변경
			
			if(sourceData[idx].end!=null){
				sourceData[idx].end = stringToDate(sourceData[idx].end);
			}
			if(sourceData[idx].allDay!=null && sourceData[idx].allDay!="true"){
				sourceData[idx].allDay=false;
			}
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
			
			select: function(start, end, allDay) {
				
				$('#dataBox').css('visibility','visible');
				$('#confirm').css('visibility','visible');
				$('#edit').css('visibility','hidden');
				clearBox();
				
				var strStart = dateToString(start);
				var strEnd = dateToString(end);
				var strStartTime = strStart.substring(8,12);
				var strEndTime = strEnd.substring(8,12);
				
				///---
				if(strStartTime=="0000" || strEndTime=="0000"){ // 월 모드
					
					var type=$('input[name=type]:checked').val();
					if(type == "4"){
						//TODO:직접입력 값 제약사항 체크 로직
						//alert('checked 4 > TODO:직접입력 값 제약사항 체크 로직');
					} else {
						//alert("type: "+type);
						if (type === "1") {
							strStartTime="0700";
							strEndTime="1500";
						} else if (type === "2") {
							strStartTime="1500";
							strEndTime="2200";
						} else if (type === "3") {
							//2개로 분리 (익일 추가 후반부 더 할 것) > 기획자의 의견에 따라 그냥 유지 함
							strStartTime="2200";
							strEndTime="0700";
						}
						
					}
					
				} else { // 주,일 모드
					$('input[name=type]').eq(3).attr("checked",true);
				
				}
				///---
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
							calendar.fullCalendar('refetchEvents');
							
							$('#dataBox').css('visibility','hidden');
						}
					}
					
				});
			},
			viewDisplay: function(view) { 
				//alert('viewDisplay(' + view.name + ')');
				//alert("typeof $('input[type=radio]') > "+typeof $('input[type=radio]'));
				myCurrentView=view.name;
				if(myCurrentView=="month"){
					
					if(typeof $('input[type=radio]')=="undefined"){
						location.reload();
					}
					$('#radio1').attr("checked","checked");
					$("#radio1").prop("checked", true); //For jQuery 1.9 or higher use
				} else {
					$('#radio4').attr("checked","checked");
					$("#radio4").prop("checked", true); //For jQuery 1.9 or higher use
				}
				
			},
			eventDrop: function (event, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view) {
		        //중요:날자 정보가 1일 인경우,
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
		        alert(chStartDate+"/"+chEndDate);
		        
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
						loadData(data);
					});
				}
		    },
		    eventResize: function(event, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view) { 
		    	alert("event.id: "+event.id+"\n"+
			        	  "event.title: "+event.title+"\n"+
			        	  "event.start: "+dateToString(event.start)+"\n"+
			        	  "event.end: "+dateToString(event.end)+"\n"+
			        	  "dayDelta: "+dayDelta+"\n"+
			        	  "minuteDelta: "+minuteDelta+"\n");
		    	var chStartDate=dateToString(event.start);
		        var chEndDate;
				
		        if(event.end==null){
		        	chEndDate=chStartDate.substring(0,8)+"0700";
		        } else {
		        	chEndDate=dateToString(event.end);
		        }
		        alert(chStartDate+"/"+chEndDate);
		        
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
						loadData(data);
					});
			    }
		        
		    },
		    eventAfterRender: function(event, element, view) {
		    	/*
		    	var width = $(element).width();

		        if($(element).hasClass("HalfClass")) {
		           width = width / 2;
		        }
		        if($(element).hasClass("QuarterClass")) {
		           width = width / 4;
		        }
		        $(element).css('width', width + 'px');
		        */
		    },
			editable: true,
			disableResizing:false,
		    disableDragging:false,
			events: sourceData
		});		
	} 
	
	function insertData(){
		//TODO:야간 선택 시 선택 시간대를 둘로 나누어서 두 번 입력 할 것.
		//2200~2400, 익일 2400~0700
		var titleArray=$('select[name=titleSelect]').val().split(":"); //jobno:name > parsing
		$('input[name=title]').val(titleArray[1]);
		$('input[name=jobno]').val(titleArray[0]);
		
		var startTime=$('input[name=starttime]').val();
		var endTime=$('input[name=endtime]').val();
		$('input[name=startdate]').val($('input[name=startdate]').val()+startTime);
		$('input[name=enddate]').val($('input[name=enddate]').val()+endTime);
		//alert($('input[name=startdate]').val()+"-"+$('input[name=enddate]').val());
		
		var params = $('#frm').serialize();
		$.post("calendar.do?method=insert",
			params,
			function(data){
				loadData(data);
			}
		);
		$('#dataBox').css('visibility','hidden');
		$('#confirm').css('visibility','hidden');
		$('#edit').css('visibility','hidden');
		clearBox();
		
	}

	//캘린더 창 > 내용 링크 클릭 시 호출 됨
	function editBox(title, id, start, end, all, type, jobno) {
		//TODO: jobno:name parsing
		//alert(type);
		$('#dataBox').css('visibility','visible');
		$('#confirm').css('visibility','hidden');
		$('#edit').css('visibility','visible');
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
		if(startTime==endTime){
			endTime="0700";
		}
		//--------------------------------------------------------
		$('input[name=starttime]').val(startTime);
		$('input[name=endtime]').val(endTime);
		
		$('input[name=allday]').val(all);
		
		$("input[name=type][value=" + type + "]").attr("checked", "checked");
		$("input[name=type][value=" + type + "]").prop("checked", true);
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
	}

	function deleteData() {
		$('#dataBox').css('visibility', 'hidden');
		$('#confirm').css('visibility','hidden');
		$('#edit').css('visibility','hidden');
		var params = $('#frm').serialize();
		$.post("calendar.do?method=delete", params, function(data) {
			loadData(data);
		});
		clearBox();
	}

	function updateData() {
		$('#dataBox').css('visibility', 'hidden');
		$('#confirm').css('visibility','hidden');
		$('#edit').css('visibility','hidden');
		
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
		}
		$('input[name=startdate]').val(start.substring(0,8)+startTime);
		$('input[name=enddate]').val(end.substring(0,8)+endTime);

		var params = $('#frm').serialize();
		$.post("calendar.do?method=update", params, function(data) {
			loadData(data);
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
</script>
<style>
	body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	}

	#calendar {
		width: 900px;
		margin: 0 auto;
	}
	#dataBox {
		positionType:'absolute'; 
		positionTop:100; 
		eventType:'click'; 
		positionLeft:100; 
		windowSourceID:'#example4InlineContent'; 
		windowPadding:20; 
		draggable:1; 
		windowBGColor:'#FFFF00'; 
		borderColor:'#990000'; 
		overlayOpacity:0;
		
		background:pink;
		position:absolute; 
		top:200px;
		left:200px;
		width:400px;
		visibility:hidden;
		z-index:100;
	}
	
</style>
</head>
<body>
 <div id='calendar'></div> 

 <div id='dataBox'>
 <form method='post' id='frm'>
 <input type='hidden' name='allday' value="false"/>
 <input type='hidden' name='url' value=""/>
 <input type='hidden' name='manager' value=""/> <!-- 확장기능대비 칼럼 -->
 <input type='hidden' name='dno' value=""/> <!-- 확장기능대비 칼럼 -->
 <input type='hidden' name='title' value=""/>
 <input type='hidden' name='jobno' value=""/>
 
 <input type='hidden' name='sno' value=""/>
 	<table id="example4InlineContent" width="400">
 		<tr><td>시작일</td>
 			<td align="left">
 				<input type='text' name='startdate' value="" size="10"/>picker
 			</td>
 		</tr>
 		<tr><td>종료일</td>
 			<td align="left">
 				<input type='text' name='enddate' value="" size="10"/>picker
 			</td>
 		</tr>
 		<tr><td>근무선택</td>
 			<td align="left">
 				<input type="radio" name="type" id="radio1" value="1" checked>오전
 				<input type="radio" name="type" id="radio2" value="2">오후
 				<input type="radio" name="type" id="radio3" value="3">야간
 				<input type="radio" name="type" id="radio4" value="4">직접입력
 			</td>
 		</tr>
 		<tr><td>근무시간</td>
 			<td align="left">
 				시작: <input type="text" name="starttime" size="4" value="0700" readonly> -&nbsp;
 				종료: <input type="text" name="endtime" size="4" value="1500" readonly>
 			</td>
 		</tr>
 		<tr><td>이름</td>
 			<td align="left">
 				<select name="titleSelect">
 					<c:forEach var="n" items="${nurse }">
 						<option value="${n.jobno }:${n.name }">${n.name }</option>
 					</c:forEach>
 				</select>
 			</td>
 		</tr>
 		<tr>
  			<td colspan="2">
  			<label id="confirm" style="visibility:hidden;"><input type='button' name='confirm' value='확인'/></label>&nbsp;
  			<input type='button' name='close' value='닫기' onClick="javascript:closeBox();"/>&nbsp;
  			<label id="edit" style="visibility:hidden;">
  			<input type='button' name='delete' value='삭제' onClick="javascript:deleteData();"/>&nbsp;
  			<input type='button' name='update' value='수정' onClick="javascript:updateData();"/>
  			</label>
  			</td>
 		</tr>
 	</table>
 </form>
 </div>
</body>
</html>
