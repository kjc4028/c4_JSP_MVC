<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script type="text/javascript">
function goList(){
	location.href="/c4/bbsList.jsp";
} 
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>글 작성 페이지</title>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<br>
<div class="container">
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
         <div class="jumbotron" style="padding-top: 20px;">
<form action="/c4/articleWrite.do" method="post">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd" >
<tr><th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th></tr>
<tr><th style="background-color: #eeeeee; text-align: center;">제 목</th><td><input type="text" class="form-control"  name = "title" size = "30"><td></tr>
<tr><th style="background-color: #eeeeee; text-align: center;">내 용</th><td><textarea name ="content" class="form-control" style="height: 200px; width: 200px;"></textarea></td></tr>
<tr><td style="background-color: #eeeeee; text-align: center;"></td><td><input type ="submit" value = "글 등록하기" class="btn btn-primary form-control" ><input type="button" class="btn btn-primary form-control"  value = "목록으로" onclick="goList()"></td></tr>
</table>
</form>
     </div>
         <div class="col-lg-4"></div>
      </div>
      <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
      <script src="js/bootstrap.js"></script>
      </div>

 
</body>
</html>

