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
    	   alarmMsg(msgResult);    		   
    	   appendMessage(msgResult);
	    };
	    sock.onclose = function() {
	    	 //appendMessage("연결을 끊었습니다.");
	        console.log('close');
	    };
	}
	function alarmMsg(msg){
		alert(checkMid);
		 if(msg.to_id=="manager" && (checkMid != msg.from_id || checkMid =='')){
			 $('button[value='+msg.from_id+']').parent().find('span').html('<img alt="new" src="/resources/img/new.gif" style="width:50px; height: 50px; ">');
		 }else if(checkMid==msg.from_id || msg.message_readTime=='' || msg.message_readTime==undefined){
			 msg.message_readTime = new Date();
			 sock.send(JSON.stringify(msg));
		 }
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
	    	    	  	$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
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
  /* $('#enterBtn').click(function() { connect(); }); $('#exitBtn').click(function() { disconnect(); }); */
