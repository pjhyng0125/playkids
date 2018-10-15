<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/sockjs.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/js/wow.min.js"></script>
<script src="/resources/bootstrap/js/main.js"></script>
<link href="/resources/css/anybootstrap.css" rel="stylesheet">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/bootstrap/css/font-awesome.min.css">
<link href="/resources/bootstrap/css/animate.min.css" rel="stylesheet">
<link href="/resources/bootstrap/css/animate.css" rel="stylesheet" />
<link href="/resources/bootstrap/css/prettyPhoto.css" rel="stylesheet">
<link href="/resources/bootstrap/css/style.css" rel="stylesheet">
<style type="text/css">
.msgDiv-user *{
	float: right;
}
.msgDiv-manager *{
	float: left;
}
</style>
</head>
<body>
<div class="container">
		<div class="row">
			<input type="text" /> <input type="button" value="전송" />
			<div id="data"></div>
			<c:set var="profile" value='<%=session.getAttribute("login")%>' />

			<div class="col-md-12" style="margin-top: 40px; clear: both;">
				<div class="col-md-12"
					style="margin: 20px auto; text-align: center; color: white; background-color: #01D1FE; border: 1px solid #01D1FE; padding: 10px 10px; border-radius: 8px;">
					수업 일정과 강의 내용에 대해 문의해보세요.</div>

			</div>
			<!-- 채팅 내용 -->

			<div class="col-md-12">
				<div class="col-md-12"
					style="margin: 0 auto; border: 1px solid #01D1FE; height: 400px; border-radius: 10px; overflow: scroll"
					id="chatArea">
					
					<div id="chatMessageArea"
						style="margin-top: 10px; margin-left: 10px;">
						<div class="msgDiv-user col-md-12">
							<div style='padding-right: 0px; padding-left: 0px;'>
								<img id='profileImg'
									src='/resources/img/man.png' style='width: 50px; height: 50px;'>
								<span style='background-color: #ACF3FF; padding: 10px 5px;border-radius: 10px; font-size:12px;'>
									가나다라마바사
								</span>
								<div style='font-size: 9px; clear: both;'>${user_name}</div>
								<div class="col-md-12" style='font-size: 9px;'>
									<span style='font-size: 9px; text-align: right;'>"+t+"</span>
								</div>
							</div>
						</div><!-- msgDiv -->
						<c:forEach items="${msgList }" var="message">
							<div class="msgDiv-user col-md-12">
								<div style='padding-right: 0px; padding-left: 0px;'>
									<img id='profileImg' src='/resources/img/man.png'
										style='width: 50px; height: 50px;'> <span
										style='background-color: #ACF3FF; padding: 10px 5px; border-radius: 10px; font-size: 12px;'>${message.message_content }</span>
									<div style='font-size: 9px; clear: both;'>${message.message_sender }&nbsp;&nbsp;</div>
									<div class="col-md-12" style='font-size: 9px;'>
										<span style='font-size: 9px; text-align: right;'><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${message.message_sendTime }" /></span>
									</div>
								</div>
							</div>
						</c:forEach>
						
					</div>
				</div>
			</div>
		</div>

		<!-- 채팅 입력창 -->
	<div class="col-md-12" style="margin-top: 20px; margin-bottom: 15px;">
		<div class="col-md-12" style="float: left">
			<textarea class="form-control"
				style="border: 1px solid #01D1FE; height: 65px; float: left; width: 80%"
				placeholder="Enter ..." id ="message"></textarea>
			<span
				style="float: right; width: 18%; height: 65px; text-align: center; background-color: #01D1FE; border-radius: 5px;">
				<a
				style="margin-top: 30px; text-align: center; color: white; font-weight: bold;" id = "sendBtn"><br>전송</a>
			</span>
		</div>
	</div>
	</div>



<input type="text" id="nickname" value = "${user_name }" >
 <input type="button" id="enterBtn" value="입장">
 <input type="button" id="exitBtn" value="나가기">
<script type="text/javascript">
 connect();

 function connect() {
	    sock = new SockJS('/echo');
	    sock.onopen = function() {
	        console.log('open');
	    };
	    sock.onmessage = function(evt) {
    	 var data = evt.data;
    	   console.log(data)
  		   var msgResult = JSON.parse(data)  	   
    	   console.log(msgResult)
    	   appendMessage(msgResult);
	    };
	    sock.onclose = function() {
	    	 //appendMessage("연결을 끊었습니다.");
	        console.log('close');
	    };
	}




 function send() {
  var msg = $("#message").val();
  if(msg != ""){
	  message = {};
  	  message.message_sender = '박형진';
  	  message.message_receiver = '관리자';
	  message.message_content = $("#message").val();
	  message.from_id = '${login_id}';
	  message.to_id = 'manager';  
  }
  sock.send(JSON.stringify(message));
  $("#message").val("");
 }



 function appendMessage(msg) {
	 
	 if(msg == '' || msg == undefined){
		 return false;
	 }else{
			$.ajax({
				type : 'post',
				data : msg,
    	        url : "/qnaResult",
    	        success : function(result) {   	            	
    	        	$("#chatMessageArea").append(result);
    	      	  	var chatAreaHeight = $("#chatArea").height();
    	    	  	var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
    	    	  	$("#chatArea").scrollTop(maxScroll);
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
 $(function() {
  $('#message').keypress(function(event){
   var keycode = (event.keyCode ? event.keyCode : event.which);
   if(keycode == '13'){
    send();
   }
   event.stopPropagation();
  });


  $('#sendBtn').click(function() {send();});
  /* $('#enterBtn').click(function() { connect(); }); $('#exitBtn').click(function() { disconnect(); }); */
 });
</script>


 
</body>
</html>