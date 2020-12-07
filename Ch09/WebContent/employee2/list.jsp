<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../9_2_JDBC_Select.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>직원목록</title>
</head>
<body>
	<h3>직원목록</h3>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>휴대폰</td>
			<td>직급</td>
			<td>부서</td>
			<td>등록일</td>
			<td>관리</td>

		</tr>
		<%for(MemberBean mb : members){ %>
		<tr>
			<td><%=mb.getUid()  %></td>
			<td><%=mb.getName() %></td>
			<td><%=mb.getHp()   %></td>
			<td><%=mb.getPos()  %></td>
			<td><%=mb.getDep()  %></td>
			<td><%=mb.getRdate().substring(2,10) %></td>
			<td>
				<a href="./modify.jsp?uid=<%=mb.getUid()%>">수정</a>
				<a href="../9_3_JDBC_Delete.jsp?uid=<%=mb.getUid()%>">삭제</a>
			</td>
		</tr>
		<% } %>
	</table>

</body>
</html>
