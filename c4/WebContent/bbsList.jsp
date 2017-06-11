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

#search1{
position: relative;
  top: 140px;
  left: 950px;
  width: 500px;
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

<!-- 페이징 처리  -->
<%!
	public Integer toInt(String x){
		int a = 0;
		try{
			a = Integer.parseInt(x);
		}catch(Exception e){}
		return a;
	}
%>
<%

	int pageno = toInt(request.getParameter("pageNumber"));
	if(pageno<1){//현재 페이지
		pageno = 1;
	}
	int total_record = 754;		   //총 레코드 수
	int page_per_record_cnt = 10;  //페이지 당 레코드 수
	int group_per_page_cnt =5;     //페이지 당 보여줄 번호 수[1],[2],[3],[4],[5]
//					  									  [6],[7],[8],[9],[10]											

	int record_end_no = pageno*page_per_record_cnt;				
	int record_start_no = record_end_no-(page_per_record_cnt-1);
	if(record_end_no>total_record){
		record_end_no = total_record;
	}
										   
										   
	int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt>0 ? 1 : 0);
	if(pageno>total_page){
		pageno = total_page;
	}

	

// 	현재 페이지(정수) / 한페이지 당 보여줄 페지 번호 수(정수) + (그룹 번호는 현제 페이지(정수) % 한페이지 당 보여줄 페지 번호 수(정수)>0 ? 1 : 0)
	int group_no = pageno/group_per_page_cnt+( pageno%group_per_page_cnt>0 ? 1:0);
//		현재 그룹번호 = 현재페이지 / 페이지당 보여줄 번호수 (현재 페이지 % 페이지당 보여줄 번호 수 >0 ? 1:0)	
//	ex) 	14		=	13(몫)		=	 (66 / 5)		1	(1(나머지) =66 % 5)			  
	
	int page_eno = group_no*group_per_page_cnt;		
//		현재 그룹 끝 번호 = 현재 그룹번호 * 페이지당 보여줄 번호 
//	ex) 	70		=	14	*	5
	int page_sno = page_eno-(group_per_page_cnt-1);	
// 		현재 그룹 시작 번호 = 현재 그룹 끝 번호 - (페이지당 보여줄 번호 수 -1)
//	ex) 	66	=	70 - 	4 (5 -1)
	
	if(page_eno>total_page){
//	   현재 그룹 끝 번호가 전체페이지 수 보다 클 경우		
		page_eno=total_page;
//	   현재 그룹 끝 번호와 = 전체페이지 수를 같게
	}
	
	int prev_pageno = page_sno-group_per_page_cnt;  // <<  *[이전]* [21],[22],[23]... [30] [다음]  >>
//		이전 페이지 번호	= 현재 그룹 시작 번호 - 페이지당 보여줄 번호수	
//	ex)		46		=	51 - 5				
	int next_pageno = page_sno+group_per_page_cnt;	// <<  [이전] [21],[22],[23]... [30] *[다음]*  >>
//		다음 페이지 번호 = 현재 그룹 시작 번호 + 페이지당 보여줄 번호수
//	ex)		56		=	51 - 5
	if(prev_pageno<1){
//		이전 페이지 번호가 1보다 작을 경우		
		prev_pageno=1;
//		이전 페이지를 1로
	}
	if(next_pageno>total_page){
//		다음 페이지보다 전체페이지 수보가 클경우		
		next_pageno=total_page/group_per_page_cnt*group_per_page_cnt+1;
//		next_pageno=total_page
//		다음 페이지 = 전체페이지수 / 페이지당 보여줄 번호수 * 페이지당 보여줄 번호수 + 1 
//	ex)			   = 	76 / 5 * 5 + 1	???????? 		
	}
	
	// [1][2][3].[10]
	// [11][12]
%>


<%-- 현재 페이지   (pageno)   : <%=pageno%><br />
전체 데이터 수   (total_record) : <%=total_record %><br />
한페이지 당 레코드 수   (page_per_record_cnt) : <%=page_per_record_cnt %><br />
한페이지 당 보여줄 페지 번호 수   (group_per_page_cnt) : <%=group_per_page_cnt %><br />

<hr />
레코드 시작 번호  (record_start_no) : <%=record_start_no%><br />
레코드 끝 번호    (record_end_no) : <%=record_end_no %><br />
전체페이지 수     (total_page)  : <%=total_page %><br />
<hr />
현재 그룹번호 [1] (group_no):  <%=group_no %><br />
현재 그룹 시작 번호(page_sno): <%= page_sno%><br />
현재 그룹 끝 번호  (page_eno): <%= page_eno%><br />
이전 페이지 번호   (prev_pageno) <%=prev_pageno%><br />
다음 페이지 번호   (next_pageno) <%=next_pageno%><br />
<hr /> --%>





	<jsp:include page="home.jsp"></jsp:include>

	<form action="/c4/articleSearch.do">
		<span id = "search1" >
	<input type="text" name = "search"/>
	
	<input type="submit" value = "search"/>
	</span>
</form>

	<form name="frm" id="frm" action="/c4/articleDelete.do" method="post">
		<table  border="1" id = "table1">
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



		
		<a href="bbsList.jsp?pageNumber=1">[맨앞으로]</a>
<a href="bbsList.jsp?pageno=<%=pageNumber -1 %>">[이전]</a> 
<%for(int i =page_sno;i<=page_eno;i++){%>
	<a href="bbsList.jsp?pageNumber=<%=i %>">
		<%if(pageno == i){ %>
			[<%=i %>]
		<%}else{ %>
			<%=i %>
		<%} %>
	</a> 
<%--	콤마	 --%>	
	<%if(i<page_eno){ %>
		,
	<%} %>
<%} %>
 
<a href="bbsList.jsp?pageNumber=<%=pageNumber +1 %>" >[다음]</a>
<a href="bbsList.jsp?pageNumber=<%=total_page %>">[맨뒤로]</a>

		</td></tr>

		</table>

		</form>
	
	
	

</body>
</html>