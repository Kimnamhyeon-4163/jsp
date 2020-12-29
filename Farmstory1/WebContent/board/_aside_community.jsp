<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cate = request.getParameter("cate");
	String title =null;
	
	if(cate.equals("notice")){
		title = "공지사항";
	}else if(cate.equals("meun")){
		title ="오늘의 식단";
	}else if(cate.equals("chef")){
		title ="나도 요리사";
	}else if(cate.equals("qna")){
		title ="고객문의";
	}else if(cate.equals("faq")){
		title ="자주묻는 질문";
	}

%>
        <div id="sub">
            <div><img src="/Farmstory1/img/sub_top_tit5.png" alt="COMMUNITY"></div>
            <section class="cate5">
                <aside>
                    <img src="/Farmstory1/img/sub_aside_cate5_tit.png" alt=" 커뮤니티">
                    <ul class="lnb">
                        <li class="<%= cate.equals("notice")? "on" : "off"%>"><a href="/Farmstory1/board/list.jsp?gnb=community&cate=notice">공지사항</a></li>
                        <li class="<%= cate.equals("menu")? "on" : "off" %>"><a href="/Farmstory1/board/list.jsp?gnb=community&cate=menu">오늘의 식단</a></li>
                        <li class="<%= cate.equals("chef")? "on" : "off" %>"><a href="/Farmstory1/board/list.jsp?gnb=community&cate=chef">나도 요리사</a></li>
                        <li class="<%= cate.equals("qna")? "on" : "off" %>"><a href="/Farmstory1/board/list.jsp?gnb=community&cate=qna">1:1고객문의</a></li>
                        <li class="<%= cate.equals("faq")? "on" : "off" %>"><a href="/Farmstory1/board/list.jsp?gnb=community&cate=faq">자주묻는질문</a></li>
                    </ul>
                </aside>
                <article>
                    <nav>
                        <img src="/Farmstory1/img/sub_nav_tit_cate5_<%=cate %>.png" alt="공지사항"/>
                        <p>
                            
                            HOME > 커뮤니티 > <em><%=title %></em>
                        </p>

                    </nav>
                    <!--내용시작-->