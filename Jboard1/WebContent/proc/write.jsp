<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파라미터 수신
	request.setCharacterEncoding("UTF-8");
	String title =request.getParameter("title");
	String content =request.getParameter("content");
	String regip = request.getRemoteAddr();
	
	MemberBean mb = (MemberBean) session.getAttribute("smember"); 
	String uid =mb.getUid();
	
	ArticleBean ab = new ArticleBean();
	ab.setTitle(title);
	ab.setContent(content);
	ab.setRegip(regip);
	ab.setUid(uid);
	
	ArticleDao.getInstance().insertArticle(ab);
	
	//리다이렉트
	response.sendRedirect("/Jboard1/list.jsp");





%>