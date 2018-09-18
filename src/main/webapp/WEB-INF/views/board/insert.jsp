<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>글쓰기 페이지</h3>
<form method="post">
	<input type="hidden" name="mid" value="qwer1234">
	제목 : <input type="text" name="title" size="40"><br>
	내용 : <textarea rows="10" cols="40" name="content"></textarea><br>
	<input type="submit" value="작성"><input type="reset" value="취소">

</form>
</body>
</html>