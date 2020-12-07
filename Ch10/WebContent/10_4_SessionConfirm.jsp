<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>10-4</title>
</head>
<body>
	<h3>10-4. 세션 데이터 확인</h3>
	<%
	
		Object sid = session.getId();
		Object name = session.getAttribute("name");
		Object uid = session.getAttribute("uid");
		Object hp = session.getAttribute("hp");
	
	%>
	<p>
		sid : <%= sid.toString() %><br />
		name : <%= name.toString() %><br />
		uid : <%= uid.toString() %><br />
		hp : <%= hp.toString() %><br />
	</p>


</body>
</html>