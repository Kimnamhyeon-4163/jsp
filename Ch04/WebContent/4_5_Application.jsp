<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>4-5</title>
</head>
<body>

	<!-- 
		날짜 : 2020/12/01
		이름 : 김남현
		내용 : application 내장객체 교재 p156
		
		application 내장객체
		- 현재 프로젝트를 실행하는 WAS(톰캣)를 의미하는 객체
	 -->
	 <h3>4-5.JSP application 내장객체</h3>
	<p>
		서버(WAS)정보 : <%= application.getServerInfo() %><br />
		컨텍스트 루트 : <%= application.getContextPath() %><br />
	</p>	 
	 
</body>
</html>