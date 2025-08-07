<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
<form action="boardUpdate.hun">
	<input type="hidden" name="num" value="${board.num }">
	<input type="hidden" name="pageNum" value="${pageNum}">
<table><caption>게시글 수정</caption>
	<tr><th>제목</th><td><input type="text" name="b_title" 
		required="required" autofocus="autofocus" value="${board.b_title }"></td></tr>
	<!-- 비회원 게시판 : 암호를 아는 사람만 수정 -->
	<tr><th>암호</th><td><input type="password" name="password" 
		required="required" ></td></tr>
	<!-- 회원 게시판에는 사용 안함 끝 -->
	<tr><th>내용</th><td><pre><textarea rows="5" cols="40" name="b_content"
		required="required">${board.b_content }</textarea></pre></td></tr>
	<tr><th colspan="2"><input type="submit" value="글수정"></th></tr>
</table>
</form>
</body>
</html>