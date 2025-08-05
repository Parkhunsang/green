<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set var="id" value='${sessionScope.id}'></c:set>
<head>
<meta charset="UTF-8">
<title>Coo-Market</title>

<script type="text/javascript">

</script>
</head>
<body>
	<header>
		<div id="headderInner">
			<div id="headerInner_top">
				<h1 id="headerLogo">
					<a href="/coomarket//main.jeong">Coo</a>
				</h1>
				<!-- <div id="headerInner_menuBox"> -->
					<nav id="mainMenu">
						<h2 class="hidden">메인메뉴</h2>
						<ul id="mainMenu_list">
							<li>중고거래</li>
							<li>쿠스토어</li>
							<li>우리동네</li>
						</ul>
					</nav>
				<!-- </div> -->
				<div id="header_userBox">
					<ul id="header_userBox_list">
						<li><a href="loginForm.jeong">로그인</a></li>
						<li><a href="joinForm.jeong">회원가입</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
</body>
</html>