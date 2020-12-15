<%@page import="com.google.gson.Gson"%>
<%@page import="sub1.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String host = "jdbc:mysql://192.168.10.114:3306/knh";
	String user = "knh";
	String pass = "1234";
	//1단계
	Class.forName("com.mysql.jdbc.Driver");
	//2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	//3단계
	Statement stmt = conn.createStatement();
	
	//4단계
	String sql ="SELECT * FROM `MEMBER`";
	ResultSet rs = stmt.executeQuery(sql);
	//5단계
	List<MemberBean> members = new ArrayList<>();
	while(rs.next()){
		MemberBean mb = new MemberBean();
		mb.setUid(rs.getString(1));
		mb.setName(rs.getString(2));
		mb.setHp(rs.getString(3));
		mb.setPos(rs.getString(4));
		mb.setDep(rs.getInt(5));
		mb.setRdate(rs.getString(6));
		members.add(mb);
	}
	//6단계
	rs.close();
	stmt.close();
	conn.close();
	
	//JSON 데이터 생성
	Gson gson = new Gson();
	String json = gson.toJson(members);
	//Json 출력
	out.print(json);
	

%>