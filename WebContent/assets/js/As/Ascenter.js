$(document).ready(function () {
	var check=$("input[type=checkbox]");
	var sam=$("input[name=samsung]");
	var LG=$("input[name=LG]");
	var apple=$("input[name=apple]");
	//체크박스마다변경하기.
	$("#not").click(function (){
		if(sam.is(":checked")==false && 
				LG.is(":checked")==false && apple.is(":checked")==false){
			alert("핸드폰 종류를 먼저 체크해주세요.");
		}else if(sam.is(":checked")){
			$("#not").hide();
			$("#LG").hide();
			$("#apple").hide();
			$("#samsung").show();
			return;
		}else if (LG.is(":checked")) {
			$("#not").hide();
			$("#apple").hide();
			$("#samsung").hide();
			$("#LG").show();
			return;
		}
		else if (apple.is(":checked")) {
			$("#not").hide();
			$("#LG").hide();
			$("#samsung").hide();
			$("#apple").show();
			return;
		}
		else if(sam.is(":checked")==true && LG.is(":checked")==true &&
			apple.is(":checked")==true ){
			$("#not").hide();
			$("#LG").hide();
			$("#apple").hide();
			$("#samsung").hide();
			$("#total").show();
		}
	});
	// 삼성에서변경.
	$("#samsung").click(function (){
		if(sam.is(":checked")==false && 
				LG.is(":checked")==false && apple.is(":checked")==false){
			alert("핸드폰 종류를 먼저 체크해주세요.");
		}else if(sam.is(":checked")){
			$("#not").hide();
			$("#LG").hide();
			$("#apple").hide();
			$("#samsung").show();
			return;
		}else if (LG.is(":checked")) {
			$("#not").hide();
			$("#apple").hide();
			$("#samsung").hide();
			$("#LG").show();
			return;
		}
		else if (apple.is(":checked")) {
			$("#not").hide();
			$("#LG").hide();
			$("#samsung").hide();
			$("#apple").show();
			return;
		}
	});
	//LG에서 변경
	$("#LG").click(function (){
		if(sam.is(":checked")==false && 
				LG.is(":checked")==false && apple.is(":checked")==false){
			alert("핸드폰 종류를 먼저 체크해주세요.");
		}else if(sam.is(":checked")){
			$("#not").hide();
			$("#LG").hide();
			$("#apple").hide();
			$("#samsung").show();
			return;
		}else if (LG.is(":checked")) {
			$("#not").hide();
			$("#apple").hide();
			$("#samsung").hide();
			$("#LG").show();
			return;
		}
		else if (apple.is(":checked")) {
			$("#not").hide();
			$("#LG").hide();
			$("#samsung").hide();
			$("#apple").show();
			return;
		}
	});
	//Apple
	$("#apple").click(function (){
		if(sam.is(":checked")==false && 
				LG.is(":checked")==false && apple.is(":checked")==false){
			alert("핸드폰 종류를 먼저 체크해주세요.");
		}else if(sam.is(":checked")){
			$("#not").hide();
			$("#LG").hide();
			$("#apple").hide();
			$("#samsung").show();
			return;
		}else if (LG.is(":checked")) {
			$("#not").hide();
			$("#apple").hide();
			$("#samsung").hide();
			$("#LG").show();
			return;
		}
		else if (apple.is(":checked")) {
			$("#not").hide();
			$("#LG").hide();
			$("#samsung").hide();
			$("#apple").show();
			return;
		}
	});


});
