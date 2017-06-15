<%@page import="bbsDao.ArticleDao"%>
<%@page import="bbsDto.Article"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script type="text/javascript">
function goList(){
	location.href="/c4/bbsList.jsp";
} 
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>글 수정 페이지</title>
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
		
		
		
		Article bbs = new ArticleDao().getBbs(bbsID,true);

		Article article = (Article)request.getAttribute("article");
	%>
<br>
<form action="/c4/ArticleModifyAction.do" method="post">
<table border="1" align="center">
<tr><th colspan="2">게시판 수정 양식</th></tr>

<c:set var = "b" value="<%= article %>" />

<tr><th>제 목</th><td><input type="hidden" name = "bbsID" value="${b.getBbsID() }"><input type="text" name = "title" size = "30" value="${b.getTitle() }"><td></tr>
<tr><th>내 용</th><td><textarea name ="content" style="height: 200px; width: 200px;" >${b.getContent() }</textarea></td></tr>
<tr><td></td><td><input type ="submit" value = "수정하기"><input type="button" value = "목록으로" onclick="goList()"></td></tr>
</table>
</form>
</body>
</html>

