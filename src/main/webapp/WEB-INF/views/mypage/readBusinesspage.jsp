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

.myinfolist th{
	text-align: center;
}

.myclassStatus-reserveTable td{
	
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

		$('.currentClassInfo button').click(function(){
			window.open("/insertclass","confirm",'width=600,height=400,top=100,left=100');
			return false;
		})
		
		$('#returnProfitBtn').click(function(){
			if(confirm('수익금은 20% 공제된 금액으로 반환됩니다.\n반환 하시겠습니까?')){				
				$.ajax({
					data : {bprofit:"${businessInfo.bprofit }"},
					type : 'post',
	    	        url : "/returnProfit",
	    	        success : function(result) {   	            	
		    	          alert(result);
		    	          location.href="/mypage";
	    	       },
	    	       error:function(e,code){
	    	    	   alert('정말에러!!'+e.status+":"+code)
	    	           if(e.status==300){
	    	               alert("데이터를 가져오는데 실패하였습니다.");
	    	           };
	    	       }
				});
			}
		});
		
		
		$('.businessPayinfo').click(function(){ //구매내역 보여주기
		
			$(this).removeClass("btn-info");
			$(this).addClass("btn-danger");
			
			$('.businessClassinfo').removeClass("btn-danger");
			$('.businessClassinfo').addClass("btn-info");
			$('.myboardinfo').removeClass("btn-danger");
			$('.myboardinfo').addClass("btn-info");
			$('.myQnAinfo').removeClass("btn-danger");
			$('.myQnAinfo').addClass("btn-info");
			
			$.ajax({  	        
    	        url : "/businessPaylist",
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
		$('.businessClassinfo').click(function(){ // 등록한 클래스 보여주기
		
			$(this).removeClass("btn-info");
			$(this).addClass("btn-danger");
			
			$('.businessPayinfo').removeClass("btn-danger");
			$('.businessPayinfo').addClass("btn-info");
			$('.myboardinfo').removeClass("btn-danger");
			$('.myboardinfo').addClass("btn-info");
			$('.myQnAinfo').removeClass("btn-danger");
			$('.myQnAinfo').addClass("btn-info");
			
			$.ajax({  	        
    	        url : "/regClasslist",
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
			
		})
		
	})
</script>
<br><br><br>
<div class="container">
	<div class="row">
		<div class="col-md-4">
			<div class="card myinfo">
				<img class="card-img-top " src="/resources/img/man.png" alt="Card image"
					style="width: 100%" height="280px">
				<div class="card-body">
					<p class="card-text text-center font-weight-bold"> &nbsp;&nbsp;&nbsp;${businessInfo.bname }님
					<button type="button" class="btn btn-default" data-toggle="modal" data-target="#businessInfoModal">정보 변경</button></p>
				</div>

			</div>
		</div>
		<div class="col-md-4">
			<div class="card myinfo text-center">
				<div class="card-header font-weight-bold small">진행중인 클래스</div>
				<div class="card-body currentClassInfo">
					<c:forEach items="${currentBClassList }" var="currentBClass">
					<p class="card-text"><a href="/class/info?=${currentBClass.cno }">${currentBClass.cname }</a></p>
					</c:forEach>
					<button type="button" class="btn btn-default">클래스 등록</button>
				</div>
				</div>
			</div>

		<div class="col-md-4">
			<div class="card myinfo text-center">
				<div class="card-header font-weight-bold small">총 수익금</div>
				<div class="card-body childInfo">
					<p class="card-text"><fmt:formatNumber value="${businessInfo.bprofit }" type="currency" currencySymbol=""/>원</p>
					<button type="button" class="btn btn-default" id="returnProfitBtn">수익금 반환</button>
					<br><br><br>
					<p class="text-left" style="color: olive;">・ 수수료(20%)를 공제하고 <br>&nbsp;&nbsp;&nbsp;남은 금액이 반환됩니다.</p>
				</div>
				</div>
			</div>
		</div>
	  
	    <div class="modal fade" id="businessInfoModal">
            <div class="modal-dialog modal-dialog-centered modal-md">
              <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                  <h2 class="modal-title text-left">기업정보 변경</h2>
                  <button type="button" class="close" data-dismiss="modal">&times;&nbsp;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body"> 
                
                      <div class="row">
							<div class="col-md-12">
<script type="text/javascript">
	
	$(function(){
//checkEmpty	
		$('#businessInfoUpdateBtn').click(function(){
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
			updateBusinessInfo();
		});
		
		$('#businessInfoCancleBtn').click(function(){
			bpw:$('#bpw').val('');
			bphone:$('#bphone').val('${businessInfo.bphone }')
			baccount:$('#baccount').val('');
			$('#bphonecheck').html('');
			$('#bpwcheck').html('');
		});
	});//function
	
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
	function updateBusinessInfo(){
		$.ajax({
			url:"/updateBusinessInfo",
			data:{
				bid:"${login_id}",
				bpw:$('#bpw').val(),
				bphone:$('#bphone').val(),
				baccount:$('#baccount').val()
			},
			type:"POST",
			success:function(result){
				alert(result);
				location.href="/mypage";
			}				
		});//ajax
	}
	
	function checkpw(){
		var pass=$('#bpw').val();
		var pass2=$('#bpwconfirm').val();
		
		if(pass===pass2)
			$('#bpwcheck').html('<font color=green>비밀번호 일치</font>');
		else
			$('#bpwcheck').html('<font color=red>비밀번호 일치 실패</font>');
	}
	
</script>
	<form class="form-horizontal">
	<div class="group">
		<label>아이디</label>
		${login_id }
	</div>
	
	<div class="group">
		<label>비밀번호</label>
		<input type="password" id="bpw" onkeyup="checkpw()" required="required"/><span class="highlight"></span><span class="bar"></span>
	</div>
	
	<div class="group">
		<label>비밀번호 확인</label>
		<input type="password" id="bpwconfirm" onkeyup="checkpw()" required="required"/><span class="highlight"></span><span class="bar"></span>
		<div id="bpwcheck"></div>
	</div>
	<div class="group">
		<label>이름</label>
		${businessInfo.bname }
	</div>
	<div class="group">
		<label>전화번호</label>
	 	<input type="text" id="bphone" onkeyup="phonecheck()" required="required" value="${businessInfo.bphone }"/><span class="highlight"></span><span class="bar"></span>
	 	<div id="bphonecheck"></div>
	 </div>
	<br>
		<div class="group">
		<label>주소</label>
		${businessInfo.baddress.split(",")[0] }		
	</div>
	<div class="group">
		<label>상세주소</label>
		${businessInfo.baddress.split(",")[1] }
	</div>
	
	 <div class="group">
		<label>기업 소개</label><br>
	 	<textarea rows="5" id="bintro" readonly required="required">${businessInfo.bintro }</textarea><span class="highlight"></span><span class="bar"></span>
	 </div>
		<br>
<!--기업 회원 가입-계좌번호 등록-->
		<label>계좌 번호</label>
 	<div class="group">
		<input type="text" id="baccount" required="required" value="${businessInfo.baccount }"/><span class="highlight"></span><span class="bar"></span>
	</div>
	</form>
</div>
				     
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal" id="businessInfoUpdateBtn">변경</button>
                  <button type="button" class="btn btn-danger" data-dismiss="modal" id="businessInfoCancleBtn">취소</button>
                </div>
              </div>
            </div>
            </div>
</div> <!--myInfoModal 끝-->
<br><br><br>
	<div class="row myinfolist">
		<div class="col-md-4">
			<button class="btn btn-info businessClassinfo">등록된 클래스</button>
		</div>
		<div class="col-md-4">
			<button class="btn btn-info businessPayinfo">구매자 내역</button>
		</div>
		<div class="col-md-4">
			<button class="btn btn-info myboardinfo">후기 게시물</button>
		</div>
	</div>
<br><br>

<div class="myinfolist-data"></div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>