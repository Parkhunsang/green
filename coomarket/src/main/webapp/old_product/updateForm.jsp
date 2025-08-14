<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>상품정보 수정</h2>
<form action="old_product_update.hun" method="post" enctype="multipart/form-data">
	<input type="hidden" name="op_no" value="${oldProduct.op_no }">
<table border="1">
	<tr><th>카테고리</th><td><select name="code">
		<c:forEach var="cate" items="${oldCategory_list }">
			<c:if test="${cate.oldCode==oldProduct.oldCode }"><option value="${cate.oldCode }" selected="selected">${cate.oldName }</option></c:if>
			<c:if test="${cate.oldCode!=oldProduct.oldCode }"><option value="${cate.oldCode }" >${cate.oldName }</option></c:if>
		</c:forEach>
		</select></td></tr>
	<tr><th>이름</th><td><input type="text" name="op_name" required="required" autofocus="autofocus" value="${oldProduct.op_name }"></td></tr>
	<tr><th>내용</th><td> <textarea  name="op_content" required="required" rows="5" cols="40">${oldProduct.op_content}</textarea>
	<tr><th>이미지</th><td><input type="file" name="fileName">${oldProduct.op_image }</td></tr>
	<tr><th>가격</th><td><input type="number" name="op_price" required="required" value="${oldProduct.op_price }"></td></tr>
	<tr><th>할인율</th><td><input type="number" name="op_discount" required="required" value="${oldProduct.op_discount }"></td></tr>
	<tr><th colspan="2"><input type="submit" value="수정"></th></tr>
</table>
</form>
</body>
</html>