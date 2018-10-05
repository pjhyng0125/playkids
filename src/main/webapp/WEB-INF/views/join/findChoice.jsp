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
<center>
<div class="container">
	<div>
	<h3>아이디/비밀번호 찾기 선택</h3><br>
		<table cellspacing="5" cellpadding="10" class="table-bordered">
		<tr>
			<td><input type="button" value="개인 회원" id="btmember">  
			    <input type="button" value="기업 회원" id="btbusiness"></td>		
		</tr>
		<tr>
			<td colspan="2" align="center"><a href="/login">로그인 화면으로</a></td>
		</tr>
		</table>
		
	</div>
</div>
</center>
<%@include file="../include/footer.jsp"%>