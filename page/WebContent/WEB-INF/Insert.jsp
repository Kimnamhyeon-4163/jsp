<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");

	String uid =request.getParameter("uid");
	String name =request.getParameter("name");
	String gender =request.getParameter("gender");
	String hp =request.getParameter("hp");
	String email =request.getParameter("email");
	String pos =request.getParameter("pos");
	String dep =request.getParameter("dep");
	String ragip =request.getParameter("regip");
	String rdate =request.getParameter("rdate");

	String host ="jdbc:mysql://192.168.10.114:3306/knh";
	String user ="knh";
	String pass ="1234";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(host, user, pass);
	Statement stmt = conn.createStatement();
	String sql = "INSERT INTO `PAGE` VALUES('"+uid+"','"+name+"','"+gender+"','"+hp+"','"+email+"','"+pos+"','"+dep+"','"+ragip+"','"+rdate+"')";
	stmt.executeQuery(sql);
	
	stmt.close();
	conn.close();
	response.sendRedirect("#");

%>