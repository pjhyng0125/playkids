<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %><%@include file="/WEB-INF/views/include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$('#cancel').click(function(){
			self.location="/admin";
		});
			
	});
	
	function write_board(){
		if($('#writeTitle').val()==''){
			 $('#alert_modal').modal();
		}
		else {
			//if($('#mid').val()== 'manager') {					안되네
				alert('hi')			
				document.form1.submit()
		///	}
		/*	else{
				//alert('manager>>'+${login_id })		왜이럴까.
				$('#alert_modal2').modal();
			}*/
		}
	}
</script>
</head>
<body>
<center>
<br>
<h3>공지사항 작성</h3>
<form method="post" name="form1">

	<input type="hidden" name="mid" value="${login_id }">
	<input type="hidden" id="login_type" value="${login_type }">
	<label>제목 : </label> <input type="text" id="writeTitle" name="title" size="40" style="width:50%" placeholder="제목을 입력하세요.">
	 <label>카테고리 : </label> <select name="category">
		<option selected="selected">공지</option>
	</select><br>
	
	<hr width="60%">
	<label>내용</label><br>
	<textarea rows="10" cols="40" name="content" style="width: 60%" placeholder="내용을 입력하세요."></textarea><br>
	
	<input type="button" value="작성" class="btn btn-info" onclick="write_board()"> <input type="reset" value="취소" id="cancel" class="btn btn-warning">

</form>
</center>
	<div class="modal fade" id="alert_modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-danger text-white">
					<h3>공지사항 작성 에러</h3>
				</div>
				<div class="modal-body">
					<p>공지사항의 제목은 반드시 작성해 주셔야 합니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="alert_modal2" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-danger text-white">
					<h3>관리자 외 접근불가</h3>
				</div>
				<div class="modal-body">
					<p>관리자를 제외한 인원이 관리자 게시판 접근불가.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>