<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String seq = request.getParameter("seq");
	
	
	ArticleBean ab = ArticleDao.getInstance().selectArticle(seq);
	
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글수정</title>
    <link rel="stylesheet" href="/Jboard1/css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="modify">
            <h3>글수정</h3>
            <article>
                <form action="/Jboard1/proc/modify.jsp" method="post">
                <input type="hidden" name="seq" value="<%=ab.getSeq() %>" />
                    <table>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="title" value="<%=ab.getTitle() %>"/></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <textarea name="content"><%=ab.getContent() %></textarea>                                
                            </td>
                        </tr>
                        <tr>
                            <td>첨부</td>
                            <td><input type="file" name="file"/></td>
                        </tr>
                    </table>
                    <div>
                        <a href="/Jboard1/view.jsp?seq=<%= seq %>" class="btnCancel">취소</a>
                        <input type="submit"  class="btnWrite" value="수정완료">
                    </div>
                </form>
            </article>
        </section>
    </div>
</body>
</html>