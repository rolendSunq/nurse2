$(document).ready(function () {
	var phone=$("input[name=phone]");

	//üũ�ڽ����ٺ����ϱ�.
	$("#not").click(function (){
		if(phone.is(":checked")==false){
			alert("�ڵ��� ������ ���� üũ���ּ���.");
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
	// �Ｚ��������.
	$("#samsung").click(function (){
		if(phone.is(":checked")==false){
			alert("�ڵ��� ������ ���� üũ���ּ���.");
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
	//LG���� ����
	$("#LG").click(function (){
		if(phone.is(":checked")==false){
			alert("�ڵ��� ������ ���� üũ���ּ���.");
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
		alert("�ڵ��� ������ ���� üũ���ּ���.");
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
			alert("�ڵ��� ������ ���� üũ���ּ���.");
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
