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
			script.println("alert('��ȿ���� ���� ���Դϴ�.')");
			script.println("location.href='bbsList.jsp'");
			script.println("</script>");
		}
		Article bbs = new ArticleDao().getBbs(bbsID,true);
		System.out.println(bbs.getReadcnt());

		Article article = (Article)request.getAttribute("article");
	%>
	<c:set var = "a" value="5"/>
		<c:set var = "a" value="<%= article %>"/>
	[JSTL �̿��� ���]<br>
		������:${a.getTitle()} <br>
		�ۼ���: ${a.getUserID()}<br>
		�ۼ�����:${a.getRegdate()}<br>
		��ȸ��: ${a.getReadcnt()}<br>
		�۳���: ${a.getContent()}<br><br>
	
	[�Ϲ��� ���]<br>
		�� ���� :<%=bbs.getTitle()%><br> 
	�ۼ��� :<%=bbs.getUserID()%><br>
	 �ۼ����� :<%=bbs.getRegdate()%><br> 
	 ��ȸ�� :<%=bbs.getReadcnt()%><br> 
	 �۳��� :<%=bbs.getContent()%><br>
	  
	
	<a href="bbsList.jsp">�������</a>
</body>
</html>