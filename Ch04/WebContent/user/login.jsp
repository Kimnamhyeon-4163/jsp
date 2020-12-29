<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login</title>
</head>
<body>
	<!--  
		데이터 전송방식 GET, POST 교재 p134
		
		Get
		-기본 데이터 전송방식
		-서버에 페이지나 데이터를 요청하는 전송방식
		-데이터(파라미터) 주소에 노출

		POST
		-서버에 데이터를 전달하면서 처리를 요청하는 전송방식
		-데이터(파라미터) 요청메세지에 삽입되어 전송
	 -->
	<h3>로그인</h3>
	<form action="../4_1_Request.jsp" method="get">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="로그인"/>
				</td>
			</tr>
			
		</table>
		</form>
		<form action="/Ch04/user/register.jsp" method="get">
		<table border="1">
		<tr>
				<td colspan="2" align="right">
					<input type="submit" value="회원가입하기"/>
				</td>
		</tr>
		</table>
	</form>
</body>
</html>