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
</head>
<body>
<section class="accountsForm">
    <h2 class="accountsForm_title">회원가입</h2>
    <form action="/coomarket/member/joinTypeAction.jeong">
        <div id="formBox_joinType">
            <ul id="joinType_list">
                <li>
                    <input type="radio" name="joinTypes" id="joinType_individual" value="individual"/>
                    <label for="joinType_individual">일반회원 가입</label>
                </li>
                <li>
                    <input type="radio" name="joinTypes" id="joinType_business" value="business"/>
                    <label for="joinType_business">사업자회원 가입</label>
                </li>
            </ul>
            <input type="submit" value="가입하기" id="joinType_btn"/>
        </div>
    </form>
</section>
</body>
</html>