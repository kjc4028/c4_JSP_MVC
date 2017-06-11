<%@page import="bbsDao.ArticleDao"%>
<%@page import="bbsDto.Article"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="home.jsp"></jsp:include>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("useID");
		}

		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='bbsList.jsp'");
			script.println("</script>");
		}
		Article bbs = new ArticleDao().getBbs(bbsID,true);
		System.out.println(bbs.getReadcnt());

		Article article = (Article)request.getAttribute("article");
	%>
	<c:set var = "a" value="5"/>
		<c:set var = "a" value="<%= article %>"/>
	[JSTL 이용한 출력]<br>
		글제목:${a.getTitle()} <br>
		작성자: ${a.getUserID()}<br>
		작성일자:${a.getRegdate()}<br>
		조회수: ${a.getReadcnt()}<br>
		글내용: ${a.getContent()}<br><br>
	
	[일반적 출력]<br>
		글 제목 :<%=bbs.getTitle()%><br> 
	작성자 :<%=bbs.getUserID()%><br>
	 작성일자 :<%=bbs.getRegdate()%><br> 
	 조회수 :<%=bbs.getReadcnt()%><br> 
	 글내용 :<%=bbs.getContent()%><br>
	  
	
	<a href="bbsList.jsp">목록으로</a>
</body>
</html>