<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/reference.jsp"%>
<title>insertclass</title>
<script type="text/javascript">
	$(function(){
//클래스 등록 버튼 클릭 시
		$('#btaddclass').click(function(){
			checkEmpty();
		});//addclass click
	}); 
	
//권장 나이1 check!	
	function loadendage(){
		param="type="+$('select[name=cage1]').val();
		$.ajax({
			url:"/loadendage",
			data:param,
			type:"POST",
			success:function(str){
				var endage=document.getElementById("cage2");
				endage.innerHTML=str;
			}
		});//ajax for gugun
	}//loadgugun

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
<div class="container">
<form enctype="multipart/form-data" method="post">
	<h1>클래스 등록 화면</h1><br>
<!-- 클래스 정보 입력 -->
		<div class="group">
		기업 아이디<input type="text" name="bid" value="${login_id}" readonly/>
		</div>
		<div class="group">
		<select name="ctype">
					<option value="야외놀이">야외놀이</option>
					<option value="실내놀이">실내놀이</option>
		</select>
		<label>관심사</label>
		</div>
		
		<div class="group">
			<input type="text" name="cname" required="required"/><span class="highlight"></span><span class="bar"></span>
			<label>클래스명</label>
		</div>
		
		<div class="group">
			<input type="file" id="file1" name="file_class" required="required"/><span class="highlight"></span><span class="bar"></span>
			<label>클래스사진</label>
		</div>
		
		<div class="group">
			<select name="cage1" onchange="loadendage()">
				<option value="0">==선택==</option>
				<option value="8">8세</option>
				<option value="9">9세</option>
				<option value="10">10세</option>
				<option value="11">11세</option>
				<option value="12">12세</option>
		    </select>
		    	~
			<select name="cage2" id="cage2">
				<option value="0">==선택==</option>
		    </select>
		    <label>권장나이</label>
		</div>
		<div class="group">
			<textarea cols="22px" rows="4px" name="cintro"></textarea><span class="highlight"></span><span class="bar"></span>
			<label>클래스소개</label>
		</div>

<!-- 클래스 상세 정보 입력 -->
<h5>클래스 상세 정보를 입력해주세요!</h5>
<div>
		<div class="group">
			<input type="date" id="cdate" name="cdate" required="required"/><span class="highlight"></span><span class="bar"></span>
			<label>날짜</label>
		</div>
		<div class="group">
			<input type="text" name="prepare" required="required"/><span class="highlight"></span><span class="bar"></span>
			<label>준비물</label>
		</div>
		<div class="group">
			<input type="text" name="notice" required="required"/><span class="highlight"></span><span class="bar"></span>
			<label>유의사항</label>
		</div>
		<div class="group">
			<input type="number" min="5000" step="5000" name="price" required="required"/><span class="highlight"></span><span class="bar"></span>
			<label>금액</label>
		</div>
		<div class="group">
				<input type="checkbox" name="park" value="park">주차공간 
  				<input type="checkbox" name="protect" value="protect">보호자대기실
  				<input type="checkbox" name="together" value="together">참관가능여부
  		<label>시설정보</label>
  		</div>
			
</div>
<!-- 강사 정보 입력 -->
<h1>playkids는 믿을 수 있는 강사님을 원합니다!</h1>
<div>
	<div class="group">
		<input type="text" name="cteachername" required="required"/><span class="highlight"></span><span class="bar"></span>
		<label>강사명</label>
	</div>
	<div class="group">
		<input type="file" id="file2" name="file_teacher" required="required"/><span class="highlight"></span><span class="bar"></span>
		<label>강사사진</label>
	</div>
	<div class="group">
		<textarea rows="5" name="cteacher"></textarea><span class="highlight"></span><span class="bar"></span>
		<label>강사소개</label>
	</div>
</div>
	<div class="btn-box">
		<button type="button" class="btn btn-submit" id="btaddclass">클래스 등록</button>
		<button type="button" class="btn btn-submit" id="btcancel">취소</button>
	</div> 
</form>
</div>
<%@include file="../include/footer.jsp"%>