<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("/coomarket/css/display/goodsList.css");
@import url("/coomarket/css/common/reset.css");
</style>

</head>
<body>
<div id="goods_list_wrap">
	<section id="goods_list_sec">
		<ul id="goods_list">
			<c:forEach var="product" items="${product_list}">
				<li>
				<a href="/coomarket/client/detailGoods.hun?np_no=${product.np_no}">
					<div id="">
						<p>${product.np_name}</p>
						<p>${product.np_content}</p>

						<img src="/coomarket/upload/${product.np_image}">
					</div>
				</a>
				</li>
			</c:forEach>
		</ul>
		<div id="number">
			<c:if test="${startPage > pagePerBlock }">
				<button onclick="location.href='goodsList.hun?pageNum=${startPage-1}'">◀</button>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<button onclick="location.href='goodsList.hun?pageNum=${i}'">${i }</button>
			</c:forEach>
			<c:if test="${endPage < totalPage }">
				<button onclick="location.href='goodsList.hun?pageNum=${endPage+1}'">▶</button>
			</c:if>
		</div>
	</section>
</div>	
</body>
</html>