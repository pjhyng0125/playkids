<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/reference.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
//클래스 등록 버튼 클릭 시
		$('#btaddclass').click(function(){
			insertclass();
		});//addclass click
	});
	
	function insertclass(){
		var form=$('form')[0];
		var formData=new FormData(form);
		$.ajax({
			url:"/insertclass",
			type:"POST",
			processData:false,
			contentType:false,
			data:formData,
			success:function(data){
				alert(data);//입력 성공시: 클래스 입력 성공!!!
							//입력 실패시: 클래스 입력 실패...
			}
		});//ajax
	}//insertclass
</script>
</head>
<body>
<center>
<div class="container">
	<h3>클래스 등록 화면</h3><br>
<!-- 클래스 정보 입력 -->
<form enctype="multipart/form-data" method="post">
	<div>
		<table cellspacing="5" cellpadding="10">
			<tr>
				<td width="150px">기업 아이디:</td><td colspan="2"><input type="text" id="bid"></td>
			</tr>
			<tr>
				<td>클래스타입:</td><td><select id="ctype">
													<option value="야외놀이">야외놀이</option>
													<option value="실내놀이">실내놀이</option>
												</select></td>
			</tr>
			<tr>
				<td>클래스명:</td><td><input type="text" id="cname"></td>
			</tr>
			<tr>
				<td>클래스사진:</td><td><input type="file" id="cpic"></td>
			</tr>
			<tr>
				<td>권장나이:</td>
					<td>
						<select id="cage1">
							<option value="0">==선택==</option>
							<option value="8">8세</option>
							<option value="9">9세</option>
							<option value="10">10세</option>
							<option value="11">11세</option>
							<option value="12">12세</option>
							<option value="13">13세</option>
		               	</select>
		               	~
						<select id="cage2">
							<option value="0">==선택==</option>
							<option value="8">8세</option>
							<option value="9">9세</option>
							<option value="10">10세</option>
							<option value="11">11세</option>
							<option value="12">12세</option>
							<option value="13">13세</option>
		               	</select>
				    </td>
			</tr>
			<tr>
				<td>클래스소개:</td><td><textarea cols="22px" rows="4px" id="cintro"></textarea></td>
			</tr>
		</table>
	<div><br><br>
<!-- 클래스 상세 정보 입력 -->
<h3>클래스 상세 정보를 입력해주세요!</h3>
<div>
		<table cellspacing="5" cellpadding="10">
			<tr>
				<td>날짜:</td><td><input type="text" id="cdate"></td>
			</tr>
			<tr>
				<td>준비물:</td><td><input type="text" id="prepare"></td>
			</tr>
			<tr>
				<td>유의사항:</td><td><input type="text" id="notice"></td>
			</tr>
			<tr>
				<td>금액:</td><td><input type="text" id="price"></td>
			</tr>
		</table>
</div><br><br>
<!-- 강사 정보 입력 -->
<h3>playkids는 믿을 수 있는 강사님을 원합니다!</h3>
<div>
		<table cellspacing="5" cellpadding="10">
			<tr>
				<td>강사명:</td><td><input type="text" id="cteachername"></td>
			</tr>
			<tr>
				<td>강사사진:</td><td><input type="file" id="cteacherpic"></td>
			</tr>
			<tr>
				<td>강사소개:</td><td><textarea cols="22px" rows="4px" id="cteacher"></textarea></td>
			</tr>
		</table>
</div>
	</div>
		<br><br>
	<input type="button" value="클래스등록" id="btaddclass">
	<input type="button" value="취소" id="btcancel">
</div>
</form>
</div>
</center>
</body>
</html>