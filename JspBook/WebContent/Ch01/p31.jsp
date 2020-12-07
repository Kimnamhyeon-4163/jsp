<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSP 예제</title>
</head>
<body>
<%
	Date nowDate = new Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 mm월dd일");
	String formatDate = dateFormat.format(nowDate);

%>


<p>일반적인 JSP 페이지의 형태로 아래와 같이 현재 날짜를 제공합니다.<br />
현재 날짜는<%=formatDate %>입니다.</p>

</body>
</html>