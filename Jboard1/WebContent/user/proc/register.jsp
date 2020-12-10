<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@page import="kr.co.jboard1.dao.UserDao"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid   = request.getParameter("uid");
	String pass1 = request.getParameter("pass1");
	String pass2 = request.getParameter("pass2");
	String name	 = request.getParameter("name");
	String nick	 = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp	 = request.getParameter("hp");
	String zip   = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String regip = request.getRemoteAddr();

	
	MemberBean mb = new MemberBean();
	mb.setUid(uid);
	mb.setPass(pass1);
	mb.setName(name);
	mb.setNick(nick);
	mb.setEmail(email);
	mb.setHp(hp);
	mb.setZip(zip);
	mb.setAddr1(addr1);
	mb.setAddr2(addr2);
	mb.setRegip(regip);
	UserDao.getInstance().insertUser(mb);
	
	response.sendRedirect("/Jboard1/user/login.jsp");

%>