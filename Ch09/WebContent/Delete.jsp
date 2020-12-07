<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터 수신
	request.getParameter("UTF-");
	String uid = request.getParameter("uid");
	

	//DB정보
	String host = "jdbc:mysql://192.168.10.114:3306/knh";
	String user = "knh";
	String pass = "1234";
	//1단계 JDBC 드라이버로드
	
	Class.forName("com.mysql.jdbc.Driver");

	//2단계 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host, user, pass);
	//3단계 SQL 실행객체 생성
	Statement stmt = conn.createStatement();
	//4단계 SQL 실행
	 String sql = ("DELETE FROM `EMPLOYEE` WHERE `uid`='"+uid+"';");
	stmt.executeUpdate(sql);
	//5단계 결과셋 처리(SELECT일 경우)
	

	
	//6단계 데이터베이스 종료

	stmt.close();
	conn.close();
	
	//리다이렉트
	response.sendRedirect("./employee/list2.jsp");
	

%>