<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자주묻는 질문 수정</title>
<script type="text/javascript">
	$(function(){	
		var formObj = $("form[role='editform']");
		
		$('#remove').on('click',function(){
			var result = confirm("정말로 삭제하시겠습니까?")
			if(result){				
				formObj.attr('action','/faq/remove');
				formObj.submit();
			}
				
		});
		
		$('#cancel').click(function(){
			self.location="/faq/faqList";
		});
	
	});
</script>
</head>
<body>
<center>
	<form action="/faq/faqModify" method="post" role='editform'>
	   	<h3>자주묻는 질문 수정</h3>
		<hr>
	    <input type="hidden" value="${faqVO.fno }" name="fno">
		<select name="fcategory">
			<option>${faqVO.fcategory }</option>
			<option>----</option>
			<option>로그인</option>
			<option>탈퇴</option>
			<option>입금</option>
			<option>환불</option>
			<option>수업정보</option>
		</select>
		<label>제목</label><input type="text" name="ftitle" value="${faqVO.ftitle}" size="40" style="width:30%"><br><br> 
		<label>답변</label><br>
		<textarea rows="10" cols="60" name="fanswer" style="width:39%">${faqVO.fanswer}</textarea>
		<br>

		<button type="submit" class="btn btn-info">수정</button>
		<button type="button" class="btn btn-danger" id="remove">삭제</button>
		<button type="button" id="cancel" class="btn btn-warning">취소</button>
	</form>
</center>

</body>
</html>