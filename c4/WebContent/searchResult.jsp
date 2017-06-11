<%@page import="java.util.ArrayList"%>
<%@page import="bbsDao.ArticleDao"%>
<%@page import="bbsDto.Article"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
position:relative;
	top:150px;
	margin-left:auto;
	margin-right:auto;
	text-align: center;
}

#head {
	text-align: center;
}
</style>
<script language="JavaScript" src="members.js"></script>
</head>
<body>
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




	<jsp:include page="home.jsp"></jsp:include>


<h1 align="center">검색 결과</h1>
		<table border="1">
				<tr>
				<th id="head" width="50">&nbsp;<input type="checkbox" id="allCheck">&nbsp;
				</th>
				<th id="head" width="100">게시물 번호</th>
				<th id="head" width="200">제목</th>
				<th id="head" width="100">작성자</th>
				<th id="head" width="180">등록일자</th>
				<th id="head" width="50">조회수</th>
			</tr>
			<%
				Article dto = new Article();
				ArticleDao dao = new ArticleDao();
				ArrayList<Article> list = dao.search(request.getParameter("search"));
				String hot = "";
				for (int i = 0; i < list.size(); i++) {
					
					if(list.get(i).getReadcnt()>20){
						hot = "[hot!!!]";
					}else if(list.get(i).getReadcnt()<=20){
						hot = " ";
					}
			%>
		<tr>
				<td><input type="checkbox" name="rowcheck" id="rowcheck"
					value="<%=list.get(i).getBbsID()%>"></td>
				<td><%=list.get(i).getBbsID()%></td>
				<td><a
					href="/c4/contentView.do?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getTitle()%></a>&nbsp;<span
					style="color: red"><%= hot %></span></td>
				<td><%=list.get(i).getUserID()%></td>
				<td><%=list.get(i).getRegdate()%></td>
				<td><%=list.get(i).getReadcnt()%></td>
			</tr>
			<%
				}
			%>
			
			<tr>
			<td colspan="6"><input type="button" value="글작성하기" onclick="goWrite()"> <input
			type="button" value="삭제하기" onclick="delete1()">



		


		</td></tr>
		</table>

		


</body>
</html>