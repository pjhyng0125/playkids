<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/reference.jsp"%>
<title>insertclass</title>
<script type="text/javascript">
	$(function(){
//클래스 등록 버튼 클릭 시
		$('#btaddclass').click(function(){
			checkEmpty();
		});//addclass click
	}); 

//유효성 검사
	function checkEmpty(){
		if($('input[name=bid]').val()==''){
			alert('기업 아이디 입력!')
			return;
		}
		if($('input[name=cname]').val()==''){
			alert('클래스명 입력!')
			return;
		}
		if($('#file1').val()==''){
			alert('클래스 사진 입력!')
			return;
		}
		if($('select[name=cage1]').val()==0){
			alert('권장 나이1 선택!')
			return;
		}
		if($('select[name=cage2]').val()==0){
			alert('권장 나이2 선택!')
			return;
		}
		if($('textarea[name=cintro]').val()==''){
			alert('클래스 소개 입력!')
			return;
		}
		if($('input[name=cdate]').val()==''){
			alert('클래스 날짜 입력!')
			return;
		}
		if($('input[name=prepare]').val()==''){
			alert('준비물 입력!')
			return;
		}
		if($('input[name=notice]').val()==''){
			alert('유의사항 입력!')
			return;
		}
		if($('input[name=price]').val()==''){
			alert('금액 입력!')
			return;
		}
		if($('input[name=cteachername]').val()==''){
			alert('강사명 입력!')
			return;
		}
		if($('#file2').val()==''){
			alert('강사 사진 입력!')
			return;
		}
		if($('textarea[name=cteacher]').val()==''){
			alert('강사소개 입력!')
			return;
		}
		insertclass();
	}
	
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
				<td width="150px">기업 아이디:</td><td colspan="2"><input type="text" name="bid"></td>
			</tr>
			<tr>
				<td>클래스타입:</td><td><select name="ctype">
													<option value="야외놀이">야외놀이</option>
													<option value="실내놀이">실내놀이</option>
												</select></td>
			</tr>
			<tr>
				<td>클래스명:</td><td><input type="text" name="cname"></td>
			</tr>
			<tr>
				<td>클래스사진:</td><td><input type="file" id="file1" name="file_class"></td>
			</tr>
			<tr>
				<td>권장나이:</td>
					<td>
						<select name="cage1">
							<option value="0">==선택==</option>
							<option value="8">8세</option>
							<option value="9">9세</option>
							<option value="10">10세</option>
							<option value="11">11세</option>
							<option value="12">12세</option>
							<option value="13">13세</option>
		               	</select>
		               	~
						<select name="cage2">
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
				<td>클래스소개:</td><td><textarea cols="22px" rows="4px" name="cintro"></textarea></td>
			</tr>
		</table>
	<div><br><br>
<!-- 클래스 상세 정보 입력 -->
<h3>클래스 상세 정보를 입력해주세요!</h3>
<div>
		<table cellspacing="5" cellpadding="10">
			<tr>
				<td>날짜:</td><td><input type="date" id="cdate" name="cdate"></td>
			</tr>
			<tr>
				<td>준비물:</td><td><input type="text" name="prepare"></td>
			</tr>
			<tr>
				<td>유의사항:</td><td><input type="text" name="notice"></td>
			</tr>
			<tr>
				<td>금액:</td><td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td>시설정보:</td><td><input type="checkbox" name="park" value="park">주차공간 
  								<input type="checkbox" name="protect" value="protect">보호자대기실
  								<input type="checkbox" name="together" value="together">참관가능여부</td>
			</tr>
			
		</table>
</div><br><br>
<!-- 강사 정보 입력 -->
<h3>playkids는 믿을 수 있는 강사님을 원합니다!</h3>
<div>
		<table cellspacing="5" cellpadding="10">
			<tr>
				<td>강사명:</td><td><input type="text" name="cteachername"></td>
			</tr>
			<tr>
				<td>강사사진:</td><td><input type="file" id="file2" name="file_teacher"></td>
			</tr>
			<tr>
				<td>강사소개:</td><td><textarea cols="22px" rows="4px" name="cteacher"></textarea></td>
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
<%@include file="../include/footer.jsp"%>