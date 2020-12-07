<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>8-1</title>
</head>
<body>
<!-- 
		날짜 : 2020/12/02
		이름 : 김남현
		내용 : JavaBean 실습하기 p254
		
		자바빈
		- 일반적으로 JSP에서 사용하는 객체(컴포넌트)
		- 일반적으로 form의 데이터를 입력받기위한 클래스를 정의
	 -->
	 <h3>8-1.JSP 자바빈</h3>
	
	<h4>회원가입</h4>
	<form action="./8_2_UseBean.jsp" method="get">
		<table border="1">
			<tr>
				<td>이름</td>
				<td> <input type="text" name="name"/></td>
			</tr>
			
			<tr>
				<td>성별</td>
				<td>
					<label><input type="radio" name="gender" value="1"/>남</label>
					<label><input type="radio" name="gender" value="2"/>여</label>
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<label><input type="checkbox" name="hobby" value="등산"/>등산하기</label>
					<label><input type="checkbox" name="hobby" value="독서"/>독서하기</label>
					<label><input type="checkbox" name="hobby" value="여행"/>여행하기</label>
					<label><input type="checkbox" name="hobby" value="운동"/>운동하기</label>
					<label><input type="checkbox" name="hobby" value="영화"/>영화보기</label>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<select name="addr">
						<option value="서울">서울특별시</option>
						<option value="대전">대전광역시</option>
						<option value="대구">대구광역시</option>
						<option value="부산">부산광역시</option>
						<option value="광주">광주광역시</option>
					</select>
				
				</td>		
			</tr>
			<tr>
				<td>가입하기</td>
			
				<td colspan="2" align="right">
				<input type="submit" value="가입하기"/>
				</td>
			</tr>
		</table>


 </form>
	
</body>
</html>