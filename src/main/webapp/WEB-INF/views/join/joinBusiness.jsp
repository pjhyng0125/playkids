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
			alert('기업 회원 가입 성공!\n 메인화면으로 이동합니다.')
			location.href="/main";
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
				location.href="/login";
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
<center>
<div class="container">
	<div>
	<h3>기업 회원 가입</h3><br>
		<table cellspacing="5" cellpadding="10" class="table-bordered">
			<tr>
				<td width="150px">아이디:</td><td colspan="2"><input type="text" id="bid"><div id="bidcheck"></div></td>
			</tr>
			<tr>
				<td>비밀번호:</td><td colspan="2"><input type="password" id="bpw"></td>
			</tr>
			<tr>
				<td>비밀번호 확인:</td><td colspan="2"><input type="password" id="bpwconfirm" onkeyup="checkpw()"><div id="bpwcheck"></div></td>
			</tr>
			<tr>
				<td>기업명:</td><td colspan="2"><input type="text" id="bname"></td>
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
				<td>도로명주소:</td><td colspan="2"><input type="text" id="road"></td>
			</tr>
			<tr>
				<td>전화번호:</td><td colspan="2"><input type="text" id="bphone"></td>
			</tr>
			<tr>
				<td>기업소개:</td><td colspan="2"><textarea cols="22px" rows="4px" id="bintro"></textarea></td>
			</tr>
		</table>
		<br><br>
<!--기업 회원 가입-계좌번호 등록-->
		<div>
		<h4>계좌번호 등록</h4><br>
	<div>
<pre>
기업 준수 사항
 계좌 번호 등록 안내
</pre>
	</div>
	<table cellspacing="5" cellpadding="10" class="table-bordered">
		<tr>
			<td width="150px">계좌번호:</td><td><input type="text" id="baccount"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="회원가입" id="btjoin" class="btn btn-primary">
				<input type="button" value="취소" id="btcancel" class="btn btn-primary">
			</td>
		</tr>
	</table>
	</div>
	</div>
</div>
</center>
<%@include file="../include/footer.jsp"%>