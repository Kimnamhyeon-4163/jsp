<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 

	//파라미터 수신
	request.setCharacterEncoding("UTF-8");
	String seq = request.getParameter("seq");
	
	//조회수 업데이터
	ArticleDao.getInstance().updateHit(seq);
	//조회글 가져오기
	ArticleBean ab = ArticleDao.getInstance().selectArticle(seq);


%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글보기</title>
    <link rel="stylesheet" href="./css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="view">
            <h3>글보기</h3>
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="<%=ab.getTitle() %>" readonly/></td>
                </tr>
                <%if(ab.getFile() != 0){ %>
                <tr>
                    <td>첨부파일</td>
                    <td>
                        <a href="#">2020년 상반기 매출자료.xls</a>
                        <span>7회 다운로드</span>
                    </td>
                </tr>
                <%} %>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content" readonly><%=ab.getContent() %></textarea>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Jboard1/proc/delete.jsp?seq=<%=ab.getSeq() %>" class="btnDelete">삭제</a>
                <a href="/Jboard1/modify.jsp?seq=<%=ab.getSeq() %>" class="btnModify">수정</a>
                <a href="/Jboard1/list.jsp" class="btnList">목록</a>
            </div>  
            
            <!-- 댓글리스트 -->
            <section class="commentList">
                <h3>댓글목록</h3>
                <%if(ab.getComment() > 0){ %>
                <article class="comment">
                    <span>
                        <span>길동이</span>
                        <span>20-05-13</span>
                    </span>
                    <textarea name="comment" readonly>댓글 샘플입니다.</textarea>
                    <div>
                        <a href="#">삭제</a>
                        <a href="#">수정</a>
                    </div>
                </article>
                <%}else{ %>
                <p class="empty">
                    등록된 댓글이 없습니다.
                </p>
                <%} %>
            </section>

            <!-- 댓글입력폼 -->
            <section class="commentForm">
                <h3>댓글쓰기</h3>
                <form action="#">
                    <textarea name="comment"></textarea>
                    <div>
                        <a href="#" class="btnCancel">취소</a>
                        <input type="submit" class="btnWrite" value="작성완료"/>
                    </div>
                </form>
            </section>

        </section>
    </div>    
</body>
</html>