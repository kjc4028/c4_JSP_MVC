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
<title>�Խñ� ���� ������</title>
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
			script.println("alert('��ȿ���� ���� ���Դϴ�.')");
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
	<!-- [JSTL �̿��� ���] -->
	<tr  ><td style="background-color: #eeeeee; text-align: center;" colspan="2" >�Խñ� ����</td></tr>
	<tr><th style="background-color: #eeeeee; text-align: center;">������</th><td >${a.getTitle()} </td></tr>
		<tr><th style="background-color: #eeeeee; text-align: center;">�ۼ���</th><td> ${a.getUserID()}</td></tr>
		<tr><th style="background-color: #eeeeee; text-align: center;">�ۼ�����</th><td>${a.getRegdate()}</td></tr>
		<tr><th style="background-color: #eeeeee; text-align: center;">��ȸ��</th><td> ${a.getReadcnt()}</td></tr>
		<tr><th style="background-color: #eeeeee; text-align: center;">�۳���</th><td> ${a.getContent()}</td></tr>
		
		</table>
		
	
	<%-- [�Ϲ��� ���]<br>
		�� ���� :<%=bbs.getTitle()%><br> 
	�ۼ��� :<%=bbs.getUserID()%><br>
	 �ۼ����� :<%=bbs.getRegdate()%><br> 
	 ��ȸ�� :<%=bbs.getReadcnt()%><br> 
	 �۳��� :<%=bbs.getContent()%><br> --%>
	  

	<%if(userID != null){ %>
	<% if(!userID.equals(ID) ){%>
		<input id = "btn" class="btn btn-primary" type="button" value="�������" onclick="location.href='bbsList.jsp';" >
		<input id = "btn1" class="btn btn-primary" type="button" value="�亯" onClick="location.href='/c4/ArticleReplyForm.do?bbsID=${a.getBbsID()}';">
	<%} %>
	<% if(userID.equals(ID)){%>
		<input id = "btn" class="btn btn-primary" type="button" value="�������" onclick="location.href='bbsList.jsp';" >
		<input id = "btn1"  class="btn btn-primary" type="button" value="�亯" onClick="location.href='/c4/ArticleReplyForm.do?bbsID=${a.getBbsID()}';">
		<input id = "btn2" class="btn btn-primary" type="button" value="�����ϱ�" onclick="location.href='/c4/ArticleSelfDelete.do?bbsID=${a.getBbsID()}';" >
				<input id = "btn3" class="btn btn-primary" type="button" value="�����ϱ�" onclick="location.href='/c4/ArticleSelfModifyView.do?bbsID=${a.getBbsID()}';" >
		
	<%} %>
	<%} %>
		<%if(userID == null){ %>
		<input  id = "btn" class="btn btn-primary" type="button" value="�������" onclick="location.href='bbsList.jsp';" >
	<%} %>
</body>
</html>