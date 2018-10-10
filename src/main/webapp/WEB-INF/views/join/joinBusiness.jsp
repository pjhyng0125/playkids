<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/reference.jsp"%>
<title>joinbusiness</title>
<script type="text/javascript">
	
	$(function(){
		loadgugun();
		
//회원가입 버튼 클릭 시
		$('#btjoin').click(function(){
			checkEmpty();
		});//btjoin click
		
//취소 버튼 클릭 시
		 $('#btcancel').click(function(){
			location.href="/login";
		});//btcancel click 

		$('#bid').keyup(function(){
			var s=$(this).val();
			if(s.length>=6 && s.length<=12){
				idcheck();
			}else{
				$('#bidcheck').html('<font color=red>아이디 조건: 6~12자리</font>');
			}
		});//bid keyup
//checkEmpty	
		function checkEmpty(){
			if($('#bid').val()==''){
				alert('개인 회원 아이디 입력!')
				return;
			}
			if($('#bidcheck').text().indexOf('6~12')>0){
				alert('아이디 조건 확인!');
				return;
			}
			if($('#bidcheck').text().indexOf('중복')>0){
				alert('아이디 중복 확인!');
				return;
			}
			if($('#bpw').val()==''){
				alert('비밀번호 입력!')
				return;
			}
			if($('#bpwconfirm').val()==''){
				alert('비밀번호 확인 입력!')
				return;
			}
			if($('#bpwcheck').text().indexOf('실패')>0){
				alert('비밀번호 일치 확인!');
				return;
			}
			if($('#bname').val()==''){
				alert('기업명 입력!')
				return;
			}
			if($('#gugun').val()==0){
				alert('주소 구 선택!')
				return;
			}
			if($('#dong').val()==0){
				alert('주소 동 선택!')
				return;
			}
			if($('#road').val()==''){
				alert('도로명 주소 입력!')
				return;
			}
			if($('#bphone').val()==''){
				alert('기업전화번호 입력!')
				return;
			}
			if($('#bphonecheck').text().indexOf('형식')>0){
				alert('전화번호 형식 확인!');
				return;
			}
			if($('#bphonecheck').text().indexOf('중복')>0){
				alert('전화번호 중복 확인!');
				return;
			}
			if($('#mbintro').val()==''){
				alert('기업 소개 입력!')
				return;
			}
			if($('#baccount').val()==''){
				alert('기업 계좌번호 입력!')
				return;
			}
			insertbusiness();
		}
	});//function
//아이디 중복 확인
function idcheck(){
	$.ajax({
		url:"/idcheck",
		data:{
			type:"business",
			checkid:$('#bid').val()
		},
		success:function(str){
			$('#bidcheck').html(str);
		}
	});//ajax
}
	
function phonecheck(){
	if($('bmphone').val()==''){
		$('#bphonecheck').html('<font color=red>폰번호 입력</font>');
		return;
	}
	if($('#bphone').val().indexOf('-')<3){
		$('#bphonecheck').html('<font color=red>폰번호 형식 확인</font>');
		return;
	}
	if($('#bphone').val().substring(4).indexOf('-')<4){
		$('#bphonecheck').html('<font color=red>폰번호 형식 확인</font>');
		return;			
	}
	if($('#bphone').val().substring(9).length<4){
		$('#bphonecheck').html('<font color=red>폰번호 형식 확인</font>');
		return;						
	}
	if($('#bphone').val().substring(9).length>4){
		$('#bphonecheck').html('<font color=red>폰번호 형식 확인</font>');
		return;						
	}
	
	
	$.ajax({
		url:"/phonecheck",
		data:{
			type:"business",
			checkphone:$('#bphone').val()
		},
		success:function(str){
			$('#bphonecheck').html(str);
		}
	});//ajax
}//phonecheck
	
//join
	function insertbusiness(){
		$.ajax({
			url:"/insertjoin",
			data:{
				type:"business",
				bid:$('#bid').val(),
				bpw:$('#bpw').val(),
				bname:$('#bname').val(),
				bintro:$('#bintro').val(),
				bphone:$('#bphone').val(),
				baddress:$('#gugun').val()+","+$('#dong').val()+","+$('#road').val(),
				baccount:$('#baccount').val()
			},
			type:"POST",
			success:function(result){
				alert(result);
				location.href="/main";
			}				
		});//ajax
	}//insertmember
	
	function checkpw(){
		var pass=$('#bpw').val();
		var pass2=$('#bpwconfirm').val();
		
		if(pass===pass2)
			$('#bpwcheck').html('<font color=green>비밀번호 일치</font>');
		else
			$('#bpwcheck').html('<font color=red>비밀번호 일치 실패</font>');
	}
	
//address	
	function loadgugun(){
		param="type=gugun";
		$.ajax({
			url:"/loadaddr",
			//url:"addr_result.jsp",
			data:param,
			type:"POST",
			success:function(str){
				var gugun=document.getElementById("gugun");
				gugun.innerHTML=str;
			}
		});//ajax for gugun
	}//loadgugun
		
	function loaddong(){
		$.ajax({
			url:"/loadaddr",
			data:{
				type:"dong",
				gugun:$('#gugun').val()
			},
			type:"POST",
			success:function(str){
				var dong=document.getElementById("dong");
				dong.innerHTML=str;
			}
		});//ajax for dong
	}//loaddong
		
</script>
</head>
<body>
<div class="container">
	<form>
	<h1>기업 회원 가입</h1>
	<div class="group">
		<input type="text" id="bid" required="required"/><span class="highlight"></span><span class="bar"></span>
		<label>아이디</label>
		<div id="bidcheck"></div>
	</div>
	
	<div class="group">
		<input type="password" id="bpw" required="required"/><span class="highlight"></span><span class="bar"></span>
		<label>비밀번호</label>
	</div>
	
	<div class="group">
		<input type="password" id="bpwconfirm" onkeyup="checkpw()" required="required"/><span class="highlight"></span><span class="bar"></span>
		<label>비밀번호 확인</label>
		<div id="bpwcheck"></div>
	</div>
	<div class="group">
		<input type="text" id="bname" required="required"/><span class="highlight"></span><span class="bar"></span>
		<label>이름</label>
	</div>
	
	<div class="group">
		<select name="gugun" id="gugun" onchange="loaddong()" required="required">
				<option value="0">==선택==</option>
		</select>
		<select name="dong" id="dong" required="required">
			<option value="0">==선택==</option>
	 	</select>
	 	<label>주소</label>
	 </div>
	 
	 <div class="group">
	 	<input type="text" id="road" required="required"/><span class="highlight"></span><span class="bar"></span>
		<label>도로명 주소</label>
	 </div>
	 
	 <div class="group">
	 	<input type="text" id="bphone" onkeyup="phonecheck()" required="required"/><span class="highlight"></span><span class="bar"></span>
		<label>전화번호</label>
	 	<div id="bphonecheck"></div>
	 </div>
	 
	 <div class="group">
	 	<textarea cols="22px" rows="4px" id="bintro"></textarea><span class="highlight"></span><span class="bar"></span>
		<label>기업 소개</label>
	 </div>
		<br><br>
<!--기업 회원 가입-계좌번호 등록-->
		<h1>계좌 번호 등록</h1>
 	<div class="group">
	 	<textarea cols="22px" rows="4px" readonly="readonly"></textarea><span class="highlight"></span><span class="bar"></span>
		<label>계좌 번호 등록 안내</label>
	</div>

 	<div class="group">
		<input type="text" id="baccount" required="required"/><span class="highlight"></span><span class="bar"></span>
		<label>계좌 번호</label>
	</div>
	
	<div class="btn-box">
		<button type="button" class="btn btn-submit" id="btjoin">회원가입</button>
		<button type="button" class="btn btn-cancel" id="btcancel">취소</button>
	</div>
	</form>
</div>
<%@include file="../include/footer.jsp"%>