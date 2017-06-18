<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>메뉴바</title>
<style type="text/css">
div {
	
}

#main {
	text-align: left;
	background-color: black;
	height: 80px;
	weight: 100px;
}

#a {
	text-align: left;
font-size: large;
font-weight: 700;
color: white;
}
#a a:hover{
color: white;
}
#a a:link{
color: white;
}
#a a:visited{
color: white;
}
#b{
color: white;
}
#b a:link{
color: white;
background-color: gray;
}
#b a:hover{
color: white;
background-color: gray;

}

#b a:visited{
color: white;
background-color: gray;

}
</style>

</head>

<body>
<%
		String userID = null;
		if (session.getAttribute("id2") != null) {
			userID = (String) session.getAttribute("id2");
		}
	%>
	
	<%if(userID != null){ %>
		<%if(userID.equals("whd4028")){ %>
<nav>
	<div id="main">
	<span id = "a" ><a href="index.jsp"><img src="images/jc1.png" width="70" height="50"></a></span>
	
		<span id="a" title="전체회원 조회로 이동"> <a href="/c4/allSelect.do">전체회원조회</a>&nbsp;|&nbsp;
		</span>
		
		<span id="a" title="홈으로 이동" > <a href="index.jsp">HOME</a>&nbsp;|&nbsp;
		</span>
		
		<span id="a" title="게시판으로 이동" > <a href="bbsList.jsp">게시판으로 이동</a>&nbsp;|&nbsp;
		</span>
		
		<br><span id = "b"><%= userID %> (관리자) 님 로그인중 </span>&nbsp;&nbsp;
		<span id = "b"><a href="logout.jsp">로그아웃 </a> </span>
		
	</div>
</nav>
<%} %>

	<% if(!userID.equals("whd4028") ){ %>
<nav>
	<div id="main">
	<span id = "a" ><a href=""><img src="images/jc1.png" width="70" height="50"></a></span>
	
		
		
		<span id="a" title="홈으로 이동" > <a href="index.jsp">HOME</a>&nbsp;|&nbsp;
		</span>
		
		<span id="a" title="게시판으로 이동" > <a href="bbsList.jsp">게시판으로 이동</a>&nbsp;|&nbsp;
		</span>
		
		<br><span id = "b"><%= userID %> 님 로그인중 </span>&nbsp;&nbsp;
		<span id = "b"><a href="logout.jsp">로그아웃 </a> </span>
		
&nbsp;&nbsp;<span id = "b"><a href="/c4/Mypage.do?id=<%=userID %>">마이페이지 </a> </span>
		
		
	</div>
</nav>
<%} %>
<%} %>
<%if(userID == null){ %>
<nav>
	<div id="main">
	<span id = "a" ><a href=""><img src="images/jc1.png" width="70" height="50"></a></span>
	
		<span id="a" title="홈으로 이동" > <a href="index.jsp">HOME</a>&nbsp;|&nbsp;
		</span>
		<span id="a" title="회원가입창으로 이동"> <a href="joinForm.jsp">회원가입하기</a>&nbsp;|&nbsp;
		</span>
		
		<span id="a" title="로그인 화면으로 이동"> <a href="loginForm.jsp">로그인하기</a>&nbsp;|&nbsp;
		</span>
			<span id="a" title="게시판으로 이동" > <a href="bbsList.jsp">게시판으로 이동</a>&nbsp;|&nbsp;
		</span>
		
	</div>
</nav>
<%} %>
</body>
</html>