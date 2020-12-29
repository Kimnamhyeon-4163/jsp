<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글보기</title>
    <link rel="stylesheet" href="/Farmstory1/css/style.css"/>
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
                    <td><input type="text" name="title" value="2" readonly/></td>
                </tr>
                <tr>
                    <td>첨부파일</td>
                    <td>
                        <a href="#">dddddd</a>
                        <span>1회 다운로드</span>
                    </td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content" readonly>dddd</textarea>
                    </td>
                </tr>
            </table>
            <div>
                <a href="#" class="btnDelete">삭제</a>
                <a href="#" class="btnModify">수정</a>
                <a href="#" class="btnList">목록</a>
            </div>  
            
            <!-- 댓글리스트 -->
            <section class="commentList">
                <h3>댓글목록</h3>
                
                <article class="comment">
                    <span>
                        <span>123</span>
                        <span>1234</span>
                    </span>
                    <textarea name="comment" readonly>ddd</textarea>
                    <div>
                        <a href="#" class="cmtDelete">삭제</a>
                        <a href="#" class="cmtModify">수정</a>
                    </div>
                </article>
                <p class="empty">
                    등록된 댓글이 없습니다.
                </p>
            </section>

            <!-- 댓글입력폼 -->
            <section class="commentForm">
                <h3>댓글쓰기</h3>
                <form action="/Jboard1/proc/comment.jsp" method="post">
                	<input type="hidden" name="parent" value="ddd"/>
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