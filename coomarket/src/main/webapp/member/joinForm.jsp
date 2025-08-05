<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	@import url("/coomarket/css/member/account.css");
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" src="/coomarket/js/joinForm.js"></script>
 <script type="text/javascript">
	let focusing = false;
	function dupChk(){
		$.post('confirm.jeong','id='+frm.userId_individual.value,function(data){
			//let msg = $(data).find('#msg').text();
			$('#userId_dupChk_Message').html(data);			
		});
		
	}
	function chk(){
		if(!frm.userId_individual.value || frm.userPw_individual.value != frm.userPw_individual_chk.value) return false;
	}

</script>
</head>
<body>
<section class="accountsForm">
	<h2 class="accountsForm_title">회원가입</h2>
	<form action="join.jeong" name="frm" onsubmit="return chk()">
		<fieldset>
			<div class="joinForm_inputBox">
				<label for="userId_individual" class="joinForm_label">
					<span id="userId_focusMsg">ID</span>
				</label>
				<input type="text" name="userId_individual" id="userId_individual" class="joinForm_input" minlength="6" maxlength="10" required="required" onkeyup="dupChk()">
			</div>
			<p class="joinForm_chkMsg" id="userId_dupChk_Message"></p>
			<div class="joinForm_inputBox_pw" id="jFiB_pw">
				<label for="userPw_individual" class="joinForm_label">
					<span id="userPw_focusMsg">비밀번호</span>
				</label>
				<input type="password" name="userPw_individual" id="userPw_individual" class="joinForm_input" minlength="8" maxlength="15" required="required">
			</div>
			<div class="joinForm_inputBox_pw" id="jFiB_pwChk">
				<label for="userPw_individual_chk" class="joinForm_label">
					<span id="userPwChk_focusMsg">비밀번호 확인</span>
				</label>
				<input type="password" name="userPw_individual_chk" id="userPw_individual_chk" class="joinForm_input" minlength="8" maxlength="15" required="required">
			</div>
			<p class="joinForm_chkMsg" id="userPw_chk_Message"></p>
			<div class="joinForm_inputBox">
				<label for="userName_individual" class="joinForm_label">
					<span>이름</span>
				</label>
				<input type="text" name="userName_individual" id="userName_individual" class="joinForm_input" required="required">
			</div>
			<p class="joinForm_chkMsg" id="userName_chk_Message"></p>
			<div class="joinForm_inputBox">
				<label for="userAddress_individual" class="joinForm_label">
					<span>주소</span>
				</label>
				<input type="text" name="userAddress_individual" id="userAddress_individual" class="joinForm_input" required="required">
			</div>
			<p class="joinForm_chkMsg" id="userAddr_chk_Message"></p>
			<div class="joinForm_inputBox">
				<label for="userTel_individual" class="joinForm_label">
					<span>연락처</span>
				</label>
				<input type="tel" name="userTel_individual" id="userTel_individual" class="joinForm_input" required="required" placeholder="010-1111-1111" pattern="010-\d{3,4}-\d{4}" title="전화번호 형식 : 010-1111-1111">
			</div>
			<p class="joinForm_chkMsg" id="userTel_chk_Message"></p>
			<div class="joinForm_inputBox">
				<label for="userEmail_individual" class="joinForm_label">
					<span>이메일</span>
				</label>
				<input type="email" name="userEmail_individual" id="userEmail_individual" class="joinForm_input" required="required" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
			</div>
			<p class="joinForm_chkMsg" id="userEmail_chk_Message"></p>
			<div>
				<input type="submit" value="확인" />
			</div>
		</fieldset>
	</form>
	<button onclick="location.href='loginForm.jeong'">로그인</button>
</section>
</body>
</html>