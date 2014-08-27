<%@ page language="java" contentType="text/plain; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
	String keyword = request.getParameter("keyword");
	String[] results=null;
	
	String[] keywords={
			"Aaa1",
			"Aaa2",
			"Aaa3",
			"ActionScript",
 			"AppleScript",
 			"Asp",
 			"BASIC",
 			"C",
 			"C++",
 			"Clojure",
 			"COBOL",
 			"ColdFusion",
 			"Erlang",
 			"Fortran",
 			"Groovy",
 			"Haskell",
 			"Java",
 			"JavaScript",
 			"Lisp",
 			"Perl",
 			"Perl2",
 			"Perl3",
 			"Perl4",
 			"Perl5",
 			"PHP",
 			"Python",
 			"Ruby",
 			"Scala",
 			"Scheme"
	};
	
	boolean isFirst = true;

	for(String kw:keywords){
		if(kw.toUpperCase().substring(0,1).equals(keyword.toUpperCase().substring(0,1))){
			if(kw.toUpperCase().indexOf(keyword.toUpperCase()) != -1){
				if(isFirst){
					isFirst = false;
				} else {
					out.print(",");
				}
				out.print(kw);
			}
		}
	}
%>
