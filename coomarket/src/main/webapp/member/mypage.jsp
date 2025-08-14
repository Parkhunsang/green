<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("/coomarket/css/common.css");
	@import url("/coomarket/css/member/mypage.css");
</style>

</head>
<body>
<section id="mypage">
	<h1 class="hidden">마이페이지</h1>
	<form action="/coomarket/member/memberPrivateUpdate.jeong" name="frm">
		<table id="mypageTable">
			<caption>회원정보</caption>
			<tr>
				<th scope="row">
					프로필 이미지
				</th>
				<td>
					${memberPrivate.memberPic}
				</td>
			</tr>
			<tr>
				<th scope="row">
					아이디
				</th>
				<td>
					${member.id}
				</td>
			</tr>
			<tr>
				<th scope="row">
					이메일
				</th>
				<td>
					${member.email}
				</td>
			</tr>
			<tr>
				<th scope="row">
					가입일
				</th>
				<td>
					${member.regDate}
				</td>
			</tr>
			<tr>
				<th scope="row">
					이름
				</th>
				<td>
					${memberPrivate.name}
				</td>
			</tr>
			<tr>
				<th scope="row">
					전화번호
				</th>
				<td>
					${memberPrivate.tel}
				</td>
			</tr>
			<tr>
				<th scope="row">
					주소
				</th>
				<td>
					<input type="text" name="address" maxlength="80" placeholder="${memberPrivate.address}" class="address"/>
				</td>
			</tr>
			<tr>
				<th scope="row">
					상세주소
				</th>
				<td>
					<input type="text" name="addressDetail" maxlength="80" placeholder="${memberPrivate.addressDetail}"class="address" />
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="수정하기" id="mypage_submit"/>
				</th>
			</tr>
		</table>
	</form>
<button type="button" id="gohome_btn" onclick="history.back()">돌아가기</button>
</section>
</body>
</html>