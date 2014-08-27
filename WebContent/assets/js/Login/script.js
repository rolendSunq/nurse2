function memIdCheck(){ // 회원가입 페이지의 중복체크 페이지 연결
	 window.open("memIdCheck.do","post","width=600, height=600, toolbar=no");
 }
 function memZipCheck(){ // 회원가입 페이지의 우편번호 검색 페이지 연결
	 var url = "memZipCheck.do?check=false";
	 window.open(url,"post","width=600, height=600, directories=no, status=yes, scrollbars=yes, menubar=no");
 }
