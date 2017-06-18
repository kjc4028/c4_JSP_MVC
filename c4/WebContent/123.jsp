<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="bbsDao.ArticleDao"%>
<%@page import="bbsDto.Article"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
<script language="JavaScript" src="members.js"></script>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("id2") != null) {
			userID = (String) session.getAttribute("id2");
			System.out.println("게시판 세션 :"+userID);

		}
	%>
	<%
int pageNumber = 1; 
if(request.getParameter("pageNumber") != null){
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}
%>
 <div class="container">
   <div class="row">
   <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
<thead>
   <tr>
   <th style="background-color: #eeeeee; text-align: center;">번호</th>
      <th style="background-color: #eeeeee; text-align: center;">제목</th>
      <th style="background-color: #eeeeee; text-align: center;">작성자</th>
      <th style="background-color: #eeeeee; text-align: center;">작성일</th>
         <th style="background-color: #eeeeee; text-align: center;">조회수</th>
   </tr>
   </thead>
   
   <tbody>
  
   <%
				Article dto = new Article();
				ArticleDao dao = new ArticleDao();
				ArrayList<Article> list = dao.getList(pageNumber);
				String hot = "";
				for (int i = 0; i < list.size(); i++) {
					
					if(list.get(i).getReadcnt()>20){
						hot = "[hot!!!]";
					}else if(list.get(i).getReadcnt()<=20){
						hot = " ";
					}
			%>
			<tr>
				
				<td><%=list.get(i).getBbsID()%></td>
				<td><c:forEach begin="1" end ="<%=list.get(i).getbIndent()%>">-></c:forEach>
				
				<a href="/c4/contentView.do?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getTitle()%></a>&nbsp;<span
					style="color: red"><%= hot %></span></td>
				<td><%=list.get(i).getUserID()%></td>
				<c:set var="date" value="<%=list.get(i).getRegdate()%>"/>
				
				
				<td>${fn:substring(date,0,4)}년
				${fn:substring(date, 5, 7)}월
			${fn:substring(date, 8, 10)}일  <br>
			${fn:substring(date, 11, 13)}시
			${fn:substring(date, 14, 16)}분</td>
				<td><%=list.get(i).getReadcnt()%></td>
			</tr>
   	<%} %>
   </tbody>
   </table>
 
   <input type="button" value="글작성하기" class="btn btn-primary pull-right"  onclick="goWrite()">
   </div>
   </div>
 
      <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
      <script src="js/bootstrap.js"></script>
   
</body>
</html>