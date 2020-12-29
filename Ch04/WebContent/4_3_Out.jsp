<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>4-3</title>
</head>
<body>
	<!-- 
		날짜 : 2020/12/01
		이름 : 김남현
		내용 : out 내장객체 교재 p154
		
		out 내장객체
		-JSP 출력객체
		-respone 응답 전송을 위해 HTML 및 데이터를 출력
	 -->
	<h3>4-3.JSP out 내장객체</h3>
	<%
		out.println("<ul>");
		out.println("<li>서울</li>");
		out.println("<li>대전</li>");
		out.println("<li>대구</li>");
		out.println("<li>부산</li>");
		out.println("<li>광주</li>");
		out.println("</ul>");
	%>
</body>
</html>