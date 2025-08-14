<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/display/sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
</head><body>
<div class="container text-center">
	<h2 class="text-primary">게시글 작성</h2>
	<form action="boardWrite.hun" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${id }">
	<table class="table table-bordered table-success">
		<tr><th>제목</th><td><input type="text" name="b_title" class="form-control"></td></tr>
		<tr><th>작성자</th><td>${id }</td></tr>
		<tr><th>내용</th><td><textarea rows="5" name="b_content"  class="form-control"></textarea></td></tr>
		<tr><th>이미지</th><td><input type="file" name="fileName"></td></tr>
		<tr><td colspan="2"><input type="submit" value="등록" class="btn btn-warning">
	</table>
	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>