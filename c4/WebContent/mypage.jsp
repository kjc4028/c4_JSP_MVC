<%@page import="java.util.Set"%>
<%@page import="memberDto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
</head>
<body>
<%
		String userID = null;
		if (session.getAttribute("id2") != null) {
			userID = (String) session.getAttribute("id2");

		}
	%>
<% MemberDto memInfo = (MemberDto)request.getAttribute("memInfo"); %>


<jsp:include page="home.jsp"></jsp:include>

<c:set var="mem" value="<%=memInfo %>"/>
<form action="/c4/MemModify.do" method="post">
아이디 : <label><%=userID%> </label>
<input type = "hidden" name = "id" value=<%=userID%> ><br>
비밀번호 : <input type = "password" name = "password" value="${mem.getPassword() }"><br>
비밀번호 확인 : <input type = "password" name = "passwordConfirm"><br>
이름 : <input type = "text" name = "name" value="${mem.getName() }"><br>
<input type="submit" value="회원 정보 변경"> 
</form>
</body>
</html>