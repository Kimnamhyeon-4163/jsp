<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.jboard1.dao.UserDao"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	int count = UserDao.getInstance().selectCountUser(uid);
	
	//json 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", count);
	
	
	out.print(json);	
	
%>