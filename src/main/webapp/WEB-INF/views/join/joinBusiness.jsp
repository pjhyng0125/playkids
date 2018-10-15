<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/reference.jsp"%>
<title>joinbusiness</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	
	$(function(){
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
			if($('#postcode').val()==''){
				alert('도로명 주소 우편번호 입력!')
				return;
			}
			if($('#baddress').val()==''){
				alert('도로명 주소 입력!')
				return;
			}
			if($('#baddress2').val()==''){
				alert('도로명  상세 주소 입력!')
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
				baddress:$('#baddress').val()+","+$('#baddress2').val(),
				baccount:$('#baccount').val()
			},
			type:"POST",
			success:function(result){
				alert(result);
				location.href="/loginsuccess?type=business&id="+$('#bid').val()
				+"&name="+$('#bname').val()
				+"&phone="+$('#bphone').val();
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
	
//도로명 주소 관련 함수
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('baddress').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('baddress2').focus();
            }
        }).open();
    }
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
		<input type="password" id="bpw" onkeyup="checkpw()" required="required"/><span class="highlight"></span><span class="bar"></span>
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
	<br>
	<br>
	 
	<font color="#2196F3" size="2px">도로명 주소</font>
	<div class="btn-box2">
		<button type="button" class="btn btn-submit" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
	</div>
	<div class="group">
		<input type="text" id="postcode" required="required"><span class="highlight"></span><span class="bar"></span>
		<label>우편번호</label>
	</div>	
	<div class="group">
		<input type="text" id="baddress" required="required"><span class="highlight"></span><span class="bar"></span>
		<label>주소</label>
	</div>
	<div class="group">
		<input type="text" id="baddress2" required="required"><span class="highlight"></span><span class="bar"></span>
		<label>상세주소</label>
	</div>
	 <br>
	 <div class="group">
	 	<input type="text" id="bphone" onkeyup="phonecheck()" required="required"/><span class="highlight"></span><span class="bar"></span>
		<label>전화번호</label>
	 	<div id="bphonecheck"></div>
	 </div>
	 
	 <div class="group">
	 	<textarea rows="5" id="bintro" required="required"></textarea><span class="highlight"></span><span class="bar"></span>
		<label>기업 소개</label>
	 </div>
		<br><br>
<!--기업 회원 가입-계좌번호 등록-->
		<h1>계좌 번호 등록</h1>
 	<div class="group">
 		<font color="#2196F3" size="2px">계좌 번호 등록 안내</font>
	 	<textarea cols="22px" rows="6px" readonly="readonly">계좌 번호는 정확하게 입력해주시기 바랍니다. 잘못된 계좌 번호에 따른 피해는 본 기업이 책임지는 것을 원칙으로 하며 Playkids는 관련이 없음을 밝힙니다.
	 	</textarea><span class="highlight"></span><span class="bar"></span>
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