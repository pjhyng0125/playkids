<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

function replylist(replypage){
	$.ajax({
			url:'/replies/${boardVO.bno}/'+replypage, 
			success:function(result){
				console.log(result)
				var replylist = result.list;
				var str="";
				for(i=0;i<replylist.length;i++){
					str+='<li data-rno="'+replylist[i].rno+'" class="replyLi"><label>댓글번호 :</label>'
					+replylist[i].rno+' <button class="mod_reply" data-rno="'+replylist[i].rno+'">수정</button>'
					+' <button class="del_reply" data-rno="'+replylist[i].rno+'">삭제</button><br>'
					+"<label>작성자 : "+replylist[i].replyer+"</label>"
					+" <label>작성일자 : </label>"+replylist[i].reply_regdate+"<br>"
					+"<label>내용 : </label><span>"+replylist[i].reply_content+"</span></li><br>";
				}
				$('#replylist').html(str);
				printPaging(result.pm);
			}	// success function
	});	// ajax
}



function printPaging(pm){
	var str='';
	for(i=pm.startPage;i<pm.endPage+1;i++){
		//str+="<li><a href=/replies/${boardVO.bno}/"+i+">"+i+"</a></li>";
		//str+="<li><a href='/board/showpage?${pm.makeSearch(pm.cri.page) }&bno=${boardVO.bno}'>"+i+"</a></li>";
		str+="<li><a href=javascript:replylist("+i+")>"+i+"</a></li>";
	}
	$('#pagination').html(str);
}





$(function(){
	
	replylist(1);
	
	$('#list').click(function(){
		self.location="/board/list";
	});
	$('#del').click(function(){
		self.location="/board/delete?bno=${boardVO.bno}";
	});
	$('#mod').click(function(){
		self.location="/board/update?bno=${boardVO.bno}";
	});
	
	$('#send_reply').click(function(){
		var replyer=$('input[name=replyer]').val();
		var replytext=$('textarea[name=reply_content]').val();
		$.ajax({
				url:'/replies',
				type:'post',
				data:JSON.stringify({'replyer':replyer,'reply_content':replytext,'bno':'${boardVO.bno}'}),
						// 컨트롤러 메소드파라미터에 @RequestBody가 선언되 있을 경우 이와같이 JSON처리해줘야함.
				success:function(result){
					alert(result);
					$('input[name=replyer]').val('');
					$('input[name=replytext]').val('');
					replylist();
					replylistPage(1);
				},
				headers:{		// 서버로 보낼 데이터 형식 지정
						// JSON 데이터를 서버컨트롤러로 보낼경우 반드시 명시
						'Content-Type':'application/json'			
				}
				//dataType:'JSON'	// 서버로 부터 받는 데이터 형식 지정
		});
	});
	
	
	$('#replylist').on('click','.replyLi .mod_reply',function(){
		alert('hi!');
		var reply = $(this).parent();
		var rno= reply.attr('data-rno');
		
	});
	
	$('#replylist').on('click','.replyLi .del_reply',function(){
		var reply = $(this).parent();
		var rno= reply.attr('data-rno');
		$.ajax({
			url:'/replies/'+rno,
			type:'delete',
			success:function(result){
				if(result==='SUCCESS'){
					alert('삭제오키');
					replylist(1);
				}
			}
			
	});
	});
	
});

</script>
</head>
<body>
<h3>게시물 보기</h3>
<div>
	<input type="hidden" id="page" value="">	<!-- 현재 페이지 -->
	
</div>

글 번호 : <input type="text" name="bno" size="3" value="${boardVO.bno }" readonly>
작성자 : <input type="text" name="mid" size="30" value="${boardVO.mid }" readonly>	<br>
제목 : <input type="text" name="title" value="${boardVO.title }" readonly>
조회수 :<input type="text" name="count" value="${boardVO.count }" readonly size="3"><br>
내용 : <textarea rows="10" cols="40" name="content" readonly>${boardVO.content }</textarea><br>
<button id="mod">수정</button>
<button id="del">삭제</button>
<button id="list">목록으로</button><br>
<br>

<div>
	<label>댓글작성</label><br>				<!-- ***id 받아온 값 인가하기********************************  -->
	작성자 : <input type="text" name="replyer" value="qwer1234" readonly ><br>
	내용 :  <textarea rows="3" cols="40" name="reply_content"></textarea><br>
	<input type="button" id="send_reply" value="댓글작성">
</div>
<div>
	<br>
	<label>댓글목록</label><br><br>
	<div id="replylist"></div>
	<div id="pagination"></div>
</div>
</body>
</html>