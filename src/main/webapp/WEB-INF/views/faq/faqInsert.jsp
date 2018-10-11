<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자주묻는 질문 작성</title>
<script type="text/javascript" src="../resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#cancel").click(function(){
			self.location="faqList"
		});
		
		
		var str = $("#fanswer").val();
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
	
		
		 $("#submit").click(function(){
			var count=$("select option:selected").val();
			var title=$("#ftitle").val();
			var answer=$("#fanswer").val();
			
			if(count==0){
				alert("카테고리를 선택하세요!");
			
			}else if(title ==''){
				alert("제목을 입력하세요!");
				$("#ftitle").focus();
				
			
			}else if(answer ==''){
				alert("내용을 입력하세요!");
				$("#fanswer").focus();
				
			}else{
				
				return true;
			}
			return false;
		
			});		 
	
	});
</script>
</head>
<body>
	<center>
	<form method="post" action="faqInsert" id="insertForm">
		<h3>자주묻는 질문 작성</h3>
		<hr>
		<select name="fcategory" id="category">
			<option value="0">----</option>
			<option>로그인</option>
			<option>탈퇴</option>
			<option>입금</option>
			<option>환불</option>
			<option>수업정보</option>
		</select>
		<label>제목</label> <input type="text" id="ftitle" name="ftitle" size="40" style="width:30%" placeholder="제목을 입력하세요."><br><br>
		<label>답변</label><br>
		<textarea rows="10" cols="60" name="fanswer" id="fanswer" placeholder="답변을 입력하세요." style="width:39%"></textarea><br>
		
		<input type="submit" id="submit" class="btn btn-info" value="입력"/>
		<button type="reset" class="btn btn-warning" id="cancel">취소</button>
	</form>
	</center>
</body>
</html>