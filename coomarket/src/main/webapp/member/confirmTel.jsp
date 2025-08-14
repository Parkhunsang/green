<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result==1}">
	<script type="text/javascript">
		alert("인증되었습니다");
		location.href="/coomarket/member/mypage.jeong"
	</script>
</c:if>
<c:if test="${result==0}">
	<script type="text/javascript">
		alert("이미 가입된 전화번호입니다");
		history.back();
	</script>
</c:if>
</body>
</html>