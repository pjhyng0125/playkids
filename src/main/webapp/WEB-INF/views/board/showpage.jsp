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
	$('#list').click(function(){
		self.location="/board/list";
	});
	$('#del').click(function(){
		self.location="/board/delete?bno=${boardVO.bno}";
	});
	$('#mod').click(function(){
		self.location="/board/update?bno=${boardVO.bno}";
	});
});

</script>
</head>
<body>
<h3>게시물 보기</h3>
글 번호 : <input type="text" name="bno" size="3" value="${boardVO.bno }" readonly>
작성자 : <input type="text" name="mid" size="30" value="${boardVO.mid }" readonly>					<br>
제목 : <input type="text" name="title" value="${boardVO.title }" readonly>
조회수 :<input type="text" name="count" value="${boardVO.count }" readonly size="3">			<br>
내용 : <textarea rows="10" cols="40" name="content" readonly>${boardVO.content }</textarea>					<br>
<button id="mod">수정</button>
<button id="del">삭제</button>
<button id="list">목록으로</button><br>
<br>

<div>
	<label>댓글작성</label><br>
	작성자 : <input type="text" name="replyer" value="${boardVO.mid }" readonly ><br>
	내용 :  <textarea rows="3" cols="40" name="reply_content"></textarea><br>
	<input type="button" id="send_reply" value="댓글작성">
</div>
<div>
	<label>댓글목록</label><br>
	
</div>
</body>
</html>