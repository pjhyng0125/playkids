<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/reference.jsp"%>
<title>Insert title here</title>
<script type="text/javascript">
	
	$(function(){
		loadgugun();
		loadplaytype();
		
//회원가입 버튼 클릭 시
		$('#btjoin').click(function(){
			checkEmpty();
		});//btjoin click
		
//취소 버튼 클릭 시
		 $('#btcancel').click(function(){
			location.href="/login";
		});//btcancel click 
//아이디 중복 확인
		$('#mid').keyup(function(){
			var s=$(this).val();
			if(s.length>=6 && s.length<=12){
				idcheck();
			}else{
				$('#midcheck').html('<font color=red>아이디 조건: 6~12자리</font>');
			}
		});//mid keyup
		
		function checkEmpty(){
			if($('#mid').val()==''){
				alert('개인 회원 아이디 입력!')
				return;
			}
			if($('#midcheck').text().indexOf('6~12')>0){
				alert('아이디 조건 확인!');
				return;
			}
			if($('#midcheck').text().indexOf('중복')>0){
				alert('아이디 중복 확인!');
				return;
			}
			if($('#mpw').val()==''){
				alert('비밀번호 입력!')
				return;
			}
			if($('#mpwconfirm').val()==''){
				alert('비밀번호 확인 입력!')
				return;
			}
			if($('#mpwcheck').text().indexOf('실패')>0){
				alert('비밀번호 일치 확인!');
				return;
			}
			if($('#mname').val()==''){
				alert('이름 입력!')
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
			 if($('#mphone').val()==''){
				alert('폰번호 입력!')
				return;
			}
			if($('#mphonecheck').text().indexOf('형식')>0){
				alert('폰번호 형식 확인!');
				return;
			}
			if($('#mphonecheck').text().indexOf('중복')>0){
				alert('폰번호 중복 확인!');
				return;
			}
			if($('#mbirth').val()==''){
				alert('생년월일 입력!')
				return;
			}
			if($('#playtype').val()==0){
				alert('관심사 타입 선택!')
				return;
			}
			if($('#act').val()==0){
				alert('관심사 상세 선택!')
				return;
			}
			insertmember();
		}
		
	});//function
//join
	function idcheck(){
		if($('#mid').val()==''){
			$('#midcheck').html('<font color=red>아이디 입력</font>');
			return;
		}
		$.ajax({
			url:"/idcheck",
			data:{
				type:"member",
				checkid:$('#mid').val()
			},
			success:function(str){
				$('#midcheck').html(str);
			}
		});//ajax
	}
	
	function phonecheck(){
		if($('#mphone').val()==''){
			$('#mphonecheck').html('<font color=red>폰번호 입력</font>');
			return;
		}
		if($('#mphone').val().indexOf('-')<3){
			$('#mphonecheck').html('<font color=red>폰번호 형식 확인</font>');
			return;
		}
		if($('#mphone').val().substring(4).indexOf('-')<4){
			$('#mphonecheck').html('<font color=red>폰번호 형식 확인</font>');
			return;			
		}
		if($('#mphone').val().substring(9).length<4){
			$('#mphonecheck').html('<font color=red>폰번호 형식 확인</font>');
			return;						
		}
		if($('#mphone').val().substring(9).length>4){
			$('#mphonecheck').html('<font color=red>폰번호 형식 확인</font>');
			return;						
		}
		
		
		$.ajax({
			url:"/phonecheck",
			data:{
				type:"member",
				checkphone:$('#mphone').val()
			},
			success:function(str){
				$('#mphonecheck').html(str);
			}
		});//ajax
	}
	
	function insertmember(){
		$.ajax({
			url:"/insertjoin",
			data:{
				type:"member",
				mid:$('#mid').val(),
				mpw:$('#mpwconfirm').val(),
				mname:$('#mname').val(),
				maddress:$('#gugun').val()+","+$('#dong').val(),
				mphone:$('#mphone').val(),
				mbirth:$('#mbirth').val(),
				minterest:$('#playtype').val()+","+$('#act').val()
			},
			type:"POST",
			success:function(result){
				alert(result);
				location.href="/loginsuccess?type=member&id="+$('#mid').val()
						+"&name="+$('#mname').val()
						+"&phone="+$('#mphone').val();
						
			}				
		});//ajax
	}//insertmember
	
	function checkpw(){
		var pass=$('#mpw').val();
		var pass2=$('#mpwconfirm').val();
		if(pass===pass2)
			$('#mpwcheck').html('<font color=green>비밀번호 일치</font>');
		else
			$('#mpwcheck').html('<font color=red>비밀번호 일치 실패</font>');
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

//play
	function loadplaytype(){
		param="type=ptype";
		$.ajax({
			url:"/loadplay",
			data:param,
			type:"POST",
			success:function(str){
				var playtype=document.getElementById("playtype");
				playtype.innerHTML=str;
			}
		});//ajax for playtype
	}//loadplaytype
		
	function loadact(){
		$.ajax({
			url:"/loadplay",
			data:{
				type:"act",
				playtype:$('#playtype').val()
			},
			type:"POST",
			success:function(str){
				var act=document.getElementById("act");
				act.innerHTML=str;
			}
		});//ajax for act
	}//loadact
</script>
</head>
<body>
<div class="container">
	<form>
	<h1>개인 회원 가입</h1><br>
		<div class="group">
			<input type="text" id="mid" required="required"/><span class="highlight"></span><span class="bar"></span>
			<label>아이디</label>
			<div id="midcheck"></div>
		</div>			
			
		<div class="group">
			<input type="password" id="mpw" onkeyup="checkpw()" required="required"/><span class="highlight"></span><span class="bar"></span>
			<label>비밀번호</label>
		</div>
		
		<div class="group">
			<input type="password" id="mpwconfirm" onkeyup="checkpw()" required="required"/><span class="highlight"></span><span class="bar"></span>
			<label>비밀번호 확인</label>
			<div id="mpwcheck"></div>
		</div>
		
		<div class="group">
			<input type="text" id="mname"  required="required"/><span class="highlight"></span><span class="bar"></span>
			<label>이름</label>
		</div>
		<div class="group">
			<input type="text" id="mphone" onkeyup="phonecheck()" required="required"/><span class="highlight"></span><span class="bar"></span>
			<label>폰번호</label>
			<div id="mphonecheck"></div>
		</div>
		
		<div class="group">
			<input type="date" id="mbirth"/><span class="highlight"></span><span class="bar"></span>
			<label>생년월일</label>
		</div>
		<br>
		
		<div class="group">
			<select name="gugun" id="gugun" onchange="loaddong()" required="required">
				<option value="0">==선택==</option>
			</select>
			<select name="dong" id="dong" required="required">
				<option value="0">==선택==</option>
			</select>
			<label>주소</label>
		</div>
		<br>
		
		<div class="group">
			<select name="playtype" id="playtype" onchange="loadact()" required="required">
				<option value="0">==선택==</option>
		   	</select>
			<select name="act" id="act">
				<option value="0">==선택==</option>
		    </select>
			<label>관심사</label>
		</div>       	
		
		<div class="btn-box">
			<button type="button" class="btn btn-submit" id="btjoin">회원가입</button>
			<button type="button" class="btn btn-cancel" id="btcancel">취소</button>
		</div>		
	</form>
</div>
<%@include file="../include/footer.jsp"%>