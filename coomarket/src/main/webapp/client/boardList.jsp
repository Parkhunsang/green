<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@import url("/coomarket/css/display/boardList.css");
	@import url("/coomarket/css/common/reset.css");
	@import url("/coomarket/css/common/common.css");
</style>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
</head>
<body>
<div id="board_list_wrap">
	<div id="search_wrap">
		<div id="serch_box_wrap">
			<form action="/coomarket/serch/serch_result.hun" name="frm">
				<input type="text" placeholder="검색어를 입력하세요" name="keyword" required="required" autofocus="autofocus">
				<button><img src="/coomarket/css/img/serch_btn.png"></button>	
			</form>
		</div>
	</div>
	<div id="board_list_inner_wrap">
		<div id="nav_bar">
			<a href="/coomarket/display/main.hun">홈</a>
			 <p>></p>
			 <a href="/coomarket/client/boardList.hun">우리동네</a>
		 </div>
		 <div id="board_list_section_inner">
			<section id="category">
			   	
			</section>
			
			<section id="board_list_section">
				<ul id="board_list">
					<c:forEach var="board" items="${board_list}">
						<li>
						<a href="/coomarket/client/detailBoard.hun?b_no=${board.b_no}">
							<div class="board_list_image_text_wrap">
								<div class="board_list_text_wrap">
									<p class="board_title">${board.b_title}</p>
									<p class="board_content">${board.b_content}</p>
									<div class="board_date_view_wrap">
										<p class="board_date">${board.b_date}</p>
										<p class="board_view">${board.b_view}</p>
									</div>
								</div>
								<img src="/coomarket/boardUpload/${board.b_image}">
							</div>
						</a>
						</li>
					</c:forEach>
				</ul>
				<div id="number">
					<c:if test="${startPage > pagePerBlock }">
						<button onclick="location.href='boardList.hun?pageNum=${startPage-1}'">◀</button>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<button onclick="location.href='boardList.hun?pageNum=${i}'">${i }</button>
					</c:forEach>
					<c:if test="${endPage < totalPage }">
						<button onclick="location.href='boardList.hun?pageNum=${endPage+1}'">▶</button>
					</c:if>
				</div>
			</section>
		</div>
	</div>
</div>	
</body>
</html>