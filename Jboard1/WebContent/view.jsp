<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@page import="java.util.List"%>
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
	
	MemberBean mb = (MemberBean) session.getAttribute("smember");
	String uid = mb.getUid();
	
	//조회수 업데이터
	ArticleDao.getInstance().updateHit(seq);
	//조회글 가져오기
	ArticleBean ab = ArticleDao.getInstance().selectArticle(seq);

	//댓글 가져오기
	List<ArticleBean> comments = ArticleDao.getInstance().selectComments(seq);




%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글보기</title>
    <link rel="stylesheet" href="/Jboard1/css/style.css"/>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
    
    $(function() {
		$('.btnDelete, .cmtDelete').click(function() {
			
			var result = confirm('정말 삭제 하시겠습니까?');
			
			if(result){
				return true;				
			}else{
				
				return false;
			}
			
			
		});
		var commentValue = '';
		// 댓글 수정
		$('.cmtModify').click(function () {
			
			var btcCancel = $(this).next();
			var btcCommplete = $(this).next().next();
			btcCancel.removeClass('disable');
			btcComplete.removeClass('disable');
			$(this).addClass('disable');
			
			var textarea = $(this).parent().prev();
			textarea.attr('readonly', false) ;
			textarea.focus();
			commentValue = textarea.text();
			
			return false;
		
		});
		//댓글 수정 취소 버튼
		$('.cmtModifyCancel').click(function() {
			$(this).addClass('disable');
			$(this).next().addClass('disable');
			$(this).prev().removeClass('disable');
			
			$(this).parent().prev().val(commentValue);
			$(this).parent().prev().attr('readonly', true);
			return false;
		});
		//댓글 수정완료 버튼
		$('.cmtModifyComplete').click(function() {
			
			var thisTag = $(this);
			var textarea = $(this).parent().prev();
			var seq = $(this).attr('data-value');
			var content = textarea.val();
			
			var jsonData ={
					'seq': seq,
					'content': content
			};
			
			$.ajax({
				url:'/Jboard1/proc/modifyComment.jsp',
				type:'post',
				data:jsonData,
				dataType:'json',
				success: function(data) {
					
					if(data.result == 1){
						alert('수정완료');
						textarea.attr('readonly', true);
						
						thisTag.addClass('disable');
						thisTag.prev().addClass('disable');
						thisTag.prev().prev().removeClass('disable');
					}else{
						alert('수정실패');
					}
				}
			});
			return false;
		});
		
    	
	});
    
    
    </script>
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
                        <a href="/Jboard1/proc/download.jsp?seq=<%= ab.getFile() %>"><%=ab.getOldName() %></a>
                        <span><%= ab.getDownload() %>회 다운로드</span>
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
                <%
                	if(ab.getComment() > 0){
               
                		for(ArticleBean comment : comments){
                	
               	%>
                <article class="comment">
                    <span>
                        <span><%=comment.getNick() %></span>
                        <span><%=comment.getRdate().substring(2,10) %></span>
                    </span>
                    <textarea name="comment" readonly><%=comment.getContent() %></textarea>
                    <%if(uid.equals(comment.getUid())){ %>
                    <div>
                        <a href="/Jboard1/proc/deleteComment.jsp?seq=<%=comment.getSeq() %>&parent=<%=comment.getParent() %>" class="cmtDelete">삭제</a>
                        <a href="#" class="cmtModify">수정</a>
                        
                        <a href="#" class="cmtModifyCancel disable">수정취소</a>
                        <a href="#" class="cmtModifyComplete disable" data-value="<%=comment.getSeq()%>">수정완료</a>
                        
                    </div>
                    <%} %>
                </article>
                <%
                		}
                	}else{ 
                %>
                <p class="empty">
                    등록된 댓글이 없습니다.
                </p>
                <%} %>
            </section>

            <!-- 댓글입력폼 -->
            <section class="commentForm">
                <h3>댓글쓰기</h3>
                <form action="/Jboard1/proc/comment.jsp" method="post">
                	<input type="hidden" name="parent" value="<%= ab.getSeq() %>"/>
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