$(function(){
	/** 아이디 */
	$('#userId').on('focus',function(){
		$('#userId_focusMsg').html("ID (띄어쓰기 없이 영/숫자 6-10)");
	});
	$('#userId').on('blur',function(){
		$('#userId_focusMsg').html("ID");
		$('#userId_dupChk_Message').html("");
	});

	
	/** 비밀번호 */
	$('#userPw').on('focus',function(){
		$('#userPw_focusMsg').html("비밀번호(8-15자의 영문 대소문자, 숫자)");
	});
	$('#userPw').on('blur',function(){
		$('#userPw_focusMsg').html("비밀번호");
	});

	
	/** 비밀번호 확인 */
	$('#userPw_chk').on('focus',function(){
		$('#userPwChk_focusMsg').html("비밀번호 재입력");
	});
	$('#userPw_chk').on('blur',function(){
		$('#userPwChk_focusMsg').html("비밀번호 확인");
	});

})