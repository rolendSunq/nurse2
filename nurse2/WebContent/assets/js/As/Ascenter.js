$(document).ready(function () {
	var check=$("input[type=checkbox]");
	var sam=$("input[name=samsung]");
	var LG=$("input[name=LG]");
	var apple=$("input[name=apple]");
	//üũ�ڽ����ٺ����ϱ�.
	$("#not").click(function (){
		if(sam.is(":checked")==false && 
				LG.is(":checked")==false && apple.is(":checked")==false){
			alert("�ڵ��� ������ ���� üũ���ּ���.");
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
	// �Ｚ��������.
	$("#samsung").click(function (){
		if(sam.is(":checked")==false && 
				LG.is(":checked")==false && apple.is(":checked")==false){
			alert("�ڵ��� ������ ���� üũ���ּ���.");
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
	//LG���� ����
	$("#LG").click(function (){
		if(sam.is(":checked")==false && 
				LG.is(":checked")==false && apple.is(":checked")==false){
			alert("�ڵ��� ������ ���� üũ���ּ���.");
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
			alert("�ڵ��� ������ ���� üũ���ּ���.");
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
