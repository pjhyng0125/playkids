<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<style>
.cashinfo{
			border: 0px;
            width: 300px;
            transform: translateX(200px);
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
				<div class="card-header font-weight-bold">캐쉬충전</div>
				<div class="card-body">
					<label class="radio-form"> <input type="radio"
						name="cash" value="10000">10,000원
					</label><br> <label class="radio-form"> <input type="radio"
						name="cash" value="20000">20,000원
					</label><br> <label class="radio-form"> <input type="radio"
						name="cash" value="30000">30,000원
					</label><br> <label class="radio-form"> <input type="radio"
						name="cash" value="50000">50,000원
					</label><br>
					<br>
					<button class="btn btn-info" id="chargeBtn">충전</button>
				</div>
			</div>
		현재 잔액: ${myInfo.mcash }원
		</div>
	</div>
</div>
<br><br><br>
<%@include file="/WEB-INF/views/include/footer.jsp"%>