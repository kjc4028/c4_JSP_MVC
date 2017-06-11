<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>글 작성 페이지</title>
</head>
<body>
<jsp:include page="home.jsp"></jsp:include>
<br>
<form action="/c4/articleWrite.do" method="post">
<table border="1" align="center">
<tr><th colspan="2">게시판 글쓰기 양식</th></tr>
<tr><th>제 목</th><td><input type="text" name = "title" size = "30"><td></tr>
<tr><th>내 용</th><td><textarea name ="content" style="height: 200px; width: 200px;"></textarea></td></tr>
<tr><td></td><td><input type ="submit" value = "글 등록하기"></td></tr>
</table>
</form>
</body>
</html>