<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String seq = request.getParameter("seq");
	String content = request.getParameter("content");
	
	int result = ArticleDao.getInstance().updateComment(seq, content);
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	out.print(json);




%>