<%@page import="kr.co.jboard1.bean.TermsBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//DB 정보
	String host = "jdbc:mysql://192.168.10.114:3306/knh";
	String user = "knh";
	String pass = "1234";
	//1단계
	Class.forName("com.mysql.jdbc.Driver");
	//2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	//3단계
	Statement stmt = conn.createStatement();
	//4단계
	String sql = "SELECT * FROM `JBOARD_TEAMS`;";
	
	ResultSet rs = stmt.executeQuery(sql);
	
	//5단계
	TermsBean tb = new TermsBean();
	
	if(rs.next()){
		String	terms =rs.getString(1);
		String	privacy =rs.getString(2);
		
		
		tb.setTerms(terms);
		tb.setPrivacy(privacy);	
	}
	
	//6단계
	
	rs.close();
	conn.close();
	stmt.close();


%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>약관</title>
    <link rel="stylesheet" href="../css/style.css"/>    
</head>
<body>
    <div id="wrapper">
        <section id="user" class="terms">
            <table>
                <caption>사이트 이용약관</caption>
                <tr>
                    <td>
                        <textarea readonly><%= tb.getTerms() %></textarea>
                        <p>
                            <label><input type="checkbox" name="chk1"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <table>
                <caption>개인정보 취급방침</caption>
                <tr>
                    <td>
                        <textarea readonly><%= tb.getPrivacy() %></textarea>
                        <p>
                            <label><input type="checkbox" name="chk2"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Jboard1/user/login.jsp">취소</a>
                <a href="/Jboard1/user/register.jsp">다음</a>
            </div>
        </section>
    </div>
    
</body>
</html>