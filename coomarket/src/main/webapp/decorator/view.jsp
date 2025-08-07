<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="deco"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>coomarket</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
	@import url("/coomarket/css/common.css");
</style>

<deco:head></deco:head>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<deco:body></deco:body>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>