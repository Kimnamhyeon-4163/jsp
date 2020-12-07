<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>10-2</title>
</head>
<body>
	<h3>10-2. 쿠키 수신하기</h3>

	<%
		Cookie[] cookies = request.getCookies();
		
		for(Cookie cookie : cookies){
	%>
		<p>
		 쿠키명 : <%= cookie.getName() %><br />
		 쿠키명 : <%= cookie.getValue() %><br />
		
		</p>
	<%
		}
	
	%>


</body>
</html>