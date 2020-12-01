<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송되어 전달하는 데이터 수신
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>4-1</title>
</head>
<body>
	<h3>4-1.JSP request 내장객체</h3>
	
	<h4>로그인 정보</h4>
	<p>
		입력한 아이디 : <%=uid %><br />
		입력한 비밀번호 : <%=pass %><br />
	</p>	
	
	<a href="./user/login.jsp"></a>

</body>
</html>