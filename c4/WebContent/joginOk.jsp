<%@page import="memberDao.MemberDao"%>
<%@page import="memberService.IdCheck"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ����</title>
</head>
<body>

<% MemberDao memdao = new MemberDao();
	String id = request.getParameter("id");
 String aa = memdao.idCheck(id);
 System.out.println("��"+id+aa);
if(id.length()==0 ){
%>

<script>
alert("���̵� �Է����ּ���.");
history.go(-1);
</script>
<%}else if(aa=="1"){%>
<script>
alert("��� ������ ���̵� �Դϴ�.");
history.go(-1);
</script>
<%}else if(aa=="2"){ %>
<script>
alert("���̵� �����մϴ�.");
history.go(-1);
</script>
<%} %>
</body>
</html>