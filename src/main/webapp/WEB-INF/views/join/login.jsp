<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/reference.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
td{
	align-items: center;
	align-self: center;
	align-content: center;
}
</style>
</head>
<body>
<center>
<div class="container">
	<div>
		<h2>회원 가입</h2><br>
	<table cellspacing="5" cellpadding="10">
		<tr>
			<td width="150px">아이디:</td><td><input type="text"></td>
		</tr>
		<tr>
			<td>비밀번호:</td><td><input type="text"></td>
		</tr>
		<tr>
			<td><input type="radio" name="rb" checked> 개인</td>
			<td><input type="radio" name="rb"> 기업</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="로그인">
				<input type="submit" value="취소">
			</td>
		</tr>
		<tr>	
			<td colspan="2" align="center">
				<pre><a href="#">회원 가입</a>  <a href="#">아이디/비밀번호 찾기</a></pre>
			</td>
		</tr>
	</table>
	</div>
</div>
</center>
</body>
</html>