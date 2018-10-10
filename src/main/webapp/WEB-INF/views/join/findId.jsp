<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/reference.jsp"%>
<title>login</title>
<script type="text/javascript">
	$(function(){
		$('#btfindid').click(function(){
			checkEmpty();
		});//아이디 찾기 button 클릭 시
		$('#btcancel').click(function(){
			alert('로그인 화면으로 이동');
			location.href="/login";	
		});//취소 button 클릭 시
	});//function
	 function checkEmpty(){
		if($('#name').val()==''){
			alert('${find_name } 입력!')
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
			url:"/findcheckid",
			data:{
				name:$('#name').val(),
				phone:$('#phone').val()
			},
			type:"POST",
			success:function(result){
				if(result.indexOf('실패')>0){//아이디 찾기 실패
					alert(result);
				}else{//아이디 찾기 성공
					if(confirm('회원님의 아이디는 '+result+'입니다\n'+'비밀번호가 기억이 안나시면 새로운 비밀번호를 발급해드릴까요?')){
						location.href="/findpw";					
					}else{
						alert('로그인 화면으로 이동');
						location.href="/login";												
					}
				}
			}
		});
	}
</script>
</head>
<body>
<div class="container">
	<form>
		<h1>${title } 회원 아이디 찾기</h1>
	<div class="group">
		<input type="text" id="name" required="required"/><span class="highlight"></span><span class="bar"></span>
		<label>이름</label>
	</div>
	<div class="group">
		<input type="text" id="phone" required="required"/><span class="highlight"></span><span class="bar"></span>
		<label>${find_phone }</label>
	</div>
	<div class="btn-box">
		<button type="button" class="btn btn-submit" id="btfindid">아이디 찾기</button>
		<button type="button" class="btn btn-submit" id="btcancel">취소</button>
	</div>
	<div class="btn-box">
		<a href="/login">로그인 화면으로</a>
	</div>
	</form>
</div>
<%@include file="../include/footer.jsp"%>