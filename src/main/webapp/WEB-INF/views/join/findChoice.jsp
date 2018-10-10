<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/reference.jsp"%>
<title>joinchoice</title>
<script type="text/javascript">

	$(function(){
		$('#btmember').click(function(){
			location.href="/findid?find_id=member";			
		});
		$('#btbusiness').click(function(){
			location.href="/findid?find_id=business";			
		});
			
	});
</script>
</head>
<body>
<div class="container">
<form>
	<h1>아이디/비밀번호 찾기 선택</h1>
	<div class="btn-box">
		<button type="button" class="btn btn-submit" id="btmember">개인 회원</button>
		<button type="button" class="btn btn-submit" id="btbusiness">기업 회원</button>
	</div>
	<div class="btn-box">	
		<a href="/login">로그인 화면으로</a>
	</div>
</form>
</div>
<%@include file="../include/footer.jsp"%>