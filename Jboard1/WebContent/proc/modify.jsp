<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String title =request.getParameter("title");
	String content =request.getParameter("content");
	String file = request.getParameter("file");
	String seq = request.getParameter("seq");
	String regip = request.getRemoteAddr(); 
	
	
	ArticleDao.getInstance().updateArticle(seq, title, content);
		//리다이렉트
	response.sendRedirect("/Jboard1/view.jsp?seq="+seq);






%>