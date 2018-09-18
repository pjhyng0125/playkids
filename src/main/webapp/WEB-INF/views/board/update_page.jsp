<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#cancel').click(function(){
			self.location="/board/list";
		});
		
	});
</script>
</head>
<body>
<h3>게시물 수정</h3>
<form action="/board/update" method="post">
글 번호 : <input type="text" name="bno" size="3" value="${boardVO.bno }" readonly>
작성자 : <input type="text" name="mid" size="40" value="${boardVO.mid }" readonly>					<br>
제목 : <input type="text" name="title" value="${boardVO.title }" >
조회수 :<input type="text" name="count" value="${boardVO.count }" readonly size="3">			<br>
내용 : <textarea rows="10" cols="40" name="content">${boardVO.content }</textarea>					<br>
<input type="submit" value="확인">
<input type="button" id="cancel" value="취소">
</form>
</body>
</html>