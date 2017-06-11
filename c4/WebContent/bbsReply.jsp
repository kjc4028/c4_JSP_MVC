<%@page import="bbsDto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		String userID = null;
		if (session.getAttribute("id2") != null) {
			userID = (String) session.getAttribute("id2");
		}
	%>
	
	<% String bbsID = request.getParameter("bbsID");
	System.out.println("답변페이지 bbsID:"+bbsID);
	
	Article article = (Article)request.getAttribute("article");

	%>
			<c:set var = "a" value="<%= article %>"/>

	<form action="/c4/ArticleReply.do" method="post">
<input type="text" name = "writer_name" value=<%=userID %>><br>
<input type="text" name = "title"><br>
<input type="text" name = "content"><br>
<input type="hidden" name = "bGroup" value="${a.getbGroup()}"><br>
<input type="hidden" name = "bStep" value="${a.getbStep()}"><br>
<input type="hidden" name = "bIndent" value="${a.getbIndent()}"><br>
<input type="submit" value="답변 등록"><br>
</form>




</body>
</html>