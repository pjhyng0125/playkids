<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.myinfo{
            border: 0px;
            width: 300px;
        }

.myinfolist{
	width:100%;
	text-align: center;
}
.myclassStatus{
	text-align: center;
	width: 100px;
	display: inline-block;
	cursor: pointer;
	font-size: large;
}

.myclassStatus-selected{
	    color: #F15A5B;
}
.myclassStatus-reserveTable, .myclassStatus-completeTable{
	display: none;
}

.myinfolist th{
	text-align: center;
}

.myclassStatus-reserveTable td{
	
}
tbody tr:hover{
	cursor: pointer;
}
.card-header{
	background: transparent;
}
.card-body p{
	font-size: large; 
}


</style>
<script>
	$(function(){
		$('#myPagechargeBtn').click(function(){
			alert("충전페이지로 이동합니다.");
			location.href="/chargepage";
		})
		
		$('#statInfo').click(function(){
			alert("통계페이지로 이동합니다.");
			location.href="/hc";	
		})
		
		$('#addChildBtn').click(function(){// 자녀 등록	
			var today = new Date();
			var minYear = today.getFullYear()-12;
			var maxYear = today.getFullYear()-7;
			var dbirth = new Date($('#dbirth').val());
			var dbirth_year = dbirth.getFullYear();
			var dname = $('#dname').val();

			if(dname=="" || dname==undefined){
				alert('이름을 입력해주세요!');
				return false;
			}else if(dbirth=='Invalid Date'){
				alert('생년월일을 입력해주세요!');
				return false;
			}
			
			if(minYear<=dbirth_year && dbirth_year<=maxYear){				
				$.ajax({
					type : 'post',
					data : {dgender:dgender=$('input[name=dgender]:checked').val(),
						  dname:$('#dname').val(),
						  dbirth: dbirth},
	    	        url : "/insertChild",
	    	        success : function(result) {   	            	
		    	          alert('등록 성공')
		    	          $('#dname').val('');
						  $('#dbirth').val('');
					      $('#initRadio').prop('checked',true);
		    	          $('.childInfo button').before('<p class="card-text">'+result.dname+'('+result.dage+'세 '+result.dgender+')</p>');
	    	       },
	    	       dataType:'json',
	    	       error:function(e,code){
	    	    	   alert('정말에러!!'+e.status+":"+code)
	    	           if(e.status==300){
	    	               alert("데이터를 가져오는데 실패하였습니다.");
	    	           };
	    	       }
				});
			}else {
				alert('8세부터 13세 아동만 가능합니다!')
				$('#dbirth').val('');
				return false;
			}
		});

		$('#cancelChildBtn').click(function(){// 자녀 등록 취소
			$('#dname').val('');
			$('#dbirth').val('');
			$('#initRadio').prop('checked',true);
		})
		
		$('.myclassinfo').click(function(){
			$('.myinfolist-data').html('');
			
			$(this).removeClass("btn-info");
			$(this).addClass("btn-danger");
			
			$('#myReserve').removeClass('myclassStatus-selected');
			$('#myComplete').removeClass('myclassStatus-selected');
			
			$('.mypayinfo').removeClass("btn-danger");
			$('.mypayinfo').addClass("btn-info");
			$('.myboardinfo').removeClass("btn-danger");
			$('.myboardinfo').addClass("btn-info");
			$('.myQnAinfo').removeClass("btn-danger");
			$('.myQnAinfo').addClass("btn-info");
		
			
			$('#myclassStatus').show();
		});
		
		
		$('.mypayinfo').click(function(){ //구매내역 보여주기
			$('#myclassStatus').hide();
			
			$(this).removeClass("btn-info");
			$(this).addClass("btn-danger");
			
			$('.myclassinfo').removeClass("btn-danger");
			$('.myclassinfo').addClass("btn-info");
			$('.myboardinfo').removeClass("btn-danger");
			$('.myboardinfo').addClass("btn-info");
			$('.myQnAinfo').removeClass("btn-danger");
			$('.myQnAinfo').addClass("btn-info");
			
			$.ajax({  	        
    	        data : {"myclass" : "payment"},
    	        url : "/myclasslist",
    	        success : function(result) {   	            	
	    	            $('.myinfolist-data').html(result);
    	       },error:function(e,code){
    	    	   alert('정말에러!!'+e.status+":"+code)
    	           if(e.status==300){
    	               alert("데이터를 가져오는데 실패하였습니다.");
    	           };
    	       }
    	    }); 
		})
		
		$('.myboardinfo').click(function(){
			$('#myclassStatus').hide();
			
			$(this).removeClass("btn-info");
			$(this).addClass("btn-danger");
			
			$('.myclassinfo').removeClass("btn-danger");
			$('.myclassinfo').addClass("btn-info");
			$('.mypayinfo').removeClass("btn-danger");
			$('.mypayinfo').addClass("btn-info");
			$('.myQnAinfo').removeClass("btn-danger");
			$('.myQnAinfo').addClass("btn-info");
			$.ajax({  	        
    	        url : "/myboardlist",
    	        success : function(result) {   	            	
	    	            $('.myinfolist-data').html(result);
    	       },error:function(e,code){
    	    	   alert('정말에러!!'+e.status+":"+code)
    	           if(e.status==300){
    	               alert("데이터를 가져오는데 실패하였습니다.");
    	           };
    	       }
    	    }); 
		})
		$('.myQnAinfo').click(function(){
			$('#myclassStatus').hide();
			
			$(this).removeClass("btn-info");
			$(this).addClass("btn-danger");
			
			$('.myclassinfo').removeClass("btn-danger");
			$('.myclassinfo').addClass("btn-info");
			$('.mypayinfo').removeClass("btn-danger");
			$('.mypayinfo').addClass("btn-info");
			$('.myboardinfo').removeClass("btn-danger");
			$('.myboardinfo').addClass("btn-info");
			
			$.ajax({  	        
    	        url : "/chat",
    	        data:{to_id:"manager", mname:"${myInfo.mname }"},
    	        success : function(result) {   	            	
	    	            $('.myinfolist-data').html(result);
	    	            $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
    	       },error:function(e,code){
    	    	   alert('정말에러!!'+e.status+":"+code)
    	           if(e.status==300){
    	               alert("데이터를 가져오는데 실패하였습니다.");
    	           };
    	       }
    	    }); 
		})
		
		$('#myReserve').click(function(){ // 예약 테이블 보여주기
			$(this).addClass('myclassStatus-selected');
			$('#myComplete').removeClass('myclassStatus-selected');
			$.ajax({
				data:{myclass:"reserve"},
    	        url : "/myclasslist",
    	        success : function(result) {   	            	
	    	            $('.myinfolist-data').html(result);
	    				$('.myclassStatus-reserveTable').show();
	    				$('.myclassStatus-completeTable').hide();
    	       },error:function(e,code){
    	    	   alert('정말에러!!'+e.status+":"+code)
    	           if(e.status==300){
    	               alert("데이터를 가져오는데 실패하였습니다.");
    	           };
    	       }
    	    }); 
		});
		

		$('#myComplete').click(function(){ //수강 완료 테이블 보여주기
			$(this).addClass('myclassStatus-selected');
			$('#myReserve').removeClass('myclassStatus-selected');
			$.ajax({
				data:{myclass:"complete"},
    	        url : "/myclasslist",
    	        success : function(result) {   	            	
	    	            $('.myinfolist-data').html(result);
	    				$('.myclassStatus-completeTable').show();
	    				$('.myclassStatus-reserveTable').hide();
    	       },error:function(e,code){
    	    	   alert('정말에러!!'+e.status+":"+code)
    	           if(e.status==300){
    	               alert("데이터를 가져오는데 실패하였습니다.");
    	           };
    	       }
    	    }); 
		});
		
		$('.myinfolist-data').on('click','.myboardTable tbody tr',function(){// 결제 취소버튼 선택시
			location.href ="/board/showpage?bno="+$(this).find(':hidden').val();
		});

		$('.myinfolist-data').on('click','.myclassStatus-table tbody tr',function(){// 결제 취소버튼 선택시
			location.href ="/class/info?cno="+$(this).find('.hidden').val();
		});
		
		$('.myinfolist-data').on('click','.mypayTable tbody tr',function(){// 결제 취소버튼 선택시
			location.href ="/board/showpage?bno="+$(this).find(':hidden').val();
		});

		$('.myinfolist-data').on('click','.myclassStatus-reserveTable button',function(){// 결제 취소버튼 선택시
			if(confirm('정말로 취소하시겠습니까?')){
				$.ajax({
					data:{rno:$(this).prev().val(),
						price:$(this).next().val()},
	    	        url : "/deleteReserve",
	    	        success : function(result) {   	            	
		    	            alert(result)
		    	            location.href = "/mypage";
	    	       },error:function(e,code){
	    	    	   alert('정말에러!!'+e.status+":"+code)
	    	           if(e.status==300){
	    	               alert("데이터를 가져오는데 실패하였습니다.");
	    	           };
	    	       }
	    	    }); 		
			}
		});
	});
</script>
<script type="text/javascript" src="/resources/js/sockjs.js"></script>
<script type="text/javascript" src="/resources/js/qna.js"></script>
<br><br><br>
<div class="container">
	<div class="row">
		<div class="col-md-4">
			<div class="card myinfo">
				<img class="card-img-top " src="/resources/img/man.png" alt="Card image"
					style="width: 100%" height="280px">
				<div class="card-body">
					<p class="card-text text-center font-weight-bold"> &nbsp;&nbsp;&nbsp;${myInfo.mname }님
					<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myInfoModal">정보 변경</button></p>
				</div>

			</div>
		</div>
		<div class="col-md-4">
			<div class="card myinfo text-center">
				<div class="card-header font-weight-bold small">자녀 정보</div>
				<div class="card-body childInfo">
					<c:forEach items="${childInfo }" var="child">
					<p class="card-text">${child.dname }(${child.dage }세 ${child.dgender })</p>
					</c:forEach>
					<button type="button" class="btn btn-info " data-toggle="modal" data-target="#childModal">등록</button>
				</div>
			</div>
		</div>
		<div class="card myinfo text-center">
			<div class="card-header font-weight-bold small">보유한 젤리</div>
			<div class="card-body">
				<p class="card-text"><fmt:formatNumber value="${myInfo.mcash }" type="currency" currencySymbol=""/>젤리</p>
				<button class="btn btn-info" id="myPagechargeBtn">젤리충전</button>
				<br><button type="button" class="btn btn-warning" id="statInfo" style="margin-top: 20px;">나의 통계</button>
			</div>
		</div>
	</div>
	    <div class="modal fade" id="childModal">
            <div class="modal-dialog modal-dialog-centered modal-sm">
              <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                  <h2 class="modal-title text-left">Kids 등록</h2>
                  
                  <button type="button" class="close" data-dismiss="modal">&times;&nbsp;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">    
                      <div class="row">
							<div class="col-md-12">
							<div class="form-group form-inline">							
								<label for="dname">키즈명</label> &nbsp;&nbsp;<input type="text"
									class="form-control" id="dname" name="dname" >
							</div>
							<div class="form-group form-inline">
								<label for="dbirth">키즈 생년월일</label> <input type="date"
									class="form-control" id="dbirth" name="dbirth" >
							</div>
							<div class="form-group">
								<label for="dgender">성별</label> &nbsp;&nbsp;
								<label class="radio-inline" id="dgender"> <input
										type="radio" name="dgender" id="initRadio" checked value="남">남
									</label> <label class="radio-inline"> <input
										type="radio" name="dgender" value="여">여
									</label>
								</div>
							</div>
					</div>     
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal" id="addChildBtn">등록</button>
                  <button type="button" class="btn btn-danger" data-dismiss="modal" id="cancelChildBtn">취소</button>
                </div>
              </div>
            </div>
            </div> <!--childModal 끝-->
	    <div class="modal fade" id="myInfoModal">
            <div class="modal-dialog modal-dialog-centered modal-md">
              <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                  <h2 class="modal-title text-left">회원정보 변경</h2>
                  <button type="button" class="close" data-dismiss="modal">&times;&nbsp;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body"> 
                
                      <div class="row">
							<div class="col-md-12">
							<script type="text/javascript">
	
	$(function(){
		loadgugun();

		loadplaytype();
//회원가입 버튼 클릭 시
		$('#myInfoUpdateBtn').click(function(){
			if($('#mpw').val()==''){
				alert('비밀번호 입력!')
				return false;
			}
			if($('#mpwconfirm').val()==''){
				alert('비밀번호 확인 입력!')
				return false;
			}
			if($('#mpwcheck').text().indexOf('실패')>0){
				alert('비밀번호 일치 확인!');
				return false;
			}
			if($('#gugun').val()==0){
				alert('주소 구 선택!')
				return false;
			}
			if($('#dong').val()==0){
				alert('주소 동 선택!')
				return false;
			}
			 if($('#mphone').val()==''){
				alert('폰번호 입력!')
				return false;
			}
			if($('#mphonecheck').text().indexOf('형식')>0){
				alert('폰번호 형식 확인!');
				return false;
			}
			if($('#mphonecheck').text().indexOf('중복')>0){
				alert('폰번호 중복 확인!');
				return false;
			}
			if($('#mbirth').val()==''){
				alert('생년월일 입력!')
				return false;
			}
			if($('#playtype').val()==0){
				alert('관심사 타입 선택!')
				return false;
			}
			if($('#act').val()==0){
				alert('관심사 상세 선택!')
				return false;
			}
			updateMyInfo();
		});//myInfoUpdateBtn 클릭
		
		
	});//function
//join
	
	
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
	
	function updateMyInfo(){
		$.ajax({
			url:"/updateMyInfo",
			data:{
				mid:"${login_id}",
				mpw:$('#mpwconfirm').val(),
				maddress:$('#gugun').val()+","+$('#dong').val(),
				mphone:$('#mphone').val(),
				mbirth:$('#mbirth').val(),
				minterest:$('#playtype').val()+","+$('#act').val()
			},
			type:"POST",
			success:function(result){
				alert(result);			
			}				
		});//ajax
	}
	
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
				$('#gugun option').each(function(){
					var gugunValue = $(this).text();
					if(gugunValue =='${myInfo.maddress.split(",")[0] }'){
						$(this).attr('selected','selected');
						return;				
					}
				})
				loaddong();
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
				$('#dong option').each(function(){
					var dongValue = $(this).text();
					if(dongValue =='${myInfo.maddress.split(",")[1] }'){
						$(this).attr('selected','selected');
						return;				
					}
				})
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
				$('#playtype option').each(function(){
					var playtypeValue = $(this).text();
					if(playtypeValue =='${myInfo.minterest.split(",")[0] }'){
						$(this).attr('selected','selected');
						return;				
					}
				})
				loadact();
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
				$('#act option').each(function(){
					var actValue = $(this).text();
					if(actValue =='${myInfo.minterest.split(",")[1] }'){
						$(this).attr('selected','selected');
						return;				
					}
				})
			}
		});//ajax for act
	}//loadact
		
</script>
	<form class="form-horizontal">
		<div class="group">
			<label>아이디</label>
			${login_id }
		</div>			
			
		<div class="group">
			<label>비밀번호</label>
			<input type="password" id="mpw" required="required"/><span class="highlight"></span><span class="bar"></span>
		</div>
		
		<div class="group">
			<label>비밀번호 확인</label>
			<input type="password" id="mpwconfirm" onkeyup="checkpw()" required="required"/><span class="highlight"></span><span class="bar"></span>
			<div id="mpwcheck"></div>
		</div>
		
		<div class="group">
			<label>이름</label>
			${myInfo.mname }
		</div>
		
		<div class="group">
			<label>주소</label>
			<select name="gugun" id="gugun" onchange="loaddong()" required="required">
			</select>
			<select name="dong" id="dong" required="required">
			</select>
		</div>
		
		<div class="group">
			<label>폰번호</label>
			<input type="text" id="mphone" onkeyup="phonecheck()" required="required" value="${myInfo.mphone }"/><span class="highlight"></span><span class="bar"></span>
			<div id="mphonecheck"></div>
		</div>
		
		<div class="group">
			<label>생년월일</label>
			<input type="date" id="mbirth" value="${myInfo.mbirth.substring(0,10) }"/><span class="highlight"></span><span class="bar"></span>
		</div>
		
		<div class="group">
			<label>관심사</label>
			<select name="playtype" id="playtype"  onchange="loadact()" required="required">
				<option value="0">==선택==</option>
		   	</select>
			<select name="act" id="act">
				<option value="0">==선택==</option>
		    </select>
		</div>
	</form>

							</div>
				     
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal" id="myInfoUpdateBtn">변경</button>
                  <button type="button" class="btn btn-danger" data-dismiss="modal" id="myInfoCancleBtn">취소</button>
                </div>
              </div>
            </div>
            </div>
</div> <!--myInfoModal 끝-->
<br><br><br>
	<div class="row myinfolist">
		<div class="col-md-3">
			<button class="btn btn-info myclassinfo">클래스</button>
		</div>
		<div class="col-md-3">
			<button class="btn btn-info mypayinfo">구매내역</button>
		</div>
		<div class="col-md-3">
			<button class="btn btn-info myboardinfo">마이게시물</button>
		</div>
		<div class="col-md-3">
			<button class="btn btn-info myQnAinfo">1 : 1 문의</button>
		</div>

	</div>
<br><br>
<div class="row myinfolist ">
<div class="font-weight-bold" id="myclassStatus" style="display: none;">
	<div class="myclassStatus" id="myReserve"><span>예약</span></div>|<div class="myclassStatus font-weight-bold" id="myComplete"><span>수강완료</span></div>
	</div>
	<br>
</div>
<div class="myinfolist-data"></div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>