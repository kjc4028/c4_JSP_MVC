<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α��� ����</title>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>

<%
	String id1 = request.getParameter("id");
session.setAttribute("id2", id1);

%>
<%=session.getAttribute("id2") %> ��
�α��� ����
<%response.sendRedirect("index.jsp"); %>
</body>
</html>