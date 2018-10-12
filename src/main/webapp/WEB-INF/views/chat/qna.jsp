<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- <script type="text/javascript">
 
    $(document).ready(function(){
        /* $("#sendBtn").click(function(){
            sendMessage();
        }); */
    });
    
    //websocket을 지정한 URL로 연결
    var sock= new SockJS("<c:url value="/echo"/>");
    //websocket 서버에서 메시지를 보내면 자동으로 실행된다.
    sock.onmessage = onMessage;
    //websocket 과 연결을 끊고 싶을때 실행하는 메소드
    sock.onclose = onClose;
    
    
    function sendMessage(){
        
            //websocket으로 메시지를 보내겠다.
            sock.send($("#message").val());
        
    }
            
    //evt 파라미터는 websocket이 보내준 데이터다.
    function onMessage(evt){  //변수 안에 function자체를 넣음.
        var data = evt.data;
        $("#data").append(data+"<br/>");
        /* sock.close(); */
    }
    
    function onClose(evt){
        $("#data").append("연결 끊김");
    }
    
</script> -->
</head>
<body>
<div class="container">
<div class="row">
    <input type="text" />
    <input type="button"  value="전송"/>
    <div id="data"></div>
    <c:set var="profile" value='<%=session.getAttribute("login")%>' />

	<div class="col-md-12" style="margin-top: 40px; clear: both;">
		<div class="col-md-12"
			style="margin: 20px auto; text-align: center; color: white; background-color: #01D1FE; border: 1px solid #01D1FE; padding: 10px 10px; border-radius: 8px;">
			수업 일정과 강의 내용에 대해 문의해보세요.
		</div>

	</div>
	<!-- 채팅 내용 -->
	
	<div class="col-md-12">
		<div class="col-md-12"
			style="margin: 0 auto; border: 1px solid #01D1FE; height: 400px; border-radius: 10px; overflow:scroll" id = "chatArea">
			<div id="chatMessageArea" style = "margin-top : 10px; margin-left:10px;">
			<div  style = 'float:right; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid' src='/resources/img/man.png' style = 'width:50px; height:50px; '><div style='font-size:9px; clear:both;'>${user_name}</div></div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-md-12' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"+msg+"</span></div><div class="col-md-12" style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"+t+"</span></div></div></div></div>
		</div>
	</div>

	<!-- 채팅 입력창 -->
	<div class="col-md-12" style="margin-top: 20px; margin-bottom: 15px;">
		<div class="col-md-12" style="float: left">
			<textarea class="form-control"
				style="border: 1px solid #01D1FE; height: 65px; float: left; width: 80%"
				placeholder="Enter ..." id ="message">
				</textarea>
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
  		   var obj = JSON.parse(data)  	   
    	   console.log(obj)
    	   appendMessage(obj.message_content);
	    };
	    sock.onclose = function() {
	    	 appendMessage("연결을 끊었습니다.");
	        console.log('close');
	    };
	}




 function send() {
  var msg = $("#message").val();
  if(msg != ""){
	  message = {};
	  message.message_content = $("#message").val()
  	  message.user_id = '${login_id}'
  	  message.admin_id = 'admin'
  }
  sock.send(JSON.stringify(message));
  $("#message").val("");
 }




 function getTimeStamp() {
   var d = new Date();
   var s =
     leadingZeros(d.getFullYear(), 4) + '-' +
     leadingZeros(d.getMonth() + 1, 2) + '-' +
     leadingZeros(d.getDate(), 2) + ' ' +

     leadingZeros(d.getHours(), 2) + ':' +
     leadingZeros(d.getMinutes(), 2) + ':' +
     leadingZeros(d.getSeconds(), 2);

   return s;
 }

 function leadingZeros(n, digits) {
   var zero = '';
   n = n.toString();

   if (n.length < digits) {
     for (i = 0; i < digits - n.length; i++)
       zero += '0';
   }
   return zero + n;
 }



 function appendMessage(msg) {
	 if(msg == ''){
		 return false;
	 }else{
	 var t = getTimeStamp();
	 $("#chatMessageArea").append("<div class='col-md-12 row' style = 'height : auto; margin-top : 5px;'><div class='col-md-2' style = 'float:right; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid' src='/resources/img/man.png' style = 'width:50px; height:50px; '><div style='font-size:9px; clear:both;'>${user_name}</div></div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-md-12' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"+msg+"</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"+t+"</span></div></div></div>")		 

	  var chatAreaHeight = $("#chatArea").height();
	  var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
	  $("#chatArea").scrollTop(maxScroll);
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

</div>
 
</body>
</html>