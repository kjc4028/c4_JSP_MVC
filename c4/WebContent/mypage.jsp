<%@page import="java.util.Set"%>
<%@page import="memberDto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("id2") != null) {
			userID = (String) session.getAttribute("id2");

		}
	%>
	<% MemberDto memInfo = (MemberDto)request.getAttribute("memInfo"); %>


	<jsp:include page="menu.jsp"></jsp:include>

	<c:set var="mem" value="<%=memInfo %>" />
	<br>

	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="/c4/MemModify.do" name="lg_frm">
					<h3 style="text-align: center;">개인정보 수정</h3>
					
					<div class="form-group">
						아이디 : <label class="form-control"><%=userID%> </label>
					</div>
					<div class="form-group">
						비밀번호 : <input type="password" name="password" class="form-control"
							value="${mem.getPassword() }"><br>
					</div>
					<div class="form-group">
						비밀번호 확인 : <input type="password" class="form-control"
							name="passwordConfirm"><br>
					</div>
					<div class="form-group">
						이름 : <input type="text" class="form-control" name="name"
							value="${mem.getName() }"><br>
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="회원 정보 변경">

				</form>
			</div>
			<div class="col-lg-4"></div>
		</div>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
	</div>
</body>
</html>