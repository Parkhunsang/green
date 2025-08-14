<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html><html><head>
<title>Insert title here</title>
<style>
	@import url("/coomarket/css/display/main.css")
</style>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
</head>
<body>
 	<!-- 배너 -->
 	
	<div id="contents_wrap">
		<div id="contents_main_text_wrap">
			<div id="contents_text_first">
				<p>중고는 중고답게,</p>
			</div>
			<div id="contents_text_second">
				<p>새 상품은 즐겁게!</p>
			</div>
		</div>
		<div id="search_wrap">
			<div id="location_wrap">
				
			
				<select>
					<c:forEach var="loc" items="${loc_list}">
						<option>${loc.loc_name}</option>
					</c:forEach>
				</select>
				
			</div>
			
			<div id="serch_box_wrap">
				<form action="/coomarket/serch/serch_result.hun" name="frm">
					<input type="text" placeholder="검색어를 입력하세요" name="keyword" required="required" autofocus="autofocus">
					<button><img src="/coomarket/css/img/serch_btn.png"></button>	
				</form>
			</div>
	    </div>
	     
	     <div>
			<a href="/coomarket/board/boardWriteForm.hun?b_no=0">게시글 작성</a>
			<a href="/coomarket/new_product/new_product_enrollForm.hun">상품등록하기</a>
		 </div>
	</div>
	
</body>
</html>