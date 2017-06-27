function idCheck(){

	var regmobile = /^\d{3}-\d{3,4}-\d{4}$/;
	 
	var regemail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	
	var regpw = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,12}$/;
	
	if(!regpw.test(document.getElementById("u_pw").value)){
		alert("비밀번호는 8~12자리의 영문 대소문자와 최소 1개의 숫자 혹은 특수 문자를 포함해야 합니다");
		return false;
	}
	else if(document.getElementById("u_pw").value != document.getElementById("passcheck").value){
		alert("비밀번호가 동일하지 않습니다.");
		return false;
	}
	else if (!regemail.test(document.getElementById("u_email").value)) {
		alert("올바른 이메일 주소를 입력하세요. (ex : userid@nodazi.com)");
		return false;
	}
	else if(!regmobile.test(document.getElementById("u_mobile").value)){
		alert("올바른 핸드폰번호를 입력해주세요. (ex : 000-0000-0000)");
		return false;
	}
	 

	return true;
}
