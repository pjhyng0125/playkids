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
<div class="container">
	<form>
		<h1>${title } 회원 임시 비밀번호 받기</h1>
	<div class="group">
	<input type="text" id="id" required="required"/><span class="highlight"></span><span class="bar"></span>
	<label>${title } 아이디</label>
	</div>
	<div class="group">
		<input type="text" id="phone" required="required"/><span class="highlight"></span><span class="bar"></span>
	<label>${find_phone }</label>
	</div>
	<div class="btn-box">
		<button type="button" class="btn btn-submit" id="btfindpw">임시 비밀번호 받기</button>
		<button type="button" class="btn btn-submit" id="btcancel">취소</button>
	</div>
	<div class="btn-box">
		<a href="/login">로그인 화면으로</a>
	</div>
			
	</form>
</div>
<%@include file="../include/footer.jsp"%>