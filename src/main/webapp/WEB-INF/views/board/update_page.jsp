<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$('#cancel').click(function(){
			self.location="/board/list";
		});
		var check = '후기';
		if($('#category').val()==check){
			$('#writeTitle').attr('readonly',true)	
		}
	});
	
	function write_board(){
		if($('#writeTitle').val()==''){
			 $('#alert_modal').modal();
		}
		else document.form1.submit()
	}
	
</script>
</head>
<body>
<center>
<h3>게시물 수정</h3>
<hr width="80%">
<form action="/board/update" method="post" name="form1">
<div id="hidden">
	<input type="hidden" id="login_id" value="${login_id }">
	<input type="hidden" id="login_type" value="${login_type }">
</div>

 글 번호 : <input type="text" name="bno" size="2" value="${boardVO.bno }" readonly>
 작성자 : <input type="text" name="mid" size="13"value="${boardVO.mid }" readonly>	
 조회수 :<input type="text" name="count" value="${boardVO.count }" readonly size="3">
 카테고리 : <input id="category" type="text" value="${boardVO.category }" readonly="readonly" size="8">
 작성일자 : <input type="text" value="${boardVO.regdate }" readonly size="10"><br>
제목 : <input type="text" id="writeTitle" name="title" size="105"  value="${boardVO.title }" ><br><br>
내용 : <textarea rows="10" style="width: 60%" name="content" >${boardVO.content }</textarea><br>

<input type="button" value="확인" class="btn btn-info" onclick="write_board()">
<input type="button" id="cancel" value="취소" class="btn btn-warning">
</form>
</center>
	<div class="modal fade" id="alert_modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<font color="red"><h3>게시물 수정 에러</h3></font>
				</div>
				<div class="modal-body">
					<p>게시물의 제목은 반드시 작성해 주셔야 합니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>