<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device=width,initial-scale=1.0"/>
	<title>스크립트릿 예제- 로직사용</title>
</head>
<body>
	<h2>스크립트릿 예제 - 로직사용</h2>
	<%
	int var1 =6;
	if(var1>5){
		%>
		변수 var1의 값은 5보다 크다.
	<%}else{ %>
	변수 var1의 값으 ㄴ5보다 작거나 같다.
	
	<%}%>

</body>
</html>