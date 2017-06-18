<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bbsDao.ArticleDao"%>
<%@page import="bbsDto.Article"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
function goWrite(){
	location.href="/c4/goWrite.do";
}
	
	function delete1(){
		if(confirm("정말 삭제하시겠습니까?")){
			document.frm.submit();
		}
		else{
			return false;
		}
	}
	

</script>
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
	
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>게시판글 목록</title>
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<style type="text/css">
th {
	background-color: yellow;
}

table {
	position: relative;
	top: 150px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

#head {
	text-align: center;
}
</style>
<script language="JavaScript" src="members.js"></script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<%
		String userID = null;
		if (session.getAttribute("id2") != null) {
			userID = (String) session.getAttribute("id2");
		}
	%>
	<%
int pageNumber = 1; 
if(request.getParameter("pageNumber") != null){
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}
%>


	

<%if(userID != null){ %>
<!--  관리자 이외의 사용자 -->
<% if(!userID.equals("whd4028")){ %>
<h1 align="center">검색 결과</h1>
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd" >
		<tr>
			
			<th id="head" style="background-color: #eeeeee; text-align: center;">게시물 번호</th>
			<th id="head" style="background-color: #eeeeee; text-align: center;">제목</th>
			<th id="head" style="background-color: #eeeeee; text-align: center;">작성자</th>
			<th id="head" style="background-color: #eeeeee; text-align: center;">등록일자</th>
			<th id="head" style="background-color: #eeeeee; text-align: center;">조회수</th>
		</tr>
		<% ArticleDao dao = new ArticleDao();

				ArrayList<Article> list = dao.search(request.getParameter("search"));
				String hot = "";
				for (int i = 0; i < list.size(); i++) {
					
					
					if(list.get(i).getReadcnt()>20){
						hot = "[hot!!!]";
					}else if(list.get(i).getReadcnt()<=20){
						hot = " ";
					}
					%>


		<c:forEach var="b" items="${requestScope.searchRS}">
			<tr>
				
				<td>${b.getBbsID() }</td>
				<td><a href="/c4/contentView.do?bbsID=${b.getBbsID() }">${b.getTitle() }</a>&nbsp;<span
					style="color: red"><%= hot %></span></td>
				<td>${b.getUserID() }</td>
				<td>${b.getRegdate()}</td>
				<td>${b.getReadcnt() }</td>

			</tr>

		</c:forEach>

		<%} %>
		<tr>
			<td colspan="6"><input type="button" class="btn btn-primary" value="글작성하기"
				onclick="goWrite()"></td>
		</tr>
		</table>
		<%} %>
		
		<!-- 관리자 접속 -->
		<% if(userID.equals("whd4028")){ %>
		<h1 align="center">검색 결과</h1>
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd" >
		<tr>
			<th id="head" style="background-color: #eeeeee; text-align: center;">&nbsp;<input type="checkbox"
				id="allCheck">&nbsp;
			</th>
			<th id="head" style="background-color: #eeeeee; text-align: center;">게시물 번호</th>
			<th id="head" style="background-color: #eeeeee; text-align: center;">제목</th>
			<th id="head" style="background-color: #eeeeee; text-align: center;">작성자</th>
			<th id="head" style="background-color: #eeeeee; text-align: center;">등록일자</th>
			<th id="head" style="background-color: #eeeeee; text-align: center;">조회수</th>
		</tr>
		<% ArticleDao dao = new ArticleDao();

				ArrayList<Article> list = dao.search(request.getParameter("search"));
				String hot = "";
				for (int i = 0; i < list.size(); i++) {
					
					
					if(list.get(i).getReadcnt()>20){
						hot = "[hot!!!]";
					}else if(list.get(i).getReadcnt()<=20){
						hot = " ";
					}
					%>


		<c:forEach var="b" items="${requestScope.searchRS}">
			<tr>
				<td><input type="checkbox" name="rowcheck" id="rowcheck"
					value="${b.getBbsID() }"></td>
				<td>${b.getBbsID() }</td>
				<td><a href="/c4/contentView.do?bbsID=${b.getBbsID() }">${b.getTitle() }</a>&nbsp;<span
					style="color: red"><%= hot %></span></td>
				<td>${b.getUserID() }</td>
				<td>${b.getRegdate()}</td>
				<td>${b.getReadcnt() }</td>

			</tr>

		</c:forEach>

		<%} %>
		<tr>
			<td colspan="6"><input type="button" class="btn btn-primary" value="글작성하기"
				onclick="goWrite()"> <input type="button" class="btn btn-primary" value="삭제하기"
				onclick="delete1()"></td>
		</tr>
		<%} %>
		</table>
		<%} %>
 <!-- 비로그인상태 -->
		<% if(userID == null){ %>
		<h1 align="center">검색 결과</h1>
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd" >
		<tr>
			
			<th id="head" style="background-color: #eeeeee; text-align: center;">게시물 번호</th>
			<th id="head" style="background-color: #eeeeee; text-align: center;">제목</th>
			<th id="head" style="background-color: #eeeeee; text-align: center;">작성자</th>
			<th id="head" style="background-color: #eeeeee; text-align: center;">등록일자</th>
			<th id="head" style="background-color: #eeeeee; text-align: center;">조회수</th>
		</tr>
		<% ArticleDao dao = new ArticleDao();

				ArrayList<Article> list = dao.search(request.getParameter("search"));
				String hot = "";
				for (int i = 0; i < list.size(); i++) {
					
					
					if(list.get(i).getReadcnt()>20){
						hot = "[hot!!!]";
					}else if(list.get(i).getReadcnt()<=20){
						hot = " ";
					}
					%>


		<c:forEach var="b" items="${requestScope.searchRS}">
			<tr>
				
				<td>${b.getBbsID() }</td>
				<td><a href="/c4/contentView.do?bbsID=${b.getBbsID() }">${b.getTitle() }</a>&nbsp;<span
					style="color: red"><%= hot %></span></td>
				<td>${b.getUserID() }</td>
				<td>${b.getRegdate()}</td>
				<td>${b.getReadcnt() }</td>

			</tr>

		</c:forEach>

		<%} %>
		<tr>
			<td colspan="6"><input class="btn btn-primary" type="button" value="글작성하기"
				onclick="goWrite()"> </td>
		</tr>
		</table>
		<%} %>
	




</body>
</html>