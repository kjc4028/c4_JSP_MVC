<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>�޴���</title>
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
	
		<span id="a" title="��üȸ�� ��ȸ�� �̵�"> <a href="/c4/allSelect.do">��üȸ����ȸ</a>&nbsp;|&nbsp;
		</span>
		
		<span id="a" title="Ȩ���� �̵�" > <a href="index.jsp">HOME</a>&nbsp;|&nbsp;
		</span>
		
		<span id="a" title="�Խ������� �̵�" > <a href="bbsList.jsp">�Խ������� �̵�</a>&nbsp;|&nbsp;
		</span>
		
		<br><span id = "b"><%= userID %> (������) �� �α����� </span>&nbsp;&nbsp;
		<span id = "b"><a href="logout.jsp">�α׾ƿ� </a> </span>
		
	</div>
</nav>
<%} %>

	<% if(!userID.equals("whd4028") ){ %>
<nav>
	<div id="main">
	<span id = "a" ><a href=""><img src="images/jc1.png" width="70" height="50"></a></span>
	
		
		
		<span id="a" title="Ȩ���� �̵�" > <a href="index.jsp">HOME</a>&nbsp;|&nbsp;
		</span>
		
		<span id="a" title="�Խ������� �̵�" > <a href="bbsList.jsp">�Խ������� �̵�</a>&nbsp;|&nbsp;
		</span>
		
		<br><span id = "b"><%= userID %> �� �α����� </span>&nbsp;&nbsp;
		<span id = "b"><a href="logout.jsp">�α׾ƿ� </a> </span>
		
&nbsp;&nbsp;<span id = "b"><a href="/c4/Mypage.do?id=<%=userID %>">���������� </a> </span>
		
		
	</div>
</nav>
<%} %>
<%} %>
<%if(userID == null){ %>
<nav>
	<div id="main">
	<span id = "a" ><a href=""><img src="images/jc1.png" width="70" height="50"></a></span>
	
		<span id="a" title="Ȩ���� �̵�" > <a href="index.jsp">HOME</a>&nbsp;|&nbsp;
		</span>
		<span id="a" title="ȸ������â���� �̵�"> <a href="joinForm.jsp">ȸ�������ϱ�</a>&nbsp;|&nbsp;
		</span>
		
		<span id="a" title="�α��� ȭ������ �̵�"> <a href="loginForm.jsp">�α����ϱ�</a>&nbsp;|&nbsp;
		</span>
			<span id="a" title="�Խ������� �̵�" > <a href="bbsList.jsp">�Խ������� �̵�</a>&nbsp;|&nbsp;
		</span>
		
	</div>
</nav>
<%} %>
</body>
</html>