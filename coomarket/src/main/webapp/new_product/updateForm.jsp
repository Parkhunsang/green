<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>상품정보 수정</h2>
<form action="new_product_update.hun" method="post" enctype="multipart/form-data">
	<input type="hidden" name="np_no" value="${newProduct.np_no }">
<table border="1">
	<tr><th>카테고리</th><td><select name="code">
		<c:forEach var="cate" items="${category_list }">
			<c:if test="${cate.code==newProduct.code }"><option value="${cate.code }" selected="selected">${cate.name }</option></c:if>
			<c:if test="${cate.code!=newProduct.code }"><option value="${cate.code }" >${cate.name }</option></c:if>
		</c:forEach>
		</select></td></tr>
	<tr><th>이름</th><td><input type="text" name="np_name" required="required" autofocus="autofocus" value="${newProduct.np_name }"></td></tr>
	<tr><th>내용</th><td> <textarea  name="np_content" required="required" rows="5" cols="40">${newProduct.np_content}</textarea>
	<tr><th>이미지</th><td><input type="file" name="fileName">${newProduct.np_image }</td></tr>
	<tr><th>가격</th><td><input type="number" name="np_price" required="required" value="${newProduct.np_price }"></td></tr>
	<tr><th>할인율</th><td><input type="number" name="np_discount" required="required" value="${newProduct.np_discount }"></td></tr>
	<tr><th>수량</th><td><input type="number" name="np_count" required="required" value="${newProduct.np_count }"></td></tr>
	<tr><th colspan="2"><input type="submit" value="수정"></th></tr>
</table>
</form>
</body>
</html>