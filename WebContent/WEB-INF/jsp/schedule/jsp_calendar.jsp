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

	firstday.set(toYear, toMonth, 1);    // �ش� ���� ù ��¥�� ���Ѵ�.
	lastday.set( toYear, toMonth+1, 1);  // �ش� ���� ���� ���� ù ��¥�� ���Ѵ�.
	lastday.add(Calendar.DATE,-1);       // �ش� ���� ���������� ���Ѵ�.

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

<a href="calendar.jsp?year=<%=toYear%>&month=<%=toMonth-1%>" class="link_Dgray">��</a>
<font color="#4B4B4B" size="4"> 
<%=yyyy.format(firstday.getTime())%>��
<%=firstday.getTime().getMonth()+1%>��
 </font>

<a href="calendar.jsp?year=<%=toYear%>&month=<%=toMonth+1%>" class="link_Dgray">��</a>
</center>

</TH></TR>

<TR><TD>
<TABLE width="100%" border="1" cellspacing="0" class="10pt" bordercolorlight="#c0c0c0" bordercolordark="white">
        <tr height="25">
                <td bgcolor="#FFEBCA" align="center"><font color="red">��</td>
                <td bgcolor="#FFEBCA" align="center">��</td>
                <td bgcolor="#FFEBCA" align="center">ȭ</td>
                <td bgcolor="#FFEBCA" align="center">��</td>
                <td bgcolor="#FFEBCA" align="center">��</td>
                <td bgcolor="#FFEBCA" align="center">��</td>
                <td bgcolor="#FFEBCA" align="center"><font color="blue">��</td>
        </tr>
        <tr height="60">
        <%
// �ش� ���� 1���� ������ ���ؼ� ��ĭ�� ����.
int span = firstday.get(Calendar.DAY_OF_WEEK);

String link_css = "";
String link_priv = "";

// �ش� ���� 1�Ϻ��� ������ 1�� �������� ��¥�� ����Ѵ�.
for (int d=1;d<=lastday.get(Calendar.DATE); d++) {

        //�Ͽ����� ������ (������ �Է� ��ũ ��Ÿ�� ��)
        if (firstday.get(Calendar.DAY_OF_WEEK)%7==1) {
                link_css = "link_red"; 
        }
        //������� �Ķ���
        else if (firstday.get(Calendar.DAY_OF_WEEK)%7==0) {
                link_css = "link_blue";
        }
        //�Ϲ����� ��� ȸ��
        else {
                link_css = "link_Dgray";
        }
        
        
        //ù���� 1�� �������� ��ĭ����
        if(span > 0) {
                for(int i=1; i<span; i++) {
                        out.print("<td width='14%'> </td>");
                }
        }
        //���� ��¥�� ���� Ư���� ���������� *^^*
    if(today.equals(firstday)) {
                out.println("<td width='14%' valign='top' bgcolor='lavender'>");
        } else {
                out.println("<td width='14%' valign='top' bgcolor='#FCFBF3'>");
        }
        //�޷��� ��¥�� ������ �Է������� �ۼ� ��ũ �ɰ� ������ ���� ��ũ ������ ġ��!!!
        out.print("<a href=\"javascript:newWindow('sched_inst.jsp?dday=");
        out.print(df.format(firstday.getTime()) +"',400,300,'no')\" class='");
        out.println(link_css+"'>"+d+"</a>");

        
        
        out.println("</td>");
        
        //������̸� �����ٷ�~~~
        if (firstday.get(Calendar.DAY_OF_WEEK)%7==0) {
                out.print("</tr>");
                if(firstday.before(lastday)) {
                        out.print("<tr height=60>");
                }
        }

    span=0; //�ι�° �� ���ʹ� �տ� ��ĭ�� �����Ƿ�...
    firstday.add(Calendar.DATE, 1); //�״��� �������� ���� 1�Ͼ� ���Ѵ�.
}

// ������ ���� ������� �ƴѰ�� ��ĭ �ֱ�
if (lastday.get(Calendar.DAY_OF_WEEK)<7) {
        for(int i=lastday.get(Calendar.DAY_OF_WEEK); i<7; i++) {
                out.println("<td> </td>");
        }
        out.println("</tr>");
}
%>
    </tr>
</TABLE>
<P ALIGN=RIGHT><font color="tomato" size="2">�� ������ �Է��� �ش����� ���ڸ� ���� �ּ���.</font></P>

</TD></TR>
</TABLE>
