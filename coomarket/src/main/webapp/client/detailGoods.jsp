<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${newProduct.np_name}<p>
${newProduct.np_content}<p>
<img src="/coomarket/upload/${newProduct.np_image}"><p>
정가 : <s><fmt:formatNumber value="${newProduct.np_price}"></fmt:formatNumber></s><p>
할인율 : ${newProduct.np_discount}<p>
판매가 : <b><fmt:formatNumber value="${newProduct.np_price - newProduct.np_price*newProduct.np_discount / 100}"></fmt:formatNumber></b>    
</body>
</html>