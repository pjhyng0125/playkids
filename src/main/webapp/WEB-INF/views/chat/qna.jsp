<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/resources/js/sockjs.js"></script>
<style type="text/css">
.message-profile{
	float: left;
	padding-right: 0px; padding-left:0px;
}
.message-content{
	float:left;
	padding-right: 0px; padding-left:0px; margin-top: 20px;
}

.msgDiv-${login_id} .message-profile{
	float: right;
	padding-right: 0px; padding-left:0px;
}
.msgDiv-${login_id} .message-content{
	float: right;
	padding-right: 0px; padding-left:0px; margin-top: 20px;
}

.message-profile .profileImg{
	width: 50px;
	height: 50px;
	margin-left: auto;
	margin-right: auto;
	display: block;'
}
.message-profile .sender{
	font-size: 9px;
	clear: both;
	text-align:center;
	display: block;
}

.message-profile .sendTime{
	font-size: 9px; 
	text-align: right;
	display: block;'
}


</style>


<div class="container">
		<div class="row">
			<c:set var="profile" value='<%=session.getAttribute("login")%>' />

			<div class="col-md-12" style="margin-top: 40px; clear: both;">
				<div class="col-md-12"
					style="margin: 20px auto; font:bold;  text-align: center; color: grey; background-color: #FFFF99; border: 1px solid #FFFF99; padding: 10px 10px; border-radius: 8px;">
					수업 일정과 강의 내용에 대해 문의해보세요.</div>

			</div>
			<!-- 채팅 내용 -->

			<div class="col-md-12">
				<div class="col-md-12"
					style="margin: 0 auto; border: 5px solid #FFFF99; height: 400px; border-radius: 10px; overflow-y: scroll; overflow-x:hidden;"
					id="chatArea">
					<div id="chatMessageArea"
						style="margin-top: 10px; margin-left: 10px;">
						<c:forEach items="${msgList }" var="message">
								<div class="msgDiv-${message.from_id } col-md-12">							
								<div class="message-profile" >
									<img class='profileImg' src='/resources/img/man.png'> 
									<span class="sender">${message.message_sender }</span>
									<span class="sendTime"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${message.message_sendTime }" /></span>
								</div>
								<div class="message-content">
									<span style='background-color: #ACF3FF; padding: 10px 5px; border-radius: 10px; font-size: 20px;'>${message.message_content }</span>
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
				style="border: 3px solid #32CD32; font-size:20px; height: 65px; float: left; width: 80%"
				placeholder="Enter ..." id ="message"></textarea>
			<span
				style="float: right; width: 18%; height: 65px; text-align: center; background-color: #32CD32; border-radius: 5px;">
				<a
				style="margin-top: 30px; text-align: center; color: white; font-weight: bold;" id = "sendBtn"><br>전송</a>
			</span>
		</div>
	</div>
	</div>
<script type="text/javascript">

 function send() {
  var msg = $("#message").val();
  if(msg != ""){
	  message = {};
	  if("${login_id}"=="manager"){
	  	  message.message_sender = '관리자';
  		  message.message_receiver = $('button[value=${to_id}]').attr('name');
  		  message.to_id = '${to_id}';
  		  message.message_readTime = new Date();
	  }else{
	  	  message.message_sender = '${mname}';
	  	  message.message_receiver = '관리자';
	  	  message.to_id = 'manager';
	  }
	  message.message_content = msg;
	  message.from_id = '${login_id}';    
	  sock.send(JSON.stringify(message));
  }else{
	  alert("내용를 입력해주세요!");
  }
  $("#message").val('');
 }


 

 $(function() {
  $('#message').keypress(function(event){
   var keycode = (event.keyCode ? event.keyCode : event.which);
   if(keycode == '13'){
    send();
    event.preventDefault();
   }
   event.stopPropagation(); 
  });


  $('#sendBtn').click(function() {send();});
  /* $('#enterBtn').click(function() { connect(); }); $('#exitBtn').click(function() { disconnect(); }); */
 });
</script>