<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	function dupChk(){
		if(!frm.id.value){
			alert("아이디를 입력하고 체크하시오");
			frm.id.focus();
			return false;
		}
		// jQuery를 이용한 ajax명령어 $는 jQuery post 방식 전달
		// id에 입력한 frm.id의 값을 가지고 confirm.jsp를 실행
		$.post('confirm.jeong','id='+frm.id.value,function(data){
			$('#err').html(data);
		});
	}
	function chk(){
		if(frm.password.value != frm.password2.value){
			alert("입력하신 비밀번호와 확인이 서로 다릅니다.");
			frm.passwrod.focus;
			frm.password.value="";
			frm.password2.value="";
			return false;
		}
	}
</script>
</head>
<body>
<div class="container text-center">
	<h2 class="text-primary">회원가입</h2>
<form action="join.jeong" name="frm" onsubmit="return chk()">
<table class="table table-bordered table-info">
<tr>
			<th>아이디</th>
			<td>
				<div class="row"><div class="col-auto"><input type="text" name="id" required="required" autofocus="autofocus" class="form-control"></div>
				<div class="col-auto"><input type="button" value="중복체크" onclick="dupChk()" class="btn btn-warning"><span id="err"></span></div></div>
			</td>
		</tr>
		<tr>
			<th>암호</th>
			<td>
				<input type="password" name="password" required="required" class="form-control">
			</td>
		</tr>
		<tr>
			<th>암호확인</th>
			<td>
				<input type="password" name="password2" required="required"  class="form-control">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name" required="required"  class="form-control">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="address" required="required"  class="form-control">
			</td>
		</tr>
		<tr>
			<th>전화</th>
			<td>
				<input type="tel" name="tel" required="required" placeholder="010-1111-1111" pattern="010-\d{3,4}-\d{4}" title="전화번호 형식 : 010-1111-1111"  class="form-control" >
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="확인"  class="btn btn-success"/>				
			</th>
		</tr>
</table>
</form>
	<button onclick="location.href='loginForm.jeong'" class="btn btn-info">로그인</button>
</div>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>