<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 성공</title>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>

<%
	String id1 = request.getParameter("id");
session.setAttribute("id2", id1);

%>
<%=session.getAttribute("id2") %> 님
로그인 성공
<%response.sendRedirect("index.jsp"); %>
</body>
</html>