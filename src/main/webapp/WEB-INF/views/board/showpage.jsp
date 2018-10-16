<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@include file="/WEB-INF/views/include/header.jsp" %>
<script type="text/javascript">

function replylist(replypage){
	$.ajax({
			url:'/replies/${boardVO.bno}/'+replypage, 
			success:function(result){
				console.log(result)
				var replylist = result.list;
				var str="";
				for(i=0;i<replylist.length;i++){
					var regdate = new Date(replylist[i].reply_regdate);
					var regdate_str = regdate.getFullYear()+"-"+(regdate.getMonth()+1)+"-"+regdate.getDate();
					
					str+='<li data-rno="'+replylist[i].rno+'" class="replyLi"><label>댓글번호 :</label>'+replylist[i].rno
					+" <label id='replyer' val='"+replylist[i].replyer+"'>작성자 : "+replylist[i].replyer+"</label>"
					+" <label>작성일자 : </label>"+regdate_str
					+' <button type="button" id="mod_reply" class="btn btn-info" data-toggle="modal" data-target="#mod_modal" data-rno="'+replylist[i].rno+'">수정</button>'
					+' <button class="btn btn-danger" id="del_reply" data-rno="'+replylist[i].rno+'">삭제</button><br>'
					+"<label id='reply_content' val='"+replylist[i].reply_content+"'>내용 : </label><span>"+replylist[i].reply_content+"</span></li><br>";
				}
				$('#replylist').html(str);
				printPaging(result.pm);
			}	// success function
	});	// ajax
}



function printPaging(pm){
	var str='<ul class="pagination pagination">';
	for(i=pm.startPage;i<pm.endPage+1;i++){
		//str+="<li><a href=/replies/${boardVO.bno}/"+i+">"+i+"</a></li>";
		//str+="<li><a href='/board/showpage?${pm.makeSearch(pm.cri.page) }&bno=${boardVO.bno}'>"+i+"</a></li>";
		str+="<li class='page-item'><a class='page-link' href=javascript:replylist("+i+")>"+i+"</a></li>";
	}
	str+='</ul>';
	$('#pagination').html(str);
}





$(function(){
	
	replylist(1);
	
	$('#list').click(function(){
		
		self.location="/board/list?page="+$('#page').val();
	
	});
	$('#del').click(function(){
		if($('#login_id').val()==$('input[name=mid]').val())
			self.location="/board/delete?bno=${boardVO.bno}";
		else {
			 $('#alert_modal').modal();
		}
	});
	$('#mod').click(function(){
		if($('#login_id').val()==$('input[name=mid]').val())
			self.location="/board/update?bno=${boardVO.bno}";
		else {
			 $('#alert_modal').modal();
		}
	});
	
	$('#send_reply').click(function(){
		var replyer=$('input[name=replyer]').val();
		var replytext=$('textarea[name=reply_content]').val();
		var test = $('#login_id').val();
		

		if(test!=replyer || replyer==''){
			 $('#alert_modal_login').modal();
		}else{
			$.ajax({
					url:'/replies',
					type:'post',
					data:JSON.stringify({'replyer':replyer,'reply_content':replytext,'bno':'${boardVO.bno}'}),
							// 컨트롤러 메소드파라미터에 @RequestBody가 선언되 있을 경우 이와같이 JSON처리해줘야함.
					success:function(result){
						alert(result);
						$('textarea[name=reply_content]').val('');
						replylist(1);
					},
					headers:{		// 서버로 보낼 데이터 형식 지정
							// JSON 데이터를 서버컨트롤러로 보낼경우 반드시 명시
							'Content-Type':'application/json'			
					}
					//dataType:'JSON'	// 서버로 부터 받는 데이터 형식 지정
			});// ajax
		}
	});
	
	$('#replylist').on('click','.replyLi #mod_reply',function(){
		var reply = $(this).parent();
		var rno = reply.attr('data-rno');
		var replyer = reply.find('#replyer').attr('val');
		var reply_content = reply.find('#reply_content').attr('val');
		$('#modal_replyer').html(replyer);
		$('#mod_reply_content').val(reply_content);
		$('#modal_rno_display').attr({'value':rno});	
		
	});
	
	$('#send_mod').click(function(){
		var rno = $('#modal_rno_display').attr('value')	;
		var replytext = $('#mod_reply_content').val();
		var replyer = $('#modal_replyer').html();
		var test = $('#login_id').val();
		
		if(test!=replyer){
			 $('#alert_modal').modal();
			$('#mod_modal').hide();
		}else{
			$.ajax({
					url:'/replies/'+rno,
					type:'put',
					data:JSON.stringify({'rno':rno,'reply_content':replytext}),
					success:function(result){
						if(result=='SUCCESS'){
							$('#mod_modal').hide();
							replylist(1);
						}
					},
					headers:{		// 서버로 보낼 데이터 형식 지정
						// JSON 데이터를 서버컨트롤러로 보낼경우 반드시 명시
						'Content-Type':'application/json'			
				}
			});// ajax
		
		}
	});
	
	$('#replylist').on('click','.replyLi #del_reply',function(){
		var reply = $(this).parent();
		var rno= reply.attr('data-rno');
		var replyer = reply.find('#replyer').attr('val');
		var test = $('#login_id').val();
		if(test!=replyer){
			 $('#alert_modal').modal();
			$('#mod_modal').hide();
		}else{
			$.ajax({
				url:'/replies/'+rno,
				type:'delete',
				success:function(result){
					if(result==='SUCCESS'){
						replylist(1);
					}
				}	
			});// ajax
		}
	});
	
});

</script>
<div class="container">
<div id="hidden_info">
	<input type="hidden" id="page" value="${pm.cri.page }">	<!-- 현재 페이지 -->
	<input type="hidden" id="searchType" value="">
	<input type="hidden" id="keyword" value="">	
	<input type="hidden" id="login_id" value="${login_id }">
	<input type="hidden" id="login_type" value="${login_type }">
</div>
<center>
<h3>게시물 보기</h3>
<hr>
 <label>글 번호 :</label> <input type="text" name="bno" size="2" value="${boardVO.bno }" readonly>
 <c:choose>
 	<c:when test="${boardVO.mid=='manager' }">
		 <label>작성자 :</label> <input type="text" name="mid" size="13"value="운영자"readonly>	 	
 	</c:when>
 	<c:otherwise>
 		<label>작성자 :</label> <input type="text" name="mid" size="13"value="${boardVO.mid }"readonly>
 	</c:otherwise>
 </c:choose>

 <label>조회수 :</label><input type="text" name="count" value="${boardVO.count }" readonly size="3">
 <label>카테고리 :</label> <input type="text" value="${boardVO.category }" readonly="readonly" size="8">
<label> 작성일자 :</label> <input type="text" value="${boardVO.regdate }" readonly size="10"><br>
<label>제목 :</label> <input type="text" name="title" size="105"  value="${boardVO.title }" readonly><br><br>
<label>내용</label><br> <textarea rows="10" style="width: 70%" name="content" readonly>${boardVO.content }</textarea><br>
<button id="mod" class="btn btn-info">수정</button>
<button id="del"class="btn btn-warning">삭제</button>
<button id="list" class="btn btn-success">목록으로</button><br>
<br>

<div>
	<label>댓글작성</label><br>				<!-- ***id 받아온 값 인가하기********************************  -->
	<label>작성자 :</label> <input type="text" name="replyer" value="${login_id }" readonly >
	 <input type="button" id="send_reply" value="댓글작성" class="btn btn-info"><br>
	<label>내용</label> 
	<textarea rows="2" style="width: 70%" name="reply_content"></textarea><br>
	
</div>
<div>
	<br>
	<label>댓글목록</label><hr><br>
	<div id="replylist"></div>
	<div id="pagination"></div>
</div>
</center>

<div class="modal fade" id="mod_modal" style="width: 50%">
	<div class="modal-content">
		<div class="modal-header">
		 <button type="button" class="close" data-dismiss="modal">&times;</button>
		 <h4>댓글 수정</h4>
		 <h5>작성자 : <label id="modal_replyer"></label> </h5>
		 <input type="hidden" id="modal_rno_display" value="a">
		</div>
		<div class="modal-body">
		 <textarea rows="2" style="width:95%" id="mod_reply_content"  ></textarea> 		 
		</div>
		<div class="modal-footer">
		 <button type="button" class="btn btn-info" id="send_mod">확인</button>
		 <button type="button" class="btn btn-warning" data-dismiss="modal">취소</button>
		</div>
	</div>
</div>
</div>

	<div class="modal fade" id="alert_modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-danger text-white">
					<font color="red"><h3>회원 불일치</h3></font>
				</div>
				<div class="modal-body">
					<p>타인의 게시물은 임의로 수정 및 삭제가 불가능합니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="alert_modal_login" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-danger text-white">
					<font color="red"><h3>로그인 필요</h3></font>
				</div>
				<div class="modal-body">
					<p>로그인 후 이용가능</p>
					<a href="/login">로그인 화면으로 이동하시겠습니까?</a>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>

<%@include file="/WEB-INF/views/include/footer.jsp" %>
