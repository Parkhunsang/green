<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("/coomarket/css/common/common.css");
	@import url("/coomarket/css/member/account.css");
</style>
</head>
<body>
<section class="accountsForm">
    <h1 class="accountsForm_title">로그인</h1>
    <div id="loginForm_inner">
        <form action="/coomarket/member/login.jeong">
            <div class="loginForm_inputBox">
                <label for="loginId">※</label>
                <input type="text" name="userId" id="loginId" required="required" placeholder="아이디"/>
            </div>
            <div class="loginForm_inputBox">
                <label for="loginPw">※</label>
                <input type="password" name="userPw" id="loginPw" required="required" placeholder="비밀번호"/>
            </div>
            <input type="submit" id="loginSubmit" value="로그인">
        </form>
        <a href="/coomarket/member/joinType.jeong" id="loginForm_joinLink">아직 계정이 없으세요???? >><span>회원가입</span></a>
    </div>
</section>
</body>
</html>