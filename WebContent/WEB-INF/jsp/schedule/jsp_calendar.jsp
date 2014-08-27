<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
	String year="2013";
	String month="11";
	
	int toYear  = 0;
	int toMonth = 0;

	Calendar today    = Calendar.getInstance();
	Calendar firstday = Calendar.getInstance();
	Calendar lastday  = Calendar.getInstance();

	if(year != null) {
	        toYear = Integer.parseInt(year);
	} 
	else {
	        toYear = today.get(Calendar.YEAR);
	}
	if(month != null) {
	        toMonth = Integer.parseInt(month);
	}
	else {
	        toMonth = today.get(Calendar.MONTH);
	}

	firstday.set(toYear, toMonth, 1);    // 해당 월의 첫 날짜를 구한다.
	lastday.set( toYear, toMonth+1, 1);  // 해당 월의 다음 달의 첫 날짜를 구한다.
	lastday.add(Calendar.DATE,-1);       // 해당 월의 마지막날을 구한다.

	DateFormat df   = new SimpleDateFormat("yyyyMMdd");
	DateFormat sdf  = new SimpleDateFormat("M.d");
	DateFormat yyyy = new SimpleDateFormat("yyyy");
	String first = df.format(firstday.getTime());
	String last  = df.format(lastday.getTime());
%>
<%=year %>-<%=month %>
<center>

<TABLE WIDTH=650>
<TR><TH>

<a href="calendar.jsp?year=<%=toYear%>&month=<%=toMonth-1%>" class="link_Dgray">◁</a>
<font color="#4B4B4B" size="4"> 
<%=yyyy.format(firstday.getTime())%>년
<%=firstday.getTime().getMonth()+1%>월
 </font>

<a href="calendar.jsp?year=<%=toYear%>&month=<%=toMonth+1%>" class="link_Dgray">▷</a>
</center>

</TH></TR>

<TR><TD>
<TABLE width="100%" border="1" cellspacing="0" class="10pt" bordercolorlight="#c0c0c0" bordercolordark="white">
        <tr height="25">
                <td bgcolor="#FFEBCA" align="center"><font color="red">일</td>
                <td bgcolor="#FFEBCA" align="center">월</td>
                <td bgcolor="#FFEBCA" align="center">화</td>
                <td bgcolor="#FFEBCA" align="center">수</td>
                <td bgcolor="#FFEBCA" align="center">목</td>
                <td bgcolor="#FFEBCA" align="center">금</td>
                <td bgcolor="#FFEBCA" align="center"><font color="blue">토</td>
        </tr>
        <tr height="60">
        <%
// 해당 월의 1일의 요일을 구해서 앞칸을 비운다.
int span = firstday.get(Calendar.DAY_OF_WEEK);

String link_css = "";
String link_priv = "";

// 해당 월의 1일부터 다음달 1일 전까지의 날짜를 출력한다.
for (int d=1;d<=lastday.get(Calendar.DATE); d++) {

        //일요일은 빨간색 (스케쥴 입력 링크 스타일 색)
        if (firstday.get(Calendar.DAY_OF_WEEK)%7==1) {
                link_css = "link_red"; 
        }
        //토요일은 파란색
        else if (firstday.get(Calendar.DAY_OF_WEEK)%7==0) {
                link_css = "link_blue";
        }
        //일반일은 어둔 회색
        else {
                link_css = "link_Dgray";
        }
        
        
        //첫줄의 1일 전날들은 빈칸으로
        if(span > 0) {
                for(int i=1; i<span; i++) {
                        out.print("<td width='14%'> </td>");
                }
        }
        //오늘 날짜는 좀더 특별한 바탕색으로 *^^*
    if(today.equals(firstday)) {
                out.println("<td width='14%' valign='top' bgcolor='lavender'>");
        } else {
                out.println("<td width='14%' valign='top' bgcolor='#FCFBF3'>");
        }
        //달력의 날짜에 스케쥴 입력페이지 작성 링크 걸고 위에서 구한 링크 색으로 치장!!!
        out.print("<a href=\"javascript:newWindow('sched_inst.jsp?dday=");
        out.print(df.format(firstday.getTime()) +"',400,300,'no')\" class='");
        out.println(link_css+"'>"+d+"</a>");

        
        
        out.println("</td>");
        
        //토요일이면 다음줄로~~~
        if (firstday.get(Calendar.DAY_OF_WEEK)%7==0) {
                out.print("</tr>");
                if(firstday.before(lastday)) {
                        out.print("<tr height=60>");
                }
        }

    span=0; //두번째 줄 부터는 앞에 빈칸이 없으므로...
    firstday.add(Calendar.DATE, 1); //그달의 마지막날 까지 1일씩 더한다.
}

// 마지막 날이 토요일이 아닌경우 빈칸 넣기
if (lastday.get(Calendar.DAY_OF_WEEK)<7) {
        for(int i=lastday.get(Calendar.DAY_OF_WEEK); i<7; i++) {
                out.println("<td> </td>");
        }
        out.println("</tr>");
}
%>
    </tr>
</TABLE>
<P ALIGN=RIGHT><font color="tomato" size="2">※ 스케쥴 입력은 해당일의 숫자를 눌러 주세요.</font></P>

</TD></TR>
</TABLE>
