<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String seq = request.getParameter("seq");
		
	
	ArticleDao.getInstance().deleteArticle(seq);
	//리다이렉트
	response.sendRedirect("/Jboard1/list.jsp");






%>