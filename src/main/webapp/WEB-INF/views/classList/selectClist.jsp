<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.class-list{
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .gu-list{
            margin-top: 5px;
            margin-bottom: 5px;
        }
        .age-list{
            margin-top: 5px;
            margin-bottom: 5px;
        }
        
        .age-list button{
            width: 70px;
        }

        .zoom{
            transition: transform .3s;
        }
        .zoom:hover {
            -webkit-box-shadow:0px 0px 12px 1px rgba(0,0,0,0.1);
            box-shadow:0px 0px 12px 1px rgba(0,0,0,0.1);
            -webkit-transform:translateY(-8px);
            -moz-transform:translateY(-8px);
            -ms-transform:translateY(-8px);
            -o-transform:translateY(-8px);
            transform:translateY(-8px);
        }

    
        .zoom img:hover{
            opacity: 0.7;
        }     

        .myinfo{
            border: 0px;
            width: 300px;
        }
        .cashinfo{
            transform: translateX(200px);
            
        }
        #loadingImg{
        	text-align: center;
        }
        
        .tophead{
        	margin-bottom:70px;
        }
</style>
  
   <div class="container">
    <h2 class="tophead font-weight-bold">${ctype }</h2>
    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#areaModal">지역</button>
    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#ageModal">나이</button>
    <!-- 나이 Modal -->
   <div class="modal fade" id="areaModal">
    <div class="modal-dialog modal-dialog-centered modal-sm">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h2 class="modal-title text-left">지역</h2>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">    
                    <div class="row">
                    <c:forEach items="${guInfoList }" var="gu">
                        <div class="col-md-4 gu-list">
                                <button class="btn card guBtn">${gu }</button>
                        </div>
                        </c:forEach>
                    </div>
        </div>
    <script type="text/javascript">
    $(function(){
        var page = 1;
        var gu ='';
    	var age='';
    	var totalPage ="${totalPage}";
    	var ctype = "${ctype}";
    	//구에 따른 list
    	$('.guBtn').click(function(){
    		gu = $(this).text();
    	});
    	
    	$('.guApplyBtn').click(function(){
    		if(gu==''){
    			alert('지역을 선택해주세요!');
    			return false;
    		}else{
    	
    			$('.addressHidden[value= "'+gu+'"]').parent().fadeIn();

    			$('.addressHidden[value!= "'+gu+'"]').parent().fadeOut();
    		}
    	});
    	
    
    	//나이에 따른 list
    	$('.ageBtn').click(function(){
    		age = parseInt($(this).val());
    	});
    	
    	$('.ageApplyBtn').click(function(){
    		if(age==''){
    			alert('나이를 선택해주세요!');
    			return false;
    		}else{
    			$('.ageHidden').each(function(){
    				var startAge = parseInt($(this).attr("startAge"));
    				var endAge = parseInt($(this).attr("endAge"));

    				if(age>=startAge && age<=endAge){
    					$(this).parent().fadeIn();
    				}else{
    					$(this).parent().fadeOut();
    				}
    			});
    		}
    	});
    	
    	function getList(page){
    		var url;
    		if(ctype=="" || ctype== undefined){
    			url="/totalClass";
    		}else if (ctype=="실내놀이"){
    			url="/innerClass";
    		}else{
    			url="/outerClass";
    		}
    		
    		$('#loadingImg').html('<img src="/resources/img/loader.gif">');  
    	    $.ajax({
    	        type : 'post',  	        
    	        data : {page : page},
    	        url : url,
    	        success : function(result) {   	            	
	    	            if (page!=1){  //페이지가 1이 아닐경우 데이터를 붙힌다.
	    	                $("#pagingList").append(result); 
	    	            }
	    	            $('#loadingImg').empty();
	    				if(gu != ""){
	    	           		$('.addressHidden[value = "'+gu+'"]').parent().show();
	
	        				$('.addressHidden[value!= "'+gu+'"]').parent().hide();					
	    				}	 
	               
	        		
	        			if(age != ''){
	    	    			$('.ageHidden').each(function(){
	    	    				var startAge = parseInt($(this).attr("startAge"));
	    	    				var endAge = parseInt($(this).attr("endAge"));
	    	
	    	    				if(age>=startAge && age<=endAge){
	    	    					$(this).parent().show();
	    	    				}else{
	    	    					$(this).parent().hide();
	    	    				}
	        				});
	        			}
	        			
    	          
    	       },error:function(e,code){
    	    	   alert('정말에러!!'+e.status+":"+code)
    	           if(e.status==300){
    	               alert("데이터를 가져오는데 실패하였습니다.");
    	           };
    	       }
    	    }); 
    	}
        
    	$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
    	     if($(window).scrollTop() >= $(document).height() - $(window).height()){
    	    	 if(page != totalPage){
    	    		  page++;
    		          getList(page);
    	          }
    	     } 
    	});  	
    	

    }); // $(function)
    
	
    </script>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary guApplyBtn" data-dismiss="modal">적용</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
    </div> <!--modal 끝-->

    <!--agemodal-->
    <div class="modal fade" id="ageModal">
            <div class="modal-dialog modal-dialog-centered modal-sm">
              <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                  <h2 class="modal-title text-left">나이</h2>
                  <button type="button" class="close" data-dismiss="modal">&times;&nbsp;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">    
                                <div class="row">
                                <div class="col-md-4 age-list">
                                        <button class="btn card ageBtn" value="8">8세</button>
                                </div>
                                <div class="col-md-4 age-list">
                                        <button class="btn card ageBtn" value="9">9세</button>
                                </div>
                                <div class="col-md-4 age-list">
                                        <button class="btn card ageBtn" value="10">10세</button>
                                </div>
                                <div class="col-md-4 age-list">
                                        <button class="btn card ageBtn" value="11">11세</button>
                                </div>
                                <div class="col-md-4 age-list">
                                        <button class="btn card ageBtn" value="12">12세</button>
                                </div>
                                <div class="col-md-4 age-list">
                                        <button class="btn card ageBtn" value="13">13세</button>
                                </div>
                            </div>
                          
                            
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary ageApplyBtn" data-dismiss="modal">적용</button>
                  <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
              </div>
            </div>
            </div> <!--agemodal 끝-->

                <!--class-->
                <div class="row" id="pagingList">
                <c:forEach items="${classlist }"  var="classlist">
                <div class="col-md-3 class-list">
                    <input type="hidden" value='${classlist.baddress.split(" ")[1] }' class="addressHidden"> 
                    <input type="hidden" startAge='${classlist.startAge }' endAge='${classlist.endAge }' class="ageHidden">
                    <div class="card zoom">
                        <a style="cursor: pointer" class="classImg" href="/class/info?cno=${classlist.cno }">
                            <img class="card-img-top" src="/resources/upload/class/${classlist.cpic }" alt="Card image" style="width:100%" height="200px">
                        </a>
                            <div class="card-body">
                              <h5 class="card-title">${classlist.cname }</h5>
                              <p class="card-text">${classlist.baddress } / ${classlist.startAge }세~${classlist.endAge }세 권장</p>
                              <p class="card-text"><font color="red ">${classlist.price }</font>원</p>
                            </div> 
                         
                        </div>
                    </div>
                </c:forEach>
                 </div><!-- //class -->
                 <div id="loadingImg"></div>
                 </div><!-- container -->
                 

<%@include file="/WEB-INF/views/include/footer.jsp"%>