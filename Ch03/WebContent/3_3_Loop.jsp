<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3-3</title>
</head>
<body>
	<!-- 
		날짜 : 2020/11/30
		이름 : 김남현
		내용 : Ch03. JSP 구성요소 스크립트릿 교재 p124
	 -->
	<h3>3-3.JSP 반복문</h3>
	
	<h4>for</h4>
	<%
		for(int i=1; i<=5;i++){
			out.print("<span>for 반복문 : "+i+"</span>");
		}
	
	%>
	<h4>while</h4>
	<%
		int i=1;
		while(i<=5){	
	
	%>
		<h4>while 반복문 : <%=i %></h4>
		<%
			i++;
	}
		%>
	<h4>구구단</h4>
	<table border="1">
		<tr>
			
			<td>2단</td>
			<td>3단</td>
			<td>4단</td>
			<td>5단</td>
			<td>6단</td>
			<td>7단</td>
			<td>8단</td>
			<td>9단</td>
		</tr>
		<% for(int a=1; a<=9; a++){%>
		<tr>
		<%for(int b=2; b<=9; b++){ %>
			<td><%=b %>x<%=a %>=<%=b*a%> </td>
		<%} %>
		</tr>
		<%} %>
	</table>
	
	<h4></h4>


</body>
</html>