<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#submit").click(function(){
			var count=$("select option:selected").val();
			//카테고리 유효성 검사			
			if(count==0){
				alert("카테고리를 선택해주세요");
				return false;
			}else{
				return true;
			}
		});
	});
</script>
</head>
<body>
	<form method="post" action="faqInsert">
		<select name="fcategory" id="category">
			<option value="0">----</option>
			<option>로그인</option>
			<option>탈퇴</option>
			<option>입금</option>
			<option>환불</option>
			<option>수업정보</option>
		</select><br>
		제목<br>
		<input type="text" name="ftitle"><br>
		답변<br>
		<textarea rows="30" cols="60" name="fanswer"></textarea><br>
		
		<button type="submit" id="submit">입력</button>
		<button type="reset">취소</button>
	</form>

</body>
</html>