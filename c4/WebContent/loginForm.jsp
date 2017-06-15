<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script language="JavaScript" src="members.js"></script>
<style>
table{
border: solid;
text-align: center;
position: relative;
left: 100px;
top: 100px;
}
tr, td{
border: solid;

}
#title{
text-align: center;
background-color: orange;
}
</style>
</head>
<body>
<jsp:include page="home.jsp"></jsp:include>


<form action="/c4/loginAction.do" method="post" name ="lg_frm">
<table border="1" style="border-width: 1px" >
<tr><th id ="title">아이디:</th><td><input type="text" name="id" style="ime-mode: disabled" ></td></tr>
<tr><th id = "title">비밀번호:</th><td><input type="password" name="password"></td></tr>
<tr><td><input type="button" value="로그인" onclick="loginConfirm()"></td></tr>
</table>
</form>
</body>
</html>