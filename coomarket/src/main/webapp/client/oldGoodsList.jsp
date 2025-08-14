<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("/coomarket/css/display/goodsList.css");
@import url("/coomarket/css/common/reset.css");
@import url("/coomarket/css/common/common.css");
</style>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
</head>
<body>
<div id="goods_list_wrap">
	<div id="goods_list_inner_wrap">
		<section id="category">
		   	
		</section>
		
		<section id="goods_list_section">
			<ul id="goods_list">
				<c:forEach var="product" items="${product_list}">
					<li>
					<a href="/coomarket/client/oldDetailGoods.hun?op_no=${product.op_no}">
						<div class="goods_list_image_text_wrap">
							<img src="/coomarket/oldProductUpload/${product.op_image}">
							<div class="goods_list_text_wrap">
								<p class="goods_title">${product.op_name}</p>
								<p class="goods_total_price">${product.op_price}원</p>
							</div>
						</div>
					</a>
					</li>
				</c:forEach>
			</ul>
			<div id="number">
				<c:if test="${startPage > pagePerBlock }">
					<button onclick="location.href='oldGoodsList.hun?pageNum=${startPage-1}'">◀</button>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<button onclick="location.href='oldGoodsList.hun?pageNum=${i}'">${i }</button>
				</c:forEach>
				<c:if test="${endPage < totalPage }">
					<button onclick="location.href='oldGoodsList.hun?pageNum=${endPage+1}'">▶</button>
				</c:if>
			</div>
		</section>
	</div>
</div>	
</body>
</html>