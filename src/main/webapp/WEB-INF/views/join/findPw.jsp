<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/reference.jsp"%>
<title>login</title>
<script type="text/javascript">
	$(function(){
		$('#btfindpw').click(function(){
			checkEmpty();
		});//아이디 찾기 button 클릭 시
		$('#btcancel').click(function(){
			alert('로그인 화면으로 이동');
			location.href="/login";	
		});//취소 button 클릭 시
	});//function
	 function checkEmpty(){
		if($('#id').val()==''){
			alert('아이디 입력!')
			return;
		}
		if($('#phone').val()==''){
			alert('${find_phone } 입력!');
			return;
		}
		checkid();
	}//checkEmpty 
	function checkid(){
		$.ajax({
			url:"/findcheckpw",
			data:{
				id:$('#id').val(),
				phone:$('#phone').val()
			},
			type:"POST",
			success:function(result){
				if(result.indexOf('실패')>0){//아이디 찾기 실패
					alert(result);
				}else{//아이디 찾기 성공
					alert(result);
						location.href="/login";												
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
		<h2>${title } 회원 임시 비밀번호 받기</h2><br>
	<table cellspacing="5" cellpadding="10" class="table-bordered">

		<tr>
			<td width="150px">${title } 아이디:</td><td><input type="text" id="id">
		<tr>
			<td>${find_phone }:</td><td><input type="text" id="phone"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="임시 비밀번호 받기" id="btfindpw">
				<input type="button" value="취소" id="btcancel">
			</td>
		</tr>
		<tr>	
			<td colspan="2" align="center">
				<pre><a href="/login">로그인 화면으로</a></pre>
			</td>
		</tr>
	</table>
	</div>
</div>
</center>
<%@include file="../include/footer.jsp"%>