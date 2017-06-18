<%@page import="memberDao.MemberDao"%>
<%@page import="memberService.IdCheck"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입 성공</title>
</head>
<body>

<% MemberDao memdao = new MemberDao();
	String id = request.getParameter("id");
 String aa = memdao.idCheck(id);
 System.out.println("하"+id+aa);
if(id.length()==0 ){
%>

<script>
alert("아이디를 입력해주세요.");
history.go(-1);
</script>
<%}else if(aa=="1"){%>
<script>
alert("사용 가능한 아이디 입니다.");
history.go(-1);
</script>
<%}else if(aa=="2"){ %>
<script>
alert("아이디가 존재합니다.");
history.go(-1);
</script>
<%} %>
</body>
</html>