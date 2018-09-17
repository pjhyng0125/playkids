<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/reference.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		alert('시작!');
		loadgugun();
		loadplaytype();
		
	});//function
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
			//url:"addr_result.jsp",
			data:param,
			type:"POST",
			success:function(str){
				var playtype=document.getElementById("playtype");
				playtype.innerHTML=str;
			}
		});//ajax for gugun
	}//loadgugun
		
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
		});//ajax for dong
	}//loaddong
		
</script>
</head>
<body>
<center>
<div class="container">
	<div>
	<h3>개인 회원 가입</h3><br>
		<table cellspacing="5" cellpadding="10">
			<tr>
				<td width="150px">아이디:</td><td colspan="2"><input type="text"></td>
			</tr>
			<tr>
				<td>비밀번호:</td><td colspan="2"><input type="text"></td>
			</tr>
			<tr>
				<td>비밀번호 확인:</td><td colspan="2"><input type="text"></td>
			</tr>
			<tr>
				<td>이름:</td><td colspan="2"><input type="text"></td>
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
				<td>폰번호:</td><td colspan="2"><input type="text"></td>
			</tr>
			<tr>
				<td>생년월일:</td><td colspan="2"><input type="text"></td>
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
					<input type="submit" value="회원가입">
					<input type="submit" value="취소">
				</td>
			</tr>
		</table>
	</div>
</div>
</center>
</body>
</html>