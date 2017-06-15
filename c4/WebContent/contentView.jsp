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
<title>Insert title here</title>
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<style type="text/css">
table {
position:relative;
	top:150px;
	margin-left:auto;
	margin-right:auto;
	text-align: center;
}

#btn {
position: absolute;
  top: 400px;
  left: 550px;
 
}

#btn1 {
position: absolute;
  top: 400px;
  left: 650px;
 
}

#btn2 {
position: absolute;
  top: 400px;
  left: 720px;
 
}

#btn3 {
position: absolute;
  top: 400px;
  left: 820px;
 
}

</style>
</head>
<body>
	<jsp:include page="home.jsp"></jsp:include>
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
		<table border="1" width="500">
		<c:set var = "a" value="<%= article %>"/>
	<!-- [JSTL 이용한 출력] -->
	<tr  ><td colspan="2"  style="font-size: 20px; text-align: center;" >게시글 내용</td></tr>
	<tr><th>글제목</th><td>${a.getTitle()} </td></tr>
		<tr><th>작성자</th><td> ${a.getUserID()}</td></tr>
		<tr><th>작성일자</th><td>${a.getRegdate()}</td></tr>
		<tr><th>조회수</th><td> ${a.getReadcnt()}</td></tr>
		<tr><th>글내용</th><td> ${a.getContent()}</td></tr>
		
		</table>
		
	
	<%-- [일반적 출력]<br>
		글 제목 :<%=bbs.getTitle()%><br> 
	작성자 :<%=bbs.getUserID()%><br>
	 작성일자 :<%=bbs.getRegdate()%><br> 
	 조회수 :<%=bbs.getReadcnt()%><br> 
	 글내용 :<%=bbs.getContent()%><br> --%>
	  

	<%if(userID != null){ %>
	<% if(!userID.equals(ID) ){%>
		<input id = "btn" type="button" value="목록으로" onclick="location.href='bbsList.jsp';" >
		<input id = "btn1"type="button" value="답변" onClick="location.href='/c4/ArticleReplyForm.do?bbsID=${a.getBbsID()}';">
	<%} %>
	<% if(userID.equals(ID)){%>
		<input id = "btn" type="button" value="목록으로" onclick="location.href='bbsList.jsp';" >
		<input id = "btn1" type="button" value="답변" onClick="location.href='/c4/ArticleReplyForm.do?bbsID=${a.getBbsID()}';">
		<input id = "btn2" type="button" value="삭제하기" onclick="location.href='/c4/ArticleSelfDelete.do?bbsID=${a.getBbsID()}';" >
				<input id = "btn3" type="button" value="수정하기" onclick="location.href='/c4/ArticleSelfModifyView.do?bbsID=${a.getBbsID()}';" >
		
	<%} %>
	<%} %>
		<%if(userID == null){ %>
		<input  id = "btn" type="button" value="목록으로" onclick="location.href='bbsList.jsp';" >
	<%} %>
</body>
</html>