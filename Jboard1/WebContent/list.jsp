<%@page import="kr.co.jboard1.db.DBConfig"%>
<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//파라미터 수신
	request.setCharacterEncoding("UTF-8");
	String pg = request.getParameter("pg");

	//현재 로그인 사용자 정보 확인
	MemberBean mb = (MemberBean)session.getAttribute("smember");
	if(mb == null){
		response.sendRedirect("/Jboard1/user/login.jsp");
		return;
	}
	ArticleDao dao = ArticleDao.getInstance();
	// 글순서 번호 구하기
	int total = dao.selectCountArticle();
	//전체 페이지 번호 구하기
	int lastPgNum = dao.getlastPgNum(total);
	//현재 페이지 번호 구하기
	int currentPg = dao.getCurrentPg(pg);
	//게시판 LIMIT 시작번호 구하기
	int limitStart = dao.getLimitStart(currentPg);
	
	//현재 페이지 글 시작번호 구하기
	int currentStartNum = dao.getCurrentStartNum(total, limitStart);
	
	//페이지 번호 그룹 구하기
	int[] groups = dao.getPageGroup(currentPg, lastPgNum);
	
	//목록 게시물 가져오기
	List<ArticleBean> articles = dao.selectArticles(limitStart);
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글목록</title>
    <link rel="stylesheet" href="/Jboard1/css/style.css">    
</head>
<body>
    <div id="wrapper">
        <section id="board" class="list">
            <h3>글목록</h3>
            <article>
                <p>
                    <%= mb.getName() %>님 반갑습니다.
                    <a href="/Jboard1/user/login.jsp" class="logout">[로그아웃]</a>
                </p>
                <table border="0">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>
                    <% for(ArticleBean ab : articles){ %>
                    <tr>
                        <td><%= currentStartNum-- %></td>
                        <td><a href="/Jboard1/view.jsp?seq=<%=ab.getSeq() %>" ><%= ab.getTitle()%> </a>&nbsp;[<%=ab.getComment() %>]</td>
                        <td><%=ab.getNick() %></td>
                        <td><%=ab.getRdate().substring(2, 10) %></td>
                        <td><%=ab.getHit() %></td>
                    </tr>
                    <%} %>
                </table>
            </article>

            <!-- 페이지 네비게이션 -->
            <div class="paging">
            	<%if(groups[0] >1){ %>
                <a href="/Jboard1/list.jsp?pg=<%= groups[0] -1 %>" class="prev">이전</a>
                <%} %>
                <% for(int num=groups[0]; num<=groups[1]; num ++){ %>
                <a href="/Jboard1/list.jsp?pg=<%=num %>" class="num <%=(currentPg == num) ? "current" : "" %>"><%=num %></a>                
                <%} %>
                <%if(groups[1] < lastPgNum){ %>
                <a href="/Jboard1/list.jsp?pg=<%= groups[1] + 1 %>" class="next">다음</a>
                <%} %>
            </div>

            <!-- 글쓰기 버튼 -->
            <a href="/Jboard1/write.jsp" class="btnWrite">글쓰기</a>

        </section>
    </div>    
</body>
</html>