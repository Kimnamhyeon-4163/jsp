<%@ page contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/*
		XML(Extensible Markup Language)
		- JSON 과 더불어 이기종간의 데이터 전송을 위한 문서 포맷
		-사용자가 직접 태그를 정의
		- JSon 보다 파싱속도가 느리다는 단점이있다.
	*/

	String  xml  = "<members>";
	
			xml +="<member>";
			xml +="<uid>A101</uid>";
			xml +="<name>김유신</name>";
			xml +="<hp>010-1111-1234</hp>";
			xml +="<pos>사원</pos>";
			xml +="</member>";
			
			xml +="<member>";
			xml +="<uid>A102</uid>";
			xml +="<name>김춘추</name>";
			xml +="<hp>010-1111-1235</hp>";
			xml +="<pos>과장</pos>";
			xml +="</member>";
			
			xml +="<member>";
			xml +="<uid>A103</uid>";
			xml +="<name>장보고</name>";
			xml +="<hp>010-2222-1234</hp>";
			xml +="<pos>부장</pos>";
			xml +="</member>";

			xml +="<member>";
			xml +="<uid>A104</uid>";
			xml +="<name>찐찐찐찐이야 완전찐이야</name>";
			xml +="<hp>010-5252-2954</hp>";
			xml +="<pos>사장</pos>";
			xml +="</member>";
	
			xml += "</members>";
	//xml 출력
	out.print(xml);




%>