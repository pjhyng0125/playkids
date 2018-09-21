<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
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

</style>
<script>
	$(function(){
		$('#chargeBtn').click(function(){
			location.href="/chargepage";
		})
		
		$('.myclassinfo').click(function(){
			$.ajax({  	        
    	        //data : {"page" : page},
    	        url : "/myinfolist",
    	        success : function(result) {   	            	
	    	            $('myinfolist').html(result);
    	       },error:function(e,code){
    	    	   alert('정말에러!!'+e.status+":"+code)
    	           if(e.status==300){
    	               alert("데이터를 가져오는데 실패하였습니다.");
    	           };
    	       }
    	    }); 
			
		})
		$('.mypayinfo').click(function(){
			
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
					<p class="card-text text-center font-weight-bold">OOO님</p>
				</div>

			</div>
		</div>

		<div class="col-md-4">
			<div class="card myinfo text-center">
				<div class="card-header font-weight-bold">자녀 정보</div>
				<div class="card-body">
					<p class="card-text">김길동(10세 남)</p>
					<p class="card-text">김라임(8세 여)</p>
				</div>

			</div>
		</div>

		<div class="card myinfo text-center">
			<div class="card-header font-weight-bold">캐쉬 정보</div>
			<div class="card-body">
				<p class="card-text">1,000원</p>
				<button class="btn btn-info " id="chargeBtn">충전</button>
			</div>

		</div>
	</div>
<br><br><br>
	<div class="row myinfolist">
		<div class="col-md-4">
			<button class="btn btn-info myclassinfo">클래스</button>
		</div>
		<div class="col-md-4">
			<button class="btn btn-info mypayinfo">구매내역</button>
		</div>
		<div class="col-md-4">
			<button class="btn btn-info myQnAinfo">1:1문의</button>
		</div>
	</div>
<br><br><br>
<div class="row myinfolist">
</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>