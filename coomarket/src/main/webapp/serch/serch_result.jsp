<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/coomarket/css/display/serch_result.css");
@import url("/coomarket/css/common/reset.css");
@import url("/coomarket/css/common/common.css");
</style>
</head>
<body>
<div id="serch_result_wrap">
	<div id="serch_result_inner_wrap">
		<section id="category">
		   	
		</section>
		
		<section id="serch_result_section">
			<ul id="serch_result_list">
				<c:forEach var="product" items="${old_list}">
					<li>
					<a href="/coomarket/serch/detailGoods.hun?op_no=${product.op_no}">
						<div class="serch_result_image_text_wrap">
							<img src="/coomarket/oldProductUpload/${product.op_image}">
							<div class="serch_result_text_wrap">
								<p class="serch_result_title">${product.op_name}</p>
								<p class="serch_result_title">${product.op_price}</p>
								<p class="serch_result_price"><fmt:formatNumber value="${product.op_price - product.op_price*product.op_discount / 100}"></fmt:formatNumber></p>
							</div>
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
</div>			
</body>
</html>