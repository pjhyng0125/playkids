<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$('#cancel').click(function(){
			self.location="/board/list";
		});
		
	});
</script>
</head>
<body>
<center>
<h3>글쓰기 페이지</h3>
<form method="post">
	<input type="hidden" name="mid" value="qwer1234">
	<label>제목 : </label> <input type="text" name="title" size="37" style="width:57%"><br>
	<label>내용</label>
	<textarea rows="10" cols="40" name="content" style="width: 60%"></textarea><br>
	
	<input type="submit" value="작성" class="btn btn-info"> <input type="reset" value="취소" id="cancel" class="btn btn-warning">
	
</form>
</center>
</body>
</html>