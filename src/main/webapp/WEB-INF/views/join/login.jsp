<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/reference.jsp"%>
<title>login</title>
<script type="text/javascript">
	$(function(){
		$('#btlogin').click(function(){
			checkEmpty();
		});//로그인 button 클릭 시
		$('#btcancel').click(function(){
			alert('취소 버튼 클릭');
			
		});//취소 button 클릭 시
	});//function
	
	function checkEmpty(){
		if($('#id').val()==''){
			alert('아이디 입력!');
			return;
		}
		if($('#pw').val()==''){
			alert('비밀번호 입력!');
			return;
		}
		selectlogin();
	}
	
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
<div class="container">
	<form>
		<h1>로그인</h1>
		<div class="group">
			<input type="text" id="id" required="required"/><span class="highlight"></span><span class="bar"></span>
			<label>아이디</label>
		</div>
		<div class="group">
			<input type="password" id="pw" required="required"/><span class="highlight"></span><span class="bar"></span>
			<label>비밀번호</label>
		</div>
		
		<div class="group">
			<input type="radio" name="rb" value="member" checked>개인
			<input type="radio" name="rb" value="business">기업
		<label>사용자 선택</label>
		</div>
		
		<div class="btn-box">
			<button type="button" id="btlogin" class="btn btn-submit">로그인</button>
			<button type="button" id="btcancel" class="btn btn-cancel">취소</button>
		</div>
		<div class="btn-box">
			<pre><a href="/joinchoice">회원 가입</a>  <a href="/findchoice">아이디/비밀번호 찾기</a></pre>
		</div>
	</form>
</div>
<%@include file="../include/footer.jsp"%>