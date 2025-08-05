<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value="${sessionScope.id }"></c:set>
<c:if test="${id.is_admin==false}">
	<script type="text/javascript">
		alert("권한이 없습니다")
		location.href="/coomarket/display/main.jeong"
	</script>
</c:if>
