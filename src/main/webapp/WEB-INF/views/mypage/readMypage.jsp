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
</style>
<script>
	$(function(){
		$('#myPagechargeBtn').click(function(){
			alert("충전페이지로 이동합니다.");
			location.href="/chargepage";
		})
		
		$('#addChildBtn').click(function(){// 자녀 등록	
			$.ajax({
				type : 'post',
				data : {dgender:dgender=$('input[name=dgender]:checked').val(),
					  dname:$('#dname').val(),
					  dbirth: new Date($('#dbirth').val())},
    	        url : "/insertChild",
    	        success : function(result) {   	            	
	    	          alert('등록 성공')
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
			$('.myQnAinfo').removeClass("btn-danger");
			$('.myQnAinfo').addClass("btn-info");
		
			
			$('#myclassStatus').show();
		});
		
		
		$('.mypayinfo').click(function(){
			$('#myclassStatus').hide();
			
			$(this).removeClass("btn-info");
			$(this).addClass("btn-danger");
			
			$('.myclassinfo').removeClass("btn-danger");
			$('.myclassinfo').addClass("btn-info");
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
		$('.myQnAinfo').click(function(){
			
		})
		
		$('#myReserve').click(function(){
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

		$('#myComplete').click(function(){
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
					<p class="card-text text-center font-weight-bold">${myInfo.mname }님</p>
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
			<div class="card-header font-weight-bold small">캐쉬 정보</div>
			<div class="card-body">
				<p class="card-text"><fmt:formatNumber value="${myInfo.mcash }" type="currency" currencySymbol=""/>젤리</p>
				<button class="btn btn-info" id="myPagechargeBtn">충전</button>
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
<br><br><br>
	<div class="row myinfolist">
		<div class="col-md-4">
			<button class="btn btn-info myclassinfo">클래스</button>
		</div>
		<div class="col-md-4">
			<button class="btn btn-info mypayinfo">구매내역</button>
		</div>
		<div class="col-md-4">
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