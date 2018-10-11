<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/reference.jsp"%>
<title>Insert title here</title>
<script type="text/javascript">
	
	$(function(){
//로그인하기 버튼 클릭 시
		$('#btlogin').click(function(){
			location.href="/login";
		});//btlogin click
		
//메인으로 버튼 클릭 시
		 $('#btmain').click(function(){
			location.href="/main";
		});//btmain click 
		
	});//function
		
</script>
</head>
<body>
<div class="container">
	<form>
	<h1>Playkids 회원이 되어주셔서 진심으로 감사합니다</h1>
	<h5>로그인 하시면 Playkids의 다양한 혜택과 정보를 이용하실 수 있습니다.</h5>
		<div class="group">
			${fid }
			<input type="text" id="id" value="${id }" readonly/><span class="highlight"></span><span class="bar"></span>
		</div>			
		
		<div class="group">
			${fname }
			<input type="text" id="name" value="${name }" readonly/><span class="highlight"></span><span class="bar"></span>
		</div>
		
		<div class="group">
			${fphone }
			<input type="text" id="phone" value="${phone }" readonly/><span class="highlight"></span><span class="bar"></span>
		</div>
		
		<div class="btn-box">
			<button type="button" class="btn btn-submit" id="btlogin">로그인하기</button>
			<button type="button" class="btn btn-cancel" id="btmain">메인으로</button>
		</div>		
	</form>
</div>
<%@include file="../include/footer.jsp"%>