<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login</title>
</head>
<body>

	<h3>로그인</h3>
	<form action="./LoginProc.jsp" method="post">
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