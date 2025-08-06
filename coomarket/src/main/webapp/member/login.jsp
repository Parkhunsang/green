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

<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("아이디 혹은 비밀번호를 확인하여 주십시오");
		history.back();
	</script>
</c:if>

<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("로그인 성공");

		location.href="/member/main.jeong";

		location.href="/coomarket/display/main.jeong";

	</script>
</c:if>

<c:if test="${result == -1}">
	<script type="text/javascript">
		alert("존재하지 않는 계정입니다");
		history.back();
	</script>
</c:if>

</body>
</html>