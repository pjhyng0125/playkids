<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$('#cancel').click(function(){
			self.location="/board/list";
		});
		$('select[name=category]').click(function(){
			
			var i =document.form1.category.selectedIndex
			 
			if(i==1){
			/*	$.ajax({
						url:'/board'
				});*/
				$('#reserve').show();
			}else{
				$('#reserve').hide();
			}
		});
		
	});
</script>
</head>
<body>
<center>
<h3>글쓰기 페이지</h3>
<form method="post" name="form1">

	<input type="hidden" name="mid" value="${login_id }">
	<input type="hidden" id="login_type" value="${login_type }">
	<label>제목 : </label> <input type="text" name="title" size="40" style="width:50%" placeholder="제목을 입력하세요.">
	 <label>카테고리 : </label> <select name="category">
		<option selected="selected">잡담</option>
		<option id="comment">후기</option>
		<option>추천</option>
		<option>질문</option>
	</select><br><br>
	<div id="reserve"style="display: none">
		<fieldset style="width: 60%">
			<legend>수강강좌 선택하기</legend>
			<ul>
				<div>
					<li>강좌 목록 받아오기</li>
					<li>강좌 목록 받아오기2</li>
					
				</div>
			</ul>
		</fieldset>
		 
	</div>
	<hr width="60%">
	<label>내용</label><br>
	<textarea rows="10" cols="40" name="content" style="width: 60%" placeholder="내용을 입력하세요."></textarea><br>
	
	<input type="submit" value="작성" class="btn btn-info"> <input type="reset" value="취소" id="cancel" class="btn btn-warning">
	
</form>
</center>
</body>
</html>