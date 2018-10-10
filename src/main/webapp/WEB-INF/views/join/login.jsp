<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/reference.jsp"%>
<title>login</title>
<script type="text/javascript">
	$(function(){
		$('#btlogin').click(function(){
			selectlogin();
		});//로그인 button 클릭 시
		$('#btcancel').click(function(){
			alert('취소 버튼 클릭');
			
		});//취소 button 클릭 시
	});//function
	function selectlogin(){
		$.ajax({
			url:"/findlogin",
			data:{
				type:$('input[name=rb]:checked').val(),
				id:$('#id').val(),
				pw:$('#pw').val()
			},
			type:"POST",
			success:function(result){
				alert(result);
				if(result.indexOf('로그인 성공')>0){
					location.href="/main";
				}
			}
		});
	}
</script>
</head>
<body>
<center>
<div class="container">
	<div>
		<h2>로그인</h2><br>
	<table cellspacing="5" cellpadding="10" class="table-bordered">
		<tr>
			<td width="150px">아이디:</td><td><input type="text" id="id"></td>
		</tr>
		<tr>
			<td>비밀번호:</td><td><input type="password" id="pw"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><pre><input type="radio" name="rb" value="member" checked> 개인      <input type="radio" name="rb" value="business"> 기업</pre></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="로그인" id="btlogin" class="btn btn-primary">
				<input type="button" value="취소" id="btcancel" class="btn btn-primary">
			</td>
		</tr>
		<tr>	
			<td colspan="2" align="center">
				<pre><a href="/joinchoice">회원 가입</a>  <a href="/findchoice">아이디/비밀번호 찾기</a></pre>
			</td>
		</tr>
	</table>
	</div>
</div>
</center>
<%@include file="../include/footer.jsp"%>