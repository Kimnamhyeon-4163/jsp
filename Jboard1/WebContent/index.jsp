<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	MemberBean mb = (MemberBean)session.getAttribute("smember");
	
	if(mb == null){
		//로그인을 안했으면 로그인으로 포워드
		pageContext.forward("./user/login.jsp");
	}else{
		//로그인을 했으면 리스트로 포워드
		
		pageContext.forward("./list.jsp");
	}
	
	//response.sendRedirect("./user/login.jsp");


%>