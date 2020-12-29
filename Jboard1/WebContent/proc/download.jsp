<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="kr.co.jboard1.bean.FileBean"%>
<%@page import="java.io.File"%>
<%@page import="kr.co.jboard1.db.DBConfig" %>
<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String seq = request.getParameter("seq");
	
	//파일 다운로드 카운트 업데이트
	ArticleDao.getInstance().updateFileDownload(seq);
	
	//파일 정보 SELECT
	FileBean fb = ArticleDao.getInstance().selectFile(seq);

	//파일 다운로드 response 헤더 수정
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(fb.getOldName(), "utf-8"));
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private");
	
	// response 객체 파일내용 스트림 작업
	String filePath = request.getServletContext().getRealPath("/file");
	
	File file = new File(filePath+"/"+fb.getNewName());

	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));	
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	
	while(true){
		int data = bis.read();
		if(data == -1){
			break;
		}
		bos.write(data);
	}
	bos.close();
	bis.close();
	

%>