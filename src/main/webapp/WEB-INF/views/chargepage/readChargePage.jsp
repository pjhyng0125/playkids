<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.cashinfo{
			border: 0px;
            width: 300px;
            
        }
.pay-notice pre{
	background-color: transparent;
	overflow: visible;
	border: 0px;
	font-size: large;
	font-weight: bold;
	color: olive;
}
.card-header{
	background: transparent;
}
.card-body p,label{
	font-size: large; 
}
</style>
<script>
	var login_id="${login_id}";
	if(login_id=="" || login_id==undefined){
		alert('로그인을 먼저 실행해 주세요!');
		location.href="/login";
	}
	
	$(function(){
		$('#chargeBtn').click(function(){
			var cash = $('.cashinfo input[name=cash]:checked').val();
			if(cash == undefined){
				alert("충전할 금액을 선택해 주세요!");
			}else{
				if(confirm('충전하시겠습니까?')){
					$.ajax({
						type : 'post',
						data : {cash:cash},
		    	        url : "/updateCharge",
		    	        success : function(result) {   	            	
			    	          alert(result);
			    	          location.href="/chargepage";
		    	       },
		    	       error:function(e,code){
		    	    	   alert('정말에러!!'+e.status+":"+code)
		    	           if(e.status==300){
		    	               alert("데이터를 가져오는데 실패하였습니다.");
		    	           };
		    	       }
					});
				}
			}
		});
		
		$('#getRefundBtn').click(function(){
			var account1 = $('#account1').val();
			var account2 = $('#account2').val();
			var account3 = $('#account3').val();
			var account= ''+account1+account2+account3;
			var jelly=$('#refundJelly').val();
			var name = $('#accountUser').val();
			if($('#bank').val()==0){
				alert('은행을 선택해주세요!');
				return false;
			}else if(account1 ==''|| account2==''|| account3==''){
				alert('계좌번호를 입력해주세요!');
				return false;
			}else if(isNaN(account)){
				alert('올바른 계좌번호가 아닙니다.');
				return false;
			}else if(!isNaN(name)){
				alert('올바른 이름을 적어주세요.');
				return false;
			}else if($('#refundJellyCheck').html()!=''){
				alert('잘못된 젤리 갯수 입니다.');
				return false;
			}else{
				if(confirm('확인을 누르시면 '+$('#refundWon').text()+'이 환불됩니다.\n진행하시겠습니까?')){
					$.ajax({
						type : 'post',
						data : {refund:"refund",
							cash:jelly},
		    	        url : "/updateCharge",
		    	        success : function(result) {   	            	
			    	          alert(result);
			    	          location.href="/chargepage";
		    	       },
		    	       error:function(e,code){
		    	    	   alert('정말에러!!'+e.status+":"+code)
		    	           if(e.status==300){
		    	               alert("데이터를 가져오는데 실패하였습니다.");
		    	           };
		    	       }
		    	       });
				}
			}
				
		});
		
		$('#refundJelly').keyup(function(){
			var jelly=$(this).val();
			var mycash = parseInt("${myInfo.mcash}")
			if(jelly==''){
				$('#refundWon').text('');
				return;
			}
			if(isNaN(jelly)){
				$('#refundJellyCheck').html('<font color=red>숫자를 입력하세요!</font>');
				$('#refundWon').text('');
			}else if(parseInt(jelly)>mycash){
				alert('보유한 젤리 수를 초과하였습니다.');
				$(this).val("${myInfo.mcash}");
				$('#refundWon').text(mycash*0.9);
			}else if(parseInt(jelly)<1000){
				$('#refundJellyCheck').html('<font color=red>1000젤리 이상이어야 합니다.</font>');
				$('#refundWon').text('');
			}else{
				$('#refundJellyCheck').html('');
				$('#refundWon').text(parseInt(jelly)*0.9);				
			}
		})
	});
	
</script>
<br><br><br>
<div class="container">
	<div class="row">
		<div class="col-md-4">
			<div class="card cashinfo">
				<img class="card-img-top" src="/resources/img/man.png" alt="Card image"
					style="width: 100%" height="280px">
				<div class="card-body">
					<p class="card-text text-center font-weight-bold">${myInfo.mname }님</p>
				</div>
			</div>
		</div>
		<div class="col-md-4">
				<div class="card cashinfo text-center">
			<div class="card-header font-weight-bold small">보유한 젤리</div>
			<div class="card-body">
				<p class="card-text"><fmt:formatNumber value="${myInfo.mcash }" type="currency" currencySymbol=""/>젤리</p>
				<button class="btn btn-info" id="refundBtn" data-toggle="modal" data-target="#refundModal">환불</button>
			</div>
		</div>
		</div>
		<div class="col-md-4">
			<div class="card cashinfo text-center">
				<div class="card-header font-weight-bold small">젤리 충전</div>
				<div class="card-body">
					<label class="radio-form"> <input type="radio"
						name="cash" value="10000">10,000젤리
					</label><br><br> <label class="radio-form"> <input type="radio"
						name="cash" value="20000">20,000젤리
					</label><br><br> <label class="radio-form"> <input type="radio"
						name="cash" value="30000">30,000젤리
					</label><br><br> <label class="radio-form"> <input type="radio"
						name="cash" value="50000">50,000젤리
					</label><br><br>
					<button class="btn btn-info" id="chargeBtn" data-toggle="modal" data-target="#chargeModal">충전</button>
				</div>
			</div>
		<br><br>
		</div>
		<div class="col-md-12 pay-notice">
		<pre>
	・ 1젤리는 1원의 가치를 지니며, 젤리는 결제 시 현금처럼 사용할 수 있습니다.
			   
	・ 충전한 젤리는 별도 유효기간 없이 사용하실 수 있습니다.단, 마지막 이용일로부터 5년 경과 시까지 이용 내역이 없을 경우,
	  &lt;상법 제64조 상사채권 소멸시효&gt; 조항에 따라 소멸됩니다.*
			      
	・ 일부를 사용한 젤리는 환불받을 수 있으며 환불 수수료(10%)를 공제하고 남은 금액을 환불해드립니다.
	
	・ 젤리는 1000젤리 이상일 경우 환불이 가능합니다.</pre>
		</div>
	</div>
</div>
<br><br><br>
	    <div class="modal fade" id="refundModal">
            <div class="modal-dialog modal-dialog-centered modal-xsm">
              <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                  <h2 class="modal-title text-left">젤리 환불</h2>
                  <button type="button" class="close" data-dismiss="modal">&times;&nbsp;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">    
                      <div class="row">
							<div class="col-md-12">
							<label>계좌번호:</label>&nbsp;&nbsp;
							<select id="bank">
							<option value="0">선택</option>
							<option value="신한">신한</option>
							<option value="국민">국민</option>
							<option value="기업">기업</option>
							<option value="농협">농협</option>
							</select>
							<input type="text" id="account1" maxlength="3" size="3">-<input type="text" id="account2" maxlength="4" size="4">-<input type="text" id="account3" maxlength="6" size="6"><br><br>
							<label>받는 사람:</label>&nbsp;&nbsp;<input type="text" size=5 id="accountUser"><br><br>
							<label>환불할 젤리 수:</label>&nbsp;&nbsp; <input type="text" id="refundJelly" placeholder="환불받을 젤리 갯수를 입력" size="22">&nbsp;&nbsp;&nbsp;<span id="refundJellyCheck"></span><br><br>		
							<label>환불될 금액:</label>&nbsp;&nbsp; <span id="refundWon"></span>		
							</div>
					</div>     
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal" id="getRefundBtn">받기</button>
                  <button type="button" class="btn btn-danger" data-dismiss="modal" id="cancelRefunddBtn">취소</button>
                </div>
              </div>
            </div>
            </div> <!--chargeModal 끝-->
<%@include file="/WEB-INF/views/include/footer.jsp"%>