<%@page import="bbsDao.ArticleDao"%>
<%@page import="bbsDto.Article"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function goList(){
	location.href="bbsList.jsp";

}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시글 내용 페이지</title>
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<%
		String userID = null;
		if (session.getAttribute("id2") != null) {
			userID = (String) session.getAttribute("id2");
			System.out.println("userID session: " + userID);

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

		Article article = (Article)request.getAttribute("article");
		String ID = bbs.getUserID();
		System.out.println(ID);

	%>
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd" >
		<c:set var = "a" value="<%= article %>"/>
	<!-- [JSTL 이용한 출력] -->
	<tr  ><td style="background-color: #eeeeee; text-align: center;" colspan="2" >게시글 내용</td></tr>
	<tr><th style="background-color: #eeeeee; text-align: center;">글제목</th><td >${a.getTitle()} </td></tr>
		<tr><th style="background-color: #eeeeee; text-align: center;">작성자</th><td> ${a.getUserID()}</td></tr>
		<tr><th style="background-color: #eeeeee; text-align: center;">작성일자</th><td>${a.getRegdate()}</td></tr>
		<tr><th style="background-color: #eeeeee; text-align: center;">조회수</th><td> ${a.getReadcnt()}</td></tr>
		<tr><th style="background-color: #eeeeee; text-align: center;">글내용</th><td> ${a.getContent()}</td></tr>
		
		</table>
		
	
	<%-- [일반적 출력]<br>
		글 제목 :<%=bbs.getTitle()%><br> 
	작성자 :<%=bbs.getUserID()%><br>
	 작성일자 :<%=bbs.getRegdate()%><br> 
	 조회수 :<%=bbs.getReadcnt()%><br> 
	 글내용 :<%=bbs.getContent()%><br> --%>
	  

	<%if(userID != null){ %>
	<% if(!userID.equals(ID) ){%>
		<input id = "btn" class="btn btn-primary" type="button" value="목록으로" onclick="location.href='bbsList.jsp';" >
		<input id = "btn1" class="btn btn-primary" type="button" value="답변" onClick="location.href='/c4/ArticleReplyForm.do?bbsID=${a.getBbsID()}';">
	<%} %>
	<% if(userID.equals(ID)){%>
		<input id = "btn" class="btn btn-primary" type="button" value="목록으로" onclick="location.href='bbsList.jsp';" >
		<input id = "btn1"  class="btn btn-primary" type="button" value="답변" onClick="location.href='/c4/ArticleReplyForm.do?bbsID=${a.getBbsID()}';">
		<input id = "btn2" class="btn btn-primary" type="button" value="삭제하기" onclick="location.href='/c4/ArticleSelfDelete.do?bbsID=${a.getBbsID()}';" >
				<input id = "btn3" class="btn btn-primary" type="button" value="수정하기" onclick="location.href='/c4/ArticleSelfModifyView.do?bbsID=${a.getBbsID()}';" >
		
	<%} %>
	<%} %>
		<%if(userID == null){ %>
		<input  id = "btn" class="btn btn-primary" type="button" value="목록으로" onclick="location.href='bbsList.jsp';" >
	<%} %>
</body>
</html>