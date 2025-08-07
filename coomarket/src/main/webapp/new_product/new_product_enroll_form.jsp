<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>상품 등록</h2>
<form action="new_product_enroll.hun" method="post" enctype="multipart/form-data">
<table border="1">
	<tr><th>카테고리</th>
		<td><select name="code">
			<c:forEach var="cate" items="${category_list }">
				<option value="${cate.code }">${cate.name }</option>
			</c:forEach>
			</select>
		</td>
	</tr>
		
	<tr><th>이름</th><td><input type="text" name="np_name" required="required" autofocus="autofocus"></td></tr>
	<tr><th>내용</th><td> <textarea  name="np_content" required="required" rows="5" cols="40"></textarea>
	<tr><th>이미지</th><td><input type="file" name="fileName" required="required"></td></tr>
	<tr><th>가격</th><td><input type="number" name="np_price" required="required"></td></tr>
	<tr><th>할인율</th><td><input type="number" name="np_discount" required="required"></td></tr>
	<tr><th>수량</th><td><input type="number" name="np_count" required="required"></td></tr>
	<tr><th colspan="2"><input type="submit" value="등록"></th></tr>
</table>
</form>
</body>
</html>