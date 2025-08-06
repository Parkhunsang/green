<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		// jQuery를 이용한 ajax명령어 $는 jQuery post 방식 전달
		// id에 입력한 frm.id의 값을 가지고 confirm.jsp를 실행
		$.post('confirm.jeong','id='+frm.userId_individual.value,function(data){
			let msg = $(data).find('#msg').text();
			$('#userId_dupChk_Message').html(msg);
			
			let result_idChk = parseInt($(data).find('#result_idChk').text());
			
		});
	}
	function chk(){
		if(!frm.userId_individual.value || frm.password.value != frm.password2.value) return false;
	}
</script>
</head>
<body>
<!-- <div class="container text-center"> -->
<section class="accountsForm">
	<h2 class="accountsForm_title">회원가입</h2>
	<form action="join.jeong" name="frm" onsubmit="return chk()">
		<fieldset>
			<div class="accountsForm_oneRow">
				<label for="userId_individual">
					<!-- <span id="userId_chk_defaultMessage">
						id
					</span>
					<span id="userId_chk_focusMessage">
						id(띄어쓰기 없이 영/숫자 6-10)
					</span> -->
				</label>
				<input type="text" name="userId_individual" id="userId_individual" required="required" autofocus="autofocus" onkeyup="dupChk()"><br/>
				<span id="userId_dupChk_Message"></span>
			</div>
			<tr>
				<th>암호</th>
				<td>
					<input type="password" name="password" required="required" class="form-control">
				</td>
			</tr>
			<tr>
				<th>암호확인</th>
				<td>
					<input type="password" name="password2" required="required"  class="form-control">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" required="required"  class="form-control">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="address" required="required"  class="form-control">
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>
					<input type="tel" name="tel" required="required" placeholder="010-1111-1111" pattern="010-\d{3,4}-\d{4}" title="전화번호 형식 : 010-1111-1111"  class="form-control" >
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="email" name="email" required="required" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control" >
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="확인"  class="btn btn-success"/>				
				</th>
			</tr>
		</fieldset>
	</form>
	<button onclick="location.href='loginForm.jeong'" class="btn btn-info">로그인</button>
</section>
 

<script type="text/javascript" src="/coomarket/js/joinForm.js"></script>
 <script type="text/javascript">
	let focusing = false;
	function dupChk(){
		$.post('confirm.jeong','id='+frm.userId.value,function(data){
			//let msg = $(data).find('#msg').text();
			$('#userId_dupChk_Message').html(data);			
		});
		
	}
	function chk(){
		if(frm.userPw.value != frm.userPw_chk.value) return false;
	}

</script>
</head>
<body>
<section class="accountsForm">
	<h2 class="accountsForm_title">회원가입</h2>
	<form action="/coomarket/member/join.jeong" name="frm" onsubmit="return chk()">
		<fieldset>
		
			<%-- 사업자 회원용 --%>
			
			<c:if test="${result==2}">
				<div class="joinForm_inputBox jF_biz">
					<label for="business_num" class="joinForm_label">
						<span>사업자 번호</span>
					</label>
					<input type="text" name="business_num" id="business_num" class="joinForm_input" required="required">
				</div>
				<div class="joinForm_inputBox jF_biz">
					<label for="company_name" class="joinForm_label">
						<span>사업자 이름</span>
					</label>
					<input type="text" name="company_name" id="company_name" class="joinForm_input" required="required">
				</div>
				<div class="joinForm_inputBox jF_biz">
					<label for="userTel" class="joinForm_label">
						<span>사업장 연락처</span>
					</label>
					<input type="tel" name="userTel" id="userTel" class="joinForm_input" required="required" placeholder="010-1111-1111" pattern="010-\d{3,4}-\d{4}" title="전화번호 형식 : 010-1111-1111">
				</div>
				<div class="joinForm_inputBox">
					<label for="userEmail_biz" class="joinForm_label">
						<span>사업자용 이메일</span>
					</label>
					<input type="email" name="userEmail_biz" id="userEmail_biz" class="joinForm_input" required="required" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
				</div>
				<div class="joinForm_inputBox jF_biz">
					<label for="userAddr" class="joinForm_label">
						<span>사업장 주소</span>
					</label>
					<input type="text" name="userAddr" id="userAddr" class="joinForm_input" required="required">
				</div>
			</c:if>
			
			<%-- 사업자 회원용 끝 --%>
			
			<div class="joinForm_inputBox">
				<label for="userId" class="joinForm_label">
					<span id="userId_focusMsg">ID</span>
				</label>
				<input type="text" name="userId" id="userId" class="joinForm_input" minlength="6" maxlength="10" required="required" onkeyup="dupChk()">
			</div>
			<p class="joinForm_chkMsg" id="userId_dupChk_Message"></p>
			<div class="joinForm_inputBox_pw" id="jFiB_pw">
				<label for="userPw" class="joinForm_label">
					<span id="userPw_focusMsg">비밀번호</span>
				</label>
				<input type="password" name="userPw" id="userPw" class="joinForm_input" minlength="8" maxlength="15" required="required">
			</div>
			<div class="joinForm_inputBox_pw" id="jFiB_pwChk">
				<label for="userPw_chk" class="joinForm_label">
					<span id="userPwChk_focusMsg">비밀번호 확인</span>
				</label>
				<input type="password" name="userPw_chk" id="userPw_chk" class="joinForm_input" minlength="8" maxlength="15" required="required">
			</div>
			<p class="joinForm_chkMsg" id="userPw_chk_Message"></p>
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
	<button onclick="location.href='/coomarket/member/loginForm.jeong'">로그인</button>
</section>

</body>
</html>