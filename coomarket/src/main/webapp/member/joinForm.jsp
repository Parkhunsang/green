<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	@import url("/coomarket/css/common.css");
	@import url("/coomarket/css/member/account.css");
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 <script type="text/javascript">
	let focusing = false;
	function dupChk(){
		$.post('confirm.jeong','id='+frm.userId_individual.value,function(data){
			let msg = $(data).find('#msg').text();
			$('#userId_dupChk_Message').html(msg);
			// 현재 confirm.jsp 파일의 html문서를 통으로 긁어오면서 내부의 #msg를 찾지 못하는 문제가 있습니다
			// 아까는 됐는디...
		});
		
	}
	function chk(){
		if(!frm.userId_individual.value || frm.userPw_individual.value != frm.userPw_individual_chk.value) return false;
	}
	$(function(){
		$('#userId_individual').on('focus',function(){
			$('#userId_chk_focusMessage').html("ID (띄어쓰기 없이 영/숫자 6-10)");
		});
		$('#userId_individual').on('blur',function(){
			$('#userId_chk_focusMessage').html("ID");
		});
	})
</script>
</head>
<body>
<section class="accountsForm">
	<h2 class="accountsForm_title">회원가입</h2>
	<form action="join.jeong" name="frm" onsubmit="return chk()">
		<fieldset>
			<div class="accountsForm_oneRow">
				<label for="userId_individual">
					<span id="userId_chk_focusMessage">ID</span>
				</label>
				<input type="text" name="userId_individual" id="userId_individual" required="required" onkeyup="dupChk()"><br/>
				<span id="userId_dupChk_Message"></span>
			</div>
			<div>
				<label for="userPw_individual">비밀번호</label>
					<input type="password" name="userPw_individual" id="userPw_individual" required="required">
			</div>
			<div>
				<label for="userPw_individual_chk">비밀번호 확인</label>
					<input type="password" name="userPw_individual_chk" id="userPw_individual_chk" required="required">
			</div>
			<div>
				<label for="userName_individual">이름</label>
				<input type="text" name="userName_individual" id="userName_individual" required="required">
			</div>
			<div>
				<label for="userAddress_individual">주소</label>
				<input type="text" name="userAddress_individual" id="userAddress_individual" required="required">
			</div>
			<div>
				<label for="userTel_individual">연락처</label>
				<input type="tel" name="userTel_individual" id="userTel_individual" required="required" placeholder="010-1111-1111" pattern="010-\d{3,4}-\d{4}" title="전화번호 형식 : 010-1111-1111">
			</div>
			<div>
				<label for="userEmail_individual">이메일</label>
				<input type="email" name="userEmail_individual" id="userEmail_individual" required="required" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
			</div>
			<div>
				<input type="submit" value="확인" />
			</div>
		</fieldset>
	</form>
	<button onclick="location.href='loginForm.jeong'">로그인</button>
</section>
</body>
</html>