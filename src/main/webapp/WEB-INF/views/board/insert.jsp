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
			self.location="/board/list";
		});
	
		$('select[name=category]').click(function(){
			
			var i =document.form1.category.selectedIndex
			if(i==1){
				$('#reserve').show();
				if(${listClass.size()==0 }){		//vv
					
					$('#listOff').show();
					$('#listOn').hide();	
				}else{		// 리스트가 없을 경우
					$('#listOff').hide();
					$('#listOn').show();
				}
			}else if(i!=1){				
				$('#writeTitle').val('')
				$('#writeTitle').attr('readonly',false)
				$('#reserve').hide();
			}
		});
		
		$('.classnames').click(function(){
			
			var classname = $(this).val()
			var str = "< "+classname+"일자 클래스 참여 후기 >"
			$('#writeTitle').val(str);
			$('#writeTitle').attr('readonly',true)
		});
		
		
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
<br>
<h3>글쓰기 페이지</h3>
<form method="post" name="form1">

	<input type="hidden" name="mid" value="${login_id }">
	<input type="hidden" id="login_type" value="${login_type }">
	<label>제목 : </label> <input type="text" id="writeTitle" name="title" size="40" style="width:50%" placeholder="제목을 입력하세요.">
	 <label>카테고리 : </label> <select name="category">
		<option selected="selected">잡담</option>
		<option id="comment">후기</option>
		<option>추천</option>
		<option>질문</option>
	</select><br><br>
	<div id="reserve"style="display: none">
		<fieldset style="width: 60%">
			<legend>수강강좌 선택하기</legend>
			<ul>
				<div id="listOn" class="alert alert-warning" style="display: ">
    				<strong><주의></strong> 후기를 남기실 때는 제목을 변경하실수 없습니다!<br>
    				수강한 클래스 중 후기를 남기실 클래스를 아래에서 선택해주세요.
  				</div>
  				<div id="listOff" class="alert alert-danger" style="display: none">
  					<strong><주의></strong> 수강한 클래스가 없습니다!
  				</div>
				<div id="listclass">
					<c:forEach items="${listClass }" var="classnames" >
						<button id ="classname" type="button" class="btn btn-danger classnames"value="${classnames.BNAME}의 ${classnames.CNAME} ${classnames.CDATE} ">
						 ${classnames.BNAME}의 ${classnames.CNAME} </button>		
					</c:forEach>
					
				</div>
			</ul>
		</fieldset> 
	</div>
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
					<h3>게시물 작성 에러</h3>
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