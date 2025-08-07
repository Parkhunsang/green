<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function del() {
		let cf = prompt("정말로 삭제하시겠습니까 ?")
		if (cf) location.href="new_product_delete.hun?np_no=${product.np_no }"
		else alert("삭제를 취소 하였습니다")
	}
</script>
</head>
<body>
<h2>등록 상품 목록</h2>
<table>
	<tr><th>번호</th><th>상품코드</th><th>상품명</th><th>이미지</th><th>가격</th><th>할인율</th><td>등록일</td><th>수정</th><th>삭제</th></tr>
	<c:forEach var="product" items="${product_list }">
		<tr><td>${product.np_no }</td><td>${product.code }</td>
			<td>${product.np_name }</td><td><img alt="" src="/coomarket/upload/${product.np_image }" width="50"></td>
			<td>${product.np_price }</td><td>${product.np_discount }</td><td>${product.np_date }</td>
			<td><a href="new_product_updateForm.hun?np_no=${product.np_no }">수정</a></td>
			<td><button onclick="del()">삭제</button> </td></tr>
	</c:forEach>
</table>
<div align="center">
	<c:if test="${startPage > pagePerBlock }">
		<button onclick="location.href='new_product_list.hun?pageNum=${startPage-1}'">◀</button>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<button onclick="location.href='new_product_list.hun?pageNum=${i}'">${i }</button>
	</c:forEach>
	<c:if test="${endPage < totalPage }">
		<button onclick="location.href='new_product_list.hun?pageNum=${endPage+1}'">▶</button>
	</c:if>
</div>
<a href="/coomarket/new_product/new_product_enrollForm.hun">상품등록</a>
</body>
</html>