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
 
</body>
</html>