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
<c:set var="cID" value="${sessionScope.id}"></c:set>
</head>
<body>
	<header>
		<div id="headderInner">
			<div id="headerInner_top">
				<h1 id="headerLogo">
					<a href="/coomarket/display/main.jeong">Coo-M</a>
				</h1>
				<!-- <div id="headerInner_menuBox"> -->
					<nav id="mainMenu">
						<h2 class="hidden">메인메뉴</h2>
						<ul id="mainMenu_list">
							<li>중고거래</li>
							<li><a href="/coomarket/client/goodsList.hun">쿠스토어</a></li>
							<li>쿠스토어</li>
							<li>우리동네</li>
						</ul>
					</nav>
				<div id="header_userBox">
					<ul id="header_userBox_list">
						<c:if test="${empty cID}">
							<li><a href="/coomarket/member/loginForm.jeong">로그인</a></li>
							<li><a href="/coomarket/member/joinType.jeong">회원가입</a></li>
						</c:if>
						<c:if test="${not empty cID}">
							<li><a href="/coomarket/member/mypage.jeong">마이페이지</a></li>
							<li><a href="/coomarket/member/cartlist.jeong">장바구니</a></li>
							<li><a href="/coomarket/member/logout.jeong">로그아웃</a></li>
						</c:if>
						
						<li><a href="#">고객센터</a></li>
					</ul>
				</div>
			</div>
			<div id="headerInner_searchBox">
				<form action="">
					<fieldset>
						
					</fieldset>
				</form>
			</div>
		</div>
	</header>
</body>
</html>