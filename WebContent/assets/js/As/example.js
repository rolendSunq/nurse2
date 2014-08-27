$(document).ready(function () {
	var phone=$("input[name=phone]");

	//체크박스마다변경하기.
	$("#not").click(function (){
		if(phone.is(":checked")==false){
			alert("핸드폰 종류를 먼저 체크해주세요.");
		}
		for(var i=0;i<phone.length; i++){
			if(phone[i].checked && phone[i].value=='sam'){
				$("#not").hide();
				$("#LG").hide();
				$("#apple").hide();
				$("#samsung").show();
				$("#total").hide();
				return;
			}else if (phone[i].checked && phone[i].value=='Lg') {
				$("#not").hide();
				$("#apple").hide();
				$("#samsung").hide();
				$("#LG").show();
				$("#total").hide();
				return;
			}
			else if (phone[i].checked && phone[i].value=='Apple') {
				$("#not").hide();
				$("#LG").hide();
				$("#samsung").hide();
				$("#apple").show();
				$("#total").hide();
				return;
			}
			else if(phone[i].checked && phone[i].value=='total'){
				$("#not").hide();
				$("#LG").hide();
				$("#samsung").hide();
				$("#apple").hide();
				$("#total").show();
			}
		}
	});
	// 삼성에서변경.
	$("#samsung").click(function (){
		if(phone.is(":checked")==false){
			alert("핸드폰 종류를 먼저 체크해주세요.");
		}
		for(var i=0;i<phone.length; i++){
			if(phone[i].checked && phone[i].value=='sam'){
				$("#not").hide();
				$("#LG").hide();
				$("#apple").hide();
				$("#samsung").show();
				$("#total").hide();
				return;
			}else if (phone[i].checked && phone[i].value=='Lg') {
				$("#not").hide();
				$("#apple").hide();
				$("#samsung").hide();
				$("#LG").show();
				$("#total").hide();
				return;
			}
			else if (phone[i].checked && phone[i].value=='Apple') {
				$("#not").hide();
				$("#LG").hide();
				$("#samsung").hide();
				$("#apple").show();
				$("#total").hide();
				return;
			}
			else if(phone[i].checked && phone[i].value=='total'){
				$("#not").hide();
				$("#LG").hide();
				$("#samsung").hide();
				$("#apple").hide();
				$("#total").show();
			}
		}
	});
	//LG에서 변경
	$("#LG").click(function (){
		if(phone.is(":checked")==false){
			alert("핸드폰 종류를 먼저 체크해주세요.");
		}
		for(var i=0;i<phone.length; i++){
			if(phone[i].checked && phone[i].value=='sam'){
				$("#not").hide();
				$("#LG").hide();
				$("#apple").hide();
				$("#samsung").show();
				$("#total").hide();
				return;
			}else if (phone[i].checked && phone[i].value=='Lg') {
				$("#not").hide();
				$("#apple").hide();
				$("#samsung").hide();
				$("#LG").show();
				$("#total").hide();
				return;
			}
			else if (phone[i].checked && phone[i].value=='Apple') {
				$("#not").hide();
				$("#LG").hide();
				$("#samsung").hide();
				$("#apple").show();
				$("#total").hide();
				return;
			}
			else if(phone[i].checked && phone[i].value=='total'){
				$("#not").hide();
				$("#LG").hide();
				$("#samsung").hide();
				$("#apple").hide();
				$("#total").show();
			}
		}
	});
	//Apple
	$("#apple").click(function (){
	if(phone.is(":checked")==false){
		alert("핸드폰 종류를 먼저 체크해주세요.");
	}
	for(var i=0;i<phone.length; i++){
		if(phone[i].checked && phone[i].value=='sam'){
			$("#not").hide();
			$("#LG").hide();
			$("#apple").hide();
			$("#samsung").show();
			$("#total").hide();
			return;
		}else if (phone[i].checked && phone[i].value=='Lg') {
			$("#not").hide();
			$("#apple").hide();
			$("#samsung").hide();
			$("#LG").show();
			$("#total").hide();
			return;
		}
		else if (phone[i].checked && phone[i].value=='Apple') {
			$("#not").hide();
			$("#LG").hide();
			$("#samsung").hide();
			$("#apple").show();
			$("#total").hide();
			return;
		}
		else if(phone[i].checked && phone[i].value=='total'){
			$("#not").hide();
			$("#LG").hide();
			$("#samsung").hide();
			$("#apple").hide();
			$("#total").show();
		}
	}
});
//total
	$("#total").click(function (){
		if(phone.is(":checked")==false){
			alert("핸드폰 종류를 먼저 체크해주세요.");
		}
		for(var i=0;i<phone.length; i++){
			if(phone[i].checked && phone[i].value=='sam'){
				$("#not").hide();
				$("#LG").hide();
				$("#apple").hide();
				$("#samsung").show();
				$("#total").hide();
				return;
			}else if (phone[i].checked && phone[i].value=='Lg') {
				$("#not").hide();
				$("#apple").hide();
				$("#samsung").hide();
				$("#LG").show();
				$("#total").hide();
				return;
			}
			else if (phone[i].checked && phone[i].value=='Apple') {
				$("#not").hide();
				$("#LG").hide();
				$("#samsung").hide();
				$("#apple").show();
				$("#total").hide();
				return;
			}
		
		}
	});
		

});
