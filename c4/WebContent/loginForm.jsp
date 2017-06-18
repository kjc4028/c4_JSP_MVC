<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
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
<jsp:include page="menu.jsp"></jsp:include>

<!-- 
<form action="/c4/loginAction.do" method="post" name ="lg_frm">
<table border="1" style="border-width: 1px" >
<tr><th id ="title">아이디:</th><td><input type="text" name="id" style="ime-mode: disabled" ></td></tr>
<tr><th id = "title">비밀번호:</th><td><input type="password" name="password"></td></tr>
<tr><td><input type="button" value="로그인" onclick="loginConfirm()"></td></tr>
</table>
</form> -->
&nbsp;
 <div class="container">
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
         <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="/c4/loginAction.do"  name ="lg_frm">
               <h3 style="text-align:center;">로그인화면</h3>
               <div class="form-group">
                <input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20">
               </div>
               <div class="form-group">
                <input type="password" class="form-control" placeholder="비밀번호" name="password" maxlength="20">
               </div>
               <input type="button" class="btn btn-primary form-control" value="로그인" onclick="loginConfirm()">
               <input type="button" class="btn btn-primary form-control" value="회원가입" onclick="location.href='joinForm.jsp';">
            </form>
         </div>
         <div class="col-lg-4"></div>
      </div>
      <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
      <script src="js/bootstrap.js"></script>
      </div>
</body>
</html>