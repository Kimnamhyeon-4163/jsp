<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>10-1</title>
</head>
<body>
	<!-- 
		날짜 : 2020/12/02
		이름 : 김남현
		내용 : 쿠키 실습하기 교재 p390
	
		Cookie
		- 클라이언트와 서버간의 식별을 위해 사용하는 조각파일
		- 서버에서 쿠키를 생성하고 클라이언트로 전달
		- 클라이언트는 전달된 쿠키를 보관, 해당 서버로 다시 요청할때 보관된 쿠키를 전송
	 -->



	<h3>10-1.cookie</h3>
	<%
		//쿠키생성
		Cookie c1 = new Cookie("name","홍길동");
		Cookie c2 = new Cookie("uid","hong");
		Cookie c3 = new Cookie("hp","010-1234-1234");
		
		c1.setMaxAge(60*3);
		c2.setMaxAge(60*5);
		c3.setMaxAge(60*10);
		//응답객체에 실어 Client로 보내기
		response.addCookie(c1);	
		response.addCookie(c2);	
		response.addCookie(c3);	
	%>
	<h4>쿠기 생성 후 클라이언트 전송완료</h4>
	
	<a href="./10_2_CookieReceive.jsp">서버로 쿠키 전송</a>


</body>
</html>