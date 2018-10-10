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
				location.href="/main";
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
<center>
<div class="container">
	<div>
	<h3>개인 회원 가입</h3><br>
		<table cellspacing="5" cellpadding="10" class="table-bordered">
			<tr>
				<td width="150px">아이디:</td><td colspan="2"><input type="text" id="mid"><div id="midcheck"></div></td>
			</tr>
			<tr>
				<td>비밀번호:</td><td colspan="2"><input type="password" id="mpw"></td>
			</tr>
			<tr>
				<td>비밀번호 확인:</td><td colspan="2"><input type="password" id="mpwconfirm" onkeyup="checkpw()"><div id="mpwcheck"></div></td>
			</tr>
			<tr>
				<td>이름:</td><td colspan="2"><input type="text" id="mname"></td>
			</tr>
			<tr>
				<td>주소:</td>
					<td>
						<select name="gugun" id="gugun" onchange="loaddong()">
							<option value="0">==선택==</option>
		               	</select>
				    </td>
				    <td>
						<select name="dong" id="dong">
							<option value="0">==선택==</option>
		               	</select>
				    </td>
			</tr>
			<tr>
				<td>폰번호:</td><td colspan="2"><input type="text" id="mphone" onkeyup="phonecheck()"><div id="mphonecheck"></div></td>
			</tr>
			<tr>
				<td>생년월일:</td><td colspan="2"><input type="date" id="mbirth"></td>
			</tr>
			<tr>
				<td>관심사:</td>
					<td>
						<select name="playtype" id="playtype" onchange="loadact()">
							<option value="0">==선택==</option>
		               	</select>
				    </td>
				    <td>
						<select name="act" id="act">
							<option value="0">==선택==</option>
		               	</select>
				    </td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="button" value="회원가입" id="btjoin" class="btn btn-primary">
					<input type="reset" value="취소" id="btcancel" class="btn btn-primary">
				</td>
			</tr>
		</table>
	</div>
</div>
</center>
<%@include file="../include/footer.jsp"%>