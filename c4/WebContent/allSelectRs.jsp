<%@page import="memberDto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="memberDao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("#allCheck").click(function() {
			if ($("#allCheck").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		})
	})
	
	function delete2(){
	if(confirm("정말 탈퇴시키시겠습니까?")){
		document.memberFrm.submit();
	}else{
		return false;
	}
	
}
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체 회원 목록</title>
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">


</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	

		<div id="tt" class="category-list">
		<form action="/c4/memberDelete.do" id="memberFrm" name="memberFrm"
		method="post">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd" >
				<thead>
				<tr>
					<th id="title" style="background-color: #eeeeee; text-align: center;"><input type="checkbox" id = "allCheck"name="allCheck"></th>
					<th id="title" style="background-color: #eeeeee; text-align: center;">이름</th>
					<th id="title" style="background-color: #eeeeee; text-align: center;">아이디</th>
					<th id="title" style="background-color: #eeeeee; text-align: center;">비밀번호</th>
				</tr>
</thead>
				<%
				MemberDao selectAll = new MemberDao();
				ArrayList<MemberDto> dtos = selectAll.memberSelect();

				for (int i = 0; i < dtos.size(); i++) {

					MemberDto dto = dtos.get(i);
					String name = dto.getName();
					String id = dto.getId();
					String password = dto.getPassword();
			%>
				<tr>
					<td><input type="checkbox" name="rowcheck" id="rowcheck"
						value="<%=id%>"></td>
					<td><%=name%></td>
					<td><%=id%></td>
					<td><%=password%></td>
				</tr>
				<%
			
				}
			%>
			
		

			</table>
						<input type="button" class="btn btn-primary" value="탈퇴시키기" onclick="delete2()">
		
	</form>
		</div>
		

</body>
</html>