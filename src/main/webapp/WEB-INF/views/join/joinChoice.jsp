<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/reference.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$('#btmember').click(function(){
			location.href="/joinmember";			
		});
		$('#btbusiness').click(function(){
			location.href="/joinbusiness";			
		});
	});
</script>
</head>
<body>
<center>
<div class="container">
	<div>
	<h3>회원 가입 선택</h3><br>
		<pre>
		<input type="button" value="개인 회원 가입" id="btmember">   <input type="button" value="기업 회원 가입" id="btbusiness">		
		</pre><br>
		<a href="/login">로그인 화면으로</a>
		
	</div>
</div>
</center>
</body>
</html>