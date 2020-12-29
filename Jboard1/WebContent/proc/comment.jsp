<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String parent = request.getParameter("parent");
	String comment = request.getParameter("comment");
	String regip = request.getRemoteAddr();
	
	//현재 댓글을 작성하는 사용자 아이디 구하기
	MemberBean mb =(MemberBean)session.getAttribute("smember");
	String uid = mb.getUid();
	
	ArticleBean ab =new ArticleBean();
	ab.setParent(parent);
	ab.setContent(comment);
	ab.setUid(uid);
	ab.setRegip(regip);


	//댓글 INSERT
	ArticleDao.getInstance().insertComment(ab);
	//원글 댓글 카운트 UPDATE
	ArticleDao.getInstance().updateCommentCount(parent);
	
	//리다이렉트
	response.sendRedirect("/Jboard1/view.jsp?seq="+parent);



%>