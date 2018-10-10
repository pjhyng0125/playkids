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

 <label>글 번호 :</label> <input type="text" name="bno" size="2" value="${boardVO.bno }" readonly>
 <label>작성자 :</label> <input type="text" name="mid" size="13"value="${boardVO.mid }" readonly>	
 <label>조회수 :</label><input type="text" name="count" value="${boardVO.count }" readonly size="3">
 <label>카테고리 :</label> <input id="category" type="text" value="${boardVO.category }" readonly="readonly" size="8">
 <label>작성일자 :</label> <input type="text" value="${boardVO.regdate }" readonly size="10"><br>
<label>제목 :</label> <input type="text" id="writeTitle" name="title" size="105"  value="${boardVO.title }" ><br><br>
<label>내용</label><br><textarea rows="10" style="width: 60%" name="content" >${boardVO.content }</textarea><br>

<input type="button" value="확인" class="btn btn-info" onclick="write_board()">
<input type="button" id="cancel" value="취소" class="btn btn-warning">
</form>
</center>
	<div class="modal fade" id="alert_modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="bg-danger text-white modal-header ">
					<h3>게시물 수정 에러</h3>
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

<%@include file="/WEB-INF/views/include/footer.jsp" %>