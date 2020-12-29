<%@page import="kr.co.farmstory1.db.Sql"%>
<%@page import="kr.co.farmstory1.bean.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory1.db.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");

	Connection conn = DBConfig.getInstance().getConnection();
	
	PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_USER);
	psmt.setString(1, uid);
	psmt.setString(2, pass);

	ResultSet rs = psmt.executeQuery();
	
	MemberBean mb = null;
	
	if(rs.next()){
		mb = new MemberBean();
		
		mb.setUid(rs.getString(1));
		mb.setPass(rs.getString(2));
		mb.setName(rs.getString(3));
		mb.setNick(rs.getString(4));
		mb.setEmail(rs.getString(5));
		mb.setHp(rs.getString(6));
		mb.setGrade(rs.getInt(7));
		mb.setZip(rs.getString(8));
		mb.setAddr1(rs.getString(9));
		mb.setAddr2(rs.getString(10));
		mb.setRegip(rs.getString(11));
		mb.setRdate(rs.getString(12));
		mb.setUid(rs.getString(1));
		
	}
	
	rs.close();
	psmt.close();
	conn.close();
	
	if(mb != null){
		session.setAttribute("smember", mb);
		response.sendRedirect("/Farmstory1/");
	}else{
		response.sendRedirect("/Farmstory1/user/login.jsp");
	}
%>