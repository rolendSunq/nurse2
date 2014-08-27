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
        $(document).ready(function(){
        	
            $("#datepicker").datepicker({
                showMonthAfterYear: true,
                changeYear: true,
                showButtonPanel: true,
                yearRange:  "-5:+5", //-5:+5 , 2000:2020
                altFormat:  "yy-mm-dd",
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
            
        });
    </script>

    <style>
        body {font-size:9pt}
        /*img {vertical-align:middle}*/
        #datepicker { margin:2px 2px; height:15px; width:75px;vertical-align:center}
    </style>
    
 </head>
 <body><center>
    jquery.ui.datepicker 이용 : <input type="text" id="datepicker" readonly><br/>
    <a class="left" href="<%=request.getContextPath()%>/nakil.do?method=datagraph"> <<< Back to the Login </a>
    <!-- controller test 용
    // http://localhost:8080/nurse2/calendar.do?method=date
	@RequestMapping(params = "method=date")
	public String datePicker(){
		return "WEB-INF/jsp/schedule/datepicker";
	}
     -->
 </center></body>
</html>


