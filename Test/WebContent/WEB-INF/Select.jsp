<%@page import="sub1.EmployeeBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%


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
	ResultSet rs = stmt.executeQuery("SELECT * FROM `EMPLOYEE` ORDER BY `name`;");
	//5단계 결과셋 처리(SELECT일 경우)
	
	
	List<EmployeeBean> employee = new ArrayList<>();
	
	while(rs.next()){
	
		EmployeeBean em = new EmployeeBean();
		
		em.setUid  (rs.getString(1));
		em.setName (rs.getString(2));
		em.setGender (rs.getInt(3));
		em.setHp   (rs.getString(4));
		em.setHp   (rs.getString(5));
		em.setPos  (rs.getString(6));
		em.setDep  (rs.getInt(7));
		em.setRdate(rs.getString(8));
		
		employee.add(em);
		
	}
	
	//6단계 데이터베이스 종료
	
	rs.close();
	stmt.close();
	conn.close();

%>