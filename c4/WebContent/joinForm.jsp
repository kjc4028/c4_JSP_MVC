<%@page import="memberDao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script>
function checkID() {
	var id = document.reg_frm.id.value;
	if (id == '') {
		alert('아이디를 입력하세요');
		document.reg_frm.checkuse.value = false;
		return;
	}else if(id !=''){
		document.reg_frm.checkuse.value = true;
		var url = '/c4/idCheck.do?id=' + id;
		window.open(url, '', 'width=300, height=350, left=0, top=0');
	}
	

}

function enableID() {
	document.reg_frm.checker.disabled = false;
}

function disableID() {
	document.reg_frm.checker.disabled = true;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script language="JavaScript" src="members.js"></script>
<style>
input:focus {
	outline: 3px;
	outline-color: #58ACFA;
	outline-style: solid
}

input {
	boder: 2px solid #FFF;
	background-color: transparent;
}

#title {
	text-align: center;
	background-color: orange;
}
table{
position: relative;
left: 50px;
top: 10px;
}
#idcheck {
 width: 100px;
}
</style>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>

	<%
		request.setCharacterEncoding("utf-8");
	
	%>
	&nbsp;
<!-- 	<form action="/c4/joinAction.do" method="post" name="reg_frm">
		<table border="1" style="border-width: 1px">
			<tr>
				<th id="title">이름</th>
				<td><input type="text" name="name" style="ime-mode: active"></td>
			</tr>
			<tr>
				<th id="title">아이디</th>
				<td><input onkeyup="enableID()" type="text" name="id"
					style="ime-mode: disabled" /> 
					<input onclick="checkID()"type="button" name="checker" value="중복확인" /></td>
				<td>
				<input type="hidden" name="checkuse" value="false">
			<tr>
				<th id="title">비밀번호</th>
				<td><input type="password" name="password"></td>
				<td>
			<tr>
				<td><input type="button" value="회원가입" onclick="infoConfirm()"></td>
			</tr>
		</table>
	</form> -->

	
	 <div class="container">
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
         <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="/c4/joinAction.do"  name ="reg_frm">
               <h3 style="text-align:center;">회원 가입 화면</h3>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="이름" name="name" maxlength="20">
               </div>
               
               <div class="form-group">
                <input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20"> 
                <input type="button" class="btn btn-primary form-control" id = "idcheck" value="중복확인" onclick="checkID()" >
                  <input type="hidden" name="checkuse" value="false">
               </div>
               <div class="form-group">
                <input type="password" class="form-control" placeholder="비밀번호" name="password" maxlength="20">
               </div>
             
               <input type="button" class="btn btn-primary form-control" value="회원가입" onclick="infoConfirm()">
            </form>
         </div>
         <div class="col-lg-4"></div>
      </div>
      <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
      <script src="js/bootstrap.js"></script>
      </div>
	
	
      <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
      <script src="js/bootstrap.js"></script>
      
      
  
</body>
</html>